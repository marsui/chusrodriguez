-SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
SET search_path = public, pg_catalog;CREATE SEQUENCE accessories_id_secuence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
SET default_tablespace = '';SET default_with_oids = false;CREATE TABLE accessories (
    id integer DEFAULT nextval('accessories_id_secuence'::regclass) NOT NULL,
    name character varying(100),
    description character varying(500),
    time_created date DEFAULT now(),
    text text,
    image_url character varying(255),
    collection_id integer
);
CREATE SEQUENCE collections_id_secuence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE collections (
    name character varying(100),
    id integer DEFAULT nextval('collections_id_secuence'::regclass) NOT NULL,
    description character varying(500),
    time_created date DEFAULT now(),
    text text,
    image_url character varying(255)
);
CREATE SEQUENCE photos_id_secuence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE contacts (
    name character varying(100),
    id integer DEFAULT nextval('photos_id_secuence'::regclass) NOT NULL,
    date date DEFAULT now(),
    email character varying(100),
    text character varying(1000),
    ip character varying(15),
    phone character varying(20)
);
CREATE SEQUENCE contacts_id_secuence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE SEQUENCE dresses_id_secuence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE dresses (
    id integer DEFAULT nextval('dresses_id_secuence'::regclass) NOT NULL,
    name character varying(100),
    description character varying(500),
    time_created date DEFAULT now(),
    text text,
    image_url character varying(255),
    collection_id integer
);
CREATE TABLE photos (
    id integer DEFAULT nextval('photos_id_secuence'::regclass) NOT NULL,
    name character varying(100),
    description character varying(500),
    time_created date DEFAULT now(),
    image_url character varying(255),
    item_id integer,
    source character varying(20)
);SELECT pg_catalog.setval('accessories_id_secuence', 1, true);
SELECT pg_catalog.setval('collections_id_secuence', 18, true);
SELECT pg_catalog.setval('contacts_id_secuence', 1, false);
SELECT pg_catalog.setval('dresses_id_secuence', 6, true);SELECT pg_catalog.setval('photos_id_secuence', 12, true);
ALTER TABLE ONLY accessories
    ADD CONSTRAINT accessories_pk PRIMARY KEY (id);
ALTER TABLE ONLY collections
    ADD CONSTRAINT collections_pk PRIMARY KEY (id);
ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pk PRIMARY KEY (id);
ALTER TABLE ONLY dresses
    ADD CONSTRAINT dresses_pk PRIMARY KEY (id);
ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pk PRIMARY KEY (id);
ALTER TABLE ONLY dresses
    ADD CONSTRAINT collection_dresses_fk FOREIGN KEY (collection_id) REFERENCES collections(id);

ALTER TABLE ONLY accessories
    ADD CONSTRAINT collection_dresses_fk FOREIGN KEY (collection_id) REFERENCES collections(id);
REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM chusrodriguez;
GRANT ALL ON SCHEMA public TO chusrodriguez;
