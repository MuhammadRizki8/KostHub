--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2025-04-15 21:21:22

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

--
-- TOC entry 850 (class 1247 OID 34329)
-- Name: jenis_sertifikat_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.jenis_sertifikat_enum AS ENUM (
    'Sertifikat Hak Milik (SHM)',
    'Sertifikat Hak Guna Bangunan (SHGB)',
    'Sertifikat Hak Guna Usaha (SHGU)',
    'Sertifikat Hak Pengelolaan (HPL)',
    'Sertifikat Hak Sewa (SHS)',
    'Sertifikat Hak Pakai (SHP)',
    'Sertifikat Hak Masyarakat Adat (SHM Adat)'
);


ALTER TYPE public.jenis_sertifikat_enum OWNER TO postgres;

--
-- TOC entry 853 (class 1247 OID 34344)
-- Name: status_properti_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status_properti_enum AS ENUM (
    'Sewa',
    'Jual'
);


ALTER TYPE public.status_properti_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 34349)
-- Name: fasilitas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fasilitas (
    id_fasilitas integer NOT NULL,
    nama_fasilitas character varying(255) NOT NULL
);


ALTER TABLE public.fasilitas OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 34352)
-- Name: fasilitas_id_fasilitas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fasilitas_id_fasilitas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fasilitas_id_fasilitas_seq OWNER TO postgres;

--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 216
-- Name: fasilitas_id_fasilitas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fasilitas_id_fasilitas_seq OWNED BY public.fasilitas.id_fasilitas;


--
-- TOC entry 217 (class 1259 OID 34353)
-- Name: favorit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorit (
    id_favorit integer NOT NULL,
    id_pencari integer NOT NULL,
    id_kost integer NOT NULL
);


ALTER TABLE public.favorit OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 34356)
-- Name: favorit_id_favorit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favorit_id_favorit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favorit_id_favorit_seq OWNER TO postgres;

--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 218
-- Name: favorit_id_favorit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favorit_id_favorit_seq OWNED BY public.favorit.id_favorit;


--
-- TOC entry 219 (class 1259 OID 34357)
-- Name: gambar_kost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gambar_kost (
    id_gambar integer NOT NULL,
    id_kost integer NOT NULL,
    url_gambar text NOT NULL
);


ALTER TABLE public.gambar_kost OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 34362)
-- Name: gambar_kost_id_gambar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gambar_kost_id_gambar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gambar_kost_id_gambar_seq OWNER TO postgres;

--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 220
-- Name: gambar_kost_id_gambar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gambar_kost_id_gambar_seq OWNED BY public.gambar_kost.id_gambar;


--
-- TOC entry 221 (class 1259 OID 34363)
-- Name: kost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kost (
    id_kost integer NOT NULL,
    nama_kost character varying(255) NOT NULL,
    alamat text NOT NULL,
    deskripsi text,
    harga_sewa numeric(10,2) NOT NULL,
    luas integer NOT NULL,
    status_properti public.status_properti_enum,
    jenis_sertifikat public.jenis_sertifikat_enum,
    luas_tanah integer,
    longitude double precision NOT NULL,
    latitude double precision NOT NULL,
    panjang numeric,
    lebar numeric
);


ALTER TABLE public.kost OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 34368)
-- Name: kost_fasilitas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kost_fasilitas (
    id_kost integer NOT NULL,
    id_fasilitas integer NOT NULL
);


ALTER TABLE public.kost_fasilitas OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 34371)
-- Name: kost_id_kost_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kost_id_kost_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kost_id_kost_seq OWNER TO postgres;

--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 223
-- Name: kost_id_kost_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kost_id_kost_seq OWNED BY public.kost.id_kost;


--
-- TOC entry 224 (class 1259 OID 34372)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_user integer NOT NULL,
    nama character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password text NOT NULL,
    role character varying(10) NOT NULL,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY (ARRAY[('pemilik'::character varying)::text, ('pencari'::character varying)::text])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 34378)
-- Name: users_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_user_seq OWNER TO postgres;

--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;


--
-- TOC entry 4664 (class 2604 OID 34379)
-- Name: fasilitas id_fasilitas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fasilitas ALTER COLUMN id_fasilitas SET DEFAULT nextval('public.fasilitas_id_fasilitas_seq'::regclass);


--
-- TOC entry 4665 (class 2604 OID 34380)
-- Name: favorit id_favorit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorit ALTER COLUMN id_favorit SET DEFAULT nextval('public.favorit_id_favorit_seq'::regclass);


--
-- TOC entry 4666 (class 2604 OID 34381)
-- Name: gambar_kost id_gambar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gambar_kost ALTER COLUMN id_gambar SET DEFAULT nextval('public.gambar_kost_id_gambar_seq'::regclass);


--
-- TOC entry 4667 (class 2604 OID 34382)
-- Name: kost id_kost; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost ALTER COLUMN id_kost SET DEFAULT nextval('public.kost_id_kost_seq'::regclass);


--
-- TOC entry 4668 (class 2604 OID 34383)
-- Name: users id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);


--
-- TOC entry 4834 (class 0 OID 34349)
-- Dependencies: 215
-- Data for Name: fasilitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fasilitas (id_fasilitas, nama_fasilitas) FROM stdin;
\.


--
-- TOC entry 4836 (class 0 OID 34353)
-- Dependencies: 217
-- Data for Name: favorit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorit (id_favorit, id_pencari, id_kost) FROM stdin;
\.


--
-- TOC entry 4838 (class 0 OID 34357)
-- Dependencies: 219
-- Data for Name: gambar_kost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gambar_kost (id_gambar, id_kost, url_gambar) FROM stdin;
\.


--
-- TOC entry 4840 (class 0 OID 34363)
-- Dependencies: 221
-- Data for Name: kost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kost (id_kost, nama_kost, alamat, deskripsi, harga_sewa, luas, status_properti, jenis_sertifikat, luas_tanah, longitude, latitude, panjang, lebar) FROM stdin;
\.


--
-- TOC entry 4841 (class 0 OID 34368)
-- Dependencies: 222
-- Data for Name: kost_fasilitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kost_fasilitas (id_kost, id_fasilitas) FROM stdin;
\.


--
-- TOC entry 4843 (class 0 OID 34372)
-- Dependencies: 224
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_user, nama, email, password, role) FROM stdin;
\.


--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 216
-- Name: fasilitas_id_fasilitas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fasilitas_id_fasilitas_seq', 1, false);


--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 218
-- Name: favorit_id_favorit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorit_id_favorit_seq', 1, false);


--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 220
-- Name: gambar_kost_id_gambar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gambar_kost_id_gambar_seq', 1, false);


--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 223
-- Name: kost_id_kost_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kost_id_kost_seq', 1, false);


--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_user_seq', 1, false);


--
-- TOC entry 4671 (class 2606 OID 34385)
-- Name: fasilitas fasilitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fasilitas
    ADD CONSTRAINT fasilitas_pkey PRIMARY KEY (id_fasilitas);


--
-- TOC entry 4675 (class 2606 OID 34387)
-- Name: favorit favorit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorit
    ADD CONSTRAINT favorit_pkey PRIMARY KEY (id_favorit);


--
-- TOC entry 4677 (class 2606 OID 34389)
-- Name: gambar_kost gambar_kost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gambar_kost
    ADD CONSTRAINT gambar_kost_pkey PRIMARY KEY (id_gambar);


--
-- TOC entry 4681 (class 2606 OID 34391)
-- Name: kost_fasilitas kost_fasilitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost_fasilitas
    ADD CONSTRAINT kost_fasilitas_pkey PRIMARY KEY (id_kost, id_fasilitas);


--
-- TOC entry 4679 (class 2606 OID 34393)
-- Name: kost kost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost
    ADD CONSTRAINT kost_pkey PRIMARY KEY (id_kost);


--
-- TOC entry 4673 (class 2606 OID 34395)
-- Name: fasilitas unique_nama_fasilitas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fasilitas
    ADD CONSTRAINT unique_nama_fasilitas UNIQUE (nama_fasilitas);


--
-- TOC entry 4683 (class 2606 OID 34397)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4685 (class 2606 OID 34399)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- TOC entry 4686 (class 2606 OID 34400)
-- Name: favorit favorit_id_kost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorit
    ADD CONSTRAINT favorit_id_kost_fkey FOREIGN KEY (id_kost) REFERENCES public.kost(id_kost) ON DELETE CASCADE;


--
-- TOC entry 4687 (class 2606 OID 34405)
-- Name: favorit favorit_id_pencari_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorit
    ADD CONSTRAINT favorit_id_pencari_fkey FOREIGN KEY (id_pencari) REFERENCES public.users(id_user) ON DELETE CASCADE;


--
-- TOC entry 4688 (class 2606 OID 34410)
-- Name: gambar_kost gambar_kost_id_kost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gambar_kost
    ADD CONSTRAINT gambar_kost_id_kost_fkey FOREIGN KEY (id_kost) REFERENCES public.kost(id_kost) ON DELETE CASCADE;


--
-- TOC entry 4689 (class 2606 OID 34415)
-- Name: kost_fasilitas kost_fasilitas_id_fasilitas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost_fasilitas
    ADD CONSTRAINT kost_fasilitas_id_fasilitas_fkey FOREIGN KEY (id_fasilitas) REFERENCES public.fasilitas(id_fasilitas) ON DELETE CASCADE;


--
-- TOC entry 4690 (class 2606 OID 34420)
-- Name: kost_fasilitas kost_fasilitas_id_kost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost_fasilitas
    ADD CONSTRAINT kost_fasilitas_id_kost_fkey FOREIGN KEY (id_kost) REFERENCES public.kost(id_kost) ON DELETE CASCADE;


-- Completed on 2025-04-15 21:21:22

--
-- PostgreSQL database dump complete
--

