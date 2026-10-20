-- =====================================================================
-- 06_demo_data.sql — OPTIONAL synthetic demo dataset
--
-- !! All features are SYNTHETIC. They are regular shapes generated on a
-- !! grid and do not represent any real geological observation. The
-- !! geometric look (hexagons, straight contacts) is intentional, so that
-- !! demo features cannot be mistaken for real survey data.
--
-- Purpose: let anyone who installs the system see the WebGIS working
-- (symbology, per-surveyor filters, date filters, soft-deleted records)
-- and test RLS ownership with three simulated authors, without access to
-- the real survey data (which are not distributed with this repository).
--
-- Features are distributed among ril_user1, ril_user2 and dir_rilevamento
-- by setting created_by explicitly, as done for the bulk import of the
-- pilot dataset (the audit trigger keeps an explicit created_by on INSERT;
-- for non-superusers the RLS INSERT policy only accepts CURRENT_USER).
--
-- Requires 01_schema.sql, 05_sigle.sql. Run as a superuser.
-- Remove with:  TRUNCATE rilevamento.affiorante, rilevamento.giaciture,
--   rilevamento.campioni, rilevamento.linee_substrato, rilevamento.gps
--   RESTART IDENTITY;
-- =====================================================================

BEGIN;

-- Grid origin (EPSG:6707, RDN2008 / UTM 32N), inside the default WebGIS view
CREATE TEMP TABLE demo_origin AS
SELECT ST_X(p) AS x0, ST_Y(p) AS y0
FROM (SELECT ST_Transform(ST_SetSRID(ST_MakePoint(8.515, 45.955), 4326), 6707) AS p) s;

-- 4 x 3 grid of regular hexagons (radius 120 m)
CREATE TEMP TABLE demo_cells AS
SELECT row_number() OVER (ORDER BY r, c) AS n,
       c, r,
       o.x0 + c * 210 + CASE WHEN r % 2 = 1 THEN 105 ELSE 0 END AS cx,
       o.y0 + r * 185 AS cy
FROM demo_origin o,
     generate_series(0, 3) AS c,
     generate_series(0, 2) AS r;

-- ── affiorante: 12 synthetic outcrop polygons ───────────────────────
INSERT INTO rilevamento.affiorante
    (geom, sigla, descrizione, visibilita, part, stratif, assetto, note,
     data_ora, created_by, is_deleted)
SELECT
    ST_MakePolygon(ST_MakeLine(ARRAY(
        SELECT ST_SetSRID(ST_MakePoint(cx + 120 * cos(radians(a)),
                                       cy + 120 * sin(radians(a))), 6707)
        FROM generate_series(0, 360, 60) AS a))),
    (ARRAY['MOT','DOM','DPR','MAI','SAA','ALZ'])[1 + (n % 6)],
    'synthetic demo outcrop ' || n,
    'affior',
    1,
    2,
    NULL,
    'DEMO - synthetic feature',
    timestamp '2026-06-01 09:00' + (n || ' days')::interval,
    (ARRAY['ril_user1','ril_user2','dir_rilevamento'])[1 + (c % 3)],
    (n = 12)                       -- one soft-deleted record
FROM demo_cells;

-- ── giaciture: one structural measurement per cell ──────────────────
INSERT INTO rilevamento.giaciture
    (geom, "Tipo", "Tipologia", "Immersio", "Direzio", "Inclina",
     note, data_ora, created_by)
SELECT
    ST_SetSRID(ST_MakePoint(cx + 30, cy - 20), 6707),
    (ARRAY[3100, 3150, 3210, 3130])[1 + (n % 4)],
    1,
    (n * 37) % 360,
    ((n * 37) % 360 + 270) % 360,
    15 + (n * 7) % 60,
    'DEMO - synthetic feature',
    timestamp '2026-06-01 10:00' + (n || ' days')::interval,
    (ARRAY['ril_user1','ril_user2','dir_rilevamento'])[1 + (c % 3)]
FROM demo_cells;

-- ── campioni: 4 samples ─────────────────────────────────────────────
INSERT INTO rilevamento.campioni (geom, "Sigla", "Note", data_ora, created_by)
SELECT
    ST_SetSRID(ST_MakePoint(cx - 40, cy + 30), 6707),
    'DEMO-' || n,
    'DEMO - synthetic',
    timestamp '2026-06-01 11:00' + (n || ' days')::interval,
    (ARRAY['ril_user1','ril_user2','dir_rilevamento'])[1 + (c % 3)]
FROM demo_cells
WHERE n IN (2, 5, 8, 11);

-- ── linee_substrato: 3 lines between grid rows ──────────────────────
INSERT INTO rilevamento.linee_substrato (geom, "Tipo", "Tipologia", created_by)
SELECT
    ST_SetSRID(ST_MakeLine(ST_MakePoint(o.x0 - 150, o.y0 + 92 + k * 185),
                           ST_MakePoint(o.x0 + 800, o.y0 + 92 + k * 185 + 60)), 6707),
    (ARRAY[1000, 2100, 1500])[k + 1],
    NULL::integer,
    (ARRAY['ril_user1','ril_user2','dir_rilevamento'])[k + 1]
FROM demo_origin o, generate_series(0, 1) AS k
UNION ALL
SELECT
    ST_SetSRID(ST_MakeLine(ST_MakePoint(o.x0 + 315, o.y0 - 150),
                           ST_MakePoint(o.x0 + 360, o.y0 + 520)), 6707),
    2100, NULL::integer, 'dir_rilevamento'
FROM demo_origin o;

-- ── gps: 2 tracks ───────────────────────────────────────────────────
INSERT INTO rilevamento.gps (geom, data_ora, created_by)
SELECT ST_SetSRID(ST_MakeLine(ARRAY(
           SELECT ST_MakePoint(cx, cy) FROM demo_cells
           WHERE r = k ORDER BY c)), 6707),
       timestamp '2026-06-03 08:00' + (k || ' days')::interval,
       (ARRAY['ril_user1','ril_user2'])[k + 1]
FROM generate_series(0, 1) AS k;

COMMIT;
