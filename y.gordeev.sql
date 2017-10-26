--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

DROP DATABASE "y.gordeev";
--
-- Name: y.gordeev; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "y.gordeev" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE "y.gordeev" OWNER TO postgres;

\connect "y.gordeev"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;


--
-- Name: artist_associations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE artist_associations (
    id integer NOT NULL,
    aid integer NOT NULL
);


ALTER TABLE artist_associations OWNER TO postgres;

--
-- Name: artist_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE artist_genre (
    id integer NOT NULL,
    gid integer NOT NULL
);


ALTER TABLE artist_genre OWNER TO postgres;

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE artists_id_seq OWNER TO postgres;

--
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE artists (
    id integer DEFAULT nextval('artists_id_seq'::regclass) NOT NULL,
    artist character varying(64) NOT NULL,
    alias character varying(64),
    origin character varying(64) NOT NULL,
    occupation character varying(64),
    birth_date date NOT NULL,
    death_date date,
    label_id integer,
    start_of_activity smallint NOT NULL,
    end_of_activity smallint,
    full_name character varying(64) NOT NULL,
    CONSTRAINT artists_activity_check CHECK ((start_of_activity < end_of_activity)),
    CONSTRAINT artists_date_check CHECK ((birth_date < death_date))
);


ALTER TABLE artists OWNER TO postgres;

--
-- Name: associations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE associations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE associations_id_seq OWNER TO postgres;

--
-- Name: associations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE associations (
    id integer DEFAULT nextval('associations_id_seq'::regclass) NOT NULL,
    association character varying(64) NOT NULL,
    origin character varying(64) NOT NULL,
    leader_id integer NOT NULL,
    label_id integer,
    start_of_activity smallint NOT NULL,
    end_of_activity smallint,
    CONSTRAINT associations_activity_check CHECK ((start_of_activity < end_of_activity))
);


ALTER TABLE associations OWNER TO postgres;

--
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genre_id_seq OWNER TO postgres;

--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE genre (
    id integer DEFAULT nextval('genre_id_seq'::regclass) NOT NULL,
    genre character varying(64) NOT NULL
);


ALTER TABLE genre OWNER TO postgres;

--
-- Name: labels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE labels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE labels_id_seq OWNER TO postgres;

--
-- Name: labels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE labels (
    id integer DEFAULT nextval('labels_id_seq'::regclass) NOT NULL,
    label character varying(64) NOT NULL,
    founder character varying(64) NOT NULL,
    status boolean NOT NULL,
    founded smallint NOT NULL,
    CONSTRAINT labels_status_check CHECK (((status = false) OR (status = true)))
);


ALTER TABLE labels OWNER TO postgres;

--
-- Data for Name: artist_associations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO artist_associations VALUES (1, 1);
INSERT INTO artist_associations VALUES (2, 2);
INSERT INTO artist_associations VALUES (2, 1);
INSERT INTO artist_associations VALUES (3, 1);
INSERT INTO artist_associations VALUES (3, 3);
INSERT INTO artist_associations VALUES (4, 4);
INSERT INTO artist_associations VALUES (7, 5);
INSERT INTO artist_associations VALUES (9, 6);
INSERT INTO artist_associations VALUES (10, 7);
INSERT INTO artist_associations VALUES (12, 8);
INSERT INTO artist_associations VALUES (13, 8);
INSERT INTO artist_associations VALUES (14, 9);


--
-- Data for Name: artist_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO artist_genre VALUES (1, 2);
INSERT INTO artist_genre VALUES (1, 1);
INSERT INTO artist_genre VALUES (2, 3);
INSERT INTO artist_genre VALUES (2, 1);
INSERT INTO artist_genre VALUES (3, 1);
INSERT INTO artist_genre VALUES (3, 3);
INSERT INTO artist_genre VALUES (4, 3);
INSERT INTO artist_genre VALUES (4, 4);
INSERT INTO artist_genre VALUES (5, 3);
INSERT INTO artist_genre VALUES (6, 1);
INSERT INTO artist_genre VALUES (6, 3);
INSERT INTO artist_genre VALUES (6, 5);
INSERT INTO artist_genre VALUES (7, 3);
INSERT INTO artist_genre VALUES (8, 3);
INSERT INTO artist_genre VALUES (9, 3);
INSERT INTO artist_genre VALUES (10, 10);
INSERT INTO artist_genre VALUES (10, 11);
INSERT INTO artist_genre VALUES (11, 3);
INSERT INTO artist_genre VALUES (11, 7);
INSERT INTO artist_genre VALUES (12, 3);
INSERT INTO artist_genre VALUES (12, 8);
INSERT INTO artist_genre VALUES (13, 3);
INSERT INTO artist_genre VALUES (14, 3);
INSERT INTO artist_genre VALUES (15, 3);
INSERT INTO artist_genre VALUES (15, 8);
INSERT INTO artist_genre VALUES (16, 3);
INSERT INTO artist_genre VALUES (16, 9);


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO artists VALUES (1, 'Eazy-E', '', 'Compton, California, U.S.', 'record producer', '1964-09-07', '1995-03-26', 1, 1986, 1995, 'Eric Lynn Wright');
INSERT INTO artists VALUES (2, 'Ice Cube', NULL, 'Los Angeles, California, U.S.', 'actor', '1969-06-15', NULL, 3, 1984, NULL, 'Oshea Jackson Sr.');
INSERT INTO artists VALUES (3, 'Dr. Dre', NULL, 'Compton, California, U.S.', 'record producer', '1965-02-18', NULL, 5, 1984, NULL, 'Andre Romelle Young');
INSERT INTO artists VALUES (4, 'Snoop Dogg', 'Snoop Lion', 'Long Beach, California, U.S.', 'singer', '1971-10-20', NULL, 2, 1992, NULL, 'Calvin Cordozar Broadus Jr.');
INSERT INTO artists VALUES (5, '2pac', 'Makaveli', 'East Harlem, New York, U.S.', 'actor', '1971-06-16', '1996-09-13', 2, 1987, 1996, 'Tupac Amaru Shakur');
INSERT INTO artists VALUES (6, 'The Notorious B.I.G.', 'Biggie', 'Brooklyn, New York, U.S.', NULL, '1972-05-21', '1997-03-09', 4, 1992, 1997, 'Christopher George Latore Wallace');
INSERT INTO artists VALUES (7, 'Eminem', 'Slim Shady', 'St. Joseph, Missouri, U.S.', 'record producer', '1972-10-17', NULL, 5, 1988, NULL, 'Marshall Bruce Mathers III');
INSERT INTO artists VALUES (8, 'Kanye West', 'Yeezy', 'Atlanta, Georgia, U.S.', 'fashion designer', '1977-06-08', NULL, 6, 1996, NULL, 'Kanye Omari West');
INSERT INTO artists VALUES (9, '50 cent', NULL, 'South Jamaica, Queens, New York, U.S.', 'businessman', '1975-07-06', NULL, 5, 1998, NULL, 'Curtis James Jackson III');
INSERT INTO artists VALUES (10, 'Kid Cudi', 'KID KUD-ee', 'Cleveland, Ohio, U.S.', 'actor', '1984-01-30', NULL, 7, 2003, NULL, 'Scott Ramon Seguro Mescudi');
INSERT INTO artists VALUES (11, 'Hopsin', NULL, 'Los Angeles, California, U.S.', 'record producer', '1985-07-18', NULL, 8, 2001, NULL, 'Marcus Jamal Hopson');
INSERT INTO artists VALUES (12, 'Schoolboy Q', NULL, 'Los Angeles, California, U.S.', NULL, '1986-10-26', NULL, 9, 2009, NULL, 'Quincy Matthew Hanley');
INSERT INTO artists VALUES (13, 'Kendrick Lamar', 'K-Dot', 'Compton, California, U.S.', 'songwriter', '1987-06-17', NULL, 9, 2004, NULL, 'Kendrick Lamar Duckworth');
INSERT INTO artists VALUES (14, 'ASAP Rocky', NULL, 'Manhattan, New York, U.S.', 'model', '1988-10-03', NULL, 10, 2007, NULL, 'Rakim Mayers');
INSERT INTO artists VALUES (15, 'Night Lovell', NULL, 'Ottawa, Canada', NULL, '1997-05-29', NULL, NULL, 2014, NULL, 'Shermar Paul');
INSERT INTO artists VALUES (16, '21 savage', '21', 'Dominica', 'record producer', '1992-10-22', NULL, 11, 2013, NULL, 'Shayaa Bin Abraham-Joseph');


--
-- Data for Name: associations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO associations VALUES (1, 'N.W.A', 'Los Angeles, California, U.S.', 1, 1, 1986, 1991);
INSERT INTO associations VALUES (2, 'Westside Connection', 'Los Angeles, California, U.S.', 2, NULL, 1994, 2005);
INSERT INTO associations VALUES (3, 'World Class Wreckin Cru', 'Compton, California, U.S.', 3, 11, 1984, 1986);
INSERT INTO associations VALUES (4, '213', 'Long Beach, California, U.S.', 4, NULL, 1990, 2011);
INSERT INTO associations VALUES (5, 'Bad Meets Evil', 'Detroit, Michigan, U.S.', 7, 3, 1997, NULL);
INSERT INTO associations VALUES (6, 'G-Unit', ' South Jamaica, Queens, New York, U.S.', 9, 3, 1999, NULL);
INSERT INTO associations VALUES (7, 'WZRD', 'Brooklyn, New York, U.S.', 10, 7, 2010, NULL);
INSERT INTO associations VALUES (8, 'Black Hippy', 'Los Angeles, California, U.S.', 12, 9, 2008, NULL);
INSERT INTO associations VALUES (9, 'ASAP Mob', 'Harlem, Manhattan, New York, U.S.', 14, 10, 2006, NULL);


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO genre VALUES (1, 'gangsta rap');
INSERT INTO genre VALUES (2, 'West Coast hip hop');
INSERT INTO genre VALUES (3, 'hip hop');
INSERT INTO genre VALUES (4, 'reggae');
INSERT INTO genre VALUES (5, 'East Coast hip hop');
INSERT INTO genre VALUES (6, 'hardcore hip hop');
INSERT INTO genre VALUES (7, 'horrorcore');
INSERT INTO genre VALUES (8, 'rap');
INSERT INTO genre VALUES (9, 'trap');
INSERT INTO genre VALUES (10, 'alternative hip hop');
INSERT INTO genre VALUES (11, 'alternative rock');


--
-- Data for Name: labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO labels VALUES (1, 'Ruthless Records', 'Jerry Heller', true, 1986);
INSERT INTO labels VALUES (2, 'Death Row Records', 'Suge Knight', false, 1991);
INSERT INTO labels VALUES (3, 'Interscope Records', 'Ted Field', true, 1989);
INSERT INTO labels VALUES (4, 'Uptown Records', 'Andre Harrell', false, 1986);
INSERT INTO labels VALUES (5, 'Aftermath Entertainment', 'Dr. Dre', true, 1996);
INSERT INTO labels VALUES (6, 'GOOD Music', 'Kanye West', true, 2004);
INSERT INTO labels VALUES (7, 'Wicked Awesome Records', 'Kid Cudi', true, 2011);
INSERT INTO labels VALUES (8, 'Funk Volume', 'Hopsin', false, 2009);
INSERT INTO labels VALUES (9, 'Top Dawg Entertainment', 'Joseph Kargbo', true, 2004);
INSERT INTO labels VALUES (10, 'Polo Grounds Music', 'Bryan Leach', true, 2006);
INSERT INTO labels VALUES (11, 'Epic Records', 'Columbia Records', true, 1953);


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('artists_id_seq', 16, true);


--
-- Name: associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('associations_id_seq', 9, true);


--
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('genre_id_seq', 11, true);


--
-- Name: labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('labels_id_seq', 11, true);


--
-- Name: artist_associations artist_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY artist_associations
    ADD CONSTRAINT artist_associations_pkey PRIMARY KEY (id, aid);


--
-- Name: artist_genre artist_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY artist_genre
    ADD CONSTRAINT artist_genre_pkey PRIMARY KEY (id, gid);


--
-- Name: artists artists_alias_ukey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY artists
    ADD CONSTRAINT artists_alias_ukey UNIQUE (alias);


--
-- Name: artists artists_artist_ukey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY artists
    ADD CONSTRAINT artists_artist_ukey UNIQUE (artist);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: associations associations_association_ukey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY associations
    ADD CONSTRAINT associations_association_ukey UNIQUE (association);


--
-- Name: associations associations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY associations
    ADD CONSTRAINT associations_pkey PRIMARY KEY (id);


--
-- Name: genre genre_genre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_genre_key UNIQUE (genre);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: labels labels_label_ukey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY labels
    ADD CONSTRAINT labels_label_ukey UNIQUE (label);


--
-- Name: labels labels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY labels
    ADD CONSTRAINT labels_pkey PRIMARY KEY (id);


--
-- Name: artist_associations artist_associations_aid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY artist_associations
    ADD CONSTRAINT artist_associations_aid_fkey FOREIGN KEY (aid) REFERENCES associations(id);


--
-- Name: artist_associations artist_associations_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY artist_associations
    ADD CONSTRAINT artist_associations_id_fkey FOREIGN KEY (id) REFERENCES artists(id);


--
-- Name: artist_genre artist_genre_gid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY artist_genre
    ADD CONSTRAINT artist_genre_gid_fkey FOREIGN KEY (gid) REFERENCES genre(id);


--
-- Name: artist_genre artist_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY artist_genre
    ADD CONSTRAINT artist_genre_id_fkey FOREIGN KEY (id) REFERENCES artists(id);


--
-- Name: artists artists_label_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY artists
    ADD CONSTRAINT artists_label_id_fkey FOREIGN KEY (label_id) REFERENCES labels(id);


--
-- Name: associations associations_label_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY associations
    ADD CONSTRAINT associations_label_id_fkey FOREIGN KEY (label_id) REFERENCES labels(id);


--
-- Name: associations associations_leader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY associations
    ADD CONSTRAINT associations_leader_id_fkey FOREIGN KEY (leader_id) REFERENCES artists(id);

--
-- PostgreSQL database dump complete
--

