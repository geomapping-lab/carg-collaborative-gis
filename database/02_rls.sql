-- =====================================================================
-- 02_rls.sql — Row-Level Security policies
--
-- Uniform four-policy pattern on every survey table:
--   SELECT  USING (true)                        everyone reads everything
--   INSERT  WITH CHECK (created_by = CURRENT_USER)
--   UPDATE  USING (created_by = CURRENT_USER)   only the owner can edit
--           WITH CHECK (true)                   see note below
--   DELETE  USING (created_by = CURRENT_USER)   (surveyors are not granted
--                                                DELETE anyway: soft delete
--                                                via is_deleted)
--
-- Note on UPDATE ... WITH CHECK (true): with WITH CHECK (created_by =
-- CURRENT_USER), updates issued from QGIS were rejected during testing.
-- Ownership is still enforced by USING on the existing row, and the audit
-- trigger (rilevamento.set_audit_fields) always restores created_by from
-- the old row, so ownership cannot be transferred by an UPDATE.
--
-- Superusers and table owners bypass RLS.
-- Run as a superuser after 01_schema.sql.
-- =====================================================================


-- ── Enable RLS ───────────────────────────────────────────────────────
ALTER TABLE rilevamento.affiorante          ENABLE ROW LEVEL SECURITY;
ALTER TABLE rilevamento.campioni            ENABLE ROW LEVEL SECURITY;
ALTER TABLE rilevamento.giaciture           ENABLE ROW LEVEL SECURITY;
ALTER TABLE rilevamento.gps                 ENABLE ROW LEVEL SECURITY;
ALTER TABLE rilevamento.linee_geomorfologia ENABLE ROW LEVEL SECURITY;
ALTER TABLE rilevamento.linee_substrato     ENABLE ROW LEVEL SECURITY;
ALTER TABLE webgis.note                     ENABLE ROW LEVEL SECURITY;


-- ── affiorante ───────────────────────────────────────────────────────
CREATE POLICY affiorante_select ON rilevamento.affiorante
    FOR SELECT USING (true);
CREATE POLICY affiorante_insert ON rilevamento.affiorante
    FOR INSERT WITH CHECK (created_by = CURRENT_USER);
CREATE POLICY affiorante_update ON rilevamento.affiorante
    FOR UPDATE USING (created_by = CURRENT_USER) WITH CHECK (true);
CREATE POLICY affiorante_delete ON rilevamento.affiorante
    FOR DELETE USING (created_by = CURRENT_USER);

-- ── campioni ─────────────────────────────────────────────────────────
CREATE POLICY campioni_select ON rilevamento.campioni
    FOR SELECT USING (true);
CREATE POLICY campioni_insert ON rilevamento.campioni
    FOR INSERT WITH CHECK (created_by = CURRENT_USER);
CREATE POLICY campioni_update ON rilevamento.campioni
    FOR UPDATE USING (created_by = CURRENT_USER) WITH CHECK (true);
CREATE POLICY campioni_delete ON rilevamento.campioni
    FOR DELETE USING (created_by = CURRENT_USER);

-- ── giaciture ────────────────────────────────────────────────────────
CREATE POLICY giaciture_select ON rilevamento.giaciture
    FOR SELECT USING (true);
CREATE POLICY giaciture_insert ON rilevamento.giaciture
    FOR INSERT WITH CHECK (created_by = CURRENT_USER);
CREATE POLICY giaciture_update ON rilevamento.giaciture
    FOR UPDATE USING (created_by = CURRENT_USER) WITH CHECK (true);
CREATE POLICY giaciture_delete ON rilevamento.giaciture
    FOR DELETE USING (created_by = CURRENT_USER);

-- ── gps ──────────────────────────────────────────────────────────────
CREATE POLICY gps_select ON rilevamento.gps
    FOR SELECT USING (true);
CREATE POLICY gps_insert ON rilevamento.gps
    FOR INSERT WITH CHECK (created_by = CURRENT_USER);
CREATE POLICY gps_update ON rilevamento.gps
    FOR UPDATE USING (created_by = CURRENT_USER) WITH CHECK (true);
CREATE POLICY gps_delete ON rilevamento.gps
    FOR DELETE USING (created_by = CURRENT_USER);

-- ── linee_geomorfologia ──────────────────────────────────────────────
CREATE POLICY linee_geomorfologia_select ON rilevamento.linee_geomorfologia
    FOR SELECT USING (true);
CREATE POLICY linee_geomorfologia_insert ON rilevamento.linee_geomorfologia
    FOR INSERT WITH CHECK (created_by = CURRENT_USER);
CREATE POLICY linee_geomorfologia_update ON rilevamento.linee_geomorfologia
    FOR UPDATE USING (created_by = CURRENT_USER) WITH CHECK (true);
CREATE POLICY linee_geomorfologia_delete ON rilevamento.linee_geomorfologia
    FOR DELETE USING (created_by = CURRENT_USER);

-- ── linee_substrato ──────────────────────────────────────────────────
CREATE POLICY linee_substrato_select ON rilevamento.linee_substrato
    FOR SELECT USING (true);
CREATE POLICY linee_substrato_insert ON rilevamento.linee_substrato
    FOR INSERT WITH CHECK (created_by = CURRENT_USER);
CREATE POLICY linee_substrato_update ON rilevamento.linee_substrato
    FOR UPDATE USING (created_by = CURRENT_USER) WITH CHECK (true);
CREATE POLICY linee_substrato_delete ON rilevamento.linee_substrato
    FOR DELETE USING (created_by = CURRENT_USER);

-- ── webgis.note (annotations) ────────────────────────────────────────
-- The author is set by trigger webgis.set_autore() to CURRENT_USER.
CREATE POLICY note_select ON webgis.note
    FOR SELECT USING (true);
CREATE POLICY note_insert ON webgis.note
    FOR INSERT WITH CHECK (autore = CURRENT_USER);
CREATE POLICY note_update ON webgis.note
    FOR UPDATE USING (autore = CURRENT_USER) WITH CHECK (true);
CREATE POLICY note_delete ON webgis.note
    FOR DELETE USING (autore = CURRENT_USER);
