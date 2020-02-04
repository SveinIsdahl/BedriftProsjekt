--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6
-- Dumped by pg_dump version 12.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

--
-- Name: eksemplar; Type: TABLE; Schema: public; Owner: tesla
--

CREATE TABLE public.eksemplar (
    eksemplarid integer NOT NULL,
    modell text NOT NULL,
    pris integer,
    longrange boolean,
    performance boolean,
    farge text
);


ALTER TABLE public.eksemplar OWNER TO tesla;

--
-- Name: eksemplar_eksemplarid_seq; Type: SEQUENCE; Schema: public; Owner: tesla
--

CREATE SEQUENCE public.eksemplar_eksemplarid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eksemplar_eksemplarid_seq OWNER TO tesla;

--
-- Name: eksemplar_eksemplarid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tesla
--

ALTER SEQUENCE public.eksemplar_eksemplarid_seq OWNED BY public.eksemplar.eksemplarid;


--
-- Name: kunde; Type: TABLE; Schema: public; Owner: tesla
--

CREATE TABLE public.kunde (
    kundeid integer NOT NULL,
    fornavn text NOT NULL,
    etternavn text NOT NULL,
    adresse text,
    epost text,
    tlf text,
    kjonn text,
    userid integer NOT NULL
);


ALTER TABLE public.kunde OWNER TO tesla;

--
-- Name: kunde_kundeid_seq; Type: SEQUENCE; Schema: public; Owner: tesla
--

CREATE SEQUENCE public.kunde_kundeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kunde_kundeid_seq OWNER TO tesla;

--
-- Name: kunde_kundeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tesla
--

ALTER SEQUENCE public.kunde_kundeid_seq OWNED BY public.kunde.kundeid;


--
-- Name: nyhetsbrev; Type: TABLE; Schema: public; Owner: tesla
--

CREATE TABLE public.nyhetsbrev (
    nyhetsbrevid integer NOT NULL,
    email text
);


ALTER TABLE public.nyhetsbrev OWNER TO tesla;

--
-- Name: nyhetsbrev_nyhetsbrevid_seq; Type: SEQUENCE; Schema: public; Owner: tesla
--

CREATE SEQUENCE public.nyhetsbrev_nyhetsbrevid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nyhetsbrev_nyhetsbrevid_seq OWNER TO tesla;

--
-- Name: nyhetsbrev_nyhetsbrevid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tesla
--

ALTER SEQUENCE public.nyhetsbrev_nyhetsbrevid_seq OWNED BY public.nyhetsbrev.nyhetsbrevid;


--
-- Name: salg; Type: TABLE; Schema: public; Owner: tesla
--

CREATE TABLE public.salg (
    salgid integer NOT NULL,
    dato date,
    kundeid integer NOT NULL,
    eksemplarid integer NOT NULL
);


ALTER TABLE public.salg OWNER TO tesla;

--
-- Name: salg_salgid_seq; Type: SEQUENCE; Schema: public; Owner: tesla
--

CREATE SEQUENCE public.salg_salgid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salg_salgid_seq OWNER TO tesla;

--
-- Name: salg_salgid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tesla
--

ALTER SEQUENCE public.salg_salgid_seq OWNED BY public.salg.salgid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: tesla
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    username text NOT NULL,
    role text DEFAULT 'user'::text,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO tesla;

--
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: tesla
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userid_seq OWNER TO tesla;

--
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tesla
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: eksemplar eksemplarid; Type: DEFAULT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.eksemplar ALTER COLUMN eksemplarid SET DEFAULT nextval('public.eksemplar_eksemplarid_seq'::regclass);


--
-- Name: kunde kundeid; Type: DEFAULT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.kunde ALTER COLUMN kundeid SET DEFAULT nextval('public.kunde_kundeid_seq'::regclass);


--
-- Name: nyhetsbrev nyhetsbrevid; Type: DEFAULT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.nyhetsbrev ALTER COLUMN nyhetsbrevid SET DEFAULT nextval('public.nyhetsbrev_nyhetsbrevid_seq'::regclass);


--
-- Name: salg salgid; Type: DEFAULT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.salg ALTER COLUMN salgid SET DEFAULT nextval('public.salg_salgid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Data for Name: eksemplar; Type: TABLE DATA; Schema: public; Owner: tesla
--

COPY public.eksemplar (eksemplarid, modell, pris, longrange, performance, farge) FROM stdin;
1	S	500000	f	f	Rød
2	3	300000	f	f	Blå
4	X	450000	t	f	Hvit
5	Y	450000	f	t	Svart
6	S	550000	f	t	Blå
7	3	300000	f	f	Grå
\.


--
-- Data for Name: kunde; Type: TABLE DATA; Schema: public; Owner: tesla
--

COPY public.kunde (kundeid, fornavn, etternavn, adresse, epost, tlf, kjonn, userid) FROM stdin;
1	Ola	Nordmann	Karl Johans Gate 0	epost@gmail.com	1881	Mann	2
\.


--
-- Data for Name: nyhetsbrev; Type: TABLE DATA; Schema: public; Owner: tesla
--

COPY public.nyhetsbrev (nyhetsbrevid, email) FROM stdin;
1	gegn@egng.com
2	epost@gmail.com
4	epost@epost.com
\.


--
-- Data for Name: salg; Type: TABLE DATA; Schema: public; Owner: tesla
--

COPY public.salg (salgid, dato, kundeid, eksemplarid) FROM stdin;
1	2020-02-14	1	6
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tesla
--

COPY public.users (userid, username, role, password) FROM stdin;
1	admin	admin	4122cb13c7a474c1976c9706ae36521d
2	olanordmann1	user	098f6bcd4621d373cade4e832627b4f6
\.


--
-- Name: eksemplar_eksemplarid_seq; Type: SEQUENCE SET; Schema: public; Owner: tesla
--

SELECT pg_catalog.setval('public.eksemplar_eksemplarid_seq', 7, true);


--
-- Name: kunde_kundeid_seq; Type: SEQUENCE SET; Schema: public; Owner: tesla
--

SELECT pg_catalog.setval('public.kunde_kundeid_seq', 1, true);


--
-- Name: nyhetsbrev_nyhetsbrevid_seq; Type: SEQUENCE SET; Schema: public; Owner: tesla
--

SELECT pg_catalog.setval('public.nyhetsbrev_nyhetsbrevid_seq', 4, true);


--
-- Name: salg_salgid_seq; Type: SEQUENCE SET; Schema: public; Owner: tesla
--

SELECT pg_catalog.setval('public.salg_salgid_seq', 1, true);


--
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: tesla
--

SELECT pg_catalog.setval('public.users_userid_seq', 2, true);


--
-- Name: eksemplar eksemplar_pkey; Type: CONSTRAINT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.eksemplar
    ADD CONSTRAINT eksemplar_pkey PRIMARY KEY (eksemplarid);


--
-- Name: kunde kunde_pkey; Type: CONSTRAINT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.kunde
    ADD CONSTRAINT kunde_pkey PRIMARY KEY (kundeid);


--
-- Name: kunde kunde_userid_key; Type: CONSTRAINT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.kunde
    ADD CONSTRAINT kunde_userid_key UNIQUE (userid);


--
-- Name: nyhetsbrev nyhetsbrev_pkey; Type: CONSTRAINT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.nyhetsbrev
    ADD CONSTRAINT nyhetsbrev_pkey PRIMARY KEY (nyhetsbrevid);


--
-- Name: salg salg_pkey; Type: CONSTRAINT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.salg
    ADD CONSTRAINT salg_pkey PRIMARY KEY (salgid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: kunde kunde_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.kunde
    ADD CONSTRAINT kunde_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: salg salg_eksemplarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.salg
    ADD CONSTRAINT salg_eksemplarid_fkey FOREIGN KEY (eksemplarid) REFERENCES public.eksemplar(eksemplarid);


--
-- Name: salg salg_kundeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tesla
--

ALTER TABLE ONLY public.salg
    ADD CONSTRAINT salg_kundeid_fkey FOREIGN KEY (kundeid) REFERENCES public.kunde(kundeid);


--
-- PostgreSQL database dump complete
--

