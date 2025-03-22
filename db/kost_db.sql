--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-22 12:57:36

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

--
-- TOC entry 877 (class 1247 OID 16638)
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
-- TOC entry 874 (class 1247 OID 16633)
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
-- TOC entry 4913 (class 0 OID 0)
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
-- TOC entry 4914 (class 0 OID 0)
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
-- TOC entry 4915 (class 0 OID 0)
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
    nama_kost character varying(255) NOT NULL,
    alamat text NOT NULL,
    deskripsi text,
    harga_sewa numeric(10,2) NOT NULL,
    luas integer NOT NULL,
    status_properti public.status_properti_enum,
    jenis_sertifikat public.jenis_sertifikat_enum,
    luas_tanah integer,
    longitude double precision NOT NULL,
    latitude double precision NOT NULL
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
-- TOC entry 4916 (class 0 OID 0)
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
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;


--
-- TOC entry 4725 (class 2604 OID 16458)
-- Name: fasilitas id_fasilitas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fasilitas ALTER COLUMN id_fasilitas SET DEFAULT nextval('public.fasilitas_id_fasilitas_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 16535)
-- Name: favorit id_favorit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorit ALTER COLUMN id_favorit SET DEFAULT nextval('public.favorit_id_favorit_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 16521)
-- Name: gambar_kost id_gambar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gambar_kost ALTER COLUMN id_gambar SET DEFAULT nextval('public.gambar_kost_id_gambar_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 16491)
-- Name: kost id_kost; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost ALTER COLUMN id_kost SET DEFAULT nextval('public.kost_id_kost_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 16479)
-- Name: users id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);


--
-- TOC entry 4898 (class 0 OID 16455)
-- Dependencies: 218
-- Data for Name: fasilitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fasilitas (id_fasilitas, nama_fasilitas) FROM stdin;
1	Jemuran
2	Parkiran
3	Dapur Bersama
4	Kamar Mandi Luar
5	Kasur
6	Lemari
7	Wifi
8	Kamar Mandi Dalam
9	Laundry
10	AC
11	Meja Belajar
12	Kandang Musang
13	Lapangan Tenis
15	Karaoke
\.


--
-- TOC entry 4907 (class 0 OID 16532)
-- Dependencies: 227
-- Data for Name: favorit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorit (id_favorit, id_pencari, id_kost) FROM stdin;
\.


--
-- TOC entry 4905 (class 0 OID 16518)
-- Dependencies: 225
-- Data for Name: gambar_kost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gambar_kost (id_gambar, id_kost, url_gambar) FROM stdin;
1	18	https://example.com/gambar1.jpg
2	18	https://example.com/gambar2.jpg
3	19	https://example.com/gambar1.jpg
4	19	https://example.com/gambar2.jpg
5	20	https://example.com/gambar1.jpg
6	20	https://example.com/gambar2.jpg
9	22	https://example.com/gambar1.jpg
10	22	https://example.com/gambar2.jpg
11	23	https://example.com/kost_asri_1.jpg
\.


--
-- TOC entry 4902 (class 0 OID 16488)
-- Dependencies: 222
-- Data for Name: kost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kost (id_kost, nama_kost, alamat, deskripsi, harga_sewa, luas, status_properti, jenis_sertifikat, luas_tanah, longitude, latitude) FROM stdin;
4	Muhammad Rizki	RT 5 RW 4 Jalan Sersan Surip, Ledeng, Cidadap, Bandung	Kost nyaman dengan fasilitas lengkap.	700000.00	58	Sewa	Sertifikat Hak Milik (SHM)	69	106.8204032	-6.22264
5	test	test	Deskripsi kost untuk testing.	10000000.00	60	Sewa	Sertifikat Hak Milik (SHM)	79	107.5871744	-6.88128
6	Kost Mewah	Jl. Sudirman No. 10	Kost nyaman dan aman	1500000.00	20	Sewa	Sertifikat Hak Milik (SHM)	\N	100.12345	-0.12345
7	Kost Mewah	Jl. Sudirman No. 10	Kost nyaman dan aman	1500000.00	20	Sewa	Sertifikat Hak Milik (SHM)	\N	100.12345	-0.12345
8	Kost Mewah	Jl. Sudirman No. 10	Kost nyaman dan aman	1500000.00	20	Sewa	Sertifikat Hak Milik (SHM)	\N	100.12345	-0.12345
9	Kost Mewah	Jl. Sudirman No. 10	Kost nyaman dan aman	1500000.00	20	Sewa	Sertifikat Hak Milik (SHM)	\N	100.12345	-0.12345
10	Kost Mewah	Jl. Sudirman No. 10	Kost nyaman dan aman	1500000.00	20	Sewa	Sertifikat Hak Milik (SHM)	\N	100.12345	-0.12345
11	Kost Mewah	Jl. Sudirman No. 10	Kost nyaman dan aman	1500000.00	20	Sewa	Sertifikat Hak Milik (SHM)	\N	100.12345	-0.12345
12	Kost Mewah	Jl. Sudirman No. 10	Kost nyaman dan aman	1500000.00	20	Sewa	Sertifikat Hak Milik (SHM)	\N	100.12345	-0.12345
13	Kost Harmoni	Jl. Melati No. 10, Padang	Kost nyaman dekat kampus dan pusat kota.	1500000.00	20	Sewa	Sertifikat Hak Guna Bangunan (SHGB)	100	100.365	-0.876
14	Kost Harmoni	Jl. Melati No. 10, Padang	Kost nyaman dekat kampus dan pusat kota.	1500000.00	20	Sewa	Sertifikat Hak Guna Bangunan (SHGB)	100	100.365	-0.876
15	Kost Harmoni 2	Jl. Melati No. 10, Padang	Kost nyaman dekat kampus dan pusat kota.	1500000.00	20	Sewa	Sertifikat Hak Guna Bangunan (SHGB)	101	100.365	-0.876
16	Kost Harmoni 2	Jl. Melati No. 10, Padang	Kost nyaman dekat kampus dan pusat kota.	1500000.00	20	Sewa	Sertifikat Hak Guna Bangunan (SHGB)	101	100.365	-0.876
17	Kost Harmoni 2	Jl. Melati No. 10, Padang	Kost nyaman dekat kampus dan pusat kota.	1500000.00	20	Sewa	Sertifikat Hak Guna Bangunan (SHGB)	101	100.365	-0.876
18	Kost Harmoni 2	Jl. Melati No. 10, Padang	Kost nyaman dekat kampus dan pusat kota.	1500000.00	20	Sewa	Sertifikat Hak Guna Bangunan (SHGB)	101	100.365	-0.876
19	Kost Harmoni 2	Jl. Melati No. 10, Padang	Kost nyaman dekat kampus dan pusat kota.	1500000.00	20	Sewa	Sertifikat Hak Guna Bangunan (SHGB)	101	100.365	-0.876
20	Kost Harmoni 2	Jl. Melati No. 10, Padang	Kost nyaman dekat kampus dan pusat kota.	1500000.00	20	Sewa	Sertifikat Hak Guna Bangunan (SHGB)	101	100.365	-0.876
22	Kost Harmoni 2	Jl. Melati No. 10, Padang	Kost nyaman dekat kampus dan pusat kota.	1500000.00	20	Sewa	Sertifikat Hak Guna Bangunan (SHGB)	101	100.365	-0.876
23	Kost Asri	Jl. Kenanga No. 5, Padang	Kost murah dan bersih.	1200000.00	18	Sewa	Sertifikat Hak Guna Bangunan (SHGB)	90	100.4	-0.89
\.


--
-- TOC entry 4903 (class 0 OID 16502)
-- Dependencies: 223
-- Data for Name: kost_fasilitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kost_fasilitas (id_kost, id_fasilitas) FROM stdin;
4	1
4	2
4	3
4	4
4	5
4	6
5	1
5	2
5	3
5	7
5	8
5	9
5	5
5	10
5	6
5	11
9	1
9	2
9	3
10	1
10	2
10	3
11	1
11	2
11	3
12	1
12	2
12	3
13	1
13	2
13	5
14	1
14	2
14	5
15	1
15	2
15	5
16	1
16	2
16	5
17	1
17	2
17	5
18	1
18	2
18	5
19	1
19	2
19	5
20	1
20	2
20	5
22	1
22	2
22	5
23	1
23	3
\.


--
-- TOC entry 4900 (class 0 OID 16476)
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
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 217
-- Name: fasilitas_id_fasilitas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fasilitas_id_fasilitas_seq', 15, true);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 226
-- Name: favorit_id_favorit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorit_id_favorit_seq', 1, false);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 224
-- Name: gambar_kost_id_gambar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gambar_kost_id_gambar_seq', 11, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 221
-- Name: kost_id_kost_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kost_id_kost_seq', 23, true);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_user_seq', 3, true);


--
-- TOC entry 4732 (class 2606 OID 16460)
-- Name: fasilitas fasilitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fasilitas
    ADD CONSTRAINT fasilitas_pkey PRIMARY KEY (id_fasilitas);


--
-- TOC entry 4746 (class 2606 OID 16537)
-- Name: favorit favorit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorit
    ADD CONSTRAINT favorit_pkey PRIMARY KEY (id_favorit);


--
-- TOC entry 4744 (class 2606 OID 16525)
-- Name: gambar_kost gambar_kost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gambar_kost
    ADD CONSTRAINT gambar_kost_pkey PRIMARY KEY (id_gambar);


--
-- TOC entry 4742 (class 2606 OID 16506)
-- Name: kost_fasilitas kost_fasilitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost_fasilitas
    ADD CONSTRAINT kost_fasilitas_pkey PRIMARY KEY (id_kost, id_fasilitas);


--
-- TOC entry 4740 (class 2606 OID 16495)
-- Name: kost kost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost
    ADD CONSTRAINT kost_pkey PRIMARY KEY (id_kost);


--
-- TOC entry 4734 (class 2606 OID 16661)
-- Name: fasilitas unique_nama_fasilitas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fasilitas
    ADD CONSTRAINT unique_nama_fasilitas UNIQUE (nama_fasilitas);


--
-- TOC entry 4736 (class 2606 OID 16486)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4738 (class 2606 OID 16484)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- TOC entry 4750 (class 2606 OID 16543)
-- Name: favorit favorit_id_kost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorit
    ADD CONSTRAINT favorit_id_kost_fkey FOREIGN KEY (id_kost) REFERENCES public.kost(id_kost) ON DELETE CASCADE;


--
-- TOC entry 4751 (class 2606 OID 16538)
-- Name: favorit favorit_id_pencari_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorit
    ADD CONSTRAINT favorit_id_pencari_fkey FOREIGN KEY (id_pencari) REFERENCES public.users(id_user) ON DELETE CASCADE;


--
-- TOC entry 4749 (class 2606 OID 16526)
-- Name: gambar_kost gambar_kost_id_kost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gambar_kost
    ADD CONSTRAINT gambar_kost_id_kost_fkey FOREIGN KEY (id_kost) REFERENCES public.kost(id_kost) ON DELETE CASCADE;


--
-- TOC entry 4747 (class 2606 OID 16512)
-- Name: kost_fasilitas kost_fasilitas_id_fasilitas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost_fasilitas
    ADD CONSTRAINT kost_fasilitas_id_fasilitas_fkey FOREIGN KEY (id_fasilitas) REFERENCES public.fasilitas(id_fasilitas) ON DELETE CASCADE;


--
-- TOC entry 4748 (class 2606 OID 16507)
-- Name: kost_fasilitas kost_fasilitas_id_kost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost_fasilitas
    ADD CONSTRAINT kost_fasilitas_id_kost_fkey FOREIGN KEY (id_kost) REFERENCES public.kost(id_kost) ON DELETE CASCADE;


-- Completed on 2025-03-22 12:57:36

--
-- PostgreSQL database dump complete
--

