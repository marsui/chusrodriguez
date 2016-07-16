--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-07-16 12:27:34 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13276)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 189 (class 1259 OID 16461)
-- Name: accessories_id_secuence; Type: SEQUENCE; Schema: public; Owner: chusrodriguez
--

CREATE SEQUENCE accessories_id_secuence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accessories_id_secuence OWNER TO chusrodriguez;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 190 (class 1259 OID 16463)
-- Name: accessories; Type: TABLE; Schema: public; Owner: chusrodriguez
--

CREATE TABLE accessories (
    id integer DEFAULT nextval('accessories_id_secuence'::regclass) NOT NULL,
    name character varying(100),
    description character varying(500),
    time_created date DEFAULT now(),
    text text,
    image_url character varying(255)
);


ALTER TABLE accessories OWNER TO chusrodriguez;

--
-- TOC entry 182 (class 1259 OID 16402)
-- Name: collections_id_secuence; Type: SEQUENCE; Schema: public; Owner: chusrodriguez
--

CREATE SEQUENCE collections_id_secuence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE collections_id_secuence OWNER TO chusrodriguez;

--
-- TOC entry 181 (class 1259 OID 16396)
-- Name: collections; Type: TABLE; Schema: public; Owner: chusrodriguez
--

CREATE TABLE collections (
    name character varying(100),
    id integer DEFAULT nextval('collections_id_secuence'::regclass) NOT NULL,
    description character varying(500),
    time_created date DEFAULT now(),
    text text,
    image_url character varying(255)
);


ALTER TABLE collections OWNER TO chusrodriguez;

--
-- TOC entry 185 (class 1259 OID 16424)
-- Name: photos_id_secuence; Type: SEQUENCE; Schema: public; Owner: chusrodriguez
--

CREATE SEQUENCE photos_id_secuence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photos_id_secuence OWNER TO chusrodriguez;

--
-- TOC entry 188 (class 1259 OID 16444)
-- Name: contacts; Type: TABLE; Schema: public; Owner: chusrodriguez
--

CREATE TABLE contacts (
    name character varying(100),
    id integer DEFAULT nextval('photos_id_secuence'::regclass) NOT NULL,
    date date DEFAULT now(),
    email character varying(100),
    text character varying(1000),
    ip character varying(15),
    phone character varying(20)
);


ALTER TABLE contacts OWNER TO chusrodriguez;

--
-- TOC entry 187 (class 1259 OID 16442)
-- Name: contacts_id_secuence; Type: SEQUENCE; Schema: public; Owner: chusrodriguez
--

CREATE SEQUENCE contacts_id_secuence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contacts_id_secuence OWNER TO chusrodriguez;

--
-- TOC entry 183 (class 1259 OID 16415)
-- Name: dresses_id_secuence; Type: SEQUENCE; Schema: public; Owner: chusrodriguez
--

CREATE SEQUENCE dresses_id_secuence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dresses_id_secuence OWNER TO chusrodriguez;

--
-- TOC entry 184 (class 1259 OID 16417)
-- Name: dresses; Type: TABLE; Schema: public; Owner: chusrodriguez
--

CREATE TABLE dresses (
    id integer DEFAULT nextval('dresses_id_secuence'::regclass) NOT NULL,
    name character varying(100),
    description character varying(500),
    time_created date DEFAULT now(),
    text text,
    image_url character varying(255),
    collection_id integer
);


ALTER TABLE dresses OWNER TO chusrodriguez;

--
-- TOC entry 186 (class 1259 OID 16426)
-- Name: photos; Type: TABLE; Schema: public; Owner: chusrodriguez
--

CREATE TABLE photos (
    id integer DEFAULT nextval('photos_id_secuence'::regclass) NOT NULL,
    name character varying(100),
    description character varying(500),
    time_created date DEFAULT now(),
    image_url character varying(255),
    item_id integer,
    source character varying(20)
);


ALTER TABLE photos OWNER TO chusrodriguez;

--
-- TOC entry 3073 (class 0 OID 16463)
-- Dependencies: 190
-- Data for Name: accessories; Type: TABLE DATA; Schema: public; Owner: chusrodriguez
--

INSERT INTO accessories VALUES (1, 'Capazo 1', 'Capazo', '2016-07-10', 'disponible en diferentes colores', '/images/accessory1.jpg');


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 189
-- Name: accessories_id_secuence; Type: SEQUENCE SET; Schema: public; Owner: chusrodriguez
--

SELECT pg_catalog.setval('accessories_id_secuence', 1, true);


--
-- TOC entry 3064 (class 0 OID 16396)
-- Dependencies: 181
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: chusrodriguez
--

INSERT INTO collections VALUES ('Colección1', 15, 'coleccion marinera', '2016-07-05', 'disponible hasta la talla 12 años', '/images/collection1.jpg');
INSERT INTO collections VALUES ('Colección2', 16, 'coleccion marinera', '2016-07-05', 'disponible hasta la talla 12 años', '/images/collection2.jpg');
INSERT INTO collections VALUES ('Colección3', 17, 'coleccion marinera', '2016-07-05', 'disponible hasta la talla 12 años', '/images/collection3.jpg');
INSERT INTO collections VALUES ('Colección4', 18, 'coleccion marinera', '2016-07-05', 'disponible hasta la talla 12 años', '/images/collection4.jpg');


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 182
-- Name: collections_id_secuence; Type: SEQUENCE SET; Schema: public; Owner: chusrodriguez
--

SELECT pg_catalog.setval('collections_id_secuence', 18, true);


--
-- TOC entry 3071 (class 0 OID 16444)
-- Dependencies: 188
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: chusrodriguez
--

INSERT INTO contacts VALUES ('Bebe33', 2, '2016-07-03', 'bbb@ddd.com', 'disponible hasta la talla 24 meses', '1.2.3.4', '123456789');
INSERT INTO contacts VALUES ('Bebe33', 3, '2016-07-03', 'bbb@ddd.com', 'disponible hasta la talla 24 meses', '1.2.3.4', '123456789');
INSERT INTO contacts VALUES ('Bebe33', 4, '2016-07-03', 'bbb@ddd.com', 'disponible hasta la talla 24 meses', '1.2.3.4', '123456789');
INSERT INTO contacts VALUES ('Bebe33', 5, '2016-07-03', 'bbb@ddd.com', 'disponible hasta la talla 24 meses', '1.2.3.4', '123456789');
INSERT INTO contacts VALUES ('Bebe33', 6, '2016-07-03', 'bbb@ddd.com', 'disponible hasta la talla 24 meses', '1.2.3.4', '123456789');
INSERT INTO contacts VALUES ('Bebe33', 7, '2016-07-03', 'bbb@ddd.com', 'disponible hasta la talla 24 meses', '1.2.3.4', '123456789');
INSERT INTO contacts VALUES ('Bebe33', 8, '2016-07-03', 'bbb@ddd.com', 'disponible hasta la talla 24 meses', '1.2.3.4', '123456789');
INSERT INTO contacts VALUES ('Bebe33', 9, '2016-07-03', 'bbb@ddd.com', 'disponible hasta la talla 24 meses', '1.2.3.4', '123456789');


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 187
-- Name: contacts_id_secuence; Type: SEQUENCE SET; Schema: public; Owner: chusrodriguez
--

SELECT pg_catalog.setval('contacts_id_secuence', 1, false);


--
-- TOC entry 3067 (class 0 OID 16417)
-- Dependencies: 184
-- Data for Name: dresses; Type: TABLE DATA; Schema: public; Owner: chusrodriguez
--

INSERT INTO dresses VALUES (1, 'Vestido 1', 'coleccion marinera', '2016-07-05', 'disponible hasta la talla 12 años', '/images/dress1.jpg', 15);
INSERT INTO dresses VALUES (2, 'Vestido 2', 'coleccion marinera', '2016-07-05', 'disponible hasta la talla 12 años', '/images/dress2.jpg', 15);
INSERT INTO dresses VALUES (3, 'Vestido 3', 'coleccion marinera', '2016-07-05', 'disponible hasta la talla 12 años', '/images/dress3.jpg', 15);
INSERT INTO dresses VALUES (4, 'Vestido 3', 'coleccion marinera', '2016-07-05', 'disponible hasta la talla 12 años', '/images/dress3.jpg', 15);
INSERT INTO dresses VALUES (5, 'Vestido 2', 'coleccion marinera', '2016-07-05', 'disponible hasta la talla 12 años', '/images/dress2.jpg', 15);
INSERT INTO dresses VALUES (6, 'Vestido 2', 'coleccion marinera', '2016-07-05', 'disponible hasta la talla 12 años', '/images/dress2.jpg', 15);


--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 183
-- Name: dresses_id_secuence; Type: SEQUENCE SET; Schema: public; Owner: chusrodriguez
--

SELECT pg_catalog.setval('dresses_id_secuence', 6, true);


--
-- TOC entry 3069 (class 0 OID 16426)
-- Dependencies: 186
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: chusrodriguez
--

INSERT INTO photos VALUES (10, 'Detalle 1', 'detalle', '2016-07-10', '/images/photo1.jpg', 1, 'dress');
INSERT INTO photos VALUES (11, 'Detalle 2', 'detalle', '2016-07-10', '/images/photo2.jpg', 1, 'dress');
INSERT INTO photos VALUES (12, 'Detalle 3', 'detalle', '2016-07-10', '/images/photo3.jpg', 1, 'dress');


--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 185
-- Name: photos_id_secuence; Type: SEQUENCE SET; Schema: public; Owner: chusrodriguez
--

SELECT pg_catalog.setval('photos_id_secuence', 12, true);


--
-- TOC entry 2948 (class 2606 OID 16478)
-- Name: accessories_pk; Type: CONSTRAINT; Schema: public; Owner: chusrodriguez
--

ALTER TABLE ONLY accessories
    ADD CONSTRAINT accessories_pk PRIMARY KEY (id);


--
-- TOC entry 2940 (class 2606 OID 16401)
-- Name: collections_pk; Type: CONSTRAINT; Schema: public; Owner: chusrodriguez
--

ALTER TABLE ONLY collections
    ADD CONSTRAINT collections_pk PRIMARY KEY (id);


--
-- TOC entry 2946 (class 2606 OID 16451)
-- Name: contacts_pk; Type: CONSTRAINT; Schema: public; Owner: chusrodriguez
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pk PRIMARY KEY (id);


--
-- TOC entry 2942 (class 2606 OID 16460)
-- Name: dresses_pk; Type: CONSTRAINT; Schema: public; Owner: chusrodriguez
--

ALTER TABLE ONLY dresses
    ADD CONSTRAINT dresses_pk PRIMARY KEY (id);


--
-- TOC entry 2944 (class 2606 OID 16440)
-- Name: photos_pk; Type: CONSTRAINT; Schema: public; Owner: chusrodriguez
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pk PRIMARY KEY (id);


--
-- TOC entry 2949 (class 2606 OID 16494)
-- Name: collection_dresses_fk; Type: FK CONSTRAINT; Schema: public; Owner: chusrodriguez
--

ALTER TABLE ONLY dresses
    ADD CONSTRAINT collection_dresses_fk FOREIGN KEY (collection_id) REFERENCES collections(id);


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: chusrodriguez
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM chusrodriguez;
GRANT ALL ON SCHEMA public TO chusrodriguez;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-07-16 12:28:10 CEST

--
-- PostgreSQL database dump complete
--

