-- =====================================================================
-- 03_roles.sql — Database roles and privileges
--
-- Profiles (paper, Tab. 4.2):
--   admin_carg        project administrator — full access
--   ril_user1/2       field surveyors       — SELECT all; INSERT/UPDATE own
--                                             records (RLS); no DELETE
--   dir_rilevamento   survey director       — same as surveyors
--   webgis_user       WebGIS backend        — read-only on survey tables,
--                                             read/write on webgis.note
--
-- Passwords are NOT stored in this file: pass them as psql variables, e.g.
--
--   psql -U postgres -d progetto_rilevamento \
--        -v pw_admin='...' -v pw_ril_user1='...' -v pw_ril_user2='...' \
--        -v pw_dir='...'   -v pw_webgis='...' \
--        -f 03_roles.sql
--
-- The webgis_user password must match DB_PASSWORD in webgis/backend/.env.
-- Add further surveyors by copying the ril_user blocks.
-- Run as a superuser after 01_schema.sql.
-- =====================================================================

\set ON_ERROR_STOP on

\if :{?pw_admin}
\else
  \echo 'ERROR: missing -v pw_admin=... (see header of 03_roles.sql)'
  \quit
\endif
\if :{?pw_ril_user1}
\else
  \echo 'ERROR: missing -v pw_ril_user1=...'
  \quit
\endif
\if :{?pw_ril_user2}
\else
  \echo 'ERROR: missing -v pw_ril_user2=...'
  \quit
\endif
\if :{?pw_dir}
\else
  \echo 'ERROR: missing -v pw_dir=...'
  \quit
\endif
\if :{?pw_webgis}
\else
  \echo 'ERROR: missing -v pw_webgis=...'
  \quit
\endif


-- ── 1. Project administrator ────────────────────────────────────────
CREATE ROLE admin_carg LOGIN CREATEROLE PASSWORD :'pw_admin';

GRANT USAGE ON SCHEMA rilevamento, visualizzazione, webgis, schema_carg TO admin_carg;
GRANT ALL ON ALL TABLES    IN SCHEMA rilevamento     TO admin_carg;
GRANT ALL ON ALL TABLES    IN SCHEMA visualizzazione TO admin_carg;
GRANT ALL ON ALL TABLES    IN SCHEMA webgis          TO admin_carg;
GRANT ALL ON ALL TABLES    IN SCHEMA schema_carg     TO admin_carg;
GRANT ALL ON ALL SEQUENCES IN SCHEMA rilevamento     TO admin_carg;
GRANT ALL ON ALL SEQUENCES IN SCHEMA webgis          TO admin_carg;
GRANT SELECT ON TABLE public.layer_styles TO admin_carg;


-- ── 2. Field surveyors and survey director ─────────────────────────
CREATE ROLE ril_user1       LOGIN PASSWORD :'pw_ril_user1';
CREATE ROLE ril_user2       LOGIN PASSWORD :'pw_ril_user2';
CREATE ROLE dir_rilevamento LOGIN PASSWORD :'pw_dir';

GRANT USAGE ON SCHEMA rilevamento, visualizzazione, webgis
    TO ril_user1, ril_user2, dir_rilevamento;

-- Survey tables: no DELETE (soft delete through is_deleted)
GRANT SELECT, INSERT, UPDATE ON TABLE
    rilevamento.affiorante,
    rilevamento.campioni,
    rilevamento.giaciture,
    rilevamento.gps,
    rilevamento.linee_geomorfologia,
    rilevamento.linee_substrato
    TO ril_user1, ril_user2, dir_rilevamento;

-- Sequences behind the id columns (needed for INSERT)
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA rilevamento
    TO ril_user1, ril_user2, dir_rilevamento;

-- Geological unit lookup: read-only
GRANT SELECT ON TABLE rilevamento.verbania_sigle
    TO ril_user1, ril_user2, dir_rilevamento;

-- Consultation / quality-control views
GRANT SELECT ON TABLE
    visualizzazione.vw_affiorante_join,
    visualizzazione.vw_affiorante_da_scartare
    TO ril_user1, ril_user2, dir_rilevamento;

-- QGIS styles stored in the database
GRANT SELECT ON TABLE public.layer_styles
    TO ril_user1, ril_user2, dir_rilevamento;

-- Annotations from QField / QGIS
GRANT SELECT, INSERT, UPDATE ON TABLE webgis.note
    TO ril_user1, ril_user2, dir_rilevamento;
GRANT USAGE, SELECT ON SEQUENCE webgis.note_id_seq
    TO ril_user1, ril_user2, dir_rilevamento;


-- ── 3. WebGIS backend service account ───────────────────────────────
CREATE ROLE webgis_user LOGIN PASSWORD :'pw_webgis';

GRANT USAGE ON SCHEMA rilevamento, visualizzazione, webgis TO webgis_user;

GRANT SELECT ON TABLE
    rilevamento.affiorante,
    rilevamento.campioni,
    rilevamento.giaciture,
    rilevamento.gps,
    rilevamento.linee_geomorfologia,
    rilevamento.linee_substrato,
    rilevamento.verbania_sigle
    TO webgis_user;

GRANT SELECT ON TABLE visualizzazione.vw_affiorante_join TO webgis_user;
GRANT SELECT ON TABLE public.layer_styles TO webgis_user;

GRANT SELECT, INSERT, DELETE ON TABLE webgis.note TO webgis_user;
GRANT USAGE, SELECT ON SEQUENCE webgis.note_id_seq TO webgis_user;
