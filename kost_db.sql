--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-15 21:19:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16455)
-- Name: fasilitas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fasilitas (
    id_fasilitas integer NOT NULL,
    nama_fasilitas character varying(255) NOT NULL
);


ALTER TABLE public.fasilitas OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16454)
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
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 217
-- Name: fasilitas_id_fasilitas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fasilitas_id_fasilitas_seq OWNED BY public.fasilitas.id_fasilitas;


--
-- TOC entry 227 (class 1259 OID 16532)
-- Name: favorit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorit (
    id_favorit integer NOT NULL,
    id_pencari integer NOT NULL,
    id_kost integer NOT NULL
);


ALTER TABLE public.favorit OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16531)
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
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 226
-- Name: favorit_id_favorit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favorit_id_favorit_seq OWNED BY public.favorit.id_favorit;


--
-- TOC entry 225 (class 1259 OID 16518)
-- Name: gambar_kost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gambar_kost (
    id_gambar integer NOT NULL,
    id_kost integer NOT NULL,
    url_gambar text NOT NULL
);


ALTER TABLE public.gambar_kost OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16517)
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
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 224
-- Name: gambar_kost_id_gambar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gambar_kost_id_gambar_seq OWNED BY public.gambar_kost.id_gambar;


--
-- TOC entry 222 (class 1259 OID 16488)
-- Name: kost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kost (
    id_kost integer NOT NULL,
    id_pemilik integer NOT NULL,
    nama_kost character varying(255) NOT NULL,
    alamat text NOT NULL,
    deskripsi text NOT NULL,
    harga_sewa numeric(10,2) NOT NULL,
    luas integer NOT NULL,
    status_properti character varying(50),
    jenis_sertifikat character varying(100),
    luas_tanah integer,
    dokumen_properti text,
    longitude double precision,
    latitude double precision
);


ALTER TABLE public.kost OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16502)
-- Name: kost_fasilitas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kost_fasilitas (
    id_kost integer NOT NULL,
    id_fasilitas integer NOT NULL
);


ALTER TABLE public.kost_fasilitas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16487)
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
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 221
-- Name: kost_id_kost_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kost_id_kost_seq OWNED BY public.kost.id_kost;


--
-- TOC entry 220 (class 1259 OID 16476)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_user integer NOT NULL,
    nama character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password text NOT NULL,
    role character varying(10) NOT NULL,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['pemilik'::character varying, 'pencari'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16475)
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
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;


--
-- TOC entry 4719 (class 2604 OID 16458)
-- Name: fasilitas id_fasilitas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fasilitas ALTER COLUMN id_fasilitas SET DEFAULT nextval('public.fasilitas_id_fasilitas_seq'::regclass);


--
-- TOC entry 4723 (class 2604 OID 16535)
-- Name: favorit id_favorit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorit ALTER COLUMN id_favorit SET DEFAULT nextval('public.favorit_id_favorit_seq'::regclass);


--
-- TOC entry 4722 (class 2604 OID 16521)
-- Name: gambar_kost id_gambar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gambar_kost ALTER COLUMN id_gambar SET DEFAULT nextval('public.gambar_kost_id_gambar_seq'::regclass);


--
-- TOC entry 4721 (class 2604 OID 16491)
-- Name: kost id_kost; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost ALTER COLUMN id_kost SET DEFAULT nextval('public.kost_id_kost_seq'::regclass);


--
-- TOC entry 4720 (class 2604 OID 16479)
-- Name: users id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);


--
-- TOC entry 4891 (class 0 OID 16455)
-- Dependencies: 218
-- Data for Name: fasilitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fasilitas (id_fasilitas, nama_fasilitas) FROM stdin;
\.


--
-- TOC entry 4900 (class 0 OID 16532)
-- Dependencies: 227
-- Data for Name: favorit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorit (id_favorit, id_pencari, id_kost) FROM stdin;
\.


--
-- TOC entry 4898 (class 0 OID 16518)
-- Dependencies: 225
-- Data for Name: gambar_kost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gambar_kost (id_gambar, id_kost, url_gambar) FROM stdin;
\.


--
-- TOC entry 4895 (class 0 OID 16488)
-- Dependencies: 222
-- Data for Name: kost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kost (id_kost, id_pemilik, nama_kost, alamat, deskripsi, harga_sewa, luas, status_properti, jenis_sertifikat, luas_tanah, dokumen_properti, longitude, latitude) FROM stdin;
3	3	test	test	Jemuran, Parkiran, Dapur Bersama, Wifi, Kamar Mandi Dalam, Laundry, Kasur, AC, Lemari, Meja Belajar	10000000.00	60	Sewa	Sertifikat Hak Milik (SHM)	79	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/tanpa%20login/1740989301117_img_%25images%20%287%29_%25d7ad0d75-531d-4cc4-a692-8dc547b94c2a.jpeg	107.5871744	-6.88128
4	4	Muhammad Rizki	RT 5 RW 4 Jalan Sersan Surip, Ledeng, Cidadap, Bandung	Jemuran, Parkiran, Dapur Bersama, Kamar Mandi Luar, Kasur, Lemari	700000.00	58	Sewa	Sertifikat Hak Milik (SHM)	69	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/tanpa%20login/1742043570557_img_%25ahmad-kasim_%25127257ee-3455-4f9b-b165-f1d85502102f.jpeg	106.8204032	-6.22264
\.


--
-- TOC entry 4896 (class 0 OID 16502)
-- Dependencies: 223
-- Data for Name: kost_fasilitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kost_fasilitas (id_kost, id_fasilitas) FROM stdin;
\.


--
-- TOC entry 4893 (class 0 OID 16476)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_user, nama, email, password, role) FROM stdin;
3	John Doe	john@example.com	yourpassword	pemilik
4	Budi Santoso	budi@email.com	hashed_pwd1	pemilik
5	Sari Melati	sari@email.com	hashed_pwd2	pemilik
6	Agus Wijaya	agus@email.com	hashed_pwd3	pemilik
\.


--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 217
-- Name: fasilitas_id_fasilitas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fasilitas_id_fasilitas_seq', 1, false);


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 226
-- Name: favorit_id_favorit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorit_id_favorit_seq', 1, false);


--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 224
-- Name: gambar_kost_id_gambar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gambar_kost_id_gambar_seq', 1, false);


--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 221
-- Name: kost_id_kost_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kost_id_kost_seq', 4, true);


--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_user_seq', 3, true);


--
-- TOC entry 4726 (class 2606 OID 16460)
-- Name: fasilitas fasilitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fasilitas
    ADD CONSTRAINT fasilitas_pkey PRIMARY KEY (id_fasilitas);


--
-- TOC entry 4738 (class 2606 OID 16537)
-- Name: favorit favorit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorit
    ADD CONSTRAINT favorit_pkey PRIMARY KEY (id_favorit);


--
-- TOC entry 4736 (class 2606 OID 16525)
-- Name: gambar_kost gambar_kost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gambar_kost
    ADD CONSTRAINT gambar_kost_pkey PRIMARY KEY (id_gambar);


--
-- TOC entry 4734 (class 2606 OID 16506)
-- Name: kost_fasilitas kost_fasilitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost_fasilitas
    ADD CONSTRAINT kost_fasilitas_pkey PRIMARY KEY (id_kost, id_fasilitas);


--
-- TOC entry 4732 (class 2606 OID 16495)
-- Name: kost kost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost
    ADD CONSTRAINT kost_pkey PRIMARY KEY (id_kost);


--
-- TOC entry 4728 (class 2606 OID 16486)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4730 (class 2606 OID 16484)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- TOC entry 4743 (class 2606 OID 16543)
-- Name: favorit favorit_id_kost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorit
    ADD CONSTRAINT favorit_id_kost_fkey FOREIGN KEY (id_kost) REFERENCES public.kost(id_kost) ON DELETE CASCADE;


--
-- TOC entry 4744 (class 2606 OID 16538)
-- Name: favorit favorit_id_pencari_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorit
    ADD CONSTRAINT favorit_id_pencari_fkey FOREIGN KEY (id_pencari) REFERENCES public.users(id_user) ON DELETE CASCADE;


--
-- TOC entry 4742 (class 2606 OID 16526)
-- Name: gambar_kost gambar_kost_id_kost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gambar_kost
    ADD CONSTRAINT gambar_kost_id_kost_fkey FOREIGN KEY (id_kost) REFERENCES public.kost(id_kost) ON DELETE CASCADE;


--
-- TOC entry 4740 (class 2606 OID 16512)
-- Name: kost_fasilitas kost_fasilitas_id_fasilitas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost_fasilitas
    ADD CONSTRAINT kost_fasilitas_id_fasilitas_fkey FOREIGN KEY (id_fasilitas) REFERENCES public.fasilitas(id_fasilitas) ON DELETE CASCADE;


--
-- TOC entry 4741 (class 2606 OID 16507)
-- Name: kost_fasilitas kost_fasilitas_id_kost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost_fasilitas
    ADD CONSTRAINT kost_fasilitas_id_kost_fkey FOREIGN KEY (id_kost) REFERENCES public.kost(id_kost) ON DELETE CASCADE;


--
-- TOC entry 4739 (class 2606 OID 16496)
-- Name: kost kost_id_pemilik_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost
    ADD CONSTRAINT kost_id_pemilik_fkey FOREIGN KEY (id_pemilik) REFERENCES public.users(id_user) ON DELETE CASCADE;


-- Completed on 2025-03-15 21:19:46

--
-- PostgreSQL database dump complete
--

