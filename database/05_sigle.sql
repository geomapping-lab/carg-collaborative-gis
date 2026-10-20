-- =====================================================================
-- 05_sigle.sql — Controlled vocabulary of mapped geological units
--
-- Lookup table used by the QField/QGIS forms (value relation on
-- affiorante.sigla) and joined in visualizzazione.vw_affiorante_join to
-- obtain the unit name, age and CARG code used for symbology.
-- Contents: the units adopted for the pilot sheet (CARG Sheet 073 –
-- Verbania). Replace with the legend of your own sheet.
-- =====================================================================

INSERT INTO rilevamento.verbania_sigle (sigla, nome, eta, codice_carg) VALUES
    ('ALZ', 'Formazione dell''Albenza', 'Giurassico inferiore', '482140'),
    ('APX', 'Calcare di Alpe Perino', 'Giurassico', '482130'),
    ('BLN', 'Formazione di Bellano', 'Triassico superiore', '542150'),
    ('CUN', 'Formazione di Cunardo', 'Triassico', '532130'),
    ('DOM', 'Calcare di Domaro', 'Giurassico inferiore', '452130'),
    ('DPR', 'Dolomia Principale', 'Triassico superiore', '502150'),
    ('DSS', 'Dolomia di San Salvatore', 'Triassico', '532150'),
    ('FVS', 'Flysch del Varesotto', 'Paleogene', '212140'),
    ('MAI', 'Maiolica', 'Cretaceo inferiore', '392120'),
    ('MOT', 'Calcare di Moltrasio', 'Giurassico inferiore', '472150'),
    ('PIZ', 'Marna del Pizzella', 'Triassico', '522150'),
    ('RSL', 'Radiolariti del Selcifero Lombardo', 'Giurassico superiore', '402130'),
    ('SAA', 'Scaglia Rossa', 'Cretaceo superiore', '372120'),
    ('SDL', 'Sass de la Luna', 'Cretaceo', '382130'),
    ('SML', 'Gruppo del Selcifero Lombardo', 'Giurassico superiore', '402150'),
    ('UID', 'Frana', 'Quaternario', '032140'),
    ('UIN', 'Morfologia', 'Quaternario', '012130'),
    ('VAM', 'Formazione di Val Maggiore', 'Giurassico', '442120'),
    ('WOW', 'Livelli-particolari', '???', '623226'),
    ('XYZ', 'Dubbio-altro', '???', '093537'),
    ('ZUU', 'Calcare di Zu', 'Triassico superiore', '502130')
ON CONFLICT (sigla) DO NOTHING;
