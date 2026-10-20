# Collaborative PostGIS infrastructure for CARG geological field mapping

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23496137.svg)](https://doi.org/10.5281/zenodo.23496137)

Open-source system for **multi-operator geological field surveying** within the
Italian CARG project (*CARtografia Geologica*, national 1:50,000 Geological Map of
Italy). Instead of one GeoPackage per surveyor merged at the end of the campaign,
all surveyors synchronise to a **single PostgreSQL/PostGIS geodatabase** that:

- enforces per-surveyor write ownership with **Row-Level Security (RLS)**;
- records who created and last modified every feature with an **automated audit trigger**;
- replaces physical deletion with a **soft delete** flag (`is_deleted`);
- serves a lightweight **WebGIS** (FastAPI + OpenLayers) for shared progress monitoring
  with the same symbology as the QGIS project.

Field data collection stays **offline** with QGIS/QField (QFieldSync).
The system was developed and evaluated on CARG Sheet 073 – Verbania. See the
accompanying article for design rationale and evaluation:

> Stori L., Pappalardo S.E., Federico L., Perozzo M. — *An open-source PostGIS
> infrastructure for collaborative geological field mapping: implementation and
> evaluation within the Italian CARG project* (submitted).

```
QField (offline) ──QFieldSync──►  PostgreSQL/PostGIS  ◄── QGIS desktop (QC, interpretation)
                                   │  RLS + audit trigger
                                   ▼
                     FastAPI backend (webgis_user, read-only)
                                   ▼
                        OpenLayers WebGIS (browser)
```

**Survey data are not included.** The real field dataset of the pilot sheet
belongs to an ongoing CARG survey and is not distributed. An optional
**synthetic demo dataset** is provided to try the system end to end: its
features are deliberately geometric (a grid of regular hexagons with straight
contacts and evenly spaced measurements) so that they cannot be mistaken for
real geological observations. They only serve to show symbology, filters,
soft-deleted records and per-surveyor ownership at work.

---

## Repository structure

```
database/
  01_schema.sql          schemas, tables, constraints, views, audit trigger (no data)
  02_rls.sql             Row-Level Security policies (4-policy pattern per table)
  03_roles.sql           roles and grants (passwords passed as psql variables)
  04_layer_styles.sql    QGIS styles (QML) stored in public.layer_styles
  05_sigle.sql           controlled vocabulary of geological units (pilot sheet)
  06_demo_data.sql       OPTIONAL synthetic demo features
styles/                  the same QGIS styles as .qml files
qgis/
  carg_survey_template.qgz   QGIS project (layers, forms, symbology) connected via a PostgreSQL service
  pg_service.conf.example    connection service template (per-user credentials)
webgis/
  backend/               FastAPI application (main.py, requirements.txt, .env.example)
  frontend/              OpenLayers + Vite single-page application
```

### Database schemas

| Schema            | Role                                                      |
|-------------------|-----------------------------------------------------------|
| `rilevamento`     | editable survey tables + `verbania_sigle` unit lookup     |
| `visualizzazione` | read-only views for consultation and quality control      |
| `schema_carg`     | empty reference tables of the official CARG BDG structure |
| `webgis`          | georeferenced annotations (`note`) from WebGIS and QField |

Survey tables (`affiorante`, `giaciture`, `campioni`, `linee_substrato`,
`linee_geomorfologia`, `gps`) share the audit fields `created_at`, `updated_at`,
`created_by`, `updated_by`, `is_deleted`, maintained by `rilevamento.set_audit_fields()`.
All geometries are in **EPSG:6707** (RDN2008 / UTM zone 32N); use EPSG:6708/6709
for sheets in other UTM zones.

### Roles

| Role              | Type            | Survey tables                                         |
|-------------------|-----------------|-------------------------------------------------------|
| `ril_user1`, `ril_user2` | field surveyor | SELECT all; INSERT/UPDATE own records (RLS); no DELETE |
| `dir_rilevamento` | survey director | same as surveyors                                     |
| `webgis_user`     | backend service | SELECT only; read/write on `webgis.note`              |
| `admin_carg`      | administrator   | full                                                  |

---

## Requirements

- PostgreSQL ≥ 16 with PostGIS 3 (deployed on PostgreSQL 18; tested on 16 + PostGIS 3.4)
- QGIS ≥ 3.34 and QField with the QFieldSync plugin
- Python ≥ 3.10 (backend), Node.js ≥ 20 (only to build the frontend)

---

## 1. Database

```bash
createdb -U postgres progetto_rilevamento
cd database
psql -U postgres -d progetto_rilevamento -f 01_schema.sql
psql -U postgres -d progetto_rilevamento -f 02_rls.sql
psql -U postgres -d progetto_rilevamento \
     -v pw_admin='…' -v pw_ril_user1='…' -v pw_ril_user2='…' \
     -v pw_dir='…'   -v pw_webgis='…' \
     -f 03_roles.sql
psql -U postgres -d progetto_rilevamento -f 04_layer_styles.sql
psql -U postgres -d progetto_rilevamento -f 05_sigle.sql
# optional
psql -U postgres -d progetto_rilevamento -f 06_demo_data.sql
```

On Windows run the same commands from the PostgreSQL `bin` folder or from pgAdmin's
PSQL Tool (use `^` instead of `\` for line continuation in `cmd`).

The database name `progetto_rilevamento` is used by default throughout; if you change
it, update `DB_NAME` in the backend `.env` and `dbname` in the service file.

To adapt the system to another sheet: replace `05_sigle.sql` with your legend,
update the value maps of the QGIS forms, and add one role per surveyor in `03_roles.sql`.

## 2. QGIS / QField

1. Copy `qgis/pg_service.conf.example` to your PostgreSQL service file
   (see comments in the file) and fill in **your own** role and password.
2. Open `qgis/carg_survey_template.qgz`: all layers connect through the `carg`
   service, so the project contains no credentials. Forms (value maps, date
   pickers, hidden audit fields) and symbology are preconfigured; styles are
   also stored in the database (`public.layer_styles`).
3. Package the project for the field with **QFieldSync** (all survey layers set to
   *offline editing*), collect data in QField, then synchronise back from QGIS.
   The audit trigger assigns `created_by` to the synchronising role and RLS
   rejects writes on records owned by others.

> **Note.** When an edit targets a record owned by another surveyor, RLS filters
> the row out and the UPDATE affects zero rows; QGIS still reports the commit as
> successful. Edits on records of other surveyors are therefore not applied, but
> without an explicit error message in QGIS.

## 3. WebGIS

### Backend

```bash
cd webgis/backend
python -m venv .venv && . .venv/bin/activate      # Windows: .venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env                               # then edit .env
uvicorn main:app --host 0.0.0.0 --port 8000
```

`.env` holds the `webgis_user` password (`DB_PASSWORD`) and the WebGIS login
accounts (`WEBGIS_USERS=user:password,…`). The WebGIS login is independent from
the PostgreSQL roles; use the surveyors' role names so that the per-surveyor
filter matches `created_by`.

### Frontend

```bash
cd webgis/frontend
npm ci
npm run build          # → webgis/frontend/dist, served by FastAPI at http://host:8000/
```

For development with hot reload: start the backend with
`CORS_ORIGINS=http://localhost:5173` in `.env`, then run
`VITE_API_BASE=http://localhost:8000 npm run dev`.

The initial map view is set in `webgis/frontend/src/main.js` (`center`, `zoom`).

### Running as a Windows service

On the Windows VM used for the pilot, uvicorn can be registered as a service with
[NSSM](https://nssm.cc/): application `…\.venv\Scripts\uvicorn.exe`, arguments
`main:app --host 0.0.0.0 --port 8000`, startup directory `webgis\backend`.

### API

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/login`, `/api/logout` | token-based session (UUID token) |
| GET | `/api/layers/{affioranti,giaciture,campioni,linee_substrato,linee_geomorfologia}` | GeoJSON (EPSG:4326); filters `rilevatore`, `data_da`, `data_a`, `solo_attivi`, `sigla` |
| GET | `/api/stili/affioranti`, `/api/stili/giaciture` | symbology parsed from the QML in `public.layer_styles` |
| GET/POST/DELETE | `/api/note` | annotations |
| GET | `/api/rilevatori`, `/api/sigle`, `/api/health` | utilities |

---

## Known limitations

This is a research prototype (see the article, Tab. 5.3):

- no topological validation during the survey (deferred to the interpretation phase);
- QFieldSync operations are not atomic;
- WebGIS login accounts are stored in an environment variable as plain text and
  tokens are kept in memory (lost on restart) — use a proper identity provider and
  secret management in production;
- annotations created from the WebGIS are stored with `autore = webgis_user`,
  because the `webgis.set_autore()` trigger sets the author to the database role;
- no vector tile service: layers are served as GeoJSON (adequate for the pilot
  data volume; `pg_tileserv` is the identified upgrade path).

---

## Licence and citation

Code: [MIT](LICENSE). Please cite the article above and this software:

> Stori L. (2026) — *carg-collaborative-gis: Collaborative PostGIS infrastructure
> for CARG geological field mapping*, v1.0.0 [software]. Zenodo.
> https://doi.org/10.5281/zenodo.23496138

The DOI above identifies version 1.0.0, the version described in the article;
https://doi.org/10.5281/zenodo.23496137 always resolves to the latest version.
See also [`CITATION.cff`](CITATION.cff).

Basemap in the WebGIS and QGIS project: © OpenStreetMap contributors.
