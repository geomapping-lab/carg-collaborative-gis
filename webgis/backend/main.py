"""
WebGIS CARG — Backend FastAPI
Stack: FastAPI + psycopg2 → PostgreSQL/PostGIS (SRID 6707)
Autenticazione: token UUID in memoria (no JWT, nessuna libreria extra)

Configuration is read from environment variables (or from a .env file in
this folder): see .env.example.
"""

import base64 as _b64
import hmac
import json
import os
import uuid
import xml.etree.ElementTree as ET
from contextlib import contextmanager
from datetime import date as Date
from pathlib import Path
from typing import Optional

import psycopg2
from dotenv import load_dotenv
from fastapi import Depends, FastAPI, Header, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from pydantic import BaseModel

# ============================================================
# CONFIGURAZIONE — da variabili d'ambiente / file .env
# ============================================================

BASE_DIR = Path(__file__).resolve().parent
load_dotenv(BASE_DIR / ".env")


def _require(name: str) -> str:
    value = os.getenv(name)
    if not value:
        raise RuntimeError(f"Missing required environment variable {name} (see .env.example)")
    return value


DB_CONFIG = {
    "host":     os.getenv("DB_HOST", "localhost"),
    "port":     int(os.getenv("DB_PORT", "5432")),
    "dbname":   os.getenv("DB_NAME", "progetto_rilevamento"),
    "user":     os.getenv("DB_USER", "webgis_user"),
    "password": _require("DB_PASSWORD"),
}


def _parse_users(raw: str) -> dict[str, str]:
    """WEBGIS_USERS="user1:password1,user2:password2" → {user: password}"""
    users = {}
    for item in raw.split(","):
        if ":" in item:
            name, pwd = item.split(":", 1)
            users[name.strip()] = pwd.strip()
    if not users:
        raise RuntimeError("WEBGIS_USERS is empty or malformed (expected user:password,...)")
    return users


# Credenziali del form di login WebGIS (indipendenti dai ruoli PostgreSQL)
USERS: dict[str, str] = _parse_users(_require("WEBGIS_USERS"))

_active_tokens: dict[str, str] = {}

# ============================================================
# APP E CORS
# ============================================================

app = FastAPI(title="WebGIS CARG", version="1.0.0")

# Il frontend compilato è servito da FastAPI stesso (stessa origine):
# CORS serve solo in sviluppo (Vite su un'altra porta).
_cors = [o.strip() for o in os.getenv("CORS_ORIGINS", "").split(",") if o.strip()]
if _cors:
    app.add_middleware(
        CORSMiddleware,
        allow_origins=_cors,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

# ============================================================
# DATABASE
# ============================================================

@contextmanager
def get_db():
    conn = psycopg2.connect(**DB_CONFIG)
    try:
        yield conn
    finally:
        conn.close()


def rows_to_geojson(rows, columns: list[str]) -> dict:
    features = []
    for row in rows:
        row_dict = dict(zip(columns, row))
        geom_raw = row_dict.pop("geom_json", None)
        geom = json.loads(geom_raw) if geom_raw else None
        props = {}
        for k, v in row_dict.items():
            props[k] = v.isoformat() if hasattr(v, "isoformat") else v
        features.append({"type": "Feature", "geometry": geom, "properties": props})
    return {"type": "FeatureCollection", "features": features}


def build_where(
    solo_attivi: bool,
    rilevatore: Optional[str],
    alias: str = "",
    data_da: Optional[Date] = None,
    data_a: Optional[Date] = None,
    date_col: str = "data_ora",
    sigla: Optional[str] = None,
) -> tuple[str, list]:
    prefix = f"{alias}." if alias else ""
    clauses, params = [], []
    if solo_attivi:
        clauses.append(f"{prefix}is_deleted = false")
    if rilevatore:
        clauses.append(f"{prefix}created_by = %s")
        params.append(rilevatore)
    if data_da:
        clauses.append(f"DATE({prefix}{date_col}) >= %s")
        params.append(data_da)
    if data_a:
        clauses.append(f"DATE({prefix}{date_col}) <= %s")
        params.append(data_a)
    if sigla:
        clauses.append(f"{prefix}sigla = %s")
        params.append(sigla)
    where = ("WHERE " + " AND ".join(clauses)) if clauses else ""
    return where, params

# ============================================================
# AUTENTICAZIONE
# ============================================================

security = HTTPBearer()


class LoginRequest(BaseModel):
    username: str
    password: str


@app.post("/api/login")
def login(req: LoginRequest):
    expected = USERS.get(req.username)
    if expected is None or not hmac.compare_digest(expected, req.password):
        raise HTTPException(status_code=401, detail="Credenziali non valide")
    token = str(uuid.uuid4())
    _active_tokens[token] = req.username
    return {"token": token, "username": req.username}


@app.post("/api/logout")
def logout(credentials: HTTPAuthorizationCredentials = Depends(security)):
    _active_tokens.pop(credentials.credentials, None)
    return {"ok": True}


def get_current_user(
    credentials: HTTPAuthorizationCredentials = Depends(security),
) -> str:
    username = _active_tokens.get(credentials.credentials)
    if not username:
        raise HTTPException(status_code=401, detail="Token non valido o scaduto")
    return username

# ============================================================
# LAYER SURVEY
# ST_Transform(geom, 4326) converte SRID 6707 → WGS84
# necessario perché GeoJSON standard usa coordinate lat/lon
# ============================================================

@app.get("/api/layers/affioranti")
def get_affioranti(
    rilevatore: Optional[str] = None,
    solo_attivi: bool = True,
    data_da: Optional[Date] = None,
    data_a: Optional[Date] = None,
    sigla: Optional[str] = None,
    _user: str = Depends(get_current_user),
):
    """Poligoni affioranti dalla vista vw_affiorante_join."""
    where, params = build_where(
        solo_attivi, rilevatore,
        data_da=data_da, data_a=data_a, date_col="data_ora",
        sigla=sigla,
    )
    sql = f"""
        SELECT
            id,
            ST_AsGeoJSON(ST_Transform(geom, 4326))::text AS geom_json,
            sigla, descrizione, visibilita,
            stratif, assetto, caratter, note,
            data_ora, created_by, updated_by, is_deleted,
            nome_unita, eta, codice_carg
        FROM visualizzazione.vw_affiorante_join
        {where}
        ORDER BY id
    """
    with get_db() as conn:
        with conn.cursor() as cur:
            cur.execute(sql, params)
            rows = cur.fetchall()
            cols = [d[0] for d in cur.description]
    return rows_to_geojson(rows, cols)


@app.get("/api/layers/giaciture")
def get_giaciture(
    rilevatore: Optional[str] = None,
    solo_attivi: bool = True,
    data_da: Optional[Date] = None,
    data_a: Optional[Date] = None,
    _user: str = Depends(get_current_user),
):
    where, params = build_where(
        solo_attivi, rilevatore,
        data_da=data_da, data_a=data_a, date_col="data_ora",
    )
    sql = f"""
        SELECT
            id,
            ST_AsGeoJSON(ST_Transform(geom, 4326))::text AS geom_json,
            "Tipo", "Tipologia",
            "Immersio", "Direzio", "Inclina",
            "Fase", "Verso", "Asimmetria",
            note, data_ora, created_by, updated_by, is_deleted
        FROM rilevamento.giaciture
        {where}
        ORDER BY id
    """
    with get_db() as conn:
        with conn.cursor() as cur:
            cur.execute(sql, params)
            rows = cur.fetchall()
            cols = [d[0] for d in cur.description]
    return rows_to_geojson(rows, cols)


@app.get("/api/layers/campioni")
def get_campioni(
    rilevatore: Optional[str] = None,
    solo_attivi: bool = True,
    data_da: Optional[Date] = None,
    data_a: Optional[Date] = None,
    _user: str = Depends(get_current_user),
):
    where, params = build_where(
        solo_attivi, rilevatore,
        data_da=data_da, data_a=data_a, date_col="data_ora",
    )
    sql = f"""
        SELECT
            id,
            ST_AsGeoJSON(ST_Transform(geom, 4326))::text AS geom_json,
            "Sigla" AS sigla,
            "Note"  AS note,
            data_ora, created_by, updated_by, is_deleted
        FROM rilevamento.campioni
        {where}
        ORDER BY id
    """
    with get_db() as conn:
        with conn.cursor() as cur:
            cur.execute(sql, params)
            rows = cur.fetchall()
            cols = [d[0] for d in cur.description]
    return rows_to_geojson(rows, cols)


@app.get("/api/layers/linee_substrato")
def get_linee_substrato(
    rilevatore: Optional[str] = None,
    solo_attivi: bool = True,
    data_da: Optional[Date] = None,
    data_a: Optional[Date] = None,
    _user: str = Depends(get_current_user),
):
    where, params = build_where(
        solo_attivi, rilevatore,
        data_da=data_da, data_a=data_a, date_col="created_at",
    )
    sql = f"""
        SELECT
            id,
            ST_AsGeoJSON(ST_Transform(geom, 4326))::text AS geom_json,
            "Tipo", "Tipologia",
            created_by, updated_by, is_deleted
        FROM rilevamento.linee_substrato
        {where}
        ORDER BY id
    """
    with get_db() as conn:
        with conn.cursor() as cur:
            cur.execute(sql, params)
            rows = cur.fetchall()
            cols = [d[0] for d in cur.description]
    return rows_to_geojson(rows, cols)


@app.get("/api/layers/linee_geomorfologia")
def get_linee_geomorfologia(
    rilevatore: Optional[str] = None,
    solo_attivi: bool = True,
    data_da: Optional[Date] = None,
    data_a: Optional[Date] = None,
    _user: str = Depends(get_current_user),
):
    where, params = build_where(
        solo_attivi, rilevatore,
        data_da=data_da, data_a=data_a, date_col="created_at",
    )
    sql = f"""
        SELECT
            id,
            ST_AsGeoJSON(ST_Transform(geom, 4326))::text AS geom_json,
            "Tipo", "Tipologia", "Stato",
            created_by, updated_by, is_deleted
        FROM rilevamento.linee_geomorfologia
        {where}
        ORDER BY id
    """
    with get_db() as conn:
        with conn.cursor() as cur:
            cur.execute(sql, params)
            rows = cur.fetchall()
            cols = [d[0] for d in cur.description]
    return rows_to_geojson(rows, cols)

# ============================================================
# ANNOTAZIONI (webgis.note)
# ============================================================

class NoteIn(BaseModel):
    lon: float
    lat: float
    testo: str


@app.get("/api/note")
def get_note(_user: str = Depends(get_current_user)):
    sql = """
        SELECT id,
               ST_AsGeoJSON(ST_Transform(geom, 4326))::text AS geom_json,
               testo, autore, created_at
        FROM webgis.note
        ORDER BY created_at DESC
    """
    with get_db() as conn:
        with conn.cursor() as cur:
            cur.execute(sql)
            rows = cur.fetchall()
            cols = [d[0] for d in cur.description]
    return rows_to_geojson(rows, cols)


@app.post("/api/note", status_code=201)
def create_nota(req: NoteIn, username: str = Depends(get_current_user)):
    sql = """
        INSERT INTO webgis.note (geom, testo, autore)
        VALUES (
            ST_Transform(ST_SetSRID(ST_MakePoint(%s, %s), 4326), 6707),
            %s, %s
        )
        RETURNING id
    """
    with get_db() as conn:
        with conn.cursor() as cur:
            cur.execute(sql, (req.lon, req.lat, req.testo, username))
            new_id = cur.fetchone()[0]
        conn.commit()
    return {"id": new_id, "ok": True}


@app.delete("/api/note/{nota_id}")
def delete_nota(nota_id: int, username: str = Depends(get_current_user)):
    with get_db() as conn:
        with conn.cursor() as cur:
            cur.execute(
                "DELETE FROM webgis.note WHERE id = %s AND autore = %s RETURNING id",
                (nota_id, username),
            )
            deleted = cur.fetchone()
        conn.commit()
    if not deleted:
        raise HTTPException(status_code=404, detail="Nota non trovata o non sei l'autore")
    return {"ok": True}

# ============================================================
# STILI — parsing QML da layer_styles
# ============================================================

def rgba_to_hex(rgba_str: str) -> str:
    """Converte '228,19,228,255,hsv:...' → '#e413e4'"""
    try:
        parts = rgba_str.split(',')
        r = int(parts[0].strip())
        g = int(parts[1].strip())
        b = int(parts[2].strip())
        return f'#{r:02x}{g:02x}{b:02x}'
    except Exception:
        return '#cccccc'


def parse_qml_categories(qml_text: str) -> dict:
    """
    Legge un QML QGIS con renderer categorizedSymbol e restituisce:
    { "valore_categoria": {"fill": "#rrggbb", "stroke": "#rrggbb"} }
    """
    root = ET.fromstring(qml_text)
    renderer = root.find('.//renderer-v2[@type="categorizedSymbol"]')
    if renderer is None:
        return {}

    # Symbol name → colori
    symbol_colors = {}
    for symbol in renderer.findall('.//symbols/symbol'):
        name   = symbol.get('name')
        fill   = '#cccccc'
        stroke = '#666666'
        for opt in symbol.findall('.//Option[@name="color"]'):
            fill = rgba_to_hex(opt.get('value', ''))
        for opt in symbol.findall('.//Option[@name="outline_color"]'):
            stroke = rgba_to_hex(opt.get('value', ''))
        symbol_colors[name] = {"fill": fill, "stroke": stroke}

    # Category value → colori (via symbol name)
    result = {}
    for cat in renderer.findall('.//categories/category'):
        value    = cat.get('value', '')
        sym_name = cat.get('symbol', '')
        if sym_name in symbol_colors:
            result[value] = symbol_colors[sym_name]

    return result


@app.get("/api/stili/affioranti")
def get_stili_affioranti(_user: str = Depends(get_current_user)):
    """
    Restituisce la mappa codice_carg → {fill, stroke} estratta dal QML
    salvato in public.layer_styles per il layer vw_affiorante_join.
    """
    sql = """
        SELECT styleqml::text
        FROM public.layer_styles
        WHERE f_table_name = 'vw_affiorante_join'
        LIMIT 1
    """
    with get_db() as conn:
        with conn.cursor() as cur:
            cur.execute(sql)
            row = cur.fetchone()

    if not row:
        raise HTTPException(status_code=404, detail="Stile affiorante non trovato")

    stili = parse_qml_categories(row[0])
    return {"stili": stili}

# ── parser QML giaciture ──────────────────────────────────────────────

_MM = 3.0   # 1 mm → 3 unità SVG
_HVB = 15   # viewBox: -15..15

def _color(s: str) -> str:
    p = s.split(',')
    return '#{:02x}{:02x}{:02x}'.format(int(p[0]), int(p[1]), int(p[2]))

def _offset(s: str):
    x, y = s.split(',')
    return float(x) * _MM, float(y) * _MM

def _opts(layer_el: ET.Element) -> dict:
    """Estrae le Option[@type='QString'] dal primo figlio Option (Map)."""
    map_el = layer_el.find('Option')
    if map_el is None:
        return {}
    return {o.get('name'): o.get('value')
            for o in map_el.findall('Option')
            if o.get('value') is not None}

def _rot_field(layer_el: ET.Element):
    """Ritorna il nome del campo di rotazione (es. 'IMMERSIO') o None."""
    try:
        ddp  = layer_el.find('data_defined_properties')
        root = ddp.find('Option[@type="Map"]')
        props = root.find('Option[@name="properties"][@type="Map"]')
        angle = props.find('Option[@name="angle"][@type="Map"]')
        if angle is None:
            return None
        active = angle.find('Option[@name="active"]')
        if active is None or active.get('value') != 'true':
            return None
        field = angle.find('Option[@name="field"]')
        return field.get('value') if field is not None else None
    except Exception:
        return None

def _stroke_attr(opts: dict) -> str:
    if opts.get('outline_style', 'solid') == 'no':
        return 'stroke="none"'
    sw = float(opts.get('outline_width', '0')) * _MM
    col = _color(opts.get('outline_color', '35,35,35,255'))
    return f'stroke="{col}" stroke-width="{sw:.2f}"'

def _ellipse_layer(layer_el: ET.Element):
    o = _opts(layer_el)
    fill = _color(o.get('color', '0,22,137,255'))
    sa = _stroke_attr(o)
    shape = o.get('symbol_name', 'circle')
    ox, oy = _offset(o.get('offset', '0,0'))
    rf = _rot_field(layer_el)

    if shape == 'rectangle':
        w = float(o.get('symbol_width',  '2')) * _MM
        h = float(o.get('symbol_height', '2')) * _MM
        el = f'<rect x="{-w/2+ox:.2f}" y="{-h/2+oy:.2f}" width="{w:.2f}" height="{h:.2f}" fill="{fill}" {sa}/>'
    else:
        rx = float(o.get('symbol_width',  '2')) * _MM / 2
        ry = float(o.get('symbol_height', '2')) * _MM / 2
        el = f'<ellipse cx="{ox:.2f}" cy="{oy:.2f}" rx="{rx:.2f}" ry="{ry:.2f}" fill="{fill}" {sa}/>'
    return el, rf

def _simple_layer(layer_el: ET.Element):
    o = _opts(layer_el)
    fill   = _color(o.get('color', '0,22,137,255'))
    stroke = _color(o.get('outline_color', '0,22,137,255'))
    sw     = max(float(o.get('outline_width', '0.2')) * _MM, 1.0)
    sa     = _stroke_attr(o)
    shape  = o.get('name', 'circle')
    size   = float(o.get('size', '2')) * _MM
    s      = size / 2
    ox, oy = _offset(o.get('offset', '0,0'))
    rf     = _rot_field(layer_el)

    shapes = {
        'circle':             f'<circle cx="{ox:.2f}" cy="{oy:.2f}" r="{s:.2f}" fill="{fill}" {sa}/>',
        'square':             f'<rect x="{-s+ox:.2f}" y="{-s+oy:.2f}" width="{size:.2f}" height="{size:.2f}" fill="{fill}" {sa}/>',
        'diamond':            f'<polygon points="{ox:.2f},{oy-s:.2f} {ox+s:.2f},{oy:.2f} {ox:.2f},{oy+s:.2f} {ox-s:.2f},{oy:.2f}" fill="{fill}" {sa}/>',
        'triangle':           f'<polygon points="{ox:.2f},{oy-s:.2f} {ox+s:.2f},{oy+s:.2f} {ox-s:.2f},{oy+s:.2f}" fill="{fill}" {sa}/>',
        'left_half_triangle': f'<polygon points="{ox:.2f},{oy-s:.2f} {ox:.2f},{oy+s:.2f} {ox-s:.2f},{oy:.2f}" fill="{fill}" {sa}/>',
        'right_half_triangle':f'<polygon points="{ox:.2f},{oy-s:.2f} {ox:.2f},{oy+s:.2f} {ox+s:.2f},{oy:.2f}" fill="{fill}" {sa}/>',
        'line':               f'<line x1="{-s+ox:.2f}" y1="{oy:.2f}" x2="{s+ox:.2f}" y2="{oy:.2f}" stroke="{stroke}" stroke-width="{sw:.2f}"/>',
        'cross':              f'<line x1="{-s+ox:.2f}" y1="{oy:.2f}" x2="{s+ox:.2f}" y2="{oy:.2f}" stroke="{stroke}" stroke-width="{sw:.2f}"/>'
                              f'<line x1="{ox:.2f}" y1="{-s+oy:.2f}" x2="{ox:.2f}" y2="{s+oy:.2f}" stroke="{stroke}" stroke-width="{sw:.2f}"/>',
        'cross2':             f'<line x1="{-s+ox:.2f}" y1="{oy:.2f}" x2="{s+ox:.2f}" y2="{oy:.2f}" stroke="{stroke}" stroke-width="{sw:.2f}"/>'
                              f'<line x1="{ox:.2f}" y1="{-s+oy:.2f}" x2="{ox:.2f}" y2="{s+oy:.2f}" stroke="{stroke}" stroke-width="{sw:.2f}"/>',
        'half_arc':           f'<path d="M {-s+ox:.2f},{oy:.2f} A {s:.2f},{s:.2f} 0 0,1 {s+ox:.2f},{oy:.2f}" fill="none" stroke="{stroke}" stroke-width="{sw:.2f}"/>',
    }
    el = shapes.get(shape,
        f'<circle cx="{ox:.2f}" cy="{oy:.2f}" r="{s:.2f}" fill="{fill}" {sa}/>')
    return el, rf

def _ensure_svg_dimensions(svg_str: str, size: int = 30) -> str:
    """Aggiunge width/height al tag <svg> se assenti — richiesto da OpenLayers."""
    import re
    has_w = re.search(r'<svg[^>]+\bwidth\s*=', svg_str)
    has_h = re.search(r'<svg[^>]+\bheight\s*=', svg_str)
    if not has_w or not has_h:
        svg_str = re.sub(r'<svg ', f'<svg width="{size}" height="{size}" ', svg_str, count=1)
    return svg_str

def _symbol_to_data_url(sym_el: ET.Element):
    parts, rot = [], None
    for layer_el in sym_el.findall('layer'):
        cls = layer_el.get('class')
        if cls == 'SvgMarker':
            o = _opts(layer_el)
            name = o.get('name', '')
            rf = _rot_field(layer_el)
            if name.startswith('base64:'):
                svg_bytes = _b64.b64decode(name[7:])
                svg_str = _ensure_svg_dimensions(svg_bytes.decode('utf-8'), size=16)
                b64_fixed = _b64.b64encode(svg_str.encode('utf-8')).decode('utf-8')
                return f'data:image/svg+xml;base64,{b64_fixed}', rf
            if rf and not rot:
                rot = rf
        elif cls == 'EllipseMarker':
            el, rf = _ellipse_layer(layer_el)
            parts.append(el)
            if rf and not rot:
                rot = rf
        elif cls == 'SimpleMarker':
            el, rf = _simple_layer(layer_el)
            parts.append(el)
            if rf and not rot:
                rot = rf
    vb = _HVB
    svg = (f'<svg xmlns="http://www.w3.org/2000/svg" '
       f'width="{vb*2}" height="{vb*2}" '
       f'viewBox="-{vb} -{vb} {vb*2} {vb*2}">\n  '
       + '\n  '.join(parts) + '\n</svg>')
    b64 = _b64.b64encode(svg.encode()).decode()
    return f'data:image/svg+xml;base64,{b64}', rot

# ── endpoint ──────────────────────────────────────────────────────────

@app.get("/api/stili/giaciture")
async def stili_giaciture(authorization: str = Header(None)):
    token = (authorization or '').replace('Bearer ', '')
    if token not in _active_tokens:
        raise HTTPException(status_code=401, detail="Token non valido")

    with get_db() as conn:
        cur = conn.cursor()
        cur.execute(
            "SELECT styleqml::text FROM public.layer_styles "
            "WHERE f_table_name = 'giaciture' LIMIT 1"
        )
        row = cur.fetchone()

    if not row:
        raise HTTPException(status_code=404, detail="Stile giaciture non trovato")

    root = ET.fromstring(row[0])
    renderer = root.find('.//renderer-v2')

    cat_to_sym = {c.get('value'): c.get('symbol')
                  for c in renderer.findall('.//categories/category')}
    sym_map    = {s.get('name'): s
                  for s in root.findall('.//symbols/symbol')}

    result = {}
    for tipo_val, sym_idx in cat_to_sym.items():
        sym_el = sym_map.get(sym_idx)
        if sym_el is None:
            continue
        data_url, rot_field = _symbol_to_data_url(sym_el)
        result[tipo_val] = {'svg_data_url': data_url, 'rotation_field': rot_field}

    return result

# ============================================================
# UTILITÀ
# ============================================================

@app.get("/api/rilevatori")
def get_rilevatori(_user: str = Depends(get_current_user)):
    sql = """
        SELECT DISTINCT created_by FROM (
            SELECT created_by FROM rilevamento.affiorante          WHERE is_deleted = false
            UNION
            SELECT created_by FROM rilevamento.giaciture            WHERE is_deleted = false
            UNION
            SELECT created_by FROM rilevamento.campioni             WHERE is_deleted = false
            UNION
            SELECT created_by FROM rilevamento.linee_substrato      WHERE is_deleted = false
            UNION
            SELECT created_by FROM rilevamento.linee_geomorfologia  WHERE is_deleted = false
        ) t
        ORDER BY created_by
    """
    with get_db() as conn:
        with conn.cursor() as cur:
            cur.execute(sql)
            rows = [r[0] for r in cur.fetchall()]
    return {"rilevatori": rows}


@app.get("/api/sigle")
def get_sigle(_user: str = Depends(get_current_user)):
    sql = """
        SELECT DISTINCT a.sigla, v.nome AS nome_unita
        FROM rilevamento.affiorante a
        LEFT JOIN rilevamento.verbania_sigle v ON a.sigla = v.sigla
        WHERE a.is_deleted = false AND a.sigla IS NOT NULL
        ORDER BY a.sigla
    """
    with get_db() as conn:
        with conn.cursor() as cur:
            cur.execute(sql)
            rows = [{"sigla": r[0], "nome_unita": r[1]} for r in cur.fetchall()]
    return {"sigle": rows}


@app.get("/api/health")
def health():
    try:
        with get_db() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT 1")
        db_ok = True
    except Exception:
        db_ok = False
    return {"status": "ok", "db": "ok" if db_ok else "error"}


# ============================================================
# FRONTEND STATICO
# Serve il frontend compilato (npm run build → frontend/dist) dalla
# stessa origine del backend. Percorso configurabile con FRONTEND_DIST.
# Deve restare in fondo: il mount su "/" non deve coprire le route /api.
# ============================================================

from fastapi.staticfiles import StaticFiles  # noqa: E402

_dist = Path(os.getenv("FRONTEND_DIST", BASE_DIR.parent / "frontend" / "dist"))
if _dist.is_dir():
    app.mount("/", StaticFiles(directory=_dist, html=True), name="frontend")
