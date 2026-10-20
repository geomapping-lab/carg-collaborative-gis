-- =====================================================================
-- 01_schema.sql — Database structure (no data)
-- Collaborative GIS for CARG geological field surveying
--
-- Creates: PostGIS extension, the four application schemas
-- (rilevamento, visualizzazione, schema_carg, webgis), the audit
-- trigger function, survey tables with CHECK/FK constraints, derived
-- views, the WebGIS annotation table and the QGIS layer_styles table.
--
-- Extracted (schema-only) from the database deployed for the pilot
-- sheet (CARG Sheet 073 – Verbania). Row-Level Security policies are
-- in 02_rls.sql, roles and grants in 03_roles.sql.
--
-- Run as a superuser on an empty database:
--   psql -U postgres -d progetto_rilevamento -f 01_schema.sql
-- =====================================================================

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


-- ---------------------------------------------------------------------
-- Schemas
-- ---------------------------------------------------------------------

CREATE SCHEMA rilevamento;

CREATE SCHEMA schema_carg;

CREATE SCHEMA visualizzazione;

CREATE SCHEMA webgis;



-- ---------------------------------------------------------------------
-- Functions
-- ---------------------------------------------------------------------

CREATE FUNCTION rilevamento.set_audit_fields() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        NEW.created_at := COALESCE(NEW.created_at, now());
        NEW.updated_at := now();
        NEW.created_by := COALESCE(NEW.created_by, current_user);
        NEW.updated_by := current_user;
        NEW.is_deleted := COALESCE(NEW.is_deleted, false);

    ELSIF TG_OP = 'UPDATE' THEN
        NEW.created_at := OLD.created_at;
        NEW.created_by := OLD.created_by;
        NEW.updated_at := now();
        NEW.updated_by := current_user;
        NEW.is_deleted := COALESCE(NEW.is_deleted, OLD.is_deleted, false);
    END IF;

    RETURN NEW;
END;
$$;

CREATE FUNCTION webgis.set_autore() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        NEW.autore      := current_user;
        NEW.created_at  := COALESCE(NEW.created_at, now());
    END IF;
    RETURN NEW;
END;
$$;


-- ---------------------------------------------------------------------
-- Tables
-- ---------------------------------------------------------------------

CREATE TABLE public.layer_styles (
    id integer NOT NULL,
    f_table_catalog character varying,
    f_table_schema character varying,
    f_table_name character varying,
    f_geometry_column character varying,
    stylename text,
    styleqml xml,
    stylesld xml,
    useasdefault boolean,
    description text,
    owner character varying(63) DEFAULT CURRENT_USER,
    ui xml,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    type character varying,
    r_raster_column character varying
);

CREATE TABLE rilevamento.affiorante (
    id integer NOT NULL,
    geom public.geometry(Polygon,6707) NOT NULL,
    fid bigint,
    sigla character varying(8),
    descrizione character varying(200),
    visibilita character varying(6),
    part integer,
    stratif integer,
    assetto character varying(2),
    caratter character varying(50),
    note character varying(200),
    data_ora timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    created_by text NOT NULL,
    updated_by text NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL
);

CREATE TABLE rilevamento.campioni (
    id integer NOT NULL,
    geom public.geometry(Point,6707),
    fid bigint,
    "Sigla" character varying(10),
    "Note" character varying(50),
    data_ora timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by text,
    updated_by text,
    is_deleted boolean DEFAULT false NOT NULL
);

CREATE TABLE rilevamento.giaciture (
    id integer NOT NULL,
    geom public.geometry(Point,6707),
    fid bigint,
    "Tipo" integer,
    "Tipologia" integer,
    "Immersio" integer,
    "Direzio" integer,
    "Inclina" integer,
    "Fase" integer,
    "Verso" integer,
    "Asimmetria" integer,
    note character varying(150),
    data_ora timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by text,
    updated_by text,
    is_deleted boolean DEFAULT false NOT NULL,
    CONSTRAINT chk_giaciture_direzio CHECK ((("Direzio" IS NULL) OR (("Direzio" >= 0) AND ("Direzio" <= 360)))),
    CONSTRAINT chk_giaciture_immersio CHECK ((("Immersio" IS NULL) OR (("Immersio" >= 0) AND ("Immersio" <= 360)))),
    CONSTRAINT chk_giaciture_inclina CHECK ((("Inclina" IS NULL) OR (("Inclina" >= 0) AND ("Inclina" <= 90))))
);

CREATE TABLE rilevamento.gps (
    id integer NOT NULL,
    geom public.geometry(LineString,6707),
    fid bigint,
    data_ora timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by text,
    updated_by text,
    is_deleted boolean DEFAULT false NOT NULL
);

CREATE TABLE rilevamento.linee_geomorfologia (
    id integer NOT NULL,
    geom public.geometry(LineString,6707),
    fid bigint,
    "Tipo" integer,
    "Tipologia" integer,
    "Stato" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by text,
    updated_by text,
    is_deleted boolean DEFAULT false NOT NULL
);

CREATE TABLE rilevamento.linee_substrato (
    id integer NOT NULL,
    geom public.geometry(LineString,6707),
    fid bigint,
    "Tipo" integer,
    "Tipologia" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by text,
    updated_by text,
    is_deleted boolean DEFAULT false NOT NULL
);

CREATE TABLE rilevamento.verbania_sigle (
    id integer NOT NULL,
    sigla character varying,
    nome character varying,
    eta character varying,
    codice_carg character varying
);

CREATE TABLE schema_carg."T0180805000" (
    id integer CONSTRAINT "CARG_schema — T0180805000_id_not_null" NOT NULL,
    fid bigint,
    "OBJECTID" character varying,
    "FoglioGeologico" character varying,
    "Id_Lito" character varying,
    "Uc_Lege" character varying,
    "Lito1" character varying,
    "Part1" character varying,
    "Stratif1" character varying,
    "Assetto1" character varying,
    "Struttura1" character varying,
    "Caratter1" character varying,
    "Composizio1" character varying,
    "Lito2" character varying,
    "Part2" character varying,
    "Stratif2" character varying,
    "Assetto2" character varying,
    "Struttura2" character varying,
    "Caratter2" character varying,
    "Composizio2" character varying,
    "Lito3" character varying,
    "Part3" character varying,
    "Stratif3" character varying,
    "Assetto3" character varying,
    "Struttura3" character varying,
    "Caratter3" character varying,
    "Composizio3" character varying,
    "Spessore" character varying,
    "Note" character varying(200)
);

CREATE TABLE schema_carg."ST010Point" (
    id integer NOT NULL,
    geom public.geometry(Point,6707),
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(15),
    "Pun_Gmo" integer,
    "Tipo" integer,
    "Tipologia" integer,
    "Stato" integer,
    "Direzio" integer
);

CREATE TABLE schema_carg."ST011Polygon" (
    id integer NOT NULL,
    geom public.geometry(Polygon,6707),
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(15),
    "Pol_Gmo" integer,
    "Tipo" integer,
    "Tipologia" integer,
    "Stato" integer,
    "Direzio" integer,
    "Shape_Length" double precision,
    "Shape_Area" double precision
);

CREATE TABLE schema_carg."ST012Polyline" (
    id integer NOT NULL,
    geom public.geometry(LineString,6707),
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(15),
    "Lin_Gmo" integer,
    "Tipo" integer,
    "Tipologia" integer,
    "Stato" integer,
    "Label" character varying(255),
    "Shape_Length" double precision
);

CREATE TABLE schema_carg."ST013Point" (
    id integer NOT NULL,
    geom public.geometry(Point,6707),
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(15),
    "Num_Ris" integer,
    "Tipo" integer,
    "Label1" character varying(255),
    "Label2" character varying(255),
    "Label3" character varying(255),
    "Codice" character varying(255),
    "Num_Cam" integer
);

CREATE TABLE schema_carg."ST017Point" (
    id integer NOT NULL,
    geom public.geometry(Point,6707),
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(15),
    "Num_Cam" integer,
    "Sigl_Ins" character varying(10),
    "Id_Ele" integer,
    "Id_Cam" integer,
    "Sigl_Cam" character varying(7),
    "Simb_Uc" integer,
    "Uc_Lege" integer,
    "Num_Trac" integer,
    "Analisi" integer
);

CREATE TABLE schema_carg."ST018Polygon" (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon,6707),
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(15),
    "ST018_" integer,
    "Pol_Uc" integer,
    "Direzio" integer,
    "Uq_Car" integer,
    "Uc_Lege" integer,
    "Id_Tess" integer,
    "Sommerso" integer,
    "Id_Amb" integer,
    "Superficie" double precision,
    "Shape_Length" double precision,
    "Shape_Area" double precision,
    "Id_Lito" bigint
);

CREATE TABLE schema_carg."ST018Polyline" (
    id integer NOT NULL,
    geom public.geometry(LineString,6707),
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(255),
    "LPoly_" integer,
    "RPoly_" integer,
    "Lin_Uc" integer,
    "Tipo" integer,
    "Tipologia" integer,
    "Id_Limite" integer,
    "Id_Elest" integer,
    "Direzio" integer,
    "Contorno" integer,
    "Affiora" integer,
    "Shape_Length" double precision
);

CREATE TABLE schema_carg."ST019Point" (
    id integer NOT NULL,
    geom public.geometry(Point,6707),
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(255),
    "Num_Oss" integer,
    "Tipo" integer,
    "Tipologia" integer,
    "Strato" integer,
    "Id_Corr" integer,
    "Immersio" integer,
    "Direzio" integer,
    "Inclina" integer,
    "Quota" double precision,
    "Metodo" character varying(64),
    "Fase" integer,
    "Label" character varying(40),
    "Verso" integer,
    "Asimmetria" integer
);

CREATE TABLE schema_carg."ST020Polyline" (
    id integer NOT NULL,
    geom public.geometry(LineString,6707),
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(255),
    "Simb_Uc" integer,
    "Uc_Lege" integer,
    "Tipo" integer,
    "Tipologia" integer,
    "Label" character varying(5),
    "Shape_Length" double precision
);

CREATE TABLE schema_carg."ST021Polyline" (
    id integer NOT NULL,
    geom public.geometry(MultiLineString,6707),
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(15),
    "Num_Piega" integer,
    "Tipo" integer,
    "Tipologia" integer,
    "Direzio" integer,
    "Fase" integer,
    "Shape_Length" double precision
);

CREATE TABLE schema_carg."ST022Polygon" (
    id integer NOT NULL,
    geom public.geometry(Polygon,6707),
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(15),
    "Num_Proc" integer,
    "Tipo" integer,
    "Direzio" integer,
    "Commento" character varying(100),
    "Tipologia" integer,
    "Shape_Length" double precision,
    "Shape_Area" double precision
);

CREATE TABLE schema_carg."T0130101000" (
    id integer NOT NULL,
    fid bigint,
    "Num_Ris" bigint,
    "Id_Liv" bigint,
    "Da_Profondita" double precision,
    "A_Profondita" double precision,
    "Spessore" double precision,
    "Eta_Inf" character varying(6),
    "Eta_Sup" character varying(6),
    "Id_Lito" bigint,
    "Uc_Lege" bigint,
    "Sigla" character varying(10),
    "Num_Cam1" bigint,
    "Prof_Cam1" double precision,
    "Num_Cam2" bigint,
    "Prof_Cam2" double precision,
    "Descrizione" character varying(200)
);

CREATE TABLE schema_carg."T0180201000" (
    id integer NOT NULL,
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(255),
    "Id_Limite" integer,
    "Nome" character varying(64),
    "Commento" character varying(512)
);

CREATE TABLE schema_carg."T0180202000" (
    id integer NOT NULL,
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(255),
    "Id_Elest" integer,
    "Nome" character varying(64),
    "Commento" character varying(100)
);

CREATE TABLE schema_carg."T0180801000" (
    id integer NOT NULL,
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(255),
    "Uq_Car" integer,
    "Tipo" integer,
    "Stato" integer
);

CREATE TABLE schema_carg."T0180802000" (
    id integer NOT NULL,
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(255),
    "Uc_Lege" integer,
    "Eta_Sup" character varying(4),
    "Sig_Etas" integer,
    "Eta_Inf" character varying(4),
    "Sig_Etai" integer,
    "Sigla1" character varying(10),
    "Colore" integer,
    "S1_Tipo" character varying(2),
    "Formale1" integer,
    "Cartografata" integer,
    "Nome" character varying(120),
    "Legenda" character varying(255),
    "Sigla2" character varying(10),
    "S2_Tipo" character varying(2),
    "Formale2" integer,
    "Nom_Naz2" character varying(64),
    "Sigla3" character varying(10),
    "S3_Tipo" character varying(2),
    "Formale3" integer,
    "Nom_Naz3" character varying(64),
    "Sigla4" character varying(10),
    "S4_Tipo" character varying(2),
    "Formale4" integer,
    "Nom_Naz4" character varying(64),
    "Sigla_Carta" character varying(20)
);

CREATE TABLE schema_carg."T0180803000" (
    id integer NOT NULL,
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(255),
    "Id_Tess" integer,
    "Tessitura" character varying(3),
    "Cemento" integer,
    "Bioclastico" integer
);

CREATE TABLE schema_carg."T0180804000" (
    id integer NOT NULL,
    fid bigint,
    "OBJECTID" bigint,
    "FoglioGeologico" character varying(255),
    "Id_Amb" integer,
    "Ambiente" integer,
    "Depositi" integer
);

CREATE TABLE webgis.note (
    id integer NOT NULL,
    geom public.geometry(Point,6707) NOT NULL,
    testo text NOT NULL,
    autore text NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


-- ---------------------------------------------------------------------
-- Sequences
-- ---------------------------------------------------------------------

CREATE SEQUENCE public.layer_styles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE rilevamento.affiorante_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE rilevamento.campioni_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE rilevamento.giaciture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE rilevamento.gps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE rilevamento.linee_geomorfologia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE rilevamento.linee_substrato_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE rilevamento.verbania_sigle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."CARG_schema — T0180805000_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."ST010Point_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."ST011Polygon_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."ST012Polyline_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."ST013Point_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."ST017Point_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."ST018Polygon_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."ST018Polyline_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."ST019Point_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."ST020Polyline_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."ST021Polyline_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."ST022Polygon_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."T0130101000_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."T0180201000_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."T0180202000_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."T0180801000_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."T0180802000_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."T0180803000_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE schema_carg."T0180804000_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE webgis.note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.layer_styles_id_seq OWNED BY public.layer_styles.id;

ALTER SEQUENCE rilevamento.affiorante_id_seq OWNED BY rilevamento.affiorante.id;

ALTER SEQUENCE rilevamento.campioni_id_seq OWNED BY rilevamento.campioni.id;

ALTER SEQUENCE rilevamento.giaciture_id_seq OWNED BY rilevamento.giaciture.id;

ALTER SEQUENCE rilevamento.gps_id_seq OWNED BY rilevamento.gps.id;

ALTER SEQUENCE rilevamento.linee_geomorfologia_id_seq OWNED BY rilevamento.linee_geomorfologia.id;

ALTER SEQUENCE rilevamento.linee_substrato_id_seq OWNED BY rilevamento.linee_substrato.id;

ALTER SEQUENCE rilevamento.verbania_sigle_id_seq OWNED BY rilevamento.verbania_sigle.id;

ALTER SEQUENCE schema_carg."CARG_schema — T0180805000_id_seq" OWNED BY schema_carg."T0180805000".id;

ALTER SEQUENCE schema_carg."ST010Point_id_seq" OWNED BY schema_carg."ST010Point".id;

ALTER SEQUENCE schema_carg."ST011Polygon_id_seq" OWNED BY schema_carg."ST011Polygon".id;

ALTER SEQUENCE schema_carg."ST012Polyline_id_seq" OWNED BY schema_carg."ST012Polyline".id;

ALTER SEQUENCE schema_carg."ST013Point_id_seq" OWNED BY schema_carg."ST013Point".id;

ALTER SEQUENCE schema_carg."ST017Point_id_seq" OWNED BY schema_carg."ST017Point".id;

ALTER SEQUENCE schema_carg."ST018Polygon_id_seq" OWNED BY schema_carg."ST018Polygon".id;

ALTER SEQUENCE schema_carg."ST018Polyline_id_seq" OWNED BY schema_carg."ST018Polyline".id;

ALTER SEQUENCE schema_carg."ST019Point_id_seq" OWNED BY schema_carg."ST019Point".id;

ALTER SEQUENCE schema_carg."ST020Polyline_id_seq" OWNED BY schema_carg."ST020Polyline".id;

ALTER SEQUENCE schema_carg."ST021Polyline_id_seq" OWNED BY schema_carg."ST021Polyline".id;

ALTER SEQUENCE schema_carg."ST022Polygon_id_seq" OWNED BY schema_carg."ST022Polygon".id;

ALTER SEQUENCE schema_carg."T0130101000_id_seq" OWNED BY schema_carg."T0130101000".id;

ALTER SEQUENCE schema_carg."T0180201000_id_seq" OWNED BY schema_carg."T0180201000".id;

ALTER SEQUENCE schema_carg."T0180202000_id_seq" OWNED BY schema_carg."T0180202000".id;

ALTER SEQUENCE schema_carg."T0180801000_id_seq" OWNED BY schema_carg."T0180801000".id;

ALTER SEQUENCE schema_carg."T0180802000_id_seq" OWNED BY schema_carg."T0180802000".id;

ALTER SEQUENCE schema_carg."T0180803000_id_seq" OWNED BY schema_carg."T0180803000".id;

ALTER SEQUENCE schema_carg."T0180804000_id_seq" OWNED BY schema_carg."T0180804000".id;

ALTER SEQUENCE webgis.note_id_seq OWNED BY webgis.note.id;


-- ---------------------------------------------------------------------
-- Column defaults
-- ---------------------------------------------------------------------

ALTER TABLE ONLY public.layer_styles ALTER COLUMN id SET DEFAULT nextval('public.layer_styles_id_seq'::regclass);

ALTER TABLE ONLY rilevamento.affiorante ALTER COLUMN id SET DEFAULT nextval('rilevamento.affiorante_id_seq'::regclass);

ALTER TABLE ONLY rilevamento.campioni ALTER COLUMN id SET DEFAULT nextval('rilevamento.campioni_id_seq'::regclass);

ALTER TABLE ONLY rilevamento.giaciture ALTER COLUMN id SET DEFAULT nextval('rilevamento.giaciture_id_seq'::regclass);

ALTER TABLE ONLY rilevamento.gps ALTER COLUMN id SET DEFAULT nextval('rilevamento.gps_id_seq'::regclass);

ALTER TABLE ONLY rilevamento.linee_geomorfologia ALTER COLUMN id SET DEFAULT nextval('rilevamento.linee_geomorfologia_id_seq'::regclass);

ALTER TABLE ONLY rilevamento.linee_substrato ALTER COLUMN id SET DEFAULT nextval('rilevamento.linee_substrato_id_seq'::regclass);

ALTER TABLE ONLY rilevamento.verbania_sigle ALTER COLUMN id SET DEFAULT nextval('rilevamento.verbania_sigle_id_seq'::regclass);

ALTER TABLE ONLY schema_carg."ST010Point" ALTER COLUMN id SET DEFAULT nextval('schema_carg."ST010Point_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."ST011Polygon" ALTER COLUMN id SET DEFAULT nextval('schema_carg."ST011Polygon_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."ST012Polyline" ALTER COLUMN id SET DEFAULT nextval('schema_carg."ST012Polyline_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."ST013Point" ALTER COLUMN id SET DEFAULT nextval('schema_carg."ST013Point_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."ST017Point" ALTER COLUMN id SET DEFAULT nextval('schema_carg."ST017Point_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."ST018Polygon" ALTER COLUMN id SET DEFAULT nextval('schema_carg."ST018Polygon_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."ST018Polyline" ALTER COLUMN id SET DEFAULT nextval('schema_carg."ST018Polyline_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."ST019Point" ALTER COLUMN id SET DEFAULT nextval('schema_carg."ST019Point_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."ST020Polyline" ALTER COLUMN id SET DEFAULT nextval('schema_carg."ST020Polyline_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."ST021Polyline" ALTER COLUMN id SET DEFAULT nextval('schema_carg."ST021Polyline_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."ST022Polygon" ALTER COLUMN id SET DEFAULT nextval('schema_carg."ST022Polygon_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."T0130101000" ALTER COLUMN id SET DEFAULT nextval('schema_carg."T0130101000_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."T0180201000" ALTER COLUMN id SET DEFAULT nextval('schema_carg."T0180201000_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."T0180202000" ALTER COLUMN id SET DEFAULT nextval('schema_carg."T0180202000_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."T0180801000" ALTER COLUMN id SET DEFAULT nextval('schema_carg."T0180801000_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."T0180802000" ALTER COLUMN id SET DEFAULT nextval('schema_carg."T0180802000_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."T0180803000" ALTER COLUMN id SET DEFAULT nextval('schema_carg."T0180803000_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."T0180804000" ALTER COLUMN id SET DEFAULT nextval('schema_carg."T0180804000_id_seq"'::regclass);

ALTER TABLE ONLY schema_carg."T0180805000" ALTER COLUMN id SET DEFAULT nextval('schema_carg."CARG_schema — T0180805000_id_seq"'::regclass);

ALTER TABLE ONLY webgis.note ALTER COLUMN id SET DEFAULT nextval('webgis.note_id_seq'::regclass);


-- ---------------------------------------------------------------------
-- Views
-- ---------------------------------------------------------------------

CREATE VIEW visualizzazione.vw_affiorante_da_scartare AS
 SELECT id,
    geom,
    sigla,
    descrizione,
    note,
    created_at,
    updated_at,
    created_by,
    updated_by,
    is_deleted
   FROM rilevamento.affiorante
  WHERE (is_deleted = true);

CREATE VIEW visualizzazione.vw_affiorante_join AS
 SELECT a.id,
    a.geom,
    a.fid,
    a.sigla,
    a.descrizione,
    a.visibilita,
    a.part,
    a.stratif,
    a.assetto,
    a.caratter,
    a.note,
    a.data_ora,
    a.created_at,
    a.updated_at,
    a.created_by,
    a.updated_by,
    a.is_deleted,
    v.nome AS nome_unita,
    v.eta,
    v.codice_carg
   FROM (rilevamento.affiorante a
     LEFT JOIN rilevamento.verbania_sigle v ON (((a.sigla)::text = (v.sigla)::text)));


-- ---------------------------------------------------------------------
-- Primary keys and unique constraints
-- ---------------------------------------------------------------------

ALTER TABLE ONLY public.layer_styles
    ADD CONSTRAINT layer_styles_pkey PRIMARY KEY (id);

ALTER TABLE ONLY rilevamento.affiorante
    ADD CONSTRAINT affiorante_pkey PRIMARY KEY (id);

ALTER TABLE ONLY rilevamento.campioni
    ADD CONSTRAINT campioni_pkey PRIMARY KEY (id);

ALTER TABLE ONLY rilevamento.giaciture
    ADD CONSTRAINT giaciture_pkey PRIMARY KEY (id);

ALTER TABLE ONLY rilevamento.gps
    ADD CONSTRAINT gps_pkey PRIMARY KEY (id);

ALTER TABLE ONLY rilevamento.linee_geomorfologia
    ADD CONSTRAINT linee_geomorfologia_pkey PRIMARY KEY (id);

ALTER TABLE ONLY rilevamento.linee_substrato
    ADD CONSTRAINT linee_substrato_pkey PRIMARY KEY (id);

ALTER TABLE ONLY rilevamento.verbania_sigle
    ADD CONSTRAINT verbania_sigle_pkey PRIMARY KEY (id);

ALTER TABLE ONLY rilevamento.verbania_sigle
    ADD CONSTRAINT verbania_sigle_sigla_unique UNIQUE (sigla);

ALTER TABLE ONLY schema_carg."T0180805000"
    ADD CONSTRAINT "CARG_schema — T0180805000_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."ST010Point"
    ADD CONSTRAINT "ST010Point_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."ST011Polygon"
    ADD CONSTRAINT "ST011Polygon_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."ST012Polyline"
    ADD CONSTRAINT "ST012Polyline_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."ST013Point"
    ADD CONSTRAINT "ST013Point_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."ST017Point"
    ADD CONSTRAINT "ST017Point_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."ST018Polygon"
    ADD CONSTRAINT "ST018Polygon_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."ST018Polyline"
    ADD CONSTRAINT "ST018Polyline_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."ST019Point"
    ADD CONSTRAINT "ST019Point_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."ST020Polyline"
    ADD CONSTRAINT "ST020Polyline_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."ST021Polyline"
    ADD CONSTRAINT "ST021Polyline_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."ST022Polygon"
    ADD CONSTRAINT "ST022Polygon_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."T0130101000"
    ADD CONSTRAINT "T0130101000_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."T0180201000"
    ADD CONSTRAINT "T0180201000_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."T0180202000"
    ADD CONSTRAINT "T0180202000_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."T0180801000"
    ADD CONSTRAINT "T0180801000_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."T0180802000"
    ADD CONSTRAINT "T0180802000_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."T0180803000"
    ADD CONSTRAINT "T0180803000_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY schema_carg."T0180804000"
    ADD CONSTRAINT "T0180804000_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY webgis.note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


-- ---------------------------------------------------------------------
-- Audit triggers
-- ---------------------------------------------------------------------

CREATE TRIGGER trg_affiorante_audit BEFORE INSERT OR UPDATE ON rilevamento.affiorante FOR EACH ROW EXECUTE FUNCTION rilevamento.set_audit_fields();

CREATE TRIGGER trg_campioni_audit BEFORE INSERT OR UPDATE ON rilevamento.campioni FOR EACH ROW EXECUTE FUNCTION rilevamento.set_audit_fields();

CREATE TRIGGER trg_giaciture_audit BEFORE INSERT OR UPDATE ON rilevamento.giaciture FOR EACH ROW EXECUTE FUNCTION rilevamento.set_audit_fields();

CREATE TRIGGER trg_gps_audit BEFORE INSERT OR UPDATE ON rilevamento.gps FOR EACH ROW EXECUTE FUNCTION rilevamento.set_audit_fields();

CREATE TRIGGER trg_linee_geomorfologia_audit BEFORE INSERT OR UPDATE ON rilevamento.linee_geomorfologia FOR EACH ROW EXECUTE FUNCTION rilevamento.set_audit_fields();

CREATE TRIGGER trg_linee_substrato_audit BEFORE INSERT OR UPDATE ON rilevamento.linee_substrato FOR EACH ROW EXECUTE FUNCTION rilevamento.set_audit_fields();

CREATE TRIGGER trg_note_autore BEFORE INSERT ON webgis.note FOR EACH ROW EXECUTE FUNCTION webgis.set_autore();


-- ---------------------------------------------------------------------
-- Foreign keys
-- ---------------------------------------------------------------------

ALTER TABLE ONLY rilevamento.affiorante
    ADD CONSTRAINT affiorante_sigla_fk FOREIGN KEY (sigla) REFERENCES rilevamento.verbania_sigle(sigla);

