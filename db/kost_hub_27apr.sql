--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-04-27 22:26:46

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
    latitude double precision NOT NULL,
    panjang numeric(5,2),
    lebar numeric(5,2)
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
1	Termasuk listrik
2	Kasur
3	Meja
4	Lemari Baju
5	Kursi
6	Kloset Jongkok
7	K. Mandi Luar
8	Bak mandi
9	WiFi
10	R. Jemur
11	Dapur
12	Parkir Motor
13	Parkir Sepeda
14	Tidak termasuk listrik
15	Bantal
16	Cermin
17	Cleaning service
18	Guling
19	Jendela
20	Kulkas
21	Penjaga Kos
22	Dispenser
23	CCTV
24	Jemuran
25	Jual Makanan
26	Balcon
27	Parkir Mobil
28	K. Mandi Dalam
29	Kloset Duduk
30	Ember mandi
31	Shower
32	R. Tamu
33	R. Santai
34	TV
35	Ventilasi
36	Air panas
37	R. Cuci
38	Pengurus Kos
39	Taman
40	Dapur Pribadi
41	Wastafel
42	Laundry
43	Mesin Cuci
44	R. Makan
45	AC
46	Meja makan
47	Mushola
48	Parkir Motor & Sepeda
49	Kipas Angin
50	Sofa
51	R. Keluarga
52	Rooftop
53	Locker
54	Gazebo
55	Joglo
56	Rice Cooker
57	Kartu Akses
58	TV Kabel
59	Meja Rias
60	Bathtub
61	microwave
62	2
63	5 meter
64	meter
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
1	1	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684577560_img_%25UGZ4QnYc-360x480%20%281%29.jpg_%2593894c78-1722-4bd3-979a-71eb761a507c.jpeg
2	2	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673961000_img_%25Screenshot%202025-04-06%20203755_%25c2d65c36-5314-49da-a022-21703f86c5ce.png
3	3	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727722099_img_%2589.jpg_%256bee859e-7041-4893-8384-3909e4dae808.jpeg
4	4	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733273188_img_%25YxhQfi5a-540x720%20%281%29.jpg_%253945aa47-647c-43aa-bbd6-09aca269ca0b.jpeg
5	5	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760941035_img_%25drtyuiknbvfyum.jpg_%2559123121-aa40-4ee9-ad36-f7372fd3b2f7.jpeg
6	6	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682479387_img_%25a640492f-d21d-45af-89d1-30322b35e88e_%2558278f7f-1484-48cb-9c9c-3821cab4d19a.png
7	7	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679020171_img_%25snapedit_1745679019081_%2588ac7536-ccef-40c6-b766-bba7b57f020c.jpeg
8	8	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728974767_img_%25118.jpg_%25e98369d0-955e-4ede-af2c-9594dfe75b64.jpeg
9	9	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679393757_img_%25snapedit_1745679463783_%256866fa1c-e3ab-43a1-98bb-eb1f567289d6.jpeg
10	10	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727030759_img_%25119.jpg_%25ecf30237-0e1c-4ae7-bf68-648df07206af.jpeg
11	11	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729446081_img_%2529.jpg_%25ef5f2f36-ce1b-46ca-a8aa-a2974a999cf9.jpeg
12	12	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673260886_img_%25snapedit_1744431774210.jpg_%258a91aeca-194f-4411-81d5-4a320ac33caf.jpeg
13	13	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729017987_img_%251-1707797865-Kos---Kosan-Pondok-Indah-Kamar-Mandi-Dalam-Fasilitas-Lengkap---Jakarta.jpg_%257da6e7d5-499c-49e7-9cf7-64f44b82011e.jpeg
14	14	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760254516_img_%25gfdsdfghjkl%3Bliu7y.jpg_%25385f01ad-ede4-4298-bfd1-b3f58eed977a.jpeg
15	15	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761419083_img_%25edfghjkl%3B.jpg_%2517faf11b-3dbb-444b-8872-b6f4b305b591.jpeg
16	16	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728196327_img_%25144.jpg_%25f878df96-ccd7-4d9d-bfff-c94a7089c899.jpeg
17	17	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728176224_img_%2566.jpg_%25d725ef00-386d-4772-8e2e-d4169f27fe24.jpeg
18	18	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758952527_img_%25gffffghjmjuhhn.jpg_%25e01fb3e8-d7b4-4880-84e8-f168e4486cfb.jpeg
19	19	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731836123_img_%25TtlTkhRA.-360x480%20%281%29.jpg_%25c9a902a9-ee63-470b-a6f1-a6fa272dbca0.jpeg
20	20	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733088709_img_%250d03LamJ.-360x480%20%281%29.jpg_%25d9c06a7c-da83-4b30-96b8-b579741737aa.jpeg
21	21	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681275347_img_%25d3a5f1f5-1c7e-4f05-8e31-ebae40c3b6a1_%25dac09fe4-3ed9-43fe-bd2a-a54bdf3b4222.png
22	22	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736933603_img_%25qBVPRANP-540x720%20%281%29.jpg_%25c2467444-85bc-41fd-9e51-b0c153de631e.jpeg
23	23	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727989137_img_%2513.jpg_%251a415329-25be-407f-89a6-6acd52a50703.jpeg
24	24	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678213456_img_%25Screenshot%202025-04-26%20213856_%25f78cce6f-0efe-4042-9590-698da586a520.png
25	25	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759022867_img_%25jhgddyfds.jpg_%25abc8f59e-4a4c-40f2-acf0-e9829fa0aea3.jpeg
26	26	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745726997024_img_%25snapedit_1745112776953.jpg_%256347c432-6d70-4afa-877d-971f4b23665c.jpeg
27	27	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762226020_img_%2573.jpg_%25de0d3d6c-52aa-482e-8151-00979549274d.jpeg
28	28	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729348585_img_%25listing-1050644677_x2.jpg_%25c2044a03-a89b-43e3-b367-f4a7b5ba07a7.jpeg
29	29	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729085225_img_%25136.jpg_%2521d8d7e7-f0ca-40b1-bb7a-d5605c1aceb5.jpeg
30	30	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732319224_img_%25LqFmeGrO-360x480%20%281%29.jpg_%25a0ba45c5-6bf7-486c-ad8a-117528c14612.jpeg
31	31	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731106132_img_%25PXvBKoAY.-360x480%20%281%29.jpg_%250591a6e6-b863-4d0f-a3bb-7a5e0e814909.jpeg
32	32	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728054716_img_%2576.jpg_%25e0ce0bdb-2dca-4ba3-ad96-42694557b665.jpeg
33	33	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764243277_img_%25144.jpg_%25de55cce1-529c-4bcf-ab4f-9e937a2d2007.jpeg
34	34	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759246523_img_%25120.jpg_%25ce1db31e-4573-4bf6-83a7-082526f02d03.jpeg
35	35	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760150347_img_%25dsfghjkllkjhgtyujk_%25c489068d-6646-4cd7-86f9-7643437e1656.jpeg
36	36	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673548630_img_%25snapedit_1745072680356.jpg_%25bfbbc633-1352-4755-84ba-33506bfc7b53.jpeg
37	37	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734863125_img_%25uWGJ2wIe-360x480%20%281%29.jpg_%25ec0e552a-fb7d-415f-85f7-ab076f735d7c.jpeg
38	38	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745333029567_img_%25image272_%25e99d9370-6ade-4c84-aa42-bf436f5df2b5.png
39	39	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760447215_img_%25dfghjkl%3Blkjhgfrtyu.jpg_%256466424b-52af-41e6-b39d-9b7831011fd5.jpeg
40	40	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729017987_img_%251-1707797865-Kos---Kosan-Pondok-Indah-Kamar-Mandi-Dalam-Fasilitas-Lengkap---Jakarta.jpg_%257da6e7d5-499c-49e7-9cf7-64f44b82011e.jpeg
41	41	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733844421_img_%25Wt2aZYfI-360x480%20%281%29.jpg_%25612741fb-0381-4ce5-87cc-6d90aee30e47.jpeg
42	42	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736508313_img_%25oBgUzkxE.-360x480%20%281%29.jpg_%25de61b0db-30fa-4406-a509-02d69755f652.jpeg
43	43	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745756860073_img_%25kPbuHarG.-360x480%20%281%29.jpg_%25722f6e90-cf36-4852-b6d5-001d1aa55004.jpeg
44	44	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736329290_img_%25PNlVdFfy.-360x480%20%281%29.jpg_%25d969fada-a50d-4187-9094-474af031e7cb.jpeg
45	45	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716224367_img_%257CGMuJSd.-540x720%20%281%29.jpg_%2594d21f4d-0b27-45d4-9e06-ac81b84b7063.jpeg
46	46	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760123101_img_%25zxfcghjklkjhytr5rtghbn.jpg_%252ea6b919-7d1d-4edf-a80e-d73371cd2482.jpeg
47	47	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759174391_img_%25ghdjskiurjer.jpg_%2562085939-3756-4643-a3db-0c3b22544bab.jpeg
48	48	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727863299_img_%2574.jpg_%25851b8574-c0f9-4d50-9cfc-60a684c47f0f.jpeg
49	49	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719417864_img_%254h9SuWWN-360x480%20%281%29.jpg_%2537e18faa-7cee-475b-bfc7-1868073fba5a.jpeg
50	50	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728454466_img_%25snapedit_1745074090053.jpg_%2528229045-8adf-4cad-8393-386919c62b15.jpeg
51	51	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727634158_img_%25170.jpg_%252f79a39d-3399-4198-93d7-b6802fc0055e.jpeg
52	52	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685374118_img_%25Yo43gYjW-360x480%20%281%29.jpg_%25486892a9-1123-41a1-896e-51a16b0f5f04.jpeg
53	53	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736453966_img_%25trrF7nQa-540x720%20%281%29.jpg_%2536232ac1-9911-48f6-b6f1-aa3f2da9945a.jpeg
54	54	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718228539_img_%258WoQBebx-360x480%20%281%29.jpg_%25174b4902-85c6-4300-bb2c-cc165ffea232.jpeg
55	55	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680216580_img_%251caf50ee-43a7-4924-9843-3c5cf3d7bed9_%25e77bca21-2d53-497a-bba5-a11fa065fde6.png
56	56	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681313339_img_%257126d1d0-fb6a-4625-baea-1bda44eae814_%25abd09186-0d8d-4784-aaa7-61676f3f82ad.png
57	57	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728306500_img_%2581.jpg_%255114259e-03a3-47f1-91c9-cac7afbd9f16.jpeg
58	58	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760123101_img_%25zxfcghjklkjhytr5rtghbn.jpg_%252ea6b919-7d1d-4edf-a80e-d73371cd2482.jpeg
59	59	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745726954377_img_%25kamar-kost-sederhana-di-sarijadi-1690635730.jpg_%25c24bc8d7-9cd2-4590-8d7e-4328639d446d.jpeg
60	60	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728483122_img_%25164.jpg_%25070a5ad2-4d63-434e-b091-a5f3dc386205.jpeg
61	61	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680995624_img_%25e16b8412-c052-4da0-be63-807055510347_%25c6508e13-4a94-49b8-a0f6-036e8f20c428.png
62	62	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764243277_img_%25144.jpg_%25de55cce1-529c-4bcf-ab4f-9e937a2d2007.jpeg
63	63	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681234675_img_%259abc1def-de24-4ef4-a601-ecf205add8d8_%252eec4bcf-b9fb-4c5a-8d96-a12b3bf89d5c.png
64	64	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758525077_img_%25fygdhcushcydfu.jpg_%257b1f2631-b032-4371-b220-5a975bb87325.jpeg
65	65	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736649268_img_%2534sb8qQd-360x480%20%281%29.jpg_%25955fbe97-7eff-4cae-ac04-4a97bbc54de1.jpeg
66	66	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763866958_img_%25150.jpg_%25a91df04c-548a-4ba8-940b-ade4db55c0da.jpeg
67	67	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760254516_img_%25gfdsdfghjkl%3Bliu7y.jpg_%25385f01ad-ede4-4298-bfd1-b3f58eed977a.jpeg
68	68	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732124401_img_%25evRR73mX.-360x480%20%281%29.jpg_%25c6f0edd2-6cfb-4ac2-8e15-ac14a52d6e4c.jpeg
69	69	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763041044_img_%25ftyuiop%3B%2Cnbgttyk.jpg_%25f306bb7a-6652-4321-bf61-e6ab4da274b2.jpeg
70	70	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727358120_img_%25kamar-kost-sederhana-di-sarijadi-1690635730.jpg_%2560e56531-2bb4-4151-834d-e3f449067065.jpeg
71	71	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684000011_img_%25Md5uRUQl.-360x480%20%281%29.jpg_%2544bff415-d0cd-4e81-a5b3-8a495a363c25.jpeg
72	72	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759174391_img_%25ghdjskiurjer.jpg_%2562085939-3756-4643-a3db-0c3b22544bab.jpeg
73	73	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719417864_img_%254h9SuWWN-360x480%20%281%29.jpg_%2537e18faa-7cee-475b-bfc7-1868073fba5a.jpeg
74	74	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728165026_img_%25images.jpg_%25050fc801-d719-454f-b6ae-b2e9f420356b.jpeg
75	75	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727298995_img_%2529.jpg_%25967549fa-7133-4e59-b347-941c2206aec5.jpeg
76	76	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758301314_img_%25dugsdskdka%2Cb.jpg_%2589cd42a9-8be0-44ce-9beb-4d161dd42e42.jpeg
77	77	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745717296867_img_%25CY2Ibxdr-360x480%20%281%29.jpg_%25fb6e58f4-091f-4f30-90bc-244fcc8fd5d8.jpeg
78	78	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728145437_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2001_04_11%20PM_%25122d327b-9e69-4ac1-9089-d7310b21a5c8.png
79	79	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745726954377_img_%25kamar-kost-sederhana-di-sarijadi-1690635730.jpg_%25c24bc8d7-9cd2-4590-8d7e-4328639d446d.jpeg
80	80	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673093962_img_%25snapedit_1744430404114.jpg_%25a1654de6-c86e-46d2-9b49-e6440e3d0682.jpeg
81	81	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728165026_img_%25images.jpg_%25050fc801-d719-454f-b6ae-b2e9f420356b.jpeg
82	82	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715385903_img_%2534sb8qQd-360x480%20%281%29.jpg_%2567fad1d9-57ad-4e7d-b520-7c9156aadd6d.jpeg
83	83	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757563186_img_%25lPFDD4uK-360x480%20%282%29.jpg_%25361e5b3b-e9f9-40d2-9c5f-3475a035f49a.jpeg
84	84	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729085225_img_%25136.jpg_%2521d8d7e7-f0ca-40b1-bb7a-d5605c1aceb5.jpeg
85	85	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729771537_img_%2557.jpg_%250abe0fa5-5f73-4da1-b02d-a004cca12278.jpeg
86	86	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728609231_img_%25143.jpg_%25b0d5f694-268c-4aad-b4a0-c08e0f757415.jpeg
87	87	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736649268_img_%2534sb8qQd-360x480%20%281%29.jpg_%25955fbe97-7eff-4cae-ac04-4a97bbc54de1.jpeg
88	88	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728854731_img_%2572.jpg_%2506256408-8823-4c67-a15d-734e0fef9b76.jpeg
89	89	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681025684_img_%25d26e9152-4d7f-4e66-aec7-1894893b6094_%250dcb866d-98c8-4a1c-a8db-cf977d1ad7e2.png
90	90	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757997686_img_%2512%20redfsg.jpg_%25608403da-384e-4be5-9d32-e3a579ab6ce3.jpeg
91	91	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728285635_img_%25142.jpg_%2552d06ad4-56f2-40ec-ab55-bef98003fd01.jpeg
92	92	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728454466_img_%25snapedit_1745074090053.jpg_%2528229045-8adf-4cad-8393-386919c62b15.jpeg
93	93	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758250683_img_%25sdgjskf9yfh7.jpg_%251816459b-a527-42cd-b154-4a0bd9d86ddc.jpeg
94	94	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734369889_img_%25bivwcyQu.-360x480%20%281%29.jpg_%257d86de7a-c983-4956-9e19-d6ccbb0dc146.jpeg
95	95	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684000011_img_%25Md5uRUQl.-360x480%20%281%29.jpg_%2544bff415-d0cd-4e81-a5b3-8a495a363c25.jpeg
96	96	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761623087_img_%25fhhhnk%2C.jpg_%25bccfacdc-9f6a-4f85-a6cc-164d8cd24175.jpeg
97	97	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672645824_img_%25Screenshot%202025-04-06%20205401_%254e8ff39c-387e-43b0-b5fe-1e40d2070f76.png
98	98	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759655457_img_%25jhgfdghjgklh%3Boiuy.jpg_%25a727e827-7922-4b55-8744-0d89e776f43d.jpeg
99	99	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678738593_img_%25snapedit_1745678801885_%259e6c25b0-900c-427a-a032-4624b8ce7d17.jpeg
100	100	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761115478_img_%25edfgkjhyyj.jpg_%25ad296f82-48cc-48be-b181-9dc1b70dff66.jpeg
101	101	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727114297_img_%25135.jpg_%2516489423-f14d-4658-941b-d1a94e34ef75.jpeg
102	102	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683885913_img_%25HJ18hnVl.-540x720%20%281%29.jpg_%25d14a2c11-182e-4768-b7a2-03c9b10da5d6.jpeg
103	103	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760698588_img_%25ytsdfghjkjhyhn.jpg_%257b943e01-9f87-47bd-9fd0-1bcd5f1029ff.jpeg
104	104	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764243277_img_%25144.jpg_%25de55cce1-529c-4bcf-ab4f-9e937a2d2007.jpeg
105	105	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727252047_img_%25110.jpg_%255bc629ef-a4a0-4a13-983b-a12ec6d7ddf9.jpeg
106	106	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728285635_img_%25142.jpg_%2552d06ad4-56f2-40ec-ab55-bef98003fd01.jpeg
107	107	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685374118_img_%25Yo43gYjW-360x480%20%281%29.jpg_%25486892a9-1123-41a1-896e-51a16b0f5f04.jpeg
108	108	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728360849_img_%25106.jpg_%2534f7c1d0-a984-4352-b780-ce92d444b208.jpeg
109	109	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762497058_img_%25dsertyuimnbgth.jpg_%25acebd805-b163-4538-86c0-23b897f5ad98.jpeg
110	110	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745720124007_img_%25SbsOr3fP-360x480%20%282%29.jpg_%252cfa031b-62c4-4e7d-b308-93a995a034b8.jpeg
111	111	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673667994_img_%25snapedit_1745074090053.jpg_%257cb5d07b-a28c-4ebe-bff3-e6997c50b349.jpeg
112	112	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759876732_img_%25drtyuiolkjhgcf.jpg_%250365494f-84f9-4845-b8f9-38dd23ca7f92.jpeg
113	113	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759022867_img_%25jhgddyfds.jpg_%25abc8f59e-4a4c-40f2-acf0-e9829fa0aea3.jpeg
114	114	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728145437_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2001_04_11%20PM_%25122d327b-9e69-4ac1-9089-d7310b21a5c8.png
115	115	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734352336_img_%25mz6lsU9v.-360x480%20%281%29.jpg_%254c1bfa7d-b42a-4b64-ba67-d31f0099fd63.jpeg
116	116	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732774866_img_%25LLK8g6fn-540x720%20%281%29.jpg_%25c4589194-2504-40bc-8842-e831a1655430.jpeg
117	117	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679930168_img_%25578113ce-7cdb-40fd-ada8-1e18a4ae80fd_%2596689d6b-6402-4f38-bb61-5c5249d9da2c.png
118	118	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729085225_img_%25136.jpg_%2521d8d7e7-f0ca-40b1-bb7a-d5605c1aceb5.jpeg
119	119	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681053041_img_%256d1a6770-541f-4a62-91a7-eef193da11a0_%2596d35214-6c0f-4fe1-b7e4-8255dfbb9ec9.png
120	120	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761811429_img_%25hgfghjk%2Cmnbfghjkl.jpg_%25b300b803-fbfa-4deb-aafe-94beba12d0bd.jpeg
121	121	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684251086_img_%25jQf5etNn-540x720%20%281%29.jpg_%2502ae639d-f161-47b1-aa10-c12d23814780.jpeg
122	122	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728038163_img_%25124.jpg_%2595a5514a-a0ce-4540-89e9-b628e6360ef5.jpeg
123	123	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715579673_img_%25Betterimage.ai_1745715627172_%252177f5cb-8cef-4ea4-8cf5-25060da4c947.jpeg
124	124	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728009721_img_%25167.jpg_%256badf91e-8fb6-425b-a4d8-183a03df7b3b.jpeg
125	125	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733122447_img_%25dhO7Ok9S-360x480%20%281%29.jpg_%2504588440-78c1-4b6d-8a9b-9c2a5189db1c.jpeg
126	126	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718228539_img_%258WoQBebx-360x480%20%281%29.jpg_%25174b4902-85c6-4300-bb2c-cc165ffea232.jpeg
127	127	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763011558_img_%25dfghjkjhgfdsasdfghjk.jpg_%25142d91dc-cb2d-4159-91ab-0d2d02fabf50.jpeg
128	128	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680372045_img_%25b9ece2e1-1e16-4b6a-9e1b-6c5e5518be12_%257f216701-faf4-4d25-839e-8b93e39a6081.png
129	129	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728467754_img_%25135.jpg_%25d0761705-3a49-420b-9b49-0bd4b3b05277.jpeg
130	130	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761963218_img_%25sasrtyuio%3Blmnbghjkl.jpg_%25bd7827b7-5533-4a28-ab53-45136318b874.jpeg
131	131	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727797412_img_%2536.jpg_%25d2d5a4e9-f632-4fc8-bbe3-cd10eecfe842.jpeg
132	132	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729158610_img_%2573.jpg_%254e835e3c-1589-4f1a-85d5-8918a9a7e9f1.jpeg
133	133	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728819618_img_%25download_4.jpg_%2528d92832-f8a6-4686-a761-2c979980ab98.jpeg
134	134	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757199483_img_%25h8KA05sK-360x480%20%281%29.jpg_%2511263c9d-972e-4de6-b706-85ed0765065b.jpeg
135	135	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680245021_img_%253f111ca1-8b5f-42d7-ba0c-28d30f857427_%2565d3b37a-7c2e-497a-af1f-957571462201.png
136	136	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728054716_img_%2576.jpg_%25e0ce0bdb-2dca-4ba3-ad96-42694557b665.jpeg
137	137	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684577560_img_%25UGZ4QnYc-360x480%20%281%29.jpg_%2593894c78-1722-4bd3-979a-71eb761a507c.jpeg
138	138	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729017987_img_%251-1707797865-Kos---Kosan-Pondok-Indah-Kamar-Mandi-Dalam-Fasilitas-Lengkap---Jakarta.jpg_%257da6e7d5-499c-49e7-9cf7-64f44b82011e.jpeg
139	139	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719979800_img_%25zyAyGSwH-540x720%20%281%29.jpg_%255c21565a-ee0a-49bf-b34d-0f9cc26e6f80.jpeg
140	140	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680538899_img_%2503532d15-cacd-49ce-afbf-1ce01e488c19_%256b0ae54e-9573-4dcf-a1f6-59878765ae0b.png
141	141	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729144841_img_%25snapedit_1745679019081_%259098a351-d925-48e3-a3c9-4cbdaa94cb38.jpeg
142	142	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683016486_img_%25ChatGPT%20Image%20Apr%2026%2C%202025%2C%2010_58_49%20PM_%25a58dda0a-23e0-41f8-a3b8-389b130c427c.png
143	143	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760698588_img_%25ytsdfghjkjhyhn.jpg_%257b943e01-9f87-47bd-9fd0-1bcd5f1029ff.jpeg
144	144	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684968549_img_%259J1CJdyS.-540x720%20%281%29.jpg_%2550744963-47fe-4379-92f5-d86ad3dd2c61.jpeg
145	145	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719212284_img_%25lw6ZQnHS-360x480%20%281%29.jpg_%25a463fb5c-bf29-465b-a753-a2b362232e16.jpeg
146	146	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728780067_img_%25th%20%283%29.jpg_%25a7e61902-5412-42e8-bbca-291f6688d8e0.jpeg
147	147	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673350770_img_%25snapedit_1745071376790.jpg_%25af257aed-2c6c-4a28-9c81-58a3dd412e4c.jpeg
148	148	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718074576_img_%25cBv86IP0-360x480%20%281%29.jpg_%25c30ce484-122f-4ee4-a582-3954ab65be4f.jpeg
149	149	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763350713_img_%25578113ce-7cdb-40fd-ada8-1e18a4ae80fd_%25ea4c8227-c7b1-4c52-964a-b5cb0d1c62e9.png
150	150	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680681219_img_%256fa6037f-a996-46f0-b8bb-536b8bdd900c_%25dc786d28-f9f0-44c2-8334-39816776f0dd.png
151	151	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761963218_img_%25sasrtyuio%3Blmnbghjkl.jpg_%25bd7827b7-5533-4a28-ab53-45136318b874.jpeg
152	152	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727030759_img_%25119.jpg_%25ecf30237-0e1c-4ae7-bf68-648df07206af.jpeg
153	153	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682890813_img_%2553d3ff3c-704a-4dce-8e71-635bbe1fc74d_%25df0bae6c-ed4c-4401-99b9-c457b6c8d837.png
154	154	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681564185_img_%250fc482ca-3600-45fb-9b4d-b26d77f5441a_%25321118c7-620c-4b25-96fa-120591bafd08.png
155	155	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736329290_img_%25PNlVdFfy.-360x480%20%281%29.jpg_%25d969fada-a50d-4187-9094-474af031e7cb.jpeg
156	156	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733731074_img_%25vYxUUw8k-540x720%20%281%29.jpg_%2547afe7b4-5281-47d2-b83e-63ce7bb19507.jpeg
157	157	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679020171_img_%25snapedit_1745679019081_%2588ac7536-ccef-40c6-b766-bba7b57f020c.jpeg
158	158	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763350713_img_%25578113ce-7cdb-40fd-ada8-1e18a4ae80fd_%25ea4c8227-c7b1-4c52-964a-b5cb0d1c62e9.png
159	159	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736294720_img_%25304oBQNH-540x720%20%281%29.jpg_%2510f28e88-073f-4b44-8fac-dd92c7e47e95.jpeg
160	160	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683750887_img_%25qZpqLyKT-540x720%20%281%29.jpg_%251d8a6dda-4399-4fe0-ba9d-4f0edfcd2e29.jpeg
161	161	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719417864_img_%254h9SuWWN-360x480%20%281%29.jpg_%2537e18faa-7cee-475b-bfc7-1868073fba5a.jpeg
162	162	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728054716_img_%2576.jpg_%25e0ce0bdb-2dca-4ba3-ad96-42694557b665.jpeg
163	163	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736875951_img_%25W6PsjaKM.-540x720%20%281%29.jpg_%25b6100d11-aa03-489c-be0f-640ad656a42b.jpeg
164	164	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678437994_img_%25Screenshot%202025-04-26%20214241_%25ac1d1b6b-d707-4abb-bd0c-1346e088bcf0.png
165	165	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683750887_img_%25qZpqLyKT-540x720%20%281%29.jpg_%251d8a6dda-4399-4fe0-ba9d-4f0edfcd2e29.jpeg
166	166	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735449952_img_%25EgPUVk9I-360x480%20%281%29.jpg_%250255d7ca-76d9-48ae-9f2f-da5b887e5896.jpeg
167	167	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681468476_img_%25cbd40244-d779-43e4-a90d-714866b72df7_%25dee4641b-f196-4e72-a3c8-5869e6aaf6ee.png
168	168	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728405426_img_%25snapedit_1745678755398_%2518346031-7d08-46d2-9441-f2f94c233586.jpeg
169	169	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731096381_img_%25mghtbrmK.-360x480%20%281%29.jpg_%25f15b1710-0129-4c05-8019-f3841496ee13.jpeg
170	170	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683252008_img_%25snapedit_1745683366960.jpg_%25a451c554-cc2a-446b-876f-c018064b9d76.jpeg
171	171	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718228539_img_%258WoQBebx-360x480%20%281%29.jpg_%25174b4902-85c6-4300-bb2c-cc165ffea232.jpeg
172	172	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731797377_img_%25Z8YizFaX-540x720%20%281%29.jpg_%25be91c4fa-3c65-4fe0-b966-5fd0bc8a9f34.jpeg
173	173	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728306500_img_%2581.jpg_%255114259e-03a3-47f1-91c9-cac7afbd9f16.jpeg
174	174	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764345274_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_08_11%20AM_%25a942e80d-7fa5-4626-85ec-89d0c052fc3f.png
175	175	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673350770_img_%25snapedit_1745071376790.jpg_%25af257aed-2c6c-4a28-9c81-58a3dd412e4c.jpeg
176	176	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764174546_img_%25128.jpg_%25ef4a9a03-185b-4ba8-b162-5eba6fbdadc7.jpeg
177	177	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761963218_img_%25sasrtyuio%3Blmnbghjkl.jpg_%25bd7827b7-5533-4a28-ab53-45136318b874.jpeg
178	178	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758819059_img_%25djhfgygdusjkl.jpg_%25495655da-c75d-4852-b339-67e92e2df25a.jpeg
179	179	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761394894_img_%25kost-eksklusif-murah-dekat-kampus-832789855.jpg_%258243871e-428d-4909-86f9-28447279c172.jpeg
180	180	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763350713_img_%25578113ce-7cdb-40fd-ada8-1e18a4ae80fd_%25ea4c8227-c7b1-4c52-964a-b5cb0d1c62e9.png
181	181	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764277720_img_%25112.jpg_%25f54fe11f-fc8b-4cc6-b8a1-a9d9cc9b40ff.jpeg
182	182	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672745966_img_%25Screenshot%202025-04-06%20205753_%25ad125b46-400f-41b3-aad3-59171ab395b5.png
183	183	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680245021_img_%253f111ca1-8b5f-42d7-ba0c-28d30f857427_%2565d3b37a-7c2e-497a-af1f-957571462201.png
184	184	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764321996_img_%25snapedit_1745131091135.jpg_%25c6a8f9d5-6dbe-4e16-aacd-483edd284682.jpeg
185	185	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681537933_img_%254252f922-9c83-4148-96eb-a6971826719d_%25acdf0884-f621-4763-9976-8f4653a5baf5.png
186	186	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761394894_img_%25kost-eksklusif-murah-dekat-kampus-832789855.jpg_%258243871e-428d-4909-86f9-28447279c172.jpeg
187	187	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729484922_img_%2584.jpg_%25cd2df962-8cc0-474f-b5aa-7c56789a51ce.jpeg
188	188	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673477147_img_%25Screenshot%202025-04-19%20204659_%25efa4ad3a-856e-4be0-9944-e582197dd4dd.png
189	189	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728526038_img_%25snapedit_1745679166503_%2544973a59-4b58-4697-9167-5555e1d6480f.jpeg
190	190	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761091720_img_%25gfdsertyuikhgffv_%25e7556433-9af5-4d48-8095-180a617700dc.jpeg
191	191	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759022867_img_%25jhgddyfds.jpg_%25abc8f59e-4a4c-40f2-acf0-e9829fa0aea3.jpeg
192	192	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681234675_img_%259abc1def-de24-4ef4-a601-ecf205add8d8_%252eec4bcf-b9fb-4c5a-8d96-a12b3bf89d5c.png
193	193	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729934426_img_%25snapedit_1745130203029.jpg_%257e55fb16-ff1a-474a-a730-7404e5548061.jpeg
194	194	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757792608_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_54_43%20AM_%2519654814-06a2-434c-915c-1a964c39cf18.png
195	195	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732467201_img_%2514OLfTDU-360x480%20%282%29%20%281%29.jpg_%252b02f8de-ac92-43b5-a487-d92fdd37857e.jpeg
196	196	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729771537_img_%2557.jpg_%250abe0fa5-5f73-4da1-b02d-a004cca12278.jpeg
197	197	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679393757_img_%25snapedit_1745679463783_%256866fa1c-e3ab-43a1-98bb-eb1f567289d6.jpeg
198	198	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685938309_img_%25vHtdq903-360x480%20%281%29.jpg_%259fb27409-68e8-4993-b52a-bb18498794ce.jpeg
199	199	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764141211_img_%25poigfddfghjkl%3B.jpg_%254bba9966-fcb6-4108-ba16-82d4d02d6f67.jpeg
200	200	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761861056_img_%25uytrewertyuilknbfertyu.jpg_%25d57e6999-4156-4df2-9ae4-1445bd199d32.jpeg
201	201	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745730678253_img_%25image_%2575c0cd6f-6496-4370-aabb-d6bacbde4512.png
202	202	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727914649_img_%2511.jpg_%251ccfd146-b89c-4b77-8918-eafd58fd97ac.jpeg
203	203	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757887548_img_%25102.jpg_%258e947b25-39b8-44ad-98dd-24d876b083c9.jpeg
204	204	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764174546_img_%25128.jpg_%25ef4a9a03-185b-4ba8-b162-5eba6fbdadc7.jpeg
205	205	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679247545_img_%25snapedit_1745679369605_%257527c056-93a8-4129-89a5-7b8ef2a82067.jpeg
206	206	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678157744_img_%25Screenshot%202025-04-26%20213757_%2584c66213-650b-4106-a6c7-469696b4dc9f.png
207	207	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684251086_img_%25jQf5etNn-540x720%20%281%29.jpg_%2502ae639d-f161-47b1-aa10-c12d23814780.jpeg
208	208	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758525077_img_%25fygdhcushcydfu.jpg_%257b1f2631-b032-4371-b220-5a975bb87325.jpeg
209	209	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673093962_img_%25snapedit_1744430404114.jpg_%25a1654de6-c86e-46d2-9b49-e6440e3d0682.jpeg
210	210	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733171840_img_%2567HNZudS.-360x480%20%281%29.jpg_%25c07b3727-8bb3-4384-8de5-a2c5e633ebb6.jpeg
211	211	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729508646_img_%2536.jpg_%2586e59792-5d98-47bc-b150-a2de5cbbacba.jpeg
212	212	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762712173_img_%25oiuhgffghjkl%3B%27.jpg_%257ae80ca4-b4d7-42e6-ad55-3f58e9c2d4da.jpeg
213	213	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729397082_img_%25168.jpg_%25116506fe-76a9-4ac5-b3e0-1749b5079eee.jpeg
214	214	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727989137_img_%2513.jpg_%251a415329-25be-407f-89a6-6acd52a50703.jpeg
215	215	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735490304_img_%25ByxuX0E7.-540x720%20%281%29.jpg_%25f509469c-75ff-43cc-9202-32491ab5a9ad.jpeg
216	216	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736649268_img_%2534sb8qQd-360x480%20%281%29.jpg_%25955fbe97-7eff-4cae-ac04-4a97bbc54de1.jpeg
217	217	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728145437_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2001_04_11%20PM_%25122d327b-9e69-4ac1-9089-d7310b21a5c8.png
218	218	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732319224_img_%25LqFmeGrO-360x480%20%281%29.jpg_%25a0ba45c5-6bf7-486c-ad8a-117528c14612.jpeg
219	219	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681611822_img_%25fe5bca43-9270-428c-a932-e89989327322_%25ec9f9ac2-24e1-4653-94d4-7f4f2df5cb16.png
220	220	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718074576_img_%25cBv86IP0-360x480%20%281%29.jpg_%25c30ce484-122f-4ee4-a582-3954ab65be4f.jpeg
221	221	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734203799_img_%25eFkpV7nQ.-360x480%20%281%29.jpg_%2513c04796-f20b-44e9-a9f0-a763df13e030.jpeg
222	222	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729771537_img_%2557.jpg_%250abe0fa5-5f73-4da1-b02d-a004cca12278.jpeg
223	223	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728360849_img_%25106.jpg_%2534f7c1d0-a984-4352-b780-ce92d444b208.jpeg
224	224	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678213456_img_%25Screenshot%202025-04-26%20213856_%25f78cce6f-0efe-4042-9590-698da586a520.png
225	225	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728990218_img_%2548.jpg_%25af47d87d-01a2-470c-b92f-49098e73a986.jpeg
226	226	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759655457_img_%25jhgfdghjgklh%3Boiuy.jpg_%25a727e827-7922-4b55-8744-0d89e776f43d.jpeg
227	227	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745737059532_img_%25TNpzcbvr-360x480%20%281%29.jpg_%25c6415c79-ee2d-4cb9-ba29-8b34e7024fbe.jpeg
228	228	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673747233_img_%25snapedit_1745075820870.jpg_%256f60486e-f05c-4aa4-9e9d-102c7a3e6931.jpeg
229	229	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736975053_img_%25zwoAXgnm.-540x720%20%281%29.jpg_%2504942a89-fbac-466f-b73f-5b8ad8653713.jpeg
230	230	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679930168_img_%25578113ce-7cdb-40fd-ada8-1e18a4ae80fd_%2596689d6b-6402-4f38-bb61-5c5249d9da2c.png
231	231	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679247545_img_%25snapedit_1745679369605_%257527c056-93a8-4129-89a5-7b8ef2a82067.jpeg
232	232	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745717296867_img_%25CY2Ibxdr-360x480%20%281%29.jpg_%25fb6e58f4-091f-4f30-90bc-244fcc8fd5d8.jpeg
233	233	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761832825_img_%25rtyuiop%5B%3Blgttyuikl..jpg_%250fd480b3-f4d3-45df-bf70-a6102262e4b7.jpeg
234	234	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718378312_img_%25LK8lzQWE.-360x480%20%281%29.jpg_%2519e8d378-f698-481f-aafe-972a22d7d099.jpeg
235	235	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734352336_img_%25mz6lsU9v.-360x480%20%281%29.jpg_%254c1bfa7d-b42a-4b64-ba67-d31f0099fd63.jpeg
236	236	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728306500_img_%2581.jpg_%255114259e-03a3-47f1-91c9-cac7afbd9f16.jpeg
237	237	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761115478_img_%25edfgkjhyyj.jpg_%25ad296f82-48cc-48be-b181-9dc1b70dff66.jpeg
238	238	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759174391_img_%25ghdjskiurjer.jpg_%2562085939-3756-4643-a3db-0c3b22544bab.jpeg
239	239	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727762641_img_%25150.jpg_%250306c7ba-741c-45b5-9c35-5445411f2853.jpeg
240	240	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729047082_img_%2546.jpg_%25712e5f6e-8c47-442c-8ea4-f2f835195d6c.jpeg
241	241	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760941035_img_%25drtyuiknbvfyum.jpg_%2559123121-aa40-4ee9-ad36-f7372fd3b2f7.jpeg
242	242	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732811537_img_%25y90mMDVu-360x480%20%281%29.jpg_%25a7054ba2-ad58-43ea-9d14-445a33dbd3f7.jpeg
243	243	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745756860073_img_%25kPbuHarG.-360x480%20%281%29.jpg_%25722f6e90-cf36-4852-b6d5-001d1aa55004.jpeg
244	244	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727515414_img_%252.jpg_%25d5689cc6-d1ea-4ed3-a18e-f3299c050f26.jpeg
245	245	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734182230_img_%25j0KTThII.-360x480%20%281%29.jpg_%25f1df47f7-2e52-4796-980d-3b322d0f35cb.jpeg
246	246	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679541686_img_%25Screenshot%202025-04-26%20215720_%252d330f56-f2a4-4526-b1d5-2f9822ba3cde.png
247	247	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728922520_img_%25128.jpg_%25728d6795-9083-4b57-96e5-29ddde40ae38.jpeg
248	248	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759246523_img_%25120.jpg_%25ce1db31e-4573-4bf6-83a7-082526f02d03.jpeg
249	249	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759154043_img_%25hjkld%3Bx.%2Cmjhhujfcmnb.jpg_%257735b832-0128-4d80-8c07-caee25439a33.jpeg
250	250	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727358120_img_%25kamar-kost-sederhana-di-sarijadi-1690635730.jpg_%2560e56531-2bb4-4151-834d-e3f449067065.jpeg
251	251	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680819607_img_%25689d5353-fbb4-446e-9570-88fa41454d99_%256e61e6e0-25eb-405e-abfc-e17382ffb4a7.png
252	252	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762981149_img_%25108.jpg_%25751cc146-f828-42b3-b69b-973b7aefdda0.jpeg
253	253	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718778541_img_%251jk4bd6l-360x480%20%281%29.jpg_%256b47d1c2-0ed3-47ff-8073-96d0dee0b330.jpeg
254	254	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728454466_img_%25snapedit_1745074090053.jpg_%2528229045-8adf-4cad-8393-386919c62b15.jpeg
255	255	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727888263_img_%25kost-single-pasutri-dekat-rshs-1991331145.jpg_%25067bb67d-e8b6-414a-9fbc-39a58c1847fb.jpeg
256	256	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718378312_img_%25LK8lzQWE.-360x480%20%281%29.jpg_%2519e8d378-f698-481f-aafe-972a22d7d099.jpeg
257	257	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727438799_img_%2544.jpg_%254d333e28-4f9d-43f3-97a2-054b1b76c528.jpeg
258	258	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763866958_img_%25150.jpg_%25a91df04c-548a-4ba8-940b-ade4db55c0da.jpeg
259	259	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764277720_img_%25112.jpg_%25f54fe11f-fc8b-4cc6-b8a1-a9d9cc9b40ff.jpeg
260	260	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685509706_img_%25kS54hARW.-360x480%20%281%29.jpg_%25fd5a90e2-7f8c-4872-833d-6c8ccae9ab1b.jpeg
261	261	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682890813_img_%2553d3ff3c-704a-4dce-8e71-635bbe1fc74d_%25df0bae6c-ed4c-4401-99b9-c457b6c8d837.png
262	262	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731096381_img_%25mghtbrmK.-360x480%20%281%29.jpg_%25f15b1710-0129-4c05-8019-f3841496ee13.jpeg
263	263	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764174546_img_%25128.jpg_%25ef4a9a03-185b-4ba8-b162-5eba6fbdadc7.jpeg
264	264	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678157744_img_%25Screenshot%202025-04-26%20213757_%2584c66213-650b-4106-a6c7-469696b4dc9f.png
265	265	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745720124007_img_%25SbsOr3fP-360x480%20%282%29.jpg_%252cfa031b-62c4-4e7d-b308-93a995a034b8.jpeg
266	266	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759628773_img_%25hghdsjkalnhyhn.jpg_%25519cfdc7-c1b3-4c9c-a037-3e6931e1f357.jpeg
267	267	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680570759_img_%256def1e96-b1c0-42a0-81ac-3c1fc7453172_%256fc20f08-688d-4143-b1a5-ceda6c5a369b.png
268	268	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759022867_img_%25jhgddyfds.jpg_%25abc8f59e-4a4c-40f2-acf0-e9829fa0aea3.jpeg
269	269	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678823231_img_%25snapedit_1745678902292_%25e1e5f1fe-3737-458a-81d6-746c6b5a5a83.jpeg
270	270	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727785505_img_%2565.jpg_%252b69d7a8-132b-402c-b7b6-4f217b276c4d.jpeg
271	271	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728467754_img_%25135.jpg_%25d0761705-3a49-420b-9b49-0bd4b3b05277.jpeg
272	272	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732774866_img_%25LLK8g6fn-540x720%20%281%29.jpg_%25c4589194-2504-40bc-8842-e831a1655430.jpeg
273	273	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683105901_img_%25snapedit_1745683222626.jpg_%25ebaf2bac-e79a-4b91-a1d7-82df00888e44.jpeg
274	274	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716585099_img_%256mJGVQY3.-360x480%20%281%29.jpg_%25a9594356-c8ae-42e8-991b-ba8de0238c70.jpeg
275	275	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685509706_img_%25kS54hARW.-360x480%20%281%29.jpg_%25fd5a90e2-7f8c-4872-833d-6c8ccae9ab1b.jpeg
276	276	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764277720_img_%25112.jpg_%25f54fe11f-fc8b-4cc6-b8a1-a9d9cc9b40ff.jpeg
277	277	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758819059_img_%25djhfgygdusjkl.jpg_%25495655da-c75d-4852-b339-67e92e2df25a.jpeg
278	278	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762263788_img_%25fdedfghjkl%3B%27.jpg_%256a38a051-43ca-4e8d-b7e1-6688933346f4.jpeg
279	279	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763320568_img_%25kjhgsasrtyuio%3B.jpg_%25968c3949-a618-4604-8e55-4447d7a0acab.jpeg
280	280	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731603740_img_%25pFEvuFUJ-540x720%20%281%29.jpg_%256b35d504-5f8f-4692-a9d6-8edbbe88a017.jpeg
281	281	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679092107_img_%25snapedit_1745679166503_%25aec8215e-01fb-46d6-b779-1e9688e266e2.jpeg
282	282	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727088594_img_%25121.jpg_%25c78c9d5b-3d45-4025-9713-651472cc3168.jpeg
283	283	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727888263_img_%25kost-single-pasutri-dekat-rshs-1991331145.jpg_%25067bb67d-e8b6-414a-9fbc-39a58c1847fb.jpeg
284	284	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727953675_img_%2592.jpg_%25d860d2bf-1496-4c4d-9c11-dc8a6827cb8f.jpeg
285	285	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682434736_img_%25e37bc554-bf05-4744-a8b7-7d8cc986c5b9_%251d9b03f6-d62a-4ef5-8764-ab962ce49550.png
286	286	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728285635_img_%25142.jpg_%2552d06ad4-56f2-40ec-ab55-bef98003fd01.jpeg
287	287	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729951984_img_%25snapedit_1745113625993.jpg_%25b1b99062-e3b8-4444-9aed-563fb1498b95.jpeg
288	288	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735851884_img_%25N2J3XbhC-360x480%20%281%29.jpg_%2514b6546c-87e5-4944-b8ba-b9b187ae43b0.jpeg
289	289	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763391186_img_%2593.jpg_%251f831ced-1abd-4473-88f3-4ce46f239918.jpeg
290	290	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758846993_img_%25jduhygiub.jpg_%254b839e00-c794-4089-8bdc-7ce9ac368ded.jpeg
291	291	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685938309_img_%25vHtdq903-360x480%20%281%29.jpg_%259fb27409-68e8-4993-b52a-bb18498794ce.jpeg
292	292	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678381661_img_%25Screenshot%202025-04-26%20214141_%251a784534-5d7d-4fcd-9a3b-82326e106650.png
293	293	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763708892_img_%25iuyttyuill%2Cmnbg.jpg_%25943c3102-5676-4877-96ba-8bbd348167cb.jpeg
294	294	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728990218_img_%2548.jpg_%25af47d87d-01a2-470c-b92f-49098e73a986.jpeg
295	295	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763708892_img_%25iuyttyuill%2Cmnbg.jpg_%25943c3102-5676-4877-96ba-8bbd348167cb.jpeg
296	296	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733088709_img_%250d03LamJ.-360x480%20%281%29.jpg_%25d9c06a7c-da83-4b30-96b8-b579741737aa.jpeg
297	297	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763708892_img_%25iuyttyuill%2Cmnbg.jpg_%25943c3102-5676-4877-96ba-8bbd348167cb.jpeg
298	298	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729982310_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_53_26%20AM_%25d8ec3995-f975-443d-ae75-29d500700ad2.png
299	299	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734352336_img_%25mz6lsU9v.-360x480%20%281%29.jpg_%254c1bfa7d-b42a-4b64-ba67-d31f0099fd63.jpeg
300	300	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760228932_img_%25ertyuio%3Btr456uikmnbvf.jpg_%257b62bc38-2d1b-432f-a7fc-9d1fba19a1df.jpeg
301	301	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758637070_img_%25kost-177-kampus-maranatha-2007512025_x2.jpg_%259b067a1c-60e5-4114-99de-28408e5cdf28.jpeg
302	302	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763511981_img_%25ertyuiohg.jpg_%25c0c7c4e0-2fb8-491e-b4ce-824c008c995f.jpeg
303	303	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763729788_img_%25fghjkndtyui.jpg_%25f3cdb37d-354a-45bf-b950-f740a4dcd54c.jpeg
304	304	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679020171_img_%25snapedit_1745679019081_%2588ac7536-ccef-40c6-b766-bba7b57f020c.jpeg
305	305	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729348585_img_%25listing-1050644677_x2.jpg_%25c2044a03-a89b-43e3-b367-f4a7b5ba07a7.jpeg
306	306	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718074576_img_%25cBv86IP0-360x480%20%281%29.jpg_%25c30ce484-122f-4ee4-a582-3954ab65be4f.jpeg
307	307	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682434736_img_%25e37bc554-bf05-4744-a8b7-7d8cc986c5b9_%251d9b03f6-d62a-4ef5-8764-ab962ce49550.png
308	308	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679107377_img_%25snapedit_1745679199931_%25f580986b-00da-4319-b603-4cb6e273a350.jpeg
309	309	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736975053_img_%25zwoAXgnm.-540x720%20%281%29.jpg_%2504942a89-fbac-466f-b73f-5b8ad8653713.jpeg
310	310	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763011558_img_%25dfghjkjhgfdsasdfghjk.jpg_%25142d91dc-cb2d-4159-91ab-0d2d02fabf50.jpeg
311	311	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680041925_img_%25c0814739-e474-402c-b313-bbbd67287b01_%2593a24f6c-f7e0-4c02-81ed-b906a5adbbb0.png
312	312	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729756043_img_%25108.jpg_%25d5a96cde-8c6f-4101-9eeb-ced42775411f.jpeg
313	313	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732659112_img_%25UGZ4QnYc-360x480%20%281%29.jpg_%2526e358b0-bb2f-4a1f-8f03-56fde7831129.jpeg
314	314	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759022867_img_%25jhgddyfds.jpg_%25abc8f59e-4a4c-40f2-acf0-e9829fa0aea3.jpeg
315	315	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758573008_img_%25139.jpg_%259e6e470e-1481-4332-ae47-fb192511c798.jpeg
316	316	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718378312_img_%25LK8lzQWE.-360x480%20%281%29.jpg_%2519e8d378-f698-481f-aafe-972a22d7d099.jpeg
317	317	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715925946_img_%252Ia5MLG5-540x720%20%281%29.jpg_%25ad83ba65-b10d-45eb-bb1d-5ffca85a5788.jpeg
318	318	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728176224_img_%2566.jpg_%25d725ef00-386d-4772-8e2e-d4169f27fe24.jpeg
319	319	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727381679_img_%2595.jpg_%255f3118ed-cc8e-4145-ba5a-f3a052b3e33e.jpeg
320	320	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727298995_img_%2529.jpg_%25967549fa-7133-4e59-b347-941c2206aec5.jpeg
321	321	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727677337_img_%25snapedit_1745678963622_%2561750830-a6b0-4b80-8c4a-fc78df9ba183.jpeg
322	322	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762226020_img_%2573.jpg_%25de0d3d6c-52aa-482e-8151-00979549274d.jpeg
323	323	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735557569_img_%25lEjTxMk9-360x480%20%281%29.jpg_%2517d9900e-f3cb-43d2-a5e2-e1e5325ba600.jpeg
324	324	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729526220_img_%2577.jpg_%25f94687c5-f403-455c-911c-06affd544a91.jpeg
325	325	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761066268_img_%25asdtyknbvcghjk_%2558465148-a5ae-4eeb-9bb4-8ffe4684e0d5.jpeg
326	326	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758708796_img_%25fjhuidik.jpg_%255badd267-9d81-41a3-991e-ff5b04b62420.jpeg
327	327	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681468476_img_%25cbd40244-d779-43e4-a90d-714866b72df7_%25dee4641b-f196-4e72-a3c8-5869e6aaf6ee.png
328	328	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759691374_img_%25rftgyhuioplkjhgfdertyui.jpg_%25ba420d1b-11e3-468d-bf98-e27d430d6d0c.jpeg
329	329	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733805695_img_%25Ga5cdygH.-360x480%20%281%29.jpg_%25ba20666d-9716-4a32-aa23-dfb0cfbfac0e.jpeg
330	330	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680180690_img_%2529054191-f441-4695-bcdd-5c4dcef69467_%25b17528de-fa98-4c23-81e5-c743c667d350.png
331	331	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727966206_img_%25snapedit_1745072680356.jpg_%25b95ccb97-481f-40eb-9bd7-a4421d35c304.jpeg
332	332	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728669701_img_%25kosan-putri-bersih-nyaman-kamar-mandi-dalam-413169630.jpg_%258dc2ab93-8678-47e6-bf54-552911e1f8de.jpeg
333	333	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735449952_img_%25EgPUVk9I-360x480%20%281%29.jpg_%250255d7ca-76d9-48ae-9f2f-da5b887e5896.jpeg
334	334	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680732290_img_%25e33498e4-503d-478a-b0b3-3482c96aba08_%2538dc5527-d622-44ef-8c9b-21209f35b04f.png
335	335	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728511680_img_%25122.jpg_%251e518e57-91dc-4478-8cd4-6cf803e03a94.jpeg
336	336	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728467754_img_%25135.jpg_%25d0761705-3a49-420b-9b49-0bd4b3b05277.jpeg
337	337	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678315083_img_%25Screenshot%202025-04-26%20214032_%25ab9f8b3e-d712-4962-b1ea-649bcdf287e1.png
338	338	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728539978_img_%25175.jpg_%25383bd4b2-db6b-445f-a6de-33ec488184d7.jpeg
339	339	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718647636_img_%25Gboppgwi.-360x480%20%281%29.jpg_%2552a4fc73-9128-4b2c-916c-b39da41d4419.jpeg
340	340	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684968549_img_%259J1CJdyS.-540x720%20%281%29.jpg_%2550744963-47fe-4379-92f5-d86ad3dd2c61.jpeg
341	341	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745730678253_img_%25image_%2575c0cd6f-6496-4370-aabb-d6bacbde4512.png
342	342	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718378312_img_%25LK8lzQWE.-360x480%20%281%29.jpg_%2519e8d378-f698-481f-aafe-972a22d7d099.jpeg
343	343	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732774866_img_%25LLK8g6fn-540x720%20%281%29.jpg_%25c4589194-2504-40bc-8842-e831a1655430.jpeg
344	344	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685070991_img_%25yTeYv7Me-360x480%20%281%29.jpg_%259d303dec-9267-4ba8-ac11-6bceb5495b77.jpeg
345	345	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732319224_img_%25LqFmeGrO-360x480%20%281%29.jpg_%25a0ba45c5-6bf7-486c-ad8a-117528c14612.jpeg
346	346	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728554935_img_%25158.jpg_%25ad3b1d51-3831-4b37-8592-7097ab522494.jpeg
347	347	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735429456_img_%25SIKsYa4l-540x720%20%281%29.jpg_%25971ed692-c264-4feb-992d-f7255ea4282f.jpeg
348	348	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727941398_img_%25snapedit_1745130203029.jpg_%2578534c86-3676-4122-94c8-d95837da293f.jpeg
349	349	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760254516_img_%25gfdsdfghjkl%3Bliu7y.jpg_%25385f01ad-ede4-4298-bfd1-b3f58eed977a.jpeg
350	350	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758455075_img_%25ojhgfdfghjkknbvdrtyh.jpg_%25851a0022-3ec1-4556-8283-938672683f20.jpeg
351	351	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727358120_img_%25kamar-kost-sederhana-di-sarijadi-1690635730.jpg_%2560e56531-2bb4-4151-834d-e3f449067065.jpeg
352	352	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745686067034_img_%25UMKHuUrU-540x720%20%281%29.jpg_%2572b05370-8af2-48a2-af95-ad9966f405fa.jpeg
353	353	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680732290_img_%25e33498e4-503d-478a-b0b3-3482c96aba08_%2538dc5527-d622-44ef-8c9b-21209f35b04f.png
354	354	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728780067_img_%25th%20%283%29.jpg_%25a7e61902-5412-42e8-bbca-291f6688d8e0.jpeg
355	355	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763433136_img_%25fghjkl%3B%2Cmhyh.jpg_%254048d80f-7102-45ba-9b5f-4127cfcfbeaf.jpeg
356	356	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727695489_img_%25177.jpg_%2515bdebd2-25a3-4696-abe8-b29323fdd290.jpeg
357	357	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681313339_img_%257126d1d0-fb6a-4625-baea-1bda44eae814_%25abd09186-0d8d-4784-aaa7-61676f3f82ad.png
358	358	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682434736_img_%25e37bc554-bf05-4744-a8b7-7d8cc986c5b9_%251d9b03f6-d62a-4ef5-8764-ab962ce49550.png
359	359	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715925946_img_%252Ia5MLG5-540x720%20%281%29.jpg_%25ad83ba65-b10d-45eb-bb1d-5ffca85a5788.jpeg
360	360	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734194486_img_%25ak9vqx9I-360x480%20%281%29.jpg_%250ddbcb94-3636-4c1c-a345-df06c6701e9e.jpeg
361	361	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764055275_img_%25listing-695252655_x2.jpg_%2558a18a5c-2f74-40a1-9f5b-2c2862c2df38.jpeg
362	362	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716585099_img_%256mJGVQY3.-360x480%20%281%29.jpg_%25a9594356-c8ae-42e8-991b-ba8de0238c70.jpeg
363	363	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759154043_img_%25hjkld%3Bx.%2Cmjhhujfcmnb.jpg_%257735b832-0128-4d80-8c07-caee25439a33.jpeg
364	364	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728693152_img_%25115.jpg_%252087e4f2-e4bc-46fe-abcd-2e7a79e7d328.jpeg
365	365	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757792608_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_54_43%20AM_%2519654814-06a2-434c-915c-1a964c39cf18.png
366	366	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727114297_img_%25135.jpg_%2516489423-f14d-4658-941b-d1a94e34ef75.jpeg
367	367	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673093962_img_%25snapedit_1744430404114.jpg_%25a1654de6-c86e-46d2-9b49-e6440e3d0682.jpeg
368	368	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727797412_img_%2536.jpg_%25d2d5a4e9-f632-4fc8-bbe3-cd10eecfe842.jpeg
369	369	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678128970_img_%25Screenshot%202025-04-26%20213728_%258b6eb7f2-40e3-43fa-95f3-7647eb931c18.png
370	370	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729982310_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_53_26%20AM_%25d8ec3995-f975-443d-ae75-29d500700ad2.png
371	371	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732659112_img_%25UGZ4QnYc-360x480%20%281%29.jpg_%2526e358b0-bb2f-4a1f-8f03-56fde7831129.jpeg
372	372	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728176224_img_%2566.jpg_%25d725ef00-386d-4772-8e2e-d4169f27fe24.jpeg
373	373	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678381661_img_%25Screenshot%202025-04-26%20214141_%251a784534-5d7d-4fcd-9a3b-82326e106650.png
374	374	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678864756_img_%25snapedit_1745678963622_%2531874df6-43c5-4971-8dfa-ece23615fea3.jpeg
375	375	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729219793_img_%2571.jpg_%259834bf28-4951-4e59-83dd-929ec51a9e07.jpeg
376	376	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681537933_img_%254252f922-9c83-4148-96eb-a6971826719d_%25acdf0884-f621-4763-9976-8f4653a5baf5.png
377	377	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673477147_img_%25Screenshot%202025-04-19%20204659_%25efa4ad3a-856e-4be0-9944-e582197dd4dd.png
378	378	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763511981_img_%25ertyuiohg.jpg_%25c0c7c4e0-2fb8-491e-b4ce-824c008c995f.jpeg
379	379	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685252160_img_%25kS54hARW.-360x480%20%281%29.jpg_%25b7a6913c-fbbb-4f2b-a845-b1c1e1dd610b.jpeg
380	380	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728213249_img_%2526.jpg_%259ed4d6fe-0e34-4715-9690-cb6ed65ab66c.jpeg
381	381	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684577560_img_%25UGZ4QnYc-360x480%20%281%29.jpg_%2593894c78-1722-4bd3-979a-71eb761a507c.jpeg
382	382	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728229986_img_%25129.jpg_%258bcaecd3-33c7-45ab-80f6-af309fd59b79.jpeg
383	383	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716992588_img_%25L0A34vUg.-540x720%20%281%29.jpg_%251a73318a-05df-4366-ae73-96a6d1ef831c.jpeg
384	384	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734194486_img_%25ak9vqx9I-360x480%20%281%29.jpg_%250ddbcb94-3636-4c1c-a345-df06c6701e9e.jpeg
385	385	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728405426_img_%25snapedit_1745678755398_%2518346031-7d08-46d2-9441-f2f94c233586.jpeg
386	386	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760773648_img_%25saaertyujgyuj.jpg_%258f8fb433-b22f-4b54-b35a-0ae58f0da9c3.jpeg
387	387	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679393757_img_%25snapedit_1745679463783_%256866fa1c-e3ab-43a1-98bb-eb1f567289d6.jpeg
388	388	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728467754_img_%25135.jpg_%25d0761705-3a49-420b-9b49-0bd4b3b05277.jpeg
389	389	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684577560_img_%25UGZ4QnYc-360x480%20%281%29.jpg_%2593894c78-1722-4bd3-979a-71eb761a507c.jpeg
390	390	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734194486_img_%25ak9vqx9I-360x480%20%281%29.jpg_%250ddbcb94-3636-4c1c-a345-df06c6701e9e.jpeg
391	391	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679205031_img_%25snapedit_1745679302560_%25da055c70-f204-4f37-a86a-61f612bab7b0.jpeg
392	392	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682479387_img_%25a640492f-d21d-45af-89d1-30322b35e88e_%2558278f7f-1484-48cb-9c9c-3821cab4d19a.png
393	393	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733586985_img_%250Ih6ZU0h.-360x480%20%281%29.jpg_%2536905939-fa57-4533-b5da-a13a069495b0.jpeg
394	394	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680459552_img_%25ad655755-9d21-46b6-9c1d-9a201d99ece4_%25880b8af8-8090-4d62-be37-c228b71b230c.png
395	395	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716585099_img_%256mJGVQY3.-360x480%20%281%29.jpg_%25a9594356-c8ae-42e8-991b-ba8de0238c70.jpeg
396	396	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682479387_img_%25a640492f-d21d-45af-89d1-30322b35e88e_%2558278f7f-1484-48cb-9c9c-3821cab4d19a.png
397	397	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682890813_img_%2553d3ff3c-704a-4dce-8e71-635bbe1fc74d_%25df0bae6c-ed4c-4401-99b9-c457b6c8d837.png
398	398	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761861056_img_%25uytrewertyuilknbfertyu.jpg_%25d57e6999-4156-4df2-9ae4-1445bd199d32.jpeg
399	399	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678409163_img_%25Screenshot%202025-04-26%20214214_%2548c302dc-2da5-40ef-90ad-94cef68f9e4a.png
400	400	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727088594_img_%25121.jpg_%25c78c9d5b-3d45-4025-9713-651472cc3168.jpeg
401	401	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729951984_img_%25snapedit_1745113625993.jpg_%25b1b99062-e3b8-4444-9aed-563fb1498b95.jpeg
402	402	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728145437_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2001_04_11%20PM_%25122d327b-9e69-4ac1-9089-d7310b21a5c8.png
403	403	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762777631_img_%25fdfghjk%2Cmjujm%2C.jpg_%2523d8aec1-b07b-4ad4-80f9-101b9f39d9ea.jpeg
404	404	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735981243_img_%25CY2Ibxdr-360x480%20%281%29.jpg_%2558d65d77-1ef7-42df-b85d-e5bff9028391.jpeg
405	405	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764207919_img_%2584.jpg_%25b91e28d7-6cd0-4b63-bec7-f4210aa8a4cc.jpeg
406	406	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679092107_img_%25snapedit_1745679166503_%25aec8215e-01fb-46d6-b779-1e9688e266e2.jpeg
407	407	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715385903_img_%2534sb8qQd-360x480%20%281%29.jpg_%2567fad1d9-57ad-4e7d-b520-7c9156aadd6d.jpeg
408	408	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727298995_img_%2529.jpg_%25967549fa-7133-4e59-b347-941c2206aec5.jpeg
409	409	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728243199_img_%25108.jpg_%255f0e2c44-4aae-4828-af84-6300d499c9f7.jpeg
410	410	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727634158_img_%25170.jpg_%252f79a39d-3399-4198-93d7-b6802fc0055e.jpeg
411	411	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678616107_img_%25snapedit_1745678704137_%253b44af88-3770-4adb-9edb-cf10d3fff632.jpeg
412	412	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731603740_img_%25pFEvuFUJ-540x720%20%281%29.jpg_%256b35d504-5f8f-4692-a9d6-8edbbe88a017.jpeg
413	413	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760827068_img_%25asjkmuung.jpg_%255003a6ae-1a6e-4b5f-ac41-032d6a25e64e.jpeg
414	414	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727438799_img_%2544.jpg_%254d333e28-4f9d-43f3-97a2-054b1b76c528.jpeg
415	415	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745737012502_img_%25SRbiAxcW-540x720%20%281%29.jpg_%257e7af819-5ee1-484f-bef8-00ca34040593.jpeg
416	416	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732811537_img_%25y90mMDVu-360x480%20%281%29.jpg_%25a7054ba2-ad58-43ea-9d14-445a33dbd3f7.jpeg
417	417	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759067736_img_%2555.jpg_%2516174d15-2816-48c5-afd3-8a19a7b83a8a.jpeg
418	418	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679930168_img_%25578113ce-7cdb-40fd-ada8-1e18a4ae80fd_%2596689d6b-6402-4f38-bb61-5c5249d9da2c.png
419	419	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729824346_img_%2519.jpg_%25d4d13de0-5eb3-483d-a7b7-f15b334304ca.jpeg
420	420	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727825244_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2001_52_17%20PM_%258cbe8abf-0533-4fe4-b3aa-3c117ad64c88.png
421	421	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681564185_img_%250fc482ca-3600-45fb-9b4d-b26d77f5441a_%25321118c7-620c-4b25-96fa-120591bafd08.png
422	422	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757737981_img_%25iMdx77Jg-540x720%20%281%29.jpg_%2511029320-f204-4609-a904-9962d31fe6cf.jpeg
423	423	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733088709_img_%250d03LamJ.-360x480%20%281%29.jpg_%25d9c06a7c-da83-4b30-96b8-b579741737aa.jpeg
424	424	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716585099_img_%256mJGVQY3.-360x480%20%281%29.jpg_%25a9594356-c8ae-42e8-991b-ba8de0238c70.jpeg
425	425	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729017987_img_%251-1707797865-Kos---Kosan-Pondok-Indah-Kamar-Mandi-Dalam-Fasilitas-Lengkap---Jakarta.jpg_%257da6e7d5-499c-49e7-9cf7-64f44b82011e.jpeg
426	426	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762981149_img_%25108.jpg_%25751cc146-f828-42b3-b69b-973b7aefdda0.jpeg
427	427	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681468476_img_%25cbd40244-d779-43e4-a90d-714866b72df7_%25dee4641b-f196-4e72-a3c8-5869e6aaf6ee.png
428	428	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733626535_img_%257f1UJo0i-540x720%20%281%29.jpg_%257ec84995-108e-4f44-a34e-cd5a8675ce4f.jpeg
429	429	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745730000800_img_%2554.jpg_%2518801688-2ce4-41cf-9ed0-bed56642f653.jpeg
430	430	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763350713_img_%25578113ce-7cdb-40fd-ada8-1e18a4ae80fd_%25ea4c8227-c7b1-4c52-964a-b5cb0d1c62e9.png
431	431	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728780067_img_%25th%20%283%29.jpg_%25a7e61902-5412-42e8-bbca-291f6688d8e0.jpeg
432	432	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682522231_img_%25ChatGPT%20Image%20Apr%2026%2C%202025%2C%2010_50_34%20PM_%2599cea16c-ad57-44d3-8bb3-baf03124b3dc.png
433	433	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764141211_img_%25poigfddfghjkl%3B.jpg_%254bba9966-fcb6-4108-ba16-82d4d02d6f67.jpeg
434	434	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727438799_img_%2544.jpg_%254d333e28-4f9d-43f3-97a2-054b1b76c528.jpeg
435	435	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728636618_img_%2586.jpg_%255cea607e-9212-493c-b44c-e069a38e0f3d.jpeg
436	436	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732305766_img_%25uQGpJmxf.-540x720%20%281%29.jpg_%258a4c052a-21c8-4e64-855f-650df7e4d86a.jpeg
437	437	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680216580_img_%251caf50ee-43a7-4924-9843-3c5cf3d7bed9_%25e77bca21-2d53-497a-bba5-a11fa065fde6.png
438	438	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762263788_img_%25fdedfghjkl%3B%27.jpg_%256a38a051-43ca-4e8d-b7e1-6688933346f4.jpeg
439	439	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759067736_img_%2555.jpg_%2516174d15-2816-48c5-afd3-8a19a7b83a8a.jpeg
440	440	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678381661_img_%25Screenshot%202025-04-26%20214141_%251a784534-5d7d-4fcd-9a3b-82326e106650.png
441	441	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716565649_img_%25Qjyu5aSW-360x480%20%281%29.jpg_%251ed9aa05-1380-41f7-a2ff-d9e6e8361308.jpeg
442	442	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745333029567_img_%25image272_%25e99d9370-6ade-4c84-aa42-bf436f5df2b5.png
443	443	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763866958_img_%25150.jpg_%25a91df04c-548a-4ba8-940b-ade4db55c0da.jpeg
444	444	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681434379_img_%25bb9e2d9b-ae45-46f4-9a41-e49c79720cbd_%2583904b56-ca2a-4e93-8cdd-7d66ddfd9584.png
445	445	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682522231_img_%25ChatGPT%20Image%20Apr%2026%2C%202025%2C%2010_50_34%20PM_%2599cea16c-ad57-44d3-8bb3-baf03124b3dc.png
446	446	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728345784_img_%2582.jpg_%25f7d34100-492c-476c-b58d-6f9edd82f778.jpeg
447	447	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763511981_img_%25ertyuiohg.jpg_%25c0c7c4e0-2fb8-491e-b4ce-824c008c995f.jpeg
448	448	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680538899_img_%2503532d15-cacd-49ce-afbf-1ce01e488c19_%256b0ae54e-9573-4dcf-a1f6-59878765ae0b.png
449	449	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716992588_img_%25L0A34vUg.-540x720%20%281%29.jpg_%251a73318a-05df-4366-ae73-96a6d1ef831c.jpeg
450	450	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758573008_img_%25139.jpg_%259e6e470e-1481-4332-ae47-fb192511c798.jpeg
451	451	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729182596_img_%2557.jpg_%257ab335a9-f899-4d7f-aa8a-ad83d3dfae8b.jpeg
452	452	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727215020_img_%25125.jpg_%2550b98efe-e742-4047-bcb0-d7106bc0d48d.jpeg
453	453	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734203799_img_%25eFkpV7nQ.-360x480%20%281%29.jpg_%2513c04796-f20b-44e9-a9f0-a763df13e030.jpeg
454	454	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745756860073_img_%25kPbuHarG.-360x480%20%281%29.jpg_%25722f6e90-cf36-4852-b6d5-001d1aa55004.jpeg
455	455	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764321996_img_%25snapedit_1745131091135.jpg_%25c6a8f9d5-6dbe-4e16-aacd-483edd284682.jpeg
456	456	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672509397_img_%25Screenshot%202025-04-06%20203755_%258b552dc8-325c-467b-84e9-e7a9517907b9.png
457	457	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760467796_img_%25dcvbhjujm%2Ckjyt.jpg_%25edc5f060-3253-44ce-a6fd-f2fe4ea43ba3.jpeg
458	458	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685252160_img_%25kS54hARW.-360x480%20%281%29.jpg_%25b7a6913c-fbbb-4f2b-a845-b1c1e1dd610b.jpeg
459	459	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680732290_img_%25e33498e4-503d-478a-b0b3-3482c96aba08_%2538dc5527-d622-44ef-8c9b-21209f35b04f.png
460	460	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761877697_img_%25gfdsdfghjkl%3B.jpg_%25573c0bae-89dc-46d9-9c2c-195fe7d1b56f.jpeg
461	461	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731679840_img_%257CGMuJSd.-540x720%20%281%29.jpg_%259a92ded4-fe10-4c61-8cdb-75ccc2856abd.jpeg
462	462	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727088594_img_%25121.jpg_%25c78c9d5b-3d45-4025-9713-651472cc3168.jpeg
463	463	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731300949_img_%25Md5uRUQl.-360x480%20%281%29.jpg_%2577b775bd-9d54-4b3f-a1ee-484bc5eacd19.jpeg
464	464	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680139839_img_%25bb3906d4-48dc-4e25-8b90-0cded2678b9c_%254acfa5d8-aa67-4338-a9f5-69ca49e365d7.png
465	465	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727888263_img_%25kost-single-pasutri-dekat-rshs-1991331145.jpg_%25067bb67d-e8b6-414a-9fbc-39a58c1847fb.jpeg
466	466	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727183248_img_%25snapedit_1745131091135.jpg_%2559ef0395-e4bd-44b7-a667-965a3f887d8b.jpeg
467	467	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681537933_img_%254252f922-9c83-4148-96eb-a6971826719d_%25acdf0884-f621-4763-9976-8f4653a5baf5.png
468	468	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735795179_img_%25gPO22UDz-540x720%20%281%29.jpg_%2526aff4bc-3840-43f8-b869-71ede648c6cf.jpeg
469	469	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762226020_img_%2573.jpg_%25de0d3d6c-52aa-482e-8151-00979549274d.jpeg
470	470	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733088709_img_%250d03LamJ.-360x480%20%281%29.jpg_%25d9c06a7c-da83-4b30-96b8-b579741737aa.jpeg
471	471	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685938309_img_%25vHtdq903-360x480%20%281%29.jpg_%259fb27409-68e8-4993-b52a-bb18498794ce.jpeg
472	472	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727785505_img_%2565.jpg_%252b69d7a8-132b-402c-b7b6-4f217b276c4d.jpeg
473	473	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727634158_img_%25170.jpg_%252f79a39d-3399-4198-93d7-b6802fc0055e.jpeg
474	474	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678099193_img_%25Screenshot%202025-04-26%20213700_%253d3be882-f266-426d-97d4-59c2d9cd4d5d.png
475	475	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682930714_img_%25dc3fedf6-aa13-47d1-b613-2527a9b8ff10_%256a195dc9-20d6-49f2-9c68-8c34427cfbc7.png
476	476	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760123101_img_%25zxfcghjklkjhytr5rtghbn.jpg_%252ea6b919-7d1d-4edf-a80e-d73371cd2482.jpeg
477	477	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685848553_img_%25oOkKsoSE.-360x480.jpg_%25e117116e-e2a5-48d4-ac56-e63f5e509985.jpeg
478	478	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763708892_img_%25iuyttyuill%2Cmnbg.jpg_%25943c3102-5676-4877-96ba-8bbd348167cb.jpeg
479	479	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735449952_img_%25EgPUVk9I-360x480%20%281%29.jpg_%250255d7ca-76d9-48ae-9f2f-da5b887e5896.jpeg
480	480	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736875951_img_%25W6PsjaKM.-540x720%20%281%29.jpg_%25b6100d11-aa03-489c-be0f-640ad656a42b.jpeg
481	481	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672932541_img_%25TrzFpYLc-540x720.jpg_%251de2acc2-0643-4118-9d6f-9ed1a5066247.jpeg
482	482	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719417864_img_%254h9SuWWN-360x480%20%281%29.jpg_%2537e18faa-7cee-475b-bfc7-1868073fba5a.jpeg
483	483	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727888263_img_%25kost-single-pasutri-dekat-rshs-1991331145.jpg_%25067bb67d-e8b6-414a-9fbc-39a58c1847fb.jpeg
484	484	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678409163_img_%25Screenshot%202025-04-26%20214214_%2548c302dc-2da5-40ef-90ad-94cef68f9e4a.png
485	485	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719979800_img_%25zyAyGSwH-540x720%20%281%29.jpg_%255c21565a-ee0a-49bf-b34d-0f9cc26e6f80.jpeg
486	486	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763041044_img_%25ftyuiop%3B%2Cnbgttyk.jpg_%25f306bb7a-6652-4321-bf61-e6ab4da274b2.jpeg
487	487	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760447215_img_%25dfghjkl%3Blkjhgfrtyu.jpg_%256466424b-52af-41e6-b39d-9b7831011fd5.jpeg
488	488	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727381679_img_%2595.jpg_%255f3118ed-cc8e-4145-ba5a-f3a052b3e33e.jpeg
489	489	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681537933_img_%254252f922-9c83-4148-96eb-a6971826719d_%25acdf0884-f621-4763-9976-8f4653a5baf5.png
490	490	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682720112_img_%25e1580e5e-3a5a-4565-b496-e8871451b610_%251f5a1fbb-2b7d-4eab-852e-2f54547e7240.png
491	491	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728266544_img_%25123.jpg_%25c15f6517-16dd-415f-b83d-962e9276e61c.jpeg
492	492	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727677337_img_%25snapedit_1745678963622_%2561750830-a6b0-4b80-8c4a-fc78df9ba183.jpeg
493	493	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728009721_img_%25167.jpg_%256badf91e-8fb6-425b-a4d8-183a03df7b3b.jpeg
494	494	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729348585_img_%25listing-1050644677_x2.jpg_%25c2044a03-a89b-43e3-b367-f4a7b5ba07a7.jpeg
495	495	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760467796_img_%25dcvbhjujm%2Ckjyt.jpg_%25edc5f060-3253-44ce-a6fd-f2fe4ea43ba3.jpeg
496	496	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685786901_img_%2510KrrycH.-360x480%20%281%29.jpg_%257170e84a-78ae-4a0c-a01d-12354d5fa260.jpeg
497	497	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733171840_img_%2567HNZudS.-360x480%20%281%29.jpg_%25c07b3727-8bb3-4384-8de5-a2c5e633ebb6.jpeg
498	498	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673747233_img_%25snapedit_1745075820870.jpg_%256f60486e-f05c-4aa4-9e9d-102c7a3e6931.jpeg
499	499	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727314678_img_%25kost-batununggal-dekat-kampus-telkom-elok-hou-1658590576_x2.jpg_%25b8f0c3f7-abc8-457c-b67e-f0f9137c82ab.jpeg
500	500	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728805308_img_%2532.jpg_%257c8f26df-1ed4-43bd-9505-50b8013fe7ea.jpeg
501	501	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727381679_img_%2595.jpg_%255f3118ed-cc8e-4145-ba5a-f3a052b3e33e.jpeg
502	502	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727888263_img_%25kost-single-pasutri-dekat-rshs-1991331145.jpg_%25067bb67d-e8b6-414a-9fbc-39a58c1847fb.jpeg
503	503	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718074576_img_%25cBv86IP0-360x480%20%281%29.jpg_%25c30ce484-122f-4ee4-a582-3954ab65be4f.jpeg
504	504	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727030759_img_%25119.jpg_%25ecf30237-0e1c-4ae7-bf68-648df07206af.jpeg
505	505	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679930168_img_%25578113ce-7cdb-40fd-ada8-1e18a4ae80fd_%2596689d6b-6402-4f38-bb61-5c5249d9da2c.png
506	506	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684000011_img_%25Md5uRUQl.-360x480%20%281%29.jpg_%2544bff415-d0cd-4e81-a5b3-8a495a363c25.jpeg
507	507	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757887548_img_%25102.jpg_%258e947b25-39b8-44ad-98dd-24d876b083c9.jpeg
508	508	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680216580_img_%251caf50ee-43a7-4924-9843-3c5cf3d7bed9_%25e77bca21-2d53-497a-bba5-a11fa065fde6.png
509	509	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731648162_img_%25r2PejhrT-540x720%20%281%29.jpg_%25bf580f22-74b0-4c51-8cd7-337777db9cf9.jpeg
510	510	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680216580_img_%251caf50ee-43a7-4924-9843-3c5cf3d7bed9_%25e77bca21-2d53-497a-bba5-a11fa065fde6.png
511	511	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681468476_img_%25cbd40244-d779-43e4-a90d-714866b72df7_%25dee4641b-f196-4e72-a3c8-5869e6aaf6ee.png
512	512	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728213249_img_%2526.jpg_%259ed4d6fe-0e34-4715-9690-cb6ed65ab66c.jpeg
513	513	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672745966_img_%25Screenshot%202025-04-06%20205753_%25ad125b46-400f-41b3-aad3-59171ab395b5.png
514	514	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679205031_img_%25snapedit_1745679302560_%25da055c70-f204-4f37-a86a-61f612bab7b0.jpeg
515	515	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734740043_img_%25Wxx1KCKW-360x480%20%281%29.jpg_%251c0a5f9b-6841-4fbd-8ae4-92a5c50ed68c.jpeg
516	516	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727966206_img_%25snapedit_1745072680356.jpg_%25b95ccb97-481f-40eb-9bd7-a4421d35c304.jpeg
517	517	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733088709_img_%250d03LamJ.-360x480%20%281%29.jpg_%25d9c06a7c-da83-4b30-96b8-b579741737aa.jpeg
518	518	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727183248_img_%25snapedit_1745131091135.jpg_%2559ef0395-e4bd-44b7-a667-965a3f887d8b.jpeg
519	519	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680459552_img_%25ad655755-9d21-46b6-9c1d-9a201d99ece4_%25880b8af8-8090-4d62-be37-c228b71b230c.png
520	520	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729860351_img_%254.jpg_%25c66d494c-f077-4307-9b28-1f6c7e2c82bf.jpeg
521	521	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680681219_img_%256fa6037f-a996-46f0-b8bb-536b8bdd900c_%25dc786d28-f9f0-44c2-8334-39816776f0dd.png
522	522	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727953675_img_%2592.jpg_%25d860d2bf-1496-4c4d-9c11-dc8a6827cb8f.jpeg
523	523	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728717167_img_%2553.jpg_%25e3332456-da8e-4fad-827c-d9ec9553b747.jpeg
524	524	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716224367_img_%257CGMuJSd.-540x720%20%281%29.jpg_%2594d21f4d-0b27-45d4-9e06-ac81b84b7063.jpeg
525	525	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679541686_img_%25Screenshot%202025-04-26%20215720_%252d330f56-f2a4-4526-b1d5-2f9822ba3cde.png
526	526	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672745966_img_%25Screenshot%202025-04-06%20205753_%25ad125b46-400f-41b3-aad3-59171ab395b5.png
527	527	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680681219_img_%256fa6037f-a996-46f0-b8bb-536b8bdd900c_%25dc786d28-f9f0-44c2-8334-39816776f0dd.png
528	528	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760123101_img_%25zxfcghjklkjhytr5rtghbn.jpg_%252ea6b919-7d1d-4edf-a80e-d73371cd2482.jpeg
529	529	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761786817_img_%25drftyujknbvdrtyukmnb.jpg_%255b665f3a-7423-4e92-b656-3a9be8a391c9.jpeg
530	530	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745737012502_img_%25SRbiAxcW-540x720%20%281%29.jpg_%257e7af819-5ee1-484f-bef8-00ca34040593.jpeg
531	531	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727252047_img_%25110.jpg_%255bc629ef-a4a0-4a13-983b-a12ec6d7ddf9.jpeg
532	532	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735608082_img_%25QRogM6u8-540x720%20%281%29.jpg_%252755c245-2897-492a-8b63-b14b20753eea.jpeg
533	533	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745720185130_img_%25Xb4voPbN.-360x480%20%281%29.jpg_%25ff0cbbd5-8ef5-4dd6-b8de-86622f6a4575.jpeg
534	534	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733122447_img_%25dhO7Ok9S-360x480%20%281%29.jpg_%2504588440-78c1-4b6d-8a9b-9c2a5189db1c.jpeg
535	535	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728483122_img_%25164.jpg_%25070a5ad2-4d63-434e-b091-a5f3dc386205.jpeg
536	536	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762226020_img_%2573.jpg_%25de0d3d6c-52aa-482e-8151-00979549274d.jpeg
537	537	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735608082_img_%25QRogM6u8-540x720%20%281%29.jpg_%252755c245-2897-492a-8b63-b14b20753eea.jpeg
538	538	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727438799_img_%2544.jpg_%254d333e28-4f9d-43f3-97a2-054b1b76c528.jpeg
539	539	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680139839_img_%25bb3906d4-48dc-4e25-8b90-0cded2678b9c_%254acfa5d8-aa67-4338-a9f5-69ca49e365d7.png
540	540	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728922520_img_%25128.jpg_%25728d6795-9083-4b57-96e5-29ddde40ae38.jpeg
541	541	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761897621_img_%25edfghjkl%3B.jpg_%255e9bfb9e-8142-4385-b13f-166b4c25f44c.jpeg
542	542	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718920525_img_%25wFTD5sY4-540x720%20%281%29.jpg_%251fd8caad-1fb6-4d1e-ac9e-37edaa98ae29.jpeg
543	543	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764124715_img_%25kjhgfdsdfghjkl%2Cmnb.jpg_%25e71e274b-8a31-4512-9755-887040b76690.jpeg
544	544	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762743442_img_%25dfyuil%2Cbfjkl.jpg_%2583b4ef41-966b-424e-b323-04def7fcc8f8.jpeg
545	545	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685374118_img_%25Yo43gYjW-360x480%20%281%29.jpg_%25486892a9-1123-41a1-896e-51a16b0f5f04.jpeg
546	546	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679205031_img_%25snapedit_1745679302560_%25da055c70-f204-4f37-a86a-61f612bab7b0.jpeg
547	547	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678616107_img_%25snapedit_1745678704137_%253b44af88-3770-4adb-9edb-cf10d3fff632.jpeg
548	548	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735429456_img_%25SIKsYa4l-540x720%20%281%29.jpg_%25971ed692-c264-4feb-992d-f7255ea4282f.jpeg
549	549	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682720112_img_%25e1580e5e-3a5a-4565-b496-e8871451b610_%251f5a1fbb-2b7d-4eab-852e-2f54547e7240.png
550	550	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761091720_img_%25gfdsertyuikhgffv_%25e7556433-9af5-4d48-8095-180a617700dc.jpeg
551	551	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728483122_img_%25164.jpg_%25070a5ad2-4d63-434e-b091-a5f3dc386205.jpeg
552	552	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729235610_img_%25166.jpg_%25c223e8aa-07c8-41a3-82ca-e7b05bd49fcd.jpeg
553	553	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761550369_img_%2515076492821725343708.jpg_%25b3a7d374-4322-4e4a-8eb4-2b4e28f063cc.jpeg
554	554	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745717296867_img_%25CY2Ibxdr-360x480%20%281%29.jpg_%25fb6e58f4-091f-4f30-90bc-244fcc8fd5d8.jpeg
555	555	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685374118_img_%25Yo43gYjW-360x480%20%281%29.jpg_%25486892a9-1123-41a1-896e-51a16b0f5f04.jpeg
556	556	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727515414_img_%252.jpg_%25d5689cc6-d1ea-4ed3-a18e-f3299c050f26.jpeg
557	557	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736975053_img_%25zwoAXgnm.-540x720%20%281%29.jpg_%2504942a89-fbac-466f-b73f-5b8ad8653713.jpeg
558	558	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762777631_img_%25fdfghjk%2Cmjujm%2C.jpg_%2523d8aec1-b07b-4ad4-80f9-101b9f39d9ea.jpeg
559	559	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758573008_img_%25139.jpg_%259e6e470e-1481-4332-ae47-fb192511c798.jpeg
560	560	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680245021_img_%253f111ca1-8b5f-42d7-ba0c-28d30f857427_%2565d3b37a-7c2e-497a-af1f-957571462201.png
561	561	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734352336_img_%25mz6lsU9v.-360x480%20%281%29.jpg_%254c1bfa7d-b42a-4b64-ba67-d31f0099fd63.jpeg
562	562	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759022867_img_%25jhgddyfds.jpg_%25abc8f59e-4a4c-40f2-acf0-e9829fa0aea3.jpeg
563	563	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757792608_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_54_43%20AM_%2519654814-06a2-434c-915c-1a964c39cf18.png
564	564	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758573008_img_%25139.jpg_%259e6e470e-1481-4332-ae47-fb192511c798.jpeg
565	565	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679406469_img_%25snapedit_1745679481327_%25887f0656-94b4-462d-b73f-a217abc4b32a.jpeg
566	566	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719212284_img_%25lw6ZQnHS-360x480%20%281%29.jpg_%25a463fb5c-bf29-465b-a753-a2b362232e16.jpeg
567	567	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678738593_img_%25snapedit_1745678801885_%259e6c25b0-900c-427a-a032-4624b8ce7d17.jpeg
568	568	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761927465_img_%25drftyujknbvdrtyukmnb.jpg_%2528c34f59-c999-47ed-9890-f8441efdf780.jpeg
569	569	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735429456_img_%25SIKsYa4l-540x720%20%281%29.jpg_%25971ed692-c264-4feb-992d-f7255ea4282f.jpeg
570	570	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729277065_img_%259.jpg_%2563397922-4bc5-4d3e-88e3-ca63959741e3.jpeg
571	571	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728285635_img_%25142.jpg_%2552d06ad4-56f2-40ec-ab55-bef98003fd01.jpeg
572	572	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729934426_img_%25snapedit_1745130203029.jpg_%257e55fb16-ff1a-474a-a730-7404e5548061.jpeg
573	573	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682688393_img_%2508fc5c3c-80fe-4674-84bb-39cf20a8aa98_%25db58122d-7669-4b38-9452-f7291797e9dc.png
574	574	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729896734_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_25_42%20AM_%2535847739-2677-4c44-9eaa-9b4b762eb008.png
575	575	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685614379_img_%25KM9ZoFNK.-540x720%20%281%29.jpg_%2551de5cd5-6cf0-4695-9822-8d028c1b0dad.jpeg
576	576	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745730678253_img_%25image_%2575c0cd6f-6496-4370-aabb-d6bacbde4512.png
577	577	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735557569_img_%25lEjTxMk9-360x480%20%281%29.jpg_%2517d9900e-f3cb-43d2-a5e2-e1e5325ba600.jpeg
578	578	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681234675_img_%259abc1def-de24-4ef4-a601-ecf205add8d8_%252eec4bcf-b9fb-4c5a-8d96-a12b3bf89d5c.png
579	579	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761811429_img_%25hgfghjk%2Cmnbfghjkl.jpg_%25b300b803-fbfa-4deb-aafe-94beba12d0bd.jpeg
580	580	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729508646_img_%2536.jpg_%2586e59792-5d98-47bc-b150-a2de5cbbacba.jpeg
581	581	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727298995_img_%2529.jpg_%25967549fa-7133-4e59-b347-941c2206aec5.jpeg
582	582	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729860351_img_%254.jpg_%25c66d494c-f077-4307-9b28-1f6c7e2c82bf.jpeg
583	583	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733844421_img_%25Wt2aZYfI-360x480%20%281%29.jpg_%25612741fb-0381-4ce5-87cc-6d90aee30e47.jpeg
584	584	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758637070_img_%25kost-177-kampus-maranatha-2007512025_x2.jpg_%259b067a1c-60e5-4114-99de-28408e5cdf28.jpeg
585	585	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672990843_img_%25mG5aCAYy-540x720.jpg_%25e49196dc-e2f6-41a7-bb1b-366085dbbb6e.jpeg
586	586	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763412070_img_%25hjklllllll%2Cmhyuik.jpg_%253f48d95b-d99f-4715-ae57-71fbe3103f35.jpeg
587	587	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762712173_img_%25oiuhgffghjkl%3B%27.jpg_%257ae80ca4-b4d7-42e6-ad55-3f58e9c2d4da.jpeg
588	588	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761623087_img_%25fhhhnk%2C.jpg_%25bccfacdc-9f6a-4f85-a6cc-164d8cd24175.jpeg
589	589	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728176224_img_%2566.jpg_%25d725ef00-386d-4772-8e2e-d4169f27fe24.jpeg
590	590	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736453966_img_%25trrF7nQa-540x720%20%281%29.jpg_%2536232ac1-9911-48f6-b6f1-aa3f2da9945a.jpeg
591	591	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728511680_img_%25122.jpg_%251e518e57-91dc-4478-8cd4-6cf803e03a94.jpeg
592	592	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727275271_img_%25105.jpg_%25cbd7f969-79c1-431e-9016-a81ad88d2bda.jpeg
593	593	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736649268_img_%2534sb8qQd-360x480%20%281%29.jpg_%25955fbe97-7eff-4cae-ac04-4a97bbc54de1.jpeg
594	594	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679247545_img_%25snapedit_1745679369605_%257527c056-93a8-4129-89a5-7b8ef2a82067.jpeg
595	595	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763824025_img_%25jhgfdertyuil%2Cmnbgtyu.jpg_%25db238043-03ff-4b79-b5d5-80835361cb93.jpeg
596	596	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763350713_img_%25578113ce-7cdb-40fd-ada8-1e18a4ae80fd_%25ea4c8227-c7b1-4c52-964a-b5cb0d1c62e9.png
597	597	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678409163_img_%25Screenshot%202025-04-26%20214214_%2548c302dc-2da5-40ef-90ad-94cef68f9e4a.png
598	598	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728693152_img_%25115.jpg_%252087e4f2-e4bc-46fe-abcd-2e7a79e7d328.jpeg
599	599	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728213249_img_%2526.jpg_%259ed4d6fe-0e34-4715-9690-cb6ed65ab66c.jpeg
600	600	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685161671_img_%25Offql8TK-360x480%20%281%29.jpg_%25f88a7092-4b33-42ac-9a24-191d954b0f3b.jpeg
601	601	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727722099_img_%2589.jpg_%256bee859e-7041-4893-8384-3909e4dae808.jpeg
602	602	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745730678253_img_%25image_%2575c0cd6f-6496-4370-aabb-d6bacbde4512.png
603	603	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727114297_img_%25135.jpg_%2516489423-f14d-4658-941b-d1a94e34ef75.jpeg
604	604	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673667994_img_%25snapedit_1745074090053.jpg_%257cb5d07b-a28c-4ebe-bff3-e6997c50b349.jpeg
605	605	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734352336_img_%25mz6lsU9v.-360x480%20%281%29.jpg_%254c1bfa7d-b42a-4b64-ba67-d31f0099fd63.jpeg
606	606	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685614379_img_%25KM9ZoFNK.-540x720%20%281%29.jpg_%2551de5cd5-6cf0-4695-9822-8d028c1b0dad.jpeg
607	607	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735429456_img_%25SIKsYa4l-540x720%20%281%29.jpg_%25971ed692-c264-4feb-992d-f7255ea4282f.jpeg
608	608	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673667994_img_%25snapedit_1745074090053.jpg_%257cb5d07b-a28c-4ebe-bff3-e6997c50b349.jpeg
609	609	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680216580_img_%251caf50ee-43a7-4924-9843-3c5cf3d7bed9_%25e77bca21-2d53-497a-bba5-a11fa065fde6.png
610	610	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728854731_img_%2572.jpg_%2506256408-8823-4c67-a15d-734e0fef9b76.jpeg
611	611	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678157744_img_%25Screenshot%202025-04-26%20213757_%2584c66213-650b-4106-a6c7-469696b4dc9f.png
612	612	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732305766_img_%25uQGpJmxf.-540x720%20%281%29.jpg_%258a4c052a-21c8-4e64-855f-650df7e4d86a.jpeg
613	613	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685786901_img_%2510KrrycH.-360x480%20%281%29.jpg_%257170e84a-78ae-4a0c-a01d-12354d5fa260.jpeg
614	614	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679393757_img_%25snapedit_1745679463783_%256866fa1c-e3ab-43a1-98bb-eb1f567289d6.jpeg
615	615	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734203799_img_%25eFkpV7nQ.-360x480%20%281%29.jpg_%2513c04796-f20b-44e9-a9f0-a763df13e030.jpeg
616	616	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728285635_img_%25142.jpg_%2552d06ad4-56f2-40ec-ab55-bef98003fd01.jpeg
617	617	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685786901_img_%2510KrrycH.-360x480%20%281%29.jpg_%257170e84a-78ae-4a0c-a01d-12354d5fa260.jpeg
618	618	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733586985_img_%250Ih6ZU0h.-360x480%20%281%29.jpg_%2536905939-fa57-4533-b5da-a13a069495b0.jpeg
619	619	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715579673_img_%25Betterimage.ai_1745715627172_%252177f5cb-8cef-4ea4-8cf5-25060da4c947.jpeg
620	620	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718378312_img_%25LK8lzQWE.-360x480%20%281%29.jpg_%2519e8d378-f698-481f-aafe-972a22d7d099.jpeg
621	621	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673548630_img_%25snapedit_1745072680356.jpg_%25bfbbc633-1352-4755-84ba-33506bfc7b53.jpeg
622	622	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727358120_img_%25kamar-kost-sederhana-di-sarijadi-1690635730.jpg_%2560e56531-2bb4-4151-834d-e3f449067065.jpeg
623	623	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681564185_img_%250fc482ca-3600-45fb-9b4d-b26d77f5441a_%25321118c7-620c-4b25-96fa-120591bafd08.png
624	624	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673350770_img_%25snapedit_1745071376790.jpg_%25af257aed-2c6c-4a28-9c81-58a3dd412e4c.jpeg
625	625	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729017987_img_%251-1707797865-Kos---Kosan-Pondok-Indah-Kamar-Mandi-Dalam-Fasilitas-Lengkap---Jakarta.jpg_%257da6e7d5-499c-49e7-9cf7-64f44b82011e.jpeg
626	626	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682522231_img_%25ChatGPT%20Image%20Apr%2026%2C%202025%2C%2010_50_34%20PM_%2599cea16c-ad57-44d3-8bb3-baf03124b3dc.png
627	627	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681434379_img_%25bb9e2d9b-ae45-46f4-9a41-e49c79720cbd_%2583904b56-ca2a-4e93-8cdd-7d66ddfd9584.png
628	628	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680570759_img_%256def1e96-b1c0-42a0-81ac-3c1fc7453172_%256fc20f08-688d-4143-b1a5-ceda6c5a369b.png
629	629	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761419083_img_%25edfghjkl%3B.jpg_%2517faf11b-3dbb-444b-8872-b6f4b305b591.jpeg
630	630	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727863299_img_%2574.jpg_%25851b8574-c0f9-4d50-9cfc-60a684c47f0f.jpeg
631	631	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759022867_img_%25jhgddyfds.jpg_%25abc8f59e-4a4c-40f2-acf0-e9829fa0aea3.jpeg
632	632	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763729788_img_%25fghjkndtyui.jpg_%25f3cdb37d-354a-45bf-b950-f740a4dcd54c.jpeg
633	633	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680538899_img_%2503532d15-cacd-49ce-afbf-1ce01e488c19_%256b0ae54e-9573-4dcf-a1f6-59878765ae0b.png
634	634	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679541686_img_%25Screenshot%202025-04-26%20215720_%252d330f56-f2a4-4526-b1d5-2f9822ba3cde.png
635	635	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681192493_img_%25fcd113be-503c-47e7-81f3-ed7390a6225e_%25c2c0c561-85fd-46f8-bf27-a3962e8e2e1b.png
636	636	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764345274_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_08_11%20AM_%25a942e80d-7fa5-4626-85ec-89d0c052fc3f.png
637	637	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729526220_img_%2577.jpg_%25f94687c5-f403-455c-911c-06affd544a91.jpeg
638	638	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764124715_img_%25kjhgfdsdfghjkl%2Cmnb.jpg_%25e71e274b-8a31-4512-9755-887040b76690.jpeg
639	639	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728819618_img_%25download_4.jpg_%2528d92832-f8a6-4686-a761-2c979980ab98.jpeg
640	640	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734776334_img_%25RMGBPLnY.-360x480%20%281%29.jpg_%25002b35a4-4730-4c13-8860-6528ca410a3b.jpeg
641	641	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731648162_img_%25r2PejhrT-540x720%20%281%29.jpg_%25bf580f22-74b0-4c51-8cd7-337777db9cf9.jpeg
642	642	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761861056_img_%25uytrewertyuilknbfertyu.jpg_%25d57e6999-4156-4df2-9ae4-1445bd199d32.jpeg
643	643	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719622294_img_%255UVLhbLv-540x720%20%281%29.jpg_%2505a3111f-8178-4bef-9330-4ebe0b87473d.jpeg
644	644	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728229986_img_%25129.jpg_%258bcaecd3-33c7-45ab-80f6-af309fd59b79.jpeg
645	645	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759246523_img_%25120.jpg_%25ce1db31e-4573-4bf6-83a7-082526f02d03.jpeg
646	646	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763708892_img_%25iuyttyuill%2Cmnbg.jpg_%25943c3102-5676-4877-96ba-8bbd348167cb.jpeg
647	647	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757792608_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_54_43%20AM_%2519654814-06a2-434c-915c-1a964c39cf18.png
648	648	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761440625_img_%25ertyhgfdfghj.jpg_%2533032b96-f236-4835-b930-d4a042ef654f.jpeg
649	649	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764321996_img_%25snapedit_1745131091135.jpg_%25c6a8f9d5-6dbe-4e16-aacd-483edd284682.jpeg
650	650	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761091720_img_%25gfdsertyuikhgffv_%25e7556433-9af5-4d48-8095-180a617700dc.jpeg
651	651	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715925946_img_%252Ia5MLG5-540x720%20%281%29.jpg_%25ad83ba65-b10d-45eb-bb1d-5ffca85a5788.jpeg
652	652	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681234675_img_%259abc1def-de24-4ef4-a601-ecf205add8d8_%252eec4bcf-b9fb-4c5a-8d96-a12b3bf89d5c.png
653	653	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729017987_img_%251-1707797865-Kos---Kosan-Pondok-Indah-Kamar-Mandi-Dalam-Fasilitas-Lengkap---Jakarta.jpg_%257da6e7d5-499c-49e7-9cf7-64f44b82011e.jpeg
654	654	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759876732_img_%25drtyuiolkjhgcf.jpg_%250365494f-84f9-4845-b8f9-38dd23ca7f92.jpeg
655	655	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680570759_img_%256def1e96-b1c0-42a0-81ac-3c1fc7453172_%256fc20f08-688d-4143-b1a5-ceda6c5a369b.png
656	656	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760422231_img_%25sdfgyuiolkjhyuj.jpg_%2524b7a0d3-9e41-4b13-9043-c21825641244.jpeg
657	657	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734352336_img_%25mz6lsU9v.-360x480%20%281%29.jpg_%254c1bfa7d-b42a-4b64-ba67-d31f0099fd63.jpeg
658	658	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680995624_img_%25e16b8412-c052-4da0-be63-807055510347_%25c6508e13-4a94-49b8-a0f6-036e8f20c428.png
659	659	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757997686_img_%2512%20redfsg.jpg_%25608403da-384e-4be5-9d32-e3a579ab6ce3.jpeg
660	660	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685938309_img_%25vHtdq903-360x480%20%281%29.jpg_%259fb27409-68e8-4993-b52a-bb18498794ce.jpeg
661	661	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673260886_img_%25snapedit_1744431774210.jpg_%258a91aeca-194f-4411-81d5-4a320ac33caf.jpeg
662	662	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759022867_img_%25jhgddyfds.jpg_%25abc8f59e-4a4c-40f2-acf0-e9829fa0aea3.jpeg
663	663	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715925946_img_%252Ia5MLG5-540x720%20%281%29.jpg_%25ad83ba65-b10d-45eb-bb1d-5ffca85a5788.jpeg
664	664	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685711870_img_%25nEMSFgzW-360x480%20%281%29.jpg_%25c7ef5407-3cf4-4a19-95aa-4f99ec1423d0.jpeg
665	665	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728345784_img_%2582.jpg_%25f7d34100-492c-476c-b58d-6f9edd82f778.jpeg
666	666	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728762023_img_%2527.jpg_%25b0d8146c-112d-497c-8ce5-0d18fe11c95c.jpeg
667	667	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718228539_img_%258WoQBebx-360x480%20%281%29.jpg_%25174b4902-85c6-4300-bb2c-cc165ffea232.jpeg
668	668	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673178154_img_%25snapedit_1744431111188.jpg_%25edef0edb-0d45-4864-a0a0-c90a0386eac2.jpeg
669	669	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759246523_img_%25120.jpg_%25ce1db31e-4573-4bf6-83a7-082526f02d03.jpeg
670	670	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727563832_img_%2582.jpg_%25a8861c5c-4d2e-4800-8e65-0c9d3846608d.jpeg
671	671	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729860351_img_%254.jpg_%25c66d494c-f077-4307-9b28-1f6c7e2c82bf.jpeg
672	672	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745720124007_img_%25SbsOr3fP-360x480%20%282%29.jpg_%252cfa031b-62c4-4e7d-b308-93a995a034b8.jpeg
673	673	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679247545_img_%25snapedit_1745679369605_%257527c056-93a8-4129-89a5-7b8ef2a82067.jpeg
674	674	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736453966_img_%25trrF7nQa-540x720%20%281%29.jpg_%2536232ac1-9911-48f6-b6f1-aa3f2da9945a.jpeg
675	675	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716565649_img_%25Qjyu5aSW-360x480%20%281%29.jpg_%251ed9aa05-1380-41f7-a2ff-d9e6e8361308.jpeg
676	676	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683016486_img_%25ChatGPT%20Image%20Apr%2026%2C%202025%2C%2010_58_49%20PM_%25a58dda0a-23e0-41f8-a3b8-389b130c427c.png
677	677	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727941398_img_%25snapedit_1745130203029.jpg_%2578534c86-3676-4122-94c8-d95837da293f.jpeg
678	678	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735901892_img_%253uYdPsTR-360x480%20%282%29.jpg_%25150e5bac-9f1c-44d8-825d-f02047fce3d0.jpeg
679	679	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727030759_img_%25119.jpg_%25ecf30237-0e1c-4ae7-bf68-648df07206af.jpeg
680	680	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729034244_img_%25177.jpg_%25e4b75b12-f144-4ec9-b754-1ec8bb43b67e.jpeg
681	681	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729047082_img_%2546.jpg_%25712e5f6e-8c47-442c-8ea4-f2f835195d6c.jpeg
682	682	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728360849_img_%25106.jpg_%2534f7c1d0-a984-4352-b780-ce92d444b208.jpeg
683	683	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763041044_img_%25ftyuiop%3B%2Cnbgttyk.jpg_%25f306bb7a-6652-4321-bf61-e6ab4da274b2.jpeg
684	684	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728165026_img_%25images.jpg_%25050fc801-d719-454f-b6ae-b2e9f420356b.jpeg
685	685	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760941035_img_%25drtyuiknbvfyum.jpg_%2559123121-aa40-4ee9-ad36-f7372fd3b2f7.jpeg
686	686	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729446081_img_%2529.jpg_%25ef5f2f36-ce1b-46ca-a8aa-a2974a999cf9.jpeg
687	687	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673477147_img_%25Screenshot%202025-04-19%20204659_%25efa4ad3a-856e-4be0-9944-e582197dd4dd.png
688	688	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672932541_img_%25TrzFpYLc-540x720.jpg_%251de2acc2-0643-4118-9d6f-9ed1a5066247.jpeg
689	689	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678409163_img_%25Screenshot%202025-04-26%20214214_%2548c302dc-2da5-40ef-90ad-94cef68f9e4a.png
690	690	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728483122_img_%25164.jpg_%25070a5ad2-4d63-434e-b091-a5f3dc386205.jpeg
691	691	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758573008_img_%25139.jpg_%259e6e470e-1481-4332-ae47-fb192511c798.jpeg
692	692	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716992588_img_%25L0A34vUg.-540x720%20%281%29.jpg_%251a73318a-05df-4366-ae73-96a6d1ef831c.jpeg
693	693	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727460248_img_%25rumah-kost-subagio-118077431_x2.jpg_%25ecf5e56d-32e4-428a-971a-f307270b2f51.jpeg
694	694	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681313339_img_%257126d1d0-fb6a-4625-baea-1bda44eae814_%25abd09186-0d8d-4784-aaa7-61676f3f82ad.png
695	695	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715714134_img_%25elnCS7Y9-540x720%20%281%29.jpg_%25364b6c26-c417-461e-b394-68523c78fd16.jpeg
696	696	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736649268_img_%2534sb8qQd-360x480%20%281%29.jpg_%25955fbe97-7eff-4cae-ac04-4a97bbc54de1.jpeg
697	697	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731106132_img_%25PXvBKoAY.-360x480%20%281%29.jpg_%250591a6e6-b863-4d0f-a3bb-7a5e0e814909.jpeg
698	698	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673667994_img_%25snapedit_1745074090053.jpg_%257cb5d07b-a28c-4ebe-bff3-e6997c50b349.jpeg
699	699	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734760351_img_%25lw6ZQnHS-360x480%20%282%29%20%281%29.jpg_%25e34bc124-8ff5-467d-89aa-ac1cfa92a665.jpeg
700	700	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745730678253_img_%25image_%2575c0cd6f-6496-4370-aabb-d6bacbde4512.png
701	701	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682688393_img_%2508fc5c3c-80fe-4674-84bb-39cf20a8aa98_%25db58122d-7669-4b38-9452-f7291797e9dc.png
702	702	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679406469_img_%25snapedit_1745679481327_%25887f0656-94b4-462d-b73f-a217abc4b32a.jpeg
703	703	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733778546_img_%25RhhiZzzw-540x720%20%281%29.jpg_%25c70b56af-107a-4810-b153-e190b7946710.jpeg
704	704	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764277720_img_%25112.jpg_%25f54fe11f-fc8b-4cc6-b8a1-a9d9cc9b40ff.jpeg
705	705	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736508313_img_%25oBgUzkxE.-360x480%20%281%29.jpg_%25de61b0db-30fa-4406-a509-02d69755f652.jpeg
706	706	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728176224_img_%2566.jpg_%25d725ef00-386d-4772-8e2e-d4169f27fe24.jpeg
707	707	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673260886_img_%25snapedit_1744431774210.jpg_%258a91aeca-194f-4411-81d5-4a320ac33caf.jpeg
708	708	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758708796_img_%25fjhuidik.jpg_%255badd267-9d81-41a3-991e-ff5b04b62420.jpeg
709	709	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759628773_img_%25hghdsjkalnhyhn.jpg_%25519cfdc7-c1b3-4c9c-a037-3e6931e1f357.jpeg
710	710	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764321996_img_%25snapedit_1745131091135.jpg_%25c6a8f9d5-6dbe-4e16-aacd-483edd284682.jpeg
711	711	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673260886_img_%25snapedit_1744431774210.jpg_%258a91aeca-194f-4411-81d5-4a320ac33caf.jpeg
712	712	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684139773_img_%25LUkHMpk5-360x480%20%281%29.jpg_%254a7f6d1c-d229-4ccd-9974-6da475d1afb3.jpeg
713	713	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681434379_img_%25bb9e2d9b-ae45-46f4-9a41-e49c79720cbd_%2583904b56-ca2a-4e93-8cdd-7d66ddfd9584.png
714	714	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680490877_img_%253baa4346-8ac7-4073-b4a9-ff878fa35eb3_%25abbd51e5-f6ac-41c2-bf35-99226c77cf7f.png
715	715	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682930714_img_%25dc3fedf6-aa13-47d1-b613-2527a9b8ff10_%256a195dc9-20d6-49f2-9c68-8c34427cfbc7.png
716	716	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759691374_img_%25rftgyhuioplkjhgfdertyui.jpg_%25ba420d1b-11e3-468d-bf98-e27d430d6d0c.jpeg
717	717	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736601815_img_%257la3Ee0J-360x480%20%281%29.jpg_%25c8df5cea-9509-4f1d-ad10-8c1b54723f72.jpeg
718	718	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762263788_img_%25fdedfghjkl%3B%27.jpg_%256a38a051-43ca-4e8d-b7e1-6688933346f4.jpeg
719	719	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672509397_img_%25Screenshot%202025-04-06%20203755_%258b552dc8-325c-467b-84e9-e7a9517907b9.png
720	720	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757887548_img_%25102.jpg_%258e947b25-39b8-44ad-98dd-24d876b083c9.jpeg
721	721	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732774866_img_%25LLK8g6fn-540x720%20%281%29.jpg_%25c4589194-2504-40bc-8842-e831a1655430.jpeg
722	722	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685374118_img_%25Yo43gYjW-360x480%20%281%29.jpg_%25486892a9-1123-41a1-896e-51a16b0f5f04.jpeg
723	723	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728125449_img_%2533.jpg_%2578320ee2-e6b0-4738-9723-16c357257e6a.jpeg
724	724	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728266544_img_%25123.jpg_%25c15f6517-16dd-415f-b83d-962e9276e61c.jpeg
725	725	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673093962_img_%25snapedit_1744430404114.jpg_%25a1654de6-c86e-46d2-9b49-e6440e3d0682.jpeg
726	726	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758798880_img_%25listing-235061894_x2.jpg_%2531779064-35e5-4a21-b00b-4d5ee1f855b2.jpeg
727	727	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728306500_img_%2581.jpg_%255114259e-03a3-47f1-91c9-cac7afbd9f16.jpeg
728	728	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735557569_img_%25lEjTxMk9-360x480%20%281%29.jpg_%2517d9900e-f3cb-43d2-a5e2-e1e5325ba600.jpeg
729	729	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682688393_img_%2508fc5c3c-80fe-4674-84bb-39cf20a8aa98_%25db58122d-7669-4b38-9452-f7291797e9dc.png
730	730	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719212284_img_%25lw6ZQnHS-360x480%20%281%29.jpg_%25a463fb5c-bf29-465b-a753-a2b362232e16.jpeg
731	731	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679406469_img_%25snapedit_1745679481327_%25887f0656-94b4-462d-b73f-a217abc4b32a.jpeg
732	732	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729047082_img_%2546.jpg_%25712e5f6e-8c47-442c-8ea4-f2f835195d6c.jpeg
733	733	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678157744_img_%25Screenshot%202025-04-26%20213757_%2584c66213-650b-4106-a6c7-469696b4dc9f.png
734	734	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763729788_img_%25fghjkndtyui.jpg_%25f3cdb37d-354a-45bf-b950-f740a4dcd54c.jpeg
735	735	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758573008_img_%25139.jpg_%259e6e470e-1481-4332-ae47-fb192511c798.jpeg
736	736	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728526038_img_%25snapedit_1745679166503_%2544973a59-4b58-4697-9167-5555e1d6480f.jpeg
737	737	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715714134_img_%25elnCS7Y9-540x720%20%281%29.jpg_%25364b6c26-c417-461e-b394-68523c78fd16.jpeg
738	738	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718920525_img_%25wFTD5sY4-540x720%20%281%29.jpg_%251fd8caad-1fb6-4d1e-ac9e-37edaa98ae29.jpeg
739	739	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760422231_img_%25sdfgyuiolkjhyuj.jpg_%2524b7a0d3-9e41-4b13-9043-c21825641244.jpeg
740	740	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679698110_img_%25Screenshot%202025-04-26%20220132_%25e0c71a37-543d-4419-9593-624ede50c37f.png
741	741	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716565649_img_%25Qjyu5aSW-360x480%20%281%29.jpg_%251ed9aa05-1380-41f7-a2ff-d9e6e8361308.jpeg
742	742	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728669701_img_%25kosan-putri-bersih-nyaman-kamar-mandi-dalam-413169630.jpg_%258dc2ab93-8678-47e6-bf54-552911e1f8de.jpeg
743	743	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718920525_img_%25wFTD5sY4-540x720%20%281%29.jpg_%251fd8caad-1fb6-4d1e-ac9e-37edaa98ae29.jpeg
744	744	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718228539_img_%258WoQBebx-360x480%20%281%29.jpg_%25174b4902-85c6-4300-bb2c-cc165ffea232.jpeg
745	745	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728467754_img_%25135.jpg_%25d0761705-3a49-420b-9b49-0bd4b3b05277.jpeg
746	746	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680681219_img_%256fa6037f-a996-46f0-b8bb-536b8bdd900c_%25dc786d28-f9f0-44c2-8334-39816776f0dd.png
747	747	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685848553_img_%25oOkKsoSE.-360x480.jpg_%25e117116e-e2a5-48d4-ac56-e63f5e509985.jpeg
748	748	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757737981_img_%25iMdx77Jg-540x720%20%281%29.jpg_%2511029320-f204-4609-a904-9962d31fe6cf.jpeg
749	749	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728229986_img_%25129.jpg_%258bcaecd3-33c7-45ab-80f6-af309fd59b79.jpeg
750	750	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728869393_img_%2559.jpg_%255060abe3-c3e4-4d1b-ad20-a8ed505d3870.jpeg
751	751	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764345274_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_08_11%20AM_%25a942e80d-7fa5-4626-85ec-89d0c052fc3f.png
752	752	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733805695_img_%25Ga5cdygH.-360x480%20%281%29.jpg_%25ba20666d-9716-4a32-aa23-dfb0cfbfac0e.jpeg
753	753	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685786901_img_%2510KrrycH.-360x480%20%281%29.jpg_%257170e84a-78ae-4a0c-a01d-12354d5fa260.jpeg
754	754	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745756746145_img_%250V2ciaJZ.-360x480%20%281%29.jpg_%25bf7fb2b1-c1c6-4365-a7e1-da0326e46a47.jpeg
755	755	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733731074_img_%25vYxUUw8k-540x720%20%281%29.jpg_%2547afe7b4-5281-47d2-b83e-63ce7bb19507.jpeg
756	756	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681313339_img_%257126d1d0-fb6a-4625-baea-1bda44eae814_%25abd09186-0d8d-4784-aaa7-61676f3f82ad.png
757	757	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678381661_img_%25Screenshot%202025-04-26%20214141_%251a784534-5d7d-4fcd-9a3b-82326e106650.png
758	758	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732467201_img_%2514OLfTDU-360x480%20%282%29%20%281%29.jpg_%252b02f8de-ac92-43b5-a487-d92fdd37857e.jpeg
759	759	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736294720_img_%25304oBQNH-540x720%20%281%29.jpg_%2510f28e88-073f-4b44-8fac-dd92c7e47e95.jpeg
760	760	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715925946_img_%252Ia5MLG5-540x720%20%281%29.jpg_%25ad83ba65-b10d-45eb-bb1d-5ffca85a5788.jpeg
761	761	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679930168_img_%25578113ce-7cdb-40fd-ada8-1e18a4ae80fd_%2596689d6b-6402-4f38-bb61-5c5249d9da2c.png
762	762	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735353676_img_%25iyXNNbfH-540x720%20%281%29.jpg_%255d7469f9-ca03-4e6d-abe8-5d958dadb558.jpeg
763	763	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727114297_img_%25135.jpg_%2516489423-f14d-4658-941b-d1a94e34ef75.jpeg
764	764	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759845848_img_%25yfdfghjklkjbv.jpg_%257c760591-adcd-48f9-8310-2139b2749038.jpeg
765	765	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681313339_img_%257126d1d0-fb6a-4625-baea-1bda44eae814_%25abd09186-0d8d-4784-aaa7-61676f3f82ad.png
766	766	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760254516_img_%25gfdsdfghjkl%3Bliu7y.jpg_%25385f01ad-ede4-4298-bfd1-b3f58eed977a.jpeg
767	767	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758637070_img_%25kost-177-kampus-maranatha-2007512025_x2.jpg_%259b067a1c-60e5-4114-99de-28408e5cdf28.jpeg
768	768	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728454466_img_%25snapedit_1745074090053.jpg_%2528229045-8adf-4cad-8393-386919c62b15.jpeg
769	769	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758525077_img_%25fygdhcushcydfu.jpg_%257b1f2631-b032-4371-b220-5a975bb87325.jpeg
770	770	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761927465_img_%25drftyujknbvdrtyukmnb.jpg_%2528c34f59-c999-47ed-9890-f8441efdf780.jpeg
771	771	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757997686_img_%2512%20redfsg.jpg_%25608403da-384e-4be5-9d32-e3a579ab6ce3.jpeg
772	772	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734369889_img_%25bivwcyQu.-360x480%20%281%29.jpg_%257d86de7a-c983-4956-9e19-d6ccbb0dc146.jpeg
773	773	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759628773_img_%25hghdsjkalnhyhn.jpg_%25519cfdc7-c1b3-4c9c-a037-3e6931e1f357.jpeg
774	774	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745726954377_img_%25kamar-kost-sederhana-di-sarijadi-1690635730.jpg_%25c24bc8d7-9cd2-4590-8d7e-4328639d446d.jpeg
775	775	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678409163_img_%25Screenshot%202025-04-26%20214214_%2548c302dc-2da5-40ef-90ad-94cef68f9e4a.png
776	776	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757563186_img_%25lPFDD4uK-360x480%20%282%29.jpg_%25361e5b3b-e9f9-40d2-9c5f-3475a035f49a.jpeg
777	777	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727141328_img_%25140.jpg_%25067deb2b-7171-4a40-9258-3f3d44968f4c.jpeg
778	778	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727722099_img_%2589.jpg_%256bee859e-7041-4893-8384-3909e4dae808.jpeg
779	779	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760773648_img_%25saaertyujgyuj.jpg_%258f8fb433-b22f-4b54-b35a-0ae58f0da9c3.jpeg
780	780	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673667994_img_%25snapedit_1745074090053.jpg_%257cb5d07b-a28c-4ebe-bff3-e6997c50b349.jpeg
781	781	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681564185_img_%250fc482ca-3600-45fb-9b4d-b26d77f5441a_%25321118c7-620c-4b25-96fa-120591bafd08.png
782	782	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727141328_img_%25140.jpg_%25067deb2b-7171-4a40-9258-3f3d44968f4c.jpeg
783	783	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685161671_img_%25Offql8TK-360x480%20%281%29.jpg_%25f88a7092-4b33-42ac-9a24-191d954b0f3b.jpeg
784	784	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673093962_img_%25snapedit_1744430404114.jpg_%25a1654de6-c86e-46d2-9b49-e6440e3d0682.jpeg
785	785	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764277720_img_%25112.jpg_%25f54fe11f-fc8b-4cc6-b8a1-a9d9cc9b40ff.jpeg
786	786	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727460248_img_%25rumah-kost-subagio-118077431_x2.jpg_%25ecf5e56d-32e4-428a-971a-f307270b2f51.jpeg
787	787	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736367335_img_%25xpGA9MPH.-360x480%20%281%29.jpg_%258427af41-0465-4db9-9b58-d4eadb925f7c.jpeg
788	788	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719979800_img_%25zyAyGSwH-540x720%20%281%29.jpg_%255c21565a-ee0a-49bf-b34d-0f9cc26e6f80.jpeg
789	789	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764321996_img_%25snapedit_1745131091135.jpg_%25c6a8f9d5-6dbe-4e16-aacd-483edd284682.jpeg
790	790	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734740043_img_%25Wxx1KCKW-360x480%20%281%29.jpg_%251c0a5f9b-6841-4fbd-8ae4-92a5c50ed68c.jpeg
791	791	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679998896_img_%25ea140517-4cf3-437f-815b-6ca733580629_%2550426b78-b6dd-4971-b01f-af4ca279d3be.png
792	792	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764345274_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_08_11%20AM_%25a942e80d-7fa5-4626-85ec-89d0c052fc3f.png
793	793	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681434379_img_%25bb9e2d9b-ae45-46f4-9a41-e49c79720cbd_%2583904b56-ca2a-4e93-8cdd-7d66ddfd9584.png
794	794	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681611822_img_%25fe5bca43-9270-428c-a932-e89989327322_%25ec9f9ac2-24e1-4653-94d4-7f4f2df5cb16.png
795	795	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763729788_img_%25fghjkndtyui.jpg_%25f3cdb37d-354a-45bf-b950-f740a4dcd54c.jpeg
796	796	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678213456_img_%25Screenshot%202025-04-26%20213856_%25f78cce6f-0efe-4042-9590-698da586a520.png
797	797	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761811429_img_%25hgfghjk%2Cmnbfghjkl.jpg_%25b300b803-fbfa-4deb-aafe-94beba12d0bd.jpeg
798	798	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728196327_img_%25144.jpg_%25f878df96-ccd7-4d9d-bfff-c94a7089c899.jpeg
799	799	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673260886_img_%25snapedit_1744431774210.jpg_%258a91aeca-194f-4411-81d5-4a320ac33caf.jpeg
800	800	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729348585_img_%25listing-1050644677_x2.jpg_%25c2044a03-a89b-43e3-b367-f4a7b5ba07a7.jpeg
801	801	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734751726_img_%25pjUWo9b9-540x720%20%281%29.jpg_%2553e4f0db-7467-4e1a-adaa-d6ae9a90f27b.jpeg
802	802	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760941035_img_%25drtyuiknbvfyum.jpg_%2559123121-aa40-4ee9-ad36-f7372fd3b2f7.jpeg
803	803	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732467201_img_%2514OLfTDU-360x480%20%282%29%20%281%29.jpg_%252b02f8de-ac92-43b5-a487-d92fdd37857e.jpeg
804	804	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764141211_img_%25poigfddfghjkl%3B.jpg_%254bba9966-fcb6-4108-ba16-82d4d02d6f67.jpeg
805	805	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733273188_img_%25YxhQfi5a-540x720%20%281%29.jpg_%253945aa47-647c-43aa-bbd6-09aca269ca0b.jpeg
806	806	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681025684_img_%25d26e9152-4d7f-4e66-aec7-1894893b6094_%250dcb866d-98c8-4a1c-a8db-cf977d1ad7e2.png
807	807	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727989137_img_%2513.jpg_%251a415329-25be-407f-89a6-6acd52a50703.jpeg
808	808	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735346495_img_%25vWVN4IrP-360x480%20%281%29.jpg_%25a587b61b-fa6d-4e2c-9780-f3e5103c696e.jpeg
809	809	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679930168_img_%25578113ce-7cdb-40fd-ada8-1e18a4ae80fd_%2596689d6b-6402-4f38-bb61-5c5249d9da2c.png
810	810	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731648162_img_%25r2PejhrT-540x720%20%281%29.jpg_%25bf580f22-74b0-4c51-8cd7-337777db9cf9.jpeg
811	811	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728539978_img_%25175.jpg_%25383bd4b2-db6b-445f-a6de-33ec488184d7.jpeg
812	812	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681192493_img_%25fcd113be-503c-47e7-81f3-ed7390a6225e_%25c2c0c561-85fd-46f8-bf27-a3962e8e2e1b.png
813	813	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728554935_img_%25158.jpg_%25ad3b1d51-3831-4b37-8592-7097ab522494.jpeg
814	814	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728360849_img_%25106.jpg_%2534f7c1d0-a984-4352-b780-ce92d444b208.jpeg
815	815	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758819059_img_%25djhfgygdusjkl.jpg_%25495655da-c75d-4852-b339-67e92e2df25a.jpeg
816	816	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728038163_img_%25124.jpg_%2595a5514a-a0ce-4540-89e9-b628e6360ef5.jpeg
817	817	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745720124007_img_%25SbsOr3fP-360x480%20%282%29.jpg_%252cfa031b-62c4-4e7d-b308-93a995a034b8.jpeg
818	818	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685374118_img_%25Yo43gYjW-360x480%20%281%29.jpg_%25486892a9-1123-41a1-896e-51a16b0f5f04.jpeg
819	819	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732305766_img_%25uQGpJmxf.-540x720%20%281%29.jpg_%258a4c052a-21c8-4e64-855f-650df7e4d86a.jpeg
820	820	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732467201_img_%2514OLfTDU-360x480%20%282%29%20%281%29.jpg_%252b02f8de-ac92-43b5-a487-d92fdd37857e.jpeg
821	821	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758573008_img_%25139.jpg_%259e6e470e-1481-4332-ae47-fb192511c798.jpeg
822	822	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729158610_img_%2573.jpg_%254e835e3c-1589-4f1a-85d5-8918a9a7e9f1.jpeg
823	823	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760447215_img_%25dfghjkl%3Blkjhgfrtyu.jpg_%256466424b-52af-41e6-b39d-9b7831011fd5.jpeg
824	824	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760723928_img_%25sertyuiolmnhyh.jpg_%2563936875-37bd-40af-b636-59b7ff987a17.jpeg
825	825	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764124715_img_%25kjhgfdsdfghjkl%2Cmnb.jpg_%25e71e274b-8a31-4512-9755-887040b76690.jpeg
826	826	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673477147_img_%25Screenshot%202025-04-19%20204659_%25efa4ad3a-856e-4be0-9944-e582197dd4dd.png
827	827	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718778541_img_%251jk4bd6l-360x480%20%281%29.jpg_%256b47d1c2-0ed3-47ff-8073-96d0dee0b330.jpeg
828	828	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745726954377_img_%25kamar-kost-sederhana-di-sarijadi-1690635730.jpg_%25c24bc8d7-9cd2-4590-8d7e-4328639d446d.jpeg
829	829	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761963218_img_%25sasrtyuio%3Blmnbghjkl.jpg_%25bd7827b7-5533-4a28-ab53-45136318b874.jpeg
830	830	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734776334_img_%25RMGBPLnY.-360x480%20%281%29.jpg_%25002b35a4-4730-4c13-8860-6528ca410a3b.jpeg
831	831	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763412070_img_%25hjklllllll%2Cmhyuik.jpg_%253f48d95b-d99f-4715-ae57-71fbe3103f35.jpeg
832	832	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736402428_img_%25sFhhcmdJ-360x480%20%281%29.jpg_%25734cb6f2-9908-4ade-b1c6-1b8c83013f06.jpeg
833	833	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679205031_img_%25snapedit_1745679302560_%25da055c70-f204-4f37-a86a-61f612bab7b0.jpeg
834	834	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745756746145_img_%250V2ciaJZ.-360x480%20%281%29.jpg_%25bf7fb2b1-c1c6-4365-a7e1-da0326e46a47.jpeg
835	835	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727515414_img_%252.jpg_%25d5689cc6-d1ea-4ed3-a18e-f3299c050f26.jpeg
836	836	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715925946_img_%252Ia5MLG5-540x720%20%281%29.jpg_%25ad83ba65-b10d-45eb-bb1d-5ffca85a5788.jpeg
837	837	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764141211_img_%25poigfddfghjkl%3B.jpg_%254bba9966-fcb6-4108-ba16-82d4d02d6f67.jpeg
838	838	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758846993_img_%25jduhygiub.jpg_%254b839e00-c794-4089-8bdc-7ce9ac368ded.jpeg
839	839	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673260886_img_%25snapedit_1744431774210.jpg_%258a91aeca-194f-4411-81d5-4a320ac33caf.jpeg
840	840	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735851884_img_%25N2J3XbhC-360x480%20%281%29.jpg_%2514b6546c-87e5-4944-b8ba-b9b187ae43b0.jpeg
841	841	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763467552_img_%2579.jpg_%25e577aa31-8046-45e7-9e56-06145770cb66.jpeg
842	842	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731648162_img_%25r2PejhrT-540x720%20%281%29.jpg_%25bf580f22-74b0-4c51-8cd7-337777db9cf9.jpeg
843	843	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735490304_img_%25ByxuX0E7.-540x720%20%281%29.jpg_%25f509469c-75ff-43cc-9202-32491ab5a9ad.jpeg
844	844	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728054716_img_%2576.jpg_%25e0ce0bdb-2dca-4ba3-ad96-42694557b665.jpeg
845	845	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729219793_img_%2571.jpg_%259834bf28-4951-4e59-83dd-929ec51a9e07.jpeg
846	846	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759845848_img_%25yfdfghjklkjbv.jpg_%257c760591-adcd-48f9-8310-2139b2749038.jpeg
847	847	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673350770_img_%25snapedit_1745071376790.jpg_%25af257aed-2c6c-4a28-9c81-58a3dd412e4c.jpeg
848	848	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683105901_img_%25snapedit_1745683222626.jpg_%25ebaf2bac-e79a-4b91-a1d7-82df00888e44.jpeg
849	849	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727953675_img_%2592.jpg_%25d860d2bf-1496-4c4d-9c11-dc8a6827cb8f.jpeg
850	850	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680995624_img_%25e16b8412-c052-4da0-be63-807055510347_%25c6508e13-4a94-49b8-a0f6-036e8f20c428.png
851	851	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735449952_img_%25EgPUVk9I-360x480%20%281%29.jpg_%250255d7ca-76d9-48ae-9f2f-da5b887e5896.jpeg
852	852	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758573008_img_%25139.jpg_%259e6e470e-1481-4332-ae47-fb192511c798.jpeg
853	853	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764345274_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_08_11%20AM_%25a942e80d-7fa5-4626-85ec-89d0c052fc3f.png
854	854	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733690758_img_%25jsbozU55-540x720%20%281%29.jpg_%25ce0c5261-e982-4d31-b480-2055d1976c51.jpeg
855	855	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734361702_img_%25sJSCYO6q-540x720%20%281%29.jpg_%25c2aa40f7-47ff-4160-a4e8-824e6596bf48.jpeg
856	856	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763511981_img_%25ertyuiohg.jpg_%25c0c7c4e0-2fb8-491e-b4ce-824c008c995f.jpeg
857	857	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761623087_img_%25fhhhnk%2C.jpg_%25bccfacdc-9f6a-4f85-a6cc-164d8cd24175.jpeg
858	858	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733171840_img_%2567HNZudS.-360x480%20%281%29.jpg_%25c07b3727-8bb3-4384-8de5-a2c5e633ebb6.jpeg
859	859	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758637070_img_%25kost-177-kampus-maranatha-2007512025_x2.jpg_%259b067a1c-60e5-4114-99de-28408e5cdf28.jpeg
860	860	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763672210_img_%25oiuyfdsdfghjk.jpg_%25229d7d82-e011-410e-afbd-58133e42d7c1.jpeg
861	861	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681434379_img_%25bb9e2d9b-ae45-46f4-9a41-e49c79720cbd_%2583904b56-ca2a-4e93-8cdd-7d66ddfd9584.png
862	862	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727515414_img_%252.jpg_%25d5689cc6-d1ea-4ed3-a18e-f3299c050f26.jpeg
863	863	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734740043_img_%25Wxx1KCKW-360x480%20%281%29.jpg_%251c0a5f9b-6841-4fbd-8ae4-92a5c50ed68c.jpeg
864	864	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729446081_img_%2529.jpg_%25ef5f2f36-ce1b-46ca-a8aa-a2974a999cf9.jpeg
865	865	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729824346_img_%2519.jpg_%25d4d13de0-5eb3-483d-a7b7-f15b334304ca.jpeg
866	866	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679247545_img_%25snapedit_1745679369605_%257527c056-93a8-4129-89a5-7b8ef2a82067.jpeg
867	867	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736367335_img_%25xpGA9MPH.-360x480%20%281%29.jpg_%258427af41-0465-4db9-9b58-d4eadb925f7c.jpeg
868	868	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729065206_img_%25snapedit_1745683222626.jpg_%25b7ea6dbf-0a95-4fb4-98f5-460a0bc52b44.jpeg
869	869	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728869393_img_%2559.jpg_%255060abe3-c3e4-4d1b-ad20-a8ed505d3870.jpeg
870	870	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729085225_img_%25136.jpg_%2521d8d7e7-f0ca-40b1-bb7a-d5605c1aceb5.jpeg
871	871	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682688393_img_%2508fc5c3c-80fe-4674-84bb-39cf20a8aa98_%25db58122d-7669-4b38-9452-f7291797e9dc.png
872	872	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745726954377_img_%25kamar-kost-sederhana-di-sarijadi-1690635730.jpg_%25c24bc8d7-9cd2-4590-8d7e-4328639d446d.jpeg
873	873	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719212284_img_%25lw6ZQnHS-360x480%20%281%29.jpg_%25a463fb5c-bf29-465b-a753-a2b362232e16.jpeg
874	874	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763467552_img_%2579.jpg_%25e577aa31-8046-45e7-9e56-06145770cb66.jpeg
875	875	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728306500_img_%2581.jpg_%255114259e-03a3-47f1-91c9-cac7afbd9f16.jpeg
876	876	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758274119_img_%25jdfhfsjkaksa.jpg_%25a2c261b4-e62a-40b1-be24-cfbd72036495.jpeg
877	877	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734352336_img_%25mz6lsU9v.-360x480%20%281%29.jpg_%254c1bfa7d-b42a-4b64-ba67-d31f0099fd63.jpeg
878	878	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736601815_img_%257la3Ee0J-360x480%20%281%29.jpg_%25c8df5cea-9509-4f1d-ad10-8c1b54723f72.jpeg
879	879	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745737059532_img_%25TNpzcbvr-360x480%20%281%29.jpg_%25c6415c79-ee2d-4cb9-ba29-8b34e7024fbe.jpeg
880	880	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759067736_img_%2555.jpg_%2516174d15-2816-48c5-afd3-8a19a7b83a8a.jpeg
881	881	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678823231_img_%25snapedit_1745678902292_%25e1e5f1fe-3737-458a-81d6-746c6b5a5a83.jpeg
882	882	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728054716_img_%2576.jpg_%25e0ce0bdb-2dca-4ba3-ad96-42694557b665.jpeg
883	883	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672990843_img_%25mG5aCAYy-540x720.jpg_%25e49196dc-e2f6-41a7-bb1b-366085dbbb6e.jpeg
884	884	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729508646_img_%2536.jpg_%2586e59792-5d98-47bc-b150-a2de5cbbacba.jpeg
885	885	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760447215_img_%25dfghjkl%3Blkjhgfrtyu.jpg_%256466424b-52af-41e6-b39d-9b7831011fd5.jpeg
886	886	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680819607_img_%25689d5353-fbb4-446e-9570-88fa41454d99_%256e61e6e0-25eb-405e-abfc-e17382ffb4a7.png
887	887	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729756043_img_%25108.jpg_%25d5a96cde-8c6f-4101-9eeb-ced42775411f.jpeg
888	888	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729235610_img_%25166.jpg_%25c223e8aa-07c8-41a3-82ca-e7b05bd49fcd.jpeg
889	889	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729508646_img_%2536.jpg_%2586e59792-5d98-47bc-b150-a2de5cbbacba.jpeg
890	890	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758274119_img_%25jdfhfsjkaksa.jpg_%25a2c261b4-e62a-40b1-be24-cfbd72036495.jpeg
891	891	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733805695_img_%25Ga5cdygH.-360x480%20%281%29.jpg_%25ba20666d-9716-4a32-aa23-dfb0cfbfac0e.jpeg
892	892	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681275347_img_%25d3a5f1f5-1c7e-4f05-8e31-ebae40c3b6a1_%25dac09fe4-3ed9-43fe-bd2a-a54bdf3b4222.png
893	893	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719417864_img_%254h9SuWWN-360x480%20%281%29.jpg_%2537e18faa-7cee-475b-bfc7-1868073fba5a.jpeg
894	894	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757737981_img_%25iMdx77Jg-540x720%20%281%29.jpg_%2511029320-f204-4609-a904-9962d31fe6cf.jpeg
895	895	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763672210_img_%25oiuyfdsdfghjk.jpg_%25229d7d82-e011-410e-afbd-58133e42d7c1.jpeg
896	896	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745737059532_img_%25TNpzcbvr-360x480%20%281%29.jpg_%25c6415c79-ee2d-4cb9-ba29-8b34e7024fbe.jpeg
897	897	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672509397_img_%25Screenshot%202025-04-06%20203755_%258b552dc8-325c-467b-84e9-e7a9517907b9.png
898	898	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729484922_img_%2584.jpg_%25cd2df962-8cc0-474f-b5aa-7c56789a51ce.jpeg
899	899	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745730678253_img_%25image_%2575c0cd6f-6496-4370-aabb-d6bacbde4512.png
900	900	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680490877_img_%253baa4346-8ac7-4073-b4a9-ff878fa35eb3_%25abbd51e5-f6ac-41c2-bf35-99226c77cf7f.png
901	901	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680139839_img_%25bb3906d4-48dc-4e25-8b90-0cded2678b9c_%254acfa5d8-aa67-4338-a9f5-69ca49e365d7.png
902	902	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682930714_img_%25dc3fedf6-aa13-47d1-b613-2527a9b8ff10_%256a195dc9-20d6-49f2-9c68-8c34427cfbc7.png
903	903	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758455075_img_%25ojhgfdfghjkknbvdrtyh.jpg_%25851a0022-3ec1-4556-8283-938672683f20.jpeg
904	904	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682479387_img_%25a640492f-d21d-45af-89d1-30322b35e88e_%2558278f7f-1484-48cb-9c9c-3821cab4d19a.png
905	905	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673961000_img_%25Screenshot%202025-04-06%20203755_%25c2d65c36-5314-49da-a022-21703f86c5ce.png
906	906	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673667994_img_%25snapedit_1745074090053.jpg_%257cb5d07b-a28c-4ebe-bff3-e6997c50b349.jpeg
907	907	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736601815_img_%257la3Ee0J-360x480%20%281%29.jpg_%25c8df5cea-9509-4f1d-ad10-8c1b54723f72.jpeg
908	908	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760827068_img_%25asjkmuung.jpg_%255003a6ae-1a6e-4b5f-ac41-032d6a25e64e.jpeg
909	909	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728854731_img_%2572.jpg_%2506256408-8823-4c67-a15d-734e0fef9b76.jpeg
910	910	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678409163_img_%25Screenshot%202025-04-26%20214214_%2548c302dc-2da5-40ef-90ad-94cef68f9e4a.png
911	911	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680784530_img_%25d22d056c-8d5f-4f23-b945-6d90f5933d40_%25b01c46ee-df3b-4859-a318-61fc13512a35.png
912	912	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718920525_img_%25wFTD5sY4-540x720%20%281%29.jpg_%251fd8caad-1fb6-4d1e-ac9e-37edaa98ae29.jpeg
913	913	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764321996_img_%25snapedit_1745131091135.jpg_%25c6a8f9d5-6dbe-4e16-aacd-483edd284682.jpeg
914	914	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735851884_img_%25N2J3XbhC-360x480%20%281%29.jpg_%2514b6546c-87e5-4944-b8ba-b9b187ae43b0.jpeg
915	915	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678864756_img_%25snapedit_1745678963622_%2531874df6-43c5-4971-8dfa-ece23615fea3.jpeg
916	916	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734369889_img_%25bivwcyQu.-360x480%20%281%29.jpg_%257d86de7a-c983-4956-9e19-d6ccbb0dc146.jpeg
917	917	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760447215_img_%25dfghjkl%3Blkjhgfrtyu.jpg_%256466424b-52af-41e6-b39d-9b7831011fd5.jpeg
918	918	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683252008_img_%25snapedit_1745683366960.jpg_%25a451c554-cc2a-446b-876f-c018064b9d76.jpeg
919	919	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758819059_img_%25djhfgygdusjkl.jpg_%25495655da-c75d-4852-b339-67e92e2df25a.jpeg
920	920	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718778541_img_%251jk4bd6l-360x480%20%281%29.jpg_%256b47d1c2-0ed3-47ff-8073-96d0dee0b330.jpeg
921	921	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685161671_img_%25Offql8TK-360x480%20%281%29.jpg_%25f88a7092-4b33-42ac-9a24-191d954b0f3b.jpeg
922	922	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734369889_img_%25bivwcyQu.-360x480%20%281%29.jpg_%257d86de7a-c983-4956-9e19-d6ccbb0dc146.jpeg
923	923	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729397082_img_%25168.jpg_%25116506fe-76a9-4ac5-b3e0-1749b5079eee.jpeg
924	924	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719622294_img_%255UVLhbLv-540x720%20%281%29.jpg_%2505a3111f-8178-4bef-9330-4ebe0b87473d.jpeg
925	925	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683105901_img_%25snapedit_1745683222626.jpg_%25ebaf2bac-e79a-4b91-a1d7-82df00888e44.jpeg
926	926	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727722099_img_%2589.jpg_%256bee859e-7041-4893-8384-3909e4dae808.jpeg
927	927	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745717296867_img_%25CY2Ibxdr-360x480%20%281%29.jpg_%25fb6e58f4-091f-4f30-90bc-244fcc8fd5d8.jpeg
928	928	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761550369_img_%2515076492821725343708.jpg_%25b3a7d374-4322-4e4a-8eb4-2b4e28f063cc.jpeg
929	929	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728009721_img_%25167.jpg_%256badf91e-8fb6-425b-a4d8-183a03df7b3b.jpeg
930	930	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732467201_img_%2514OLfTDU-360x480%20%282%29%20%281%29.jpg_%252b02f8de-ac92-43b5-a487-d92fdd37857e.jpeg
931	931	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728805308_img_%2532.jpg_%257c8f26df-1ed4-43bd-9505-50b8013fe7ea.jpeg
932	932	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678616107_img_%25snapedit_1745678704137_%253b44af88-3770-4adb-9edb-cf10d3fff632.jpeg
933	933	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727114297_img_%25135.jpg_%2516489423-f14d-4658-941b-d1a94e34ef75.jpeg
934	934	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729756043_img_%25108.jpg_%25d5a96cde-8c6f-4101-9eeb-ced42775411f.jpeg
935	935	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761550369_img_%2515076492821725343708.jpg_%25b3a7d374-4322-4e4a-8eb4-2b4e28f063cc.jpeg
936	936	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683625667_img_%25y90mMDVu-360x480%20%281%29.jpg_%2580b0934b-caf7-406a-8a9f-db405d6ddf4d.jpeg
937	937	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718378312_img_%25LK8lzQWE.-360x480%20%281%29.jpg_%2519e8d378-f698-481f-aafe-972a22d7d099.jpeg
938	938	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729158610_img_%2573.jpg_%254e835e3c-1589-4f1a-85d5-8918a9a7e9f1.jpeg
939	939	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728213249_img_%2526.jpg_%259ed4d6fe-0e34-4715-9690-cb6ed65ab66c.jpeg
940	940	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729934426_img_%25snapedit_1745130203029.jpg_%257e55fb16-ff1a-474a-a730-7404e5548061.jpeg
941	941	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728345784_img_%2582.jpg_%25f7d34100-492c-476c-b58d-6f9edd82f778.jpeg
942	942	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727695489_img_%25177.jpg_%2515bdebd2-25a3-4696-abe8-b29323fdd290.jpeg
943	943	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673178154_img_%25snapedit_1744431111188.jpg_%25edef0edb-0d45-4864-a0a0-c90a0386eac2.jpeg
944	944	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745737059532_img_%25TNpzcbvr-360x480%20%281%29.jpg_%25c6415c79-ee2d-4cb9-ba29-8b34e7024fbe.jpeg
945	945	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678409163_img_%25Screenshot%202025-04-26%20214214_%2548c302dc-2da5-40ef-90ad-94cef68f9e4a.png
946	946	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759628773_img_%25hghdsjkalnhyhn.jpg_%25519cfdc7-c1b3-4c9c-a037-3e6931e1f357.jpeg
947	947	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727030759_img_%25119.jpg_%25ecf30237-0e1c-4ae7-bf68-648df07206af.jpeg
948	948	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727914649_img_%2511.jpg_%251ccfd146-b89c-4b77-8918-eafd58fd97ac.jpeg
949	949	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685848553_img_%25oOkKsoSE.-360x480.jpg_%25e117116e-e2a5-48d4-ac56-e63f5e509985.jpeg
950	950	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760422231_img_%25sdfgyuiolkjhyuj.jpg_%2524b7a0d3-9e41-4b13-9043-c21825641244.jpeg
951	951	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679020171_img_%25snapedit_1745679019081_%2588ac7536-ccef-40c6-b766-bba7b57f020c.jpeg
952	952	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715925946_img_%252Ia5MLG5-540x720%20%281%29.jpg_%25ad83ba65-b10d-45eb-bb1d-5ffca85a5788.jpeg
953	953	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760228932_img_%25ertyuio%3Btr456uikmnbvf.jpg_%257b62bc38-2d1b-432f-a7fc-9d1fba19a1df.jpeg
954	954	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761066268_img_%25asdtyknbvcghjk_%2558465148-a5ae-4eeb-9bb4-8ffe4684e0d5.jpeg
955	955	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681192493_img_%25fcd113be-503c-47e7-81f3-ed7390a6225e_%25c2c0c561-85fd-46f8-bf27-a3962e8e2e1b.png
956	956	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715579673_img_%25Betterimage.ai_1745715627172_%252177f5cb-8cef-4ea4-8cf5-25060da4c947.jpeg
957	957	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762556317_img_%2539.jpg_%251012b03e-2053-419a-8f3f-c44ad82a2721.jpeg
958	958	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716992588_img_%25L0A34vUg.-540x720%20%281%29.jpg_%251a73318a-05df-4366-ae73-96a6d1ef831c.jpeg
959	959	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733088709_img_%250d03LamJ.-360x480%20%281%29.jpg_%25d9c06a7c-da83-4b30-96b8-b579741737aa.jpeg
960	960	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727381679_img_%2595.jpg_%255f3118ed-cc8e-4145-ba5a-f3a052b3e33e.jpeg
961	961	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745726997024_img_%25snapedit_1745112776953.jpg_%256347c432-6d70-4afa-877d-971f4b23665c.jpeg
962	962	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684251086_img_%25jQf5etNn-540x720%20%281%29.jpg_%2502ae639d-f161-47b1-aa10-c12d23814780.jpeg
963	963	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764124715_img_%25kjhgfdsdfghjkl%2Cmnb.jpg_%25e71e274b-8a31-4512-9755-887040b76690.jpeg
964	964	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728405426_img_%25snapedit_1745678755398_%2518346031-7d08-46d2-9441-f2f94c233586.jpeg
965	965	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680245021_img_%253f111ca1-8b5f-42d7-ba0c-28d30f857427_%2565d3b37a-7c2e-497a-af1f-957571462201.png
966	966	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729508646_img_%2536.jpg_%2586e59792-5d98-47bc-b150-a2de5cbbacba.jpeg
967	967	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734751726_img_%25pjUWo9b9-540x720%20%281%29.jpg_%2553e4f0db-7467-4e1a-adaa-d6ae9a90f27b.jpeg
968	968	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731797377_img_%25Z8YizFaX-540x720%20%281%29.jpg_%25be91c4fa-3c65-4fe0-b966-5fd0bc8a9f34.jpeg
969	969	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760698588_img_%25ytsdfghjkjhyhn.jpg_%257b943e01-9f87-47bd-9fd0-1bcd5f1029ff.jpeg
970	970	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729182596_img_%2557.jpg_%257ab335a9-f899-4d7f-aa8a-ad83d3dfae8b.jpeg
971	971	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673178154_img_%25snapedit_1744431111188.jpg_%25edef0edb-0d45-4864-a0a0-c90a0386eac2.jpeg
972	972	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734182230_img_%25j0KTThII.-360x480%20%281%29.jpg_%25f1df47f7-2e52-4796-980d-3b322d0f35cb.jpeg
973	973	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727114297_img_%25135.jpg_%2516489423-f14d-4658-941b-d1a94e34ef75.jpeg
974	974	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728038163_img_%25124.jpg_%2595a5514a-a0ce-4540-89e9-b628e6360ef5.jpeg
975	975	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682434736_img_%25e37bc554-bf05-4744-a8b7-7d8cc986c5b9_%251d9b03f6-d62a-4ef5-8764-ab962ce49550.png
976	976	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673667994_img_%25snapedit_1745074090053.jpg_%257cb5d07b-a28c-4ebe-bff3-e6997c50b349.jpeg
977	977	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736294720_img_%25304oBQNH-540x720%20%281%29.jpg_%2510f28e88-073f-4b44-8fac-dd92c7e47e95.jpeg
978	978	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764141211_img_%25poigfddfghjkl%3B.jpg_%254bba9966-fcb6-4108-ba16-82d4d02d6f67.jpeg
979	979	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681434379_img_%25bb9e2d9b-ae45-46f4-9a41-e49c79720cbd_%2583904b56-ca2a-4e93-8cdd-7d66ddfd9584.png
980	980	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729017987_img_%251-1707797865-Kos---Kosan-Pondok-Indah-Kamar-Mandi-Dalam-Fasilitas-Lengkap---Jakarta.jpg_%257da6e7d5-499c-49e7-9cf7-64f44b82011e.jpeg
981	981	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763041044_img_%25ftyuiop%3B%2Cnbgttyk.jpg_%25f306bb7a-6652-4321-bf61-e6ab4da274b2.jpeg
982	982	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759134158_img_%25gffffghjmjuhhn.jpg_%2519e677e3-4533-4bbd-982d-d10cfc5aeff1.jpeg
983	983	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760941035_img_%25drtyuiknbvfyum.jpg_%2559123121-aa40-4ee9-ad36-f7372fd3b2f7.jpeg
984	984	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758798880_img_%25listing-235061894_x2.jpg_%2531779064-35e5-4a21-b00b-4d5ee1f855b2.jpeg
985	985	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681234675_img_%259abc1def-de24-4ef4-a601-ecf205add8d8_%252eec4bcf-b9fb-4c5a-8d96-a12b3bf89d5c.png
986	986	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761832825_img_%25rtyuiop%5B%3Blgttyuikl..jpg_%250fd480b3-f4d3-45df-bf70-a6102262e4b7.jpeg
987	987	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728285635_img_%25142.jpg_%2552d06ad4-56f2-40ec-ab55-bef98003fd01.jpeg
988	988	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761115478_img_%25edfgkjhyyj.jpg_%25ad296f82-48cc-48be-b181-9dc1b70dff66.jpeg
989	989	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727438799_img_%2544.jpg_%254d333e28-4f9d-43f3-97a2-054b1b76c528.jpeg
990	990	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733805695_img_%25Ga5cdygH.-360x480%20%281%29.jpg_%25ba20666d-9716-4a32-aa23-dfb0cfbfac0e.jpeg
991	991	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683750887_img_%25qZpqLyKT-540x720%20%281%29.jpg_%251d8a6dda-4399-4fe0-ba9d-4f0edfcd2e29.jpeg
992	992	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762777631_img_%25fdfghjk%2Cmjujm%2C.jpg_%2523d8aec1-b07b-4ad4-80f9-101b9f39d9ea.jpeg
993	993	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719979800_img_%25zyAyGSwH-540x720%20%281%29.jpg_%255c21565a-ee0a-49bf-b34d-0f9cc26e6f80.jpeg
994	994	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682522231_img_%25ChatGPT%20Image%20Apr%2026%2C%202025%2C%2010_50_34%20PM_%2599cea16c-ad57-44d3-8bb3-baf03124b3dc.png
995	995	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757737981_img_%25iMdx77Jg-540x720%20%281%29.jpg_%2511029320-f204-4609-a904-9962d31fe6cf.jpeg
996	996	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719979800_img_%25zyAyGSwH-540x720%20%281%29.jpg_%255c21565a-ee0a-49bf-b34d-0f9cc26e6f80.jpeg
997	997	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672645824_img_%25Screenshot%202025-04-06%20205401_%254e8ff39c-387e-43b0-b5fe-1e40d2070f76.png
998	998	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745730867532_img_%25bb3906d4-48dc-4e25-8b90-0cded2678b9c_%253522b20a-0f20-444d-beee-f69f6496d1f9.png
999	999	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732811537_img_%25y90mMDVu-360x480%20%281%29.jpg_%25a7054ba2-ad58-43ea-9d14-445a33dbd3f7.jpeg
1000	1000	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757792608_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_54_43%20AM_%2519654814-06a2-434c-915c-1a964c39cf18.png
1001	1001	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735557569_img_%25lEjTxMk9-360x480%20%281%29.jpg_%2517d9900e-f3cb-43d2-a5e2-e1e5325ba600.jpeg
1002	1002	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727655818_img_%25180.jpg_%258329435a-6477-4c99-a25a-08f026ab1fcd.jpeg
1003	1003	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729756043_img_%25108.jpg_%25d5a96cde-8c6f-4101-9eeb-ced42775411f.jpeg
1004	1004	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716248651_img_%25yhIloaas.-540x720%20%281%29.jpg_%257ab8e433-f072-4e1f-b9bf-8905c5913f5e.jpeg
1005	1005	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728345784_img_%2582.jpg_%25f7d34100-492c-476c-b58d-6f9edd82f778.jpeg
1006	1006	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728405426_img_%25snapedit_1745678755398_%2518346031-7d08-46d2-9441-f2f94c233586.jpeg
1007	1007	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761091720_img_%25gfdsertyuikhgffv_%25e7556433-9af5-4d48-8095-180a617700dc.jpeg
1008	1008	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731096381_img_%25mghtbrmK.-360x480%20%281%29.jpg_%25f15b1710-0129-4c05-8019-f3841496ee13.jpeg
1009	1009	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727141328_img_%25140.jpg_%25067deb2b-7171-4a40-9258-3f3d44968f4c.jpeg
1010	1010	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729047082_img_%2546.jpg_%25712e5f6e-8c47-442c-8ea4-f2f835195d6c.jpeg
1011	1011	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733805695_img_%25Ga5cdygH.-360x480%20%281%29.jpg_%25ba20666d-9716-4a32-aa23-dfb0cfbfac0e.jpeg
1012	1012	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673548630_img_%25snapedit_1745072680356.jpg_%25bfbbc633-1352-4755-84ba-33506bfc7b53.jpeg
1013	1013	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727677337_img_%25snapedit_1745678963622_%2561750830-a6b0-4b80-8c4a-fc78df9ba183.jpeg
1014	1014	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763672210_img_%25oiuyfdsdfghjk.jpg_%25229d7d82-e011-410e-afbd-58133e42d7c1.jpeg
1015	1015	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680372045_img_%25b9ece2e1-1e16-4b6a-9e1b-6c5e5518be12_%257f216701-faf4-4d25-839e-8b93e39a6081.png
1016	1016	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735608082_img_%25QRogM6u8-540x720%20%281%29.jpg_%252755c245-2897-492a-8b63-b14b20753eea.jpeg
1017	1017	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732659112_img_%25UGZ4QnYc-360x480%20%281%29.jpg_%2526e358b0-bb2f-4a1f-8f03-56fde7831129.jpeg
1018	1018	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672745966_img_%25Screenshot%202025-04-06%20205753_%25ad125b46-400f-41b3-aad3-59171ab395b5.png
1019	1019	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735851884_img_%25N2J3XbhC-360x480%20%281%29.jpg_%2514b6546c-87e5-4944-b8ba-b9b187ae43b0.jpeg
1020	1020	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733731074_img_%25vYxUUw8k-540x720%20%281%29.jpg_%2547afe7b4-5281-47d2-b83e-63ce7bb19507.jpeg
1021	1021	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673477147_img_%25Screenshot%202025-04-19%20204659_%25efa4ad3a-856e-4be0-9944-e582197dd4dd.png
1022	1022	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728360849_img_%25106.jpg_%2534f7c1d0-a984-4352-b780-ce92d444b208.jpeg
1023	1023	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760228932_img_%25ertyuio%3Btr456uikmnbvf.jpg_%257b62bc38-2d1b-432f-a7fc-9d1fba19a1df.jpeg
1024	1024	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736975053_img_%25zwoAXgnm.-540x720%20%281%29.jpg_%2504942a89-fbac-466f-b73f-5b8ad8653713.jpeg
1025	1025	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678616107_img_%25snapedit_1745678704137_%253b44af88-3770-4adb-9edb-cf10d3fff632.jpeg
1026	1026	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728762023_img_%2527.jpg_%25b0d8146c-112d-497c-8ce5-0d18fe11c95c.jpeg
1027	1027	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718228539_img_%258WoQBebx-360x480%20%281%29.jpg_%25174b4902-85c6-4300-bb2c-cc165ffea232.jpeg
1028	1028	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764321996_img_%25snapedit_1745131091135.jpg_%25c6a8f9d5-6dbe-4e16-aacd-483edd284682.jpeg
1029	1029	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685786901_img_%2510KrrycH.-360x480%20%281%29.jpg_%257170e84a-78ae-4a0c-a01d-12354d5fa260.jpeg
1030	1030	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728693152_img_%25115.jpg_%252087e4f2-e4bc-46fe-abcd-2e7a79e7d328.jpeg
1031	1031	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728511680_img_%25122.jpg_%251e518e57-91dc-4478-8cd4-6cf803e03a94.jpeg
1032	1032	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728196327_img_%25144.jpg_%25f878df96-ccd7-4d9d-bfff-c94a7089c899.jpeg
1033	1033	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716224367_img_%257CGMuJSd.-540x720%20%281%29.jpg_%2594d21f4d-0b27-45d4-9e06-ac81b84b7063.jpeg
1034	1034	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759845848_img_%25yfdfghjklkjbv.jpg_%257c760591-adcd-48f9-8310-2139b2749038.jpeg
1035	1035	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761832825_img_%25rtyuiop%5B%3Blgttyuikl..jpg_%250fd480b3-f4d3-45df-bf70-a6102262e4b7.jpeg
1036	1036	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685711870_img_%25nEMSFgzW-360x480%20%281%29.jpg_%25c7ef5407-3cf4-4a19-95aa-4f99ec1423d0.jpeg
1037	1037	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685070991_img_%25yTeYv7Me-360x480%20%281%29.jpg_%259d303dec-9267-4ba8-ac11-6bceb5495b77.jpeg
1038	1038	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764321996_img_%25snapedit_1745131091135.jpg_%25c6a8f9d5-6dbe-4e16-aacd-483edd284682.jpeg
1039	1039	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729085225_img_%25136.jpg_%2521d8d7e7-f0ca-40b1-bb7a-d5605c1aceb5.jpeg
1040	1040	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680957601_img_%2582386784-be14-4cef-9781-607d08fa7f18_%25988f7a58-0a62-48ec-88f6-b96d1a8b4059.png
1041	1041	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680995624_img_%25e16b8412-c052-4da0-be63-807055510347_%25c6508e13-4a94-49b8-a0f6-036e8f20c428.png
1042	1042	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680732290_img_%25e33498e4-503d-478a-b0b3-3482c96aba08_%2538dc5527-d622-44ef-8c9b-21209f35b04f.png
1043	1043	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719417864_img_%254h9SuWWN-360x480%20%281%29.jpg_%2537e18faa-7cee-475b-bfc7-1868073fba5a.jpeg
1044	1044	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745730867532_img_%25bb3906d4-48dc-4e25-8b90-0cded2678b9c_%253522b20a-0f20-444d-beee-f69f6496d1f9.png
1045	1045	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680459552_img_%25ad655755-9d21-46b6-9c1d-9a201d99ece4_%25880b8af8-8090-4d62-be37-c228b71b230c.png
1046	1046	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736294720_img_%25304oBQNH-540x720%20%281%29.jpg_%2510f28e88-073f-4b44-8fac-dd92c7e47e95.jpeg
1047	1047	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729756043_img_%25108.jpg_%25d5a96cde-8c6f-4101-9eeb-ced42775411f.jpeg
1048	1048	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728266544_img_%25123.jpg_%25c15f6517-16dd-415f-b83d-962e9276e61c.jpeg
1049	1049	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736453966_img_%25trrF7nQa-540x720%20%281%29.jpg_%2536232ac1-9911-48f6-b6f1-aa3f2da9945a.jpeg
1050	1050	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728609231_img_%25143.jpg_%25b0d5f694-268c-4aad-b4a0-c08e0f757415.jpeg
1051	1051	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731300949_img_%25Md5uRUQl.-360x480%20%281%29.jpg_%2577b775bd-9d54-4b3f-a1ee-484bc5eacd19.jpeg
1052	1052	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745677739420_img_%25Screenshot%202025-04-26%20213050_%2595368d92-e6bf-48ff-8bf3-ad1e3cf81b6c.png
1053	1053	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732319224_img_%25LqFmeGrO-360x480%20%281%29.jpg_%25a0ba45c5-6bf7-486c-ad8a-117528c14612.jpeg
1054	1054	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678381661_img_%25Screenshot%202025-04-26%20214141_%251a784534-5d7d-4fcd-9a3b-82326e106650.png
1055	1055	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679698110_img_%25Screenshot%202025-04-26%20220132_%25e0c71a37-543d-4419-9593-624ede50c37f.png
1056	1056	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759691374_img_%25rftgyhuioplkjhgfdertyui.jpg_%25ba420d1b-11e3-468d-bf98-e27d430d6d0c.jpeg
1057	1057	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728243199_img_%25108.jpg_%255f0e2c44-4aae-4828-af84-6300d499c9f7.jpeg
1058	1058	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678661319_img_%25snapedit_1745678755398_%254a9df92a-4fa6-4104-b08b-c4087622eeee.jpeg
1059	1059	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758573008_img_%25139.jpg_%259e6e470e-1481-4332-ae47-fb192511c798.jpeg
1060	1060	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731797377_img_%25Z8YizFaX-540x720%20%281%29.jpg_%25be91c4fa-3c65-4fe0-b966-5fd0bc8a9f34.jpeg
1061	1061	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728125449_img_%2533.jpg_%2578320ee2-e6b0-4738-9723-16c357257e6a.jpeg
1062	1062	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728084498_img_%2577.jpg_%2558473cde-462f-466e-87fa-394a58978cf6.jpeg
1063	1063	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759467886_img_%25ydghjnm%2Cyhy.jpg_%25845afe55-5e83-4857-8852-efeb9a0742e6.jpeg
1064	1064	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729824346_img_%2519.jpg_%25d4d13de0-5eb3-483d-a7b7-f15b334304ca.jpeg
1065	1065	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727863299_img_%2574.jpg_%25851b8574-c0f9-4d50-9cfc-60a684c47f0f.jpeg
1066	1066	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763672210_img_%25oiuyfdsdfghjk.jpg_%25229d7d82-e011-410e-afbd-58133e42d7c1.jpeg
1067	1067	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683105901_img_%25snapedit_1745683222626.jpg_%25ebaf2bac-e79a-4b91-a1d7-82df00888e44.jpeg
1068	1068	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736453966_img_%25trrF7nQa-540x720%20%281%29.jpg_%2536232ac1-9911-48f6-b6f1-aa3f2da9945a.jpeg
1069	1069	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727460248_img_%25rumah-kost-subagio-118077431_x2.jpg_%25ecf5e56d-32e4-428a-971a-f307270b2f51.jpeg
1070	1070	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760150347_img_%25dsfghjkllkjhgtyujk_%25c489068d-6646-4cd7-86f9-7643437e1656.jpeg
1071	1071	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679998896_img_%25ea140517-4cf3-437f-815b-6ca733580629_%2550426b78-b6dd-4971-b01f-af4ca279d3be.png
1072	1072	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735901892_img_%253uYdPsTR-360x480%20%282%29.jpg_%25150e5bac-9f1c-44d8-825d-f02047fce3d0.jpeg
1073	1073	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762497058_img_%25dsertyuimnbgth.jpg_%25acebd805-b163-4538-86c0-23b897f5ad98.jpeg
1074	1074	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761927465_img_%25drftyujknbvdrtyukmnb.jpg_%2528c34f59-c999-47ed-9890-f8441efdf780.jpeg
1075	1075	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762712173_img_%25oiuhgffghjkl%3B%27.jpg_%257ae80ca4-b4d7-42e6-ad55-3f58e9c2d4da.jpeg
1076	1076	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763824025_img_%25jhgfdertyuil%2Cmnbgtyu.jpg_%25db238043-03ff-4b79-b5d5-80835361cb93.jpeg
1077	1077	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763866958_img_%25150.jpg_%25a91df04c-548a-4ba8-940b-ade4db55c0da.jpeg
1078	1078	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764321996_img_%25snapedit_1745131091135.jpg_%25c6a8f9d5-6dbe-4e16-aacd-483edd284682.jpeg
1079	1079	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764124715_img_%25kjhgfdsdfghjkl%2Cmnb.jpg_%25e71e274b-8a31-4512-9755-887040b76690.jpeg
1080	1080	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764055275_img_%25listing-695252655_x2.jpg_%2558a18a5c-2f74-40a1-9f5b-2c2862c2df38.jpeg
1081	1081	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762743442_img_%25dfyuil%2Cbfjkl.jpg_%2583b4ef41-966b-424e-b323-04def7fcc8f8.jpeg
1082	1082	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763011558_img_%25dfghjkjhgfdsasdfghjk.jpg_%25142d91dc-cb2d-4159-91ab-0d2d02fabf50.jpeg
1083	1083	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764141211_img_%25poigfddfghjkl%3B.jpg_%254bba9966-fcb6-4108-ba16-82d4d02d6f67.jpeg
1084	1084	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762981149_img_%25108.jpg_%25751cc146-f828-42b3-b69b-973b7aefdda0.jpeg
1085	1085	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761897621_img_%25edfghjkl%3B.jpg_%255e9bfb9e-8142-4385-b13f-166b4c25f44c.jpeg
1086	1086	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764345274_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_08_11%20AM_%25a942e80d-7fa5-4626-85ec-89d0c052fc3f.png
1087	1087	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762777631_img_%25fdfghjk%2Cmjujm%2C.jpg_%2523d8aec1-b07b-4ad4-80f9-101b9f39d9ea.jpeg
1088	1088	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763041044_img_%25ftyuiop%3B%2Cnbgttyk.jpg_%25f306bb7a-6652-4321-bf61-e6ab4da274b2.jpeg
1089	1089	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761877697_img_%25gfdsdfghjkl%3B.jpg_%25573c0bae-89dc-46d9-9c2c-195fe7d1b56f.jpeg
1090	1090	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763729788_img_%25fghjkndtyui.jpg_%25f3cdb37d-354a-45bf-b950-f740a4dcd54c.jpeg
1091	1091	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685711870_img_%25nEMSFgzW-360x480%20%281%29.jpg_%25c7ef5407-3cf4-4a19-95aa-4f99ec1423d0.jpeg
1092	1092	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763708892_img_%25iuyttyuill%2Cmnbg.jpg_%25943c3102-5676-4877-96ba-8bbd348167cb.jpeg
1093	1093	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761861056_img_%25uytrewertyuilknbfertyu.jpg_%25d57e6999-4156-4df2-9ae4-1445bd199d32.jpeg
1094	1094	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758525077_img_%25fygdhcushcydfu.jpg_%257b1f2631-b032-4371-b220-5a975bb87325.jpeg
1095	1095	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763672210_img_%25oiuyfdsdfghjk.jpg_%25229d7d82-e011-410e-afbd-58133e42d7c1.jpeg
1096	1096	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764277720_img_%25112.jpg_%25f54fe11f-fc8b-4cc6-b8a1-a9d9cc9b40ff.jpeg
1097	1097	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763511981_img_%25ertyuiohg.jpg_%25c0c7c4e0-2fb8-491e-b4ce-824c008c995f.jpeg
1098	1098	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763467552_img_%2579.jpg_%25e577aa31-8046-45e7-9e56-06145770cb66.jpeg
1099	1099	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761811429_img_%25hgfghjk%2Cmnbfghjkl.jpg_%25b300b803-fbfa-4deb-aafe-94beba12d0bd.jpeg
1100	1100	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761832825_img_%25rtyuiop%5B%3Blgttyuikl..jpg_%250fd480b3-f4d3-45df-bf70-a6102262e4b7.jpeg
1101	1101	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681468476_img_%25cbd40244-d779-43e4-a90d-714866b72df7_%25dee4641b-f196-4e72-a3c8-5869e6aaf6ee.png
1102	1102	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763433136_img_%25fghjkl%3B%2Cmhyh.jpg_%254048d80f-7102-45ba-9b5f-4127cfcfbeaf.jpeg
1103	1103	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763412070_img_%25hjklllllll%2Cmhyuik.jpg_%253f48d95b-d99f-4715-ae57-71fbe3103f35.jpeg
1104	1104	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763391186_img_%2593.jpg_%251f831ced-1abd-4473-88f3-4ce46f239918.jpeg
1105	1105	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763350713_img_%25578113ce-7cdb-40fd-ada8-1e18a4ae80fd_%25ea4c8227-c7b1-4c52-964a-b5cb0d1c62e9.png
1106	1106	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763320568_img_%25kjhgsasrtyuio%3B.jpg_%25968c3949-a618-4604-8e55-4447d7a0acab.jpeg
1107	1107	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762556317_img_%2539.jpg_%251012b03e-2053-419a-8f3f-c44ad82a2721.jpeg
1108	1108	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745763295357_img_%25cbd40244-d779-43e4-a90d-714866b72df7_%259d32f2ba-4d88-467f-9585-a25ab6674851.png
1109	1109	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762497058_img_%25dsertyuimnbgth.jpg_%25acebd805-b163-4538-86c0-23b897f5ad98.jpeg
1110	1110	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762263788_img_%25fdedfghjkl%3B%27.jpg_%256a38a051-43ca-4e8d-b7e1-6688933346f4.jpeg
1111	1111	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745762226020_img_%2573.jpg_%25de0d3d6c-52aa-482e-8151-00979549274d.jpeg
1112	1112	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761786817_img_%25drftyujknbvdrtyukmnb.jpg_%255b665f3a-7423-4e92-b656-3a9be8a391c9.jpeg
1113	1113	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761963218_img_%25sasrtyuio%3Blmnbghjkl.jpg_%25bd7827b7-5533-4a28-ab53-45136318b874.jpeg
1114	1114	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679092107_img_%25snapedit_1745679166503_%25aec8215e-01fb-46d6-b779-1e9688e266e2.jpeg
1115	1115	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761550369_img_%2515076492821725343708.jpg_%25b3a7d374-4322-4e4a-8eb4-2b4e28f063cc.jpeg
1116	1116	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764243277_img_%25144.jpg_%25de55cce1-529c-4bcf-ab4f-9e937a2d2007.jpeg
1117	1117	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761623087_img_%25fhhhnk%2C.jpg_%25bccfacdc-9f6a-4f85-a6cc-164d8cd24175.jpeg
1118	1118	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761115478_img_%25edfgkjhyyj.jpg_%25ad296f82-48cc-48be-b181-9dc1b70dff66.jpeg
1119	1119	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761440625_img_%25ertyhgfdfghj.jpg_%2533032b96-f236-4835-b930-d4a042ef654f.jpeg
1120	1120	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761419083_img_%25edfghjkl%3B.jpg_%2517faf11b-3dbb-444b-8872-b6f4b305b591.jpeg
1121	1121	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761394894_img_%25kost-eksklusif-murah-dekat-kampus-832789855.jpg_%258243871e-428d-4909-86f9-28447279c172.jpeg
1122	1122	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761091720_img_%25gfdsertyuikhgffv_%25e7556433-9af5-4d48-8095-180a617700dc.jpeg
1123	1123	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760827068_img_%25asjkmuung.jpg_%255003a6ae-1a6e-4b5f-ac41-032d6a25e64e.jpeg
1124	1124	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745761066268_img_%25asdtyknbvcghjk_%2558465148-a5ae-4eeb-9bb4-8ffe4684e0d5.jpeg
1125	1125	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760941035_img_%25drtyuiknbvfyum.jpg_%2559123121-aa40-4ee9-ad36-f7372fd3b2f7.jpeg
1126	1126	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760422231_img_%25sdfgyuiolkjhyuj.jpg_%2524b7a0d3-9e41-4b13-9043-c21825641244.jpeg
1127	1127	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760773648_img_%25saaertyujgyuj.jpg_%258f8fb433-b22f-4b54-b35a-0ae58f0da9c3.jpeg
1128	1128	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760723928_img_%25sertyuiolmnhyh.jpg_%2563936875-37bd-40af-b636-59b7ff987a17.jpeg
1129	1129	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760698588_img_%25ytsdfghjkjhyhn.jpg_%257b943e01-9f87-47bd-9fd0-1bcd5f1029ff.jpeg
1130	1130	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760467796_img_%25dcvbhjujm%2Ckjyt.jpg_%25edc5f060-3253-44ce-a6fd-f2fe4ea43ba3.jpeg
1131	1131	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760447215_img_%25dfghjkl%3Blkjhgfrtyu.jpg_%256466424b-52af-41e6-b39d-9b7831011fd5.jpeg
1132	1132	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760254516_img_%25gfdsdfghjkl%3Bliu7y.jpg_%25385f01ad-ede4-4298-bfd1-b3f58eed977a.jpeg
1133	1133	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760228932_img_%25ertyuio%3Btr456uikmnbvf.jpg_%257b62bc38-2d1b-432f-a7fc-9d1fba19a1df.jpeg
1134	1134	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759749968_img_%25dedrtyujnbgfrtyuiojhbhnm%2Cs.jpg_%2551ec4dc1-b4c4-479b-b0be-967302c43f9e.jpeg
1135	1135	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760150347_img_%25dsfghjkllkjhgtyujk_%25c489068d-6646-4cd7-86f9-7643437e1656.jpeg
1136	1136	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760123101_img_%25zxfcghjklkjhytr5rtghbn.jpg_%252ea6b919-7d1d-4edf-a80e-d73371cd2482.jpeg
1137	1137	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745760083857_img_%25hcxzasrtyuil%2Cmnbvfrg.jpg_%25364d4c27-e139-460d-9b7f-3ee714fb7214.jpeg
1138	1138	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759876732_img_%25drtyuiolkjhgcf.jpg_%250365494f-84f9-4845-b8f9-38dd23ca7f92.jpeg
1139	1139	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759845848_img_%25yfdfghjklkjbv.jpg_%257c760591-adcd-48f9-8310-2139b2749038.jpeg
1140	1140	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759691374_img_%25rftgyhuioplkjhgfdertyui.jpg_%25ba420d1b-11e3-468d-bf98-e27d430d6d0c.jpeg
1141	1141	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759655457_img_%25jhgfdghjgklh%3Boiuy.jpg_%25a727e827-7922-4b55-8744-0d89e776f43d.jpeg
1142	1142	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759628773_img_%25hghdsjkalnhyhn.jpg_%25519cfdc7-c1b3-4c9c-a037-3e6931e1f357.jpeg
1143	1143	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759467886_img_%25ydghjnm%2Cyhy.jpg_%25845afe55-5e83-4857-8852-efeb9a0742e6.jpeg
1144	1144	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759246523_img_%25120.jpg_%25ce1db31e-4573-4bf6-83a7-082526f02d03.jpeg
1145	1145	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759174391_img_%25ghdjskiurjer.jpg_%2562085939-3756-4643-a3db-0c3b22544bab.jpeg
1146	1146	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759154043_img_%25hjkld%3Bx.%2Cmjhhujfcmnb.jpg_%257735b832-0128-4d80-8c07-caee25439a33.jpeg
1147	1147	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764207919_img_%2584.jpg_%25b91e28d7-6cd0-4b63-bec7-f4210aa8a4cc.jpeg
1148	1148	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759134158_img_%25gffffghjmjuhhn.jpg_%2519e677e3-4533-4bbd-982d-d10cfc5aeff1.jpeg
1149	1149	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759022867_img_%25jhgddyfds.jpg_%25abc8f59e-4a4c-40f2-acf0-e9829fa0aea3.jpeg
1150	1150	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745759067736_img_%2555.jpg_%2516174d15-2816-48c5-afd3-8a19a7b83a8a.jpeg
1151	1151	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758573008_img_%25139.jpg_%259e6e470e-1481-4332-ae47-fb192511c798.jpeg
1152	1152	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758846993_img_%25jduhygiub.jpg_%254b839e00-c794-4089-8bdc-7ce9ac368ded.jpeg
1153	1153	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758952527_img_%25gffffghjmjuhhn.jpg_%25e01fb3e8-d7b4-4880-84e8-f168e4486cfb.jpeg
1154	1154	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758819059_img_%25djhfgygdusjkl.jpg_%25495655da-c75d-4852-b339-67e92e2df25a.jpeg
1155	1155	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758798880_img_%25listing-235061894_x2.jpg_%2531779064-35e5-4a21-b00b-4d5ee1f855b2.jpeg
1156	1156	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758708796_img_%25fjhuidik.jpg_%255badd267-9d81-41a3-991e-ff5b04b62420.jpeg
1157	1157	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758637070_img_%25kost-177-kampus-maranatha-2007512025_x2.jpg_%259b067a1c-60e5-4114-99de-28408e5cdf28.jpeg
1158	1158	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673667994_img_%25snapedit_1745074090053.jpg_%257cb5d07b-a28c-4ebe-bff3-e6997c50b349.jpeg
1159	1159	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758525077_img_%25fygdhcushcydfu.jpg_%257b1f2631-b032-4371-b220-5a975bb87325.jpeg
1160	1160	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758455075_img_%25ojhgfdfghjkknbvdrtyh.jpg_%25851a0022-3ec1-4556-8283-938672683f20.jpeg
1161	1161	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758301314_img_%25dugsdskdka%2Cb.jpg_%2589cd42a9-8be0-44ce-9beb-4d161dd42e42.jpeg
1162	1162	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758274119_img_%25jdfhfsjkaksa.jpg_%25a2c261b4-e62a-40b1-be24-cfbd72036495.jpeg
1163	1163	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745758250683_img_%25sdgjskf9yfh7.jpg_%251816459b-a527-42cd-b154-4a0bd9d86ddc.jpeg
1164	1164	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757997686_img_%2512%20redfsg.jpg_%25608403da-384e-4be5-9d32-e3a579ab6ce3.jpeg
1165	1165	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745764174546_img_%25128.jpg_%25ef4a9a03-185b-4ba8-b162-5eba6fbdadc7.jpeg
1166	1166	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678409163_img_%25Screenshot%202025-04-26%20214214_%2548c302dc-2da5-40ef-90ad-94cef68f9e4a.png
1167	1167	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757887548_img_%25102.jpg_%258e947b25-39b8-44ad-98dd-24d876b083c9.jpeg
1168	1168	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757792608_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_54_43%20AM_%2519654814-06a2-434c-915c-1a964c39cf18.png
1169	1169	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757737981_img_%25iMdx77Jg-540x720%20%281%29.jpg_%2511029320-f204-4609-a904-9962d31fe6cf.jpeg
1170	1170	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757563186_img_%25lPFDD4uK-360x480%20%282%29.jpg_%25361e5b3b-e9f9-40d2-9c5f-3475a035f49a.jpeg
1171	1171	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745757199483_img_%25h8KA05sK-360x480%20%281%29.jpg_%2511263c9d-972e-4de6-b706-85ed0765065b.jpeg
1172	1172	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745756860073_img_%25kPbuHarG.-360x480%20%281%29.jpg_%25722f6e90-cf36-4852-b6d5-001d1aa55004.jpeg
1173	1173	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745756746145_img_%250V2ciaJZ.-360x480%20%281%29.jpg_%25bf7fb2b1-c1c6-4365-a7e1-da0326e46a47.jpeg
1174	1174	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745737059532_img_%25TNpzcbvr-360x480%20%281%29.jpg_%25c6415c79-ee2d-4cb9-ba29-8b34e7024fbe.jpeg
1175	1175	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745737012502_img_%25SRbiAxcW-540x720%20%281%29.jpg_%257e7af819-5ee1-484f-bef8-00ca34040593.jpeg
1176	1176	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736975053_img_%25zwoAXgnm.-540x720%20%281%29.jpg_%2504942a89-fbac-466f-b73f-5b8ad8653713.jpeg
1177	1177	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736933603_img_%25qBVPRANP-540x720%20%281%29.jpg_%25c2467444-85bc-41fd-9e51-b0c153de631e.jpeg
1178	1178	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736875951_img_%25W6PsjaKM.-540x720%20%281%29.jpg_%25b6100d11-aa03-489c-be0f-640ad656a42b.jpeg
1179	1179	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736649268_img_%2534sb8qQd-360x480%20%281%29.jpg_%25955fbe97-7eff-4cae-ac04-4a97bbc54de1.jpeg
1180	1180	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736601815_img_%257la3Ee0J-360x480%20%281%29.jpg_%25c8df5cea-9509-4f1d-ad10-8c1b54723f72.jpeg
1181	1181	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736547897_img_%25yQI34Bw1-360x480%20%281%29.jpg_%25f85aa08f-95fa-4e2f-9b8c-05459bc862e0.jpeg
1182	1182	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736508313_img_%25oBgUzkxE.-360x480%20%281%29.jpg_%25de61b0db-30fa-4406-a509-02d69755f652.jpeg
1183	1183	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736453966_img_%25trrF7nQa-540x720%20%281%29.jpg_%2536232ac1-9911-48f6-b6f1-aa3f2da9945a.jpeg
1184	1184	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736402428_img_%25sFhhcmdJ-360x480%20%281%29.jpg_%25734cb6f2-9908-4ade-b1c6-1b8c83013f06.jpeg
1185	1185	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736367335_img_%25xpGA9MPH.-360x480%20%281%29.jpg_%258427af41-0465-4db9-9b58-d4eadb925f7c.jpeg
1186	1186	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736329290_img_%25PNlVdFfy.-360x480%20%281%29.jpg_%25d969fada-a50d-4187-9094-474af031e7cb.jpeg
1187	1187	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745736294720_img_%25304oBQNH-540x720%20%281%29.jpg_%2510f28e88-073f-4b44-8fac-dd92c7e47e95.jpeg
1188	1188	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735981243_img_%25CY2Ibxdr-360x480%20%281%29.jpg_%2558d65d77-1ef7-42df-b85d-e5bff9028391.jpeg
1189	1189	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735901892_img_%253uYdPsTR-360x480%20%282%29.jpg_%25150e5bac-9f1c-44d8-825d-f02047fce3d0.jpeg
1190	1190	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735851884_img_%25N2J3XbhC-360x480%20%281%29.jpg_%2514b6546c-87e5-4944-b8ba-b9b187ae43b0.jpeg
1191	1191	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735795179_img_%25gPO22UDz-540x720%20%281%29.jpg_%2526aff4bc-3840-43f8-b869-71ede648c6cf.jpeg
1192	1192	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735608082_img_%25QRogM6u8-540x720%20%281%29.jpg_%252755c245-2897-492a-8b63-b14b20753eea.jpeg
1193	1193	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735557569_img_%25lEjTxMk9-360x480%20%281%29.jpg_%2517d9900e-f3cb-43d2-a5e2-e1e5325ba600.jpeg
1194	1194	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735490304_img_%25ByxuX0E7.-540x720%20%281%29.jpg_%25f509469c-75ff-43cc-9202-32491ab5a9ad.jpeg
1195	1195	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735449952_img_%25EgPUVk9I-360x480%20%281%29.jpg_%250255d7ca-76d9-48ae-9f2f-da5b887e5896.jpeg
1196	1196	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735429456_img_%25SIKsYa4l-540x720%20%281%29.jpg_%25971ed692-c264-4feb-992d-f7255ea4282f.jpeg
1197	1197	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735353676_img_%25iyXNNbfH-540x720%20%281%29.jpg_%255d7469f9-ca03-4e6d-abe8-5d958dadb558.jpeg
1198	1198	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745735346495_img_%25vWVN4IrP-360x480%20%281%29.jpg_%25a587b61b-fa6d-4e2c-9780-f3e5103c696e.jpeg
1199	1199	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734863125_img_%25uWGJ2wIe-360x480%20%281%29.jpg_%25ec0e552a-fb7d-415f-85f7-ab076f735d7c.jpeg
1200	1200	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734776334_img_%25RMGBPLnY.-360x480%20%281%29.jpg_%25002b35a4-4730-4c13-8860-6528ca410a3b.jpeg
1201	1201	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734760351_img_%25lw6ZQnHS-360x480%20%282%29%20%281%29.jpg_%25e34bc124-8ff5-467d-89aa-ac1cfa92a665.jpeg
1202	1202	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734751726_img_%25pjUWo9b9-540x720%20%281%29.jpg_%2553e4f0db-7467-4e1a-adaa-d6ae9a90f27b.jpeg
1203	1203	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734740043_img_%25Wxx1KCKW-360x480%20%281%29.jpg_%251c0a5f9b-6841-4fbd-8ae4-92a5c50ed68c.jpeg
1204	1204	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734369889_img_%25bivwcyQu.-360x480%20%281%29.jpg_%257d86de7a-c983-4956-9e19-d6ccbb0dc146.jpeg
1205	1205	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734361702_img_%25sJSCYO6q-540x720%20%281%29.jpg_%25c2aa40f7-47ff-4160-a4e8-824e6596bf48.jpeg
1206	1206	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734352336_img_%25mz6lsU9v.-360x480%20%281%29.jpg_%254c1bfa7d-b42a-4b64-ba67-d31f0099fd63.jpeg
1207	1207	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734203799_img_%25eFkpV7nQ.-360x480%20%281%29.jpg_%2513c04796-f20b-44e9-a9f0-a763df13e030.jpeg
1208	1208	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734194486_img_%25ak9vqx9I-360x480%20%281%29.jpg_%250ddbcb94-3636-4c1c-a345-df06c6701e9e.jpeg
1209	1209	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745734182230_img_%25j0KTThII.-360x480%20%281%29.jpg_%25f1df47f7-2e52-4796-980d-3b322d0f35cb.jpeg
1210	1210	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733844421_img_%25Wt2aZYfI-360x480%20%281%29.jpg_%25612741fb-0381-4ce5-87cc-6d90aee30e47.jpeg
1211	1211	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733805695_img_%25Ga5cdygH.-360x480%20%281%29.jpg_%25ba20666d-9716-4a32-aa23-dfb0cfbfac0e.jpeg
1212	1212	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733778546_img_%25RhhiZzzw-540x720%20%281%29.jpg_%25c70b56af-107a-4810-b153-e190b7946710.jpeg
1213	1213	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733731074_img_%25vYxUUw8k-540x720%20%281%29.jpg_%2547afe7b4-5281-47d2-b83e-63ce7bb19507.jpeg
1214	1214	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733690758_img_%25jsbozU55-540x720%20%281%29.jpg_%25ce0c5261-e982-4d31-b480-2055d1976c51.jpeg
1215	1215	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733626535_img_%257f1UJo0i-540x720%20%281%29.jpg_%257ec84995-108e-4f44-a34e-cd5a8675ce4f.jpeg
1216	1216	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733586985_img_%250Ih6ZU0h.-360x480%20%281%29.jpg_%2536905939-fa57-4533-b5da-a13a069495b0.jpeg
1217	1217	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733273188_img_%25YxhQfi5a-540x720%20%281%29.jpg_%253945aa47-647c-43aa-bbd6-09aca269ca0b.jpeg
1218	1218	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733238779_img_%25ngtLdl27-540x720%20%281%29.jpg_%25371cfab1-9b4a-45b6-9af7-dfe7c1b746b7.jpeg
1219	1219	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733171840_img_%2567HNZudS.-360x480%20%281%29.jpg_%25c07b3727-8bb3-4384-8de5-a2c5e633ebb6.jpeg
1220	1220	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733122447_img_%25dhO7Ok9S-360x480%20%281%29.jpg_%2504588440-78c1-4b6d-8a9b-9c2a5189db1c.jpeg
1221	1221	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745733088709_img_%250d03LamJ.-360x480%20%281%29.jpg_%25d9c06a7c-da83-4b30-96b8-b579741737aa.jpeg
1222	1222	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732811537_img_%25y90mMDVu-360x480%20%281%29.jpg_%25a7054ba2-ad58-43ea-9d14-445a33dbd3f7.jpeg
1223	1223	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732774866_img_%25LLK8g6fn-540x720%20%281%29.jpg_%25c4589194-2504-40bc-8842-e831a1655430.jpeg
1224	1224	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732659112_img_%25UGZ4QnYc-360x480%20%281%29.jpg_%2526e358b0-bb2f-4a1f-8f03-56fde7831129.jpeg
1225	1225	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673747233_img_%25snapedit_1745075820870.jpg_%256f60486e-f05c-4aa4-9e9d-102c7a3e6931.jpeg
1226	1226	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732467201_img_%2514OLfTDU-360x480%20%282%29%20%281%29.jpg_%252b02f8de-ac92-43b5-a487-d92fdd37857e.jpeg
1227	1227	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728125449_img_%2533.jpg_%2578320ee2-e6b0-4738-9723-16c357257e6a.jpeg
1228	1228	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732319224_img_%25LqFmeGrO-360x480%20%281%29.jpg_%25a0ba45c5-6bf7-486c-ad8a-117528c14612.jpeg
1229	1229	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732305766_img_%25uQGpJmxf.-540x720%20%281%29.jpg_%258a4c052a-21c8-4e64-855f-650df7e4d86a.jpeg
1230	1230	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732124401_img_%25evRR73mX.-360x480%20%281%29.jpg_%25c6f0edd2-6cfb-4ac2-8e15-ac14a52d6e4c.jpeg
1231	1231	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731836123_img_%25TtlTkhRA.-360x480%20%281%29.jpg_%25c9a902a9-ee63-470b-a6f1-a6fa272dbca0.jpeg
1232	1232	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731797377_img_%25Z8YizFaX-540x720%20%281%29.jpg_%25be91c4fa-3c65-4fe0-b966-5fd0bc8a9f34.jpeg
1233	1233	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731679840_img_%257CGMuJSd.-540x720%20%281%29.jpg_%259a92ded4-fe10-4c61-8cdb-75ccc2856abd.jpeg
1234	1234	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731648162_img_%25r2PejhrT-540x720%20%281%29.jpg_%25bf580f22-74b0-4c51-8cd7-337777db9cf9.jpeg
1235	1235	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731603740_img_%25pFEvuFUJ-540x720%20%281%29.jpg_%256b35d504-5f8f-4692-a9d6-8edbbe88a017.jpeg
1236	1236	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731300949_img_%25Md5uRUQl.-360x480%20%281%29.jpg_%2577b775bd-9d54-4b3f-a1ee-484bc5eacd19.jpeg
1237	1237	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731353493_img_%25MbwpguqB.-540x720%20%281%29.jpg_%25e0947a7e-28ec-4346-822f-1d72760817cf.jpeg
1238	1238	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745732305766_img_%25uQGpJmxf.-540x720%20%281%29.jpg_%258a4c052a-21c8-4e64-855f-650df7e4d86a.jpeg
1239	1239	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731106132_img_%25PXvBKoAY.-360x480%20%281%29.jpg_%250591a6e6-b863-4d0f-a3bb-7a5e0e814909.jpeg
1240	1240	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727762641_img_%25150.jpg_%250306c7ba-741c-45b5-9c35-5445411f2853.jpeg
1241	1241	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745731096381_img_%25mghtbrmK.-360x480%20%281%29.jpg_%25f15b1710-0129-4c05-8019-f3841496ee13.jpeg
1242	1242	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745730678253_img_%25image_%2575c0cd6f-6496-4370-aabb-d6bacbde4512.png
1243	1243	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745730000800_img_%2554.jpg_%2518801688-2ce4-41cf-9ed0-bed56642f653.jpeg
1244	1244	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729982310_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_53_26%20AM_%25d8ec3995-f975-443d-ae75-29d500700ad2.png
1245	1245	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729951984_img_%25snapedit_1745113625993.jpg_%25b1b99062-e3b8-4444-9aed-563fb1498b95.jpeg
1246	1246	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729934426_img_%25snapedit_1745130203029.jpg_%257e55fb16-ff1a-474a-a730-7404e5548061.jpeg
1247	1247	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729896734_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2010_25_42%20AM_%2535847739-2677-4c44-9eaa-9b4b762eb008.png
1248	1248	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729860351_img_%254.jpg_%25c66d494c-f077-4307-9b28-1f6c7e2c82bf.jpeg
1249	1249	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729824346_img_%2519.jpg_%25d4d13de0-5eb3-483d-a7b7-f15b334304ca.jpeg
1250	1250	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729794193_img_%2540.jpg_%25ecc0731a-7e15-423b-bf0c-21214ad6f18b.jpeg
1251	1251	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729771537_img_%2557.jpg_%250abe0fa5-5f73-4da1-b02d-a004cca12278.jpeg
1252	1252	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729756043_img_%25108.jpg_%25d5a96cde-8c6f-4101-9eeb-ced42775411f.jpeg
1253	1253	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729526220_img_%2577.jpg_%25f94687c5-f403-455c-911c-06affd544a91.jpeg
1254	1254	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729508646_img_%2536.jpg_%2586e59792-5d98-47bc-b150-a2de5cbbacba.jpeg
1255	1255	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729484922_img_%2584.jpg_%25cd2df962-8cc0-474f-b5aa-7c56789a51ce.jpeg
1256	1256	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729446081_img_%2529.jpg_%25ef5f2f36-ce1b-46ca-a8aa-a2974a999cf9.jpeg
1257	1257	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729397082_img_%25168.jpg_%25116506fe-76a9-4ac5-b3e0-1749b5079eee.jpeg
1258	1258	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729348585_img_%25listing-1050644677_x2.jpg_%25c2044a03-a89b-43e3-b367-f4a7b5ba07a7.jpeg
1259	1259	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729277065_img_%259.jpg_%2563397922-4bc5-4d3e-88e3-ca63959741e3.jpeg
1260	1260	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729255520_img_%2516.jpg_%252c7cb63f-e3ff-4d04-accc-ab28c93402bc.jpeg
1261	1261	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729235610_img_%25166.jpg_%25c223e8aa-07c8-41a3-82ca-e7b05bd49fcd.jpeg
1262	1262	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729219793_img_%2571.jpg_%259834bf28-4951-4e59-83dd-929ec51a9e07.jpeg
1263	1263	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729182596_img_%2557.jpg_%257ab335a9-f899-4d7f-aa8a-ad83d3dfae8b.jpeg
1264	1264	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729158610_img_%2573.jpg_%254e835e3c-1589-4f1a-85d5-8918a9a7e9f1.jpeg
1265	1265	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729144841_img_%25snapedit_1745679019081_%259098a351-d925-48e3-a3c9-4cbdaa94cb38.jpeg
1266	1266	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729085225_img_%25136.jpg_%2521d8d7e7-f0ca-40b1-bb7a-d5605c1aceb5.jpeg
1267	1267	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729065206_img_%25snapedit_1745683222626.jpg_%25b7ea6dbf-0a95-4fb4-98f5-460a0bc52b44.jpeg
1268	1268	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729047082_img_%2546.jpg_%25712e5f6e-8c47-442c-8ea4-f2f835195d6c.jpeg
1269	1269	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729034244_img_%25177.jpg_%25e4b75b12-f144-4ec9-b754-1ec8bb43b67e.jpeg
1270	1270	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745729017987_img_%251-1707797865-Kos---Kosan-Pondok-Indah-Kamar-Mandi-Dalam-Fasilitas-Lengkap---Jakarta.jpg_%257da6e7d5-499c-49e7-9cf7-64f44b82011e.jpeg
1271	1271	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728990218_img_%2548.jpg_%25af47d87d-01a2-470c-b92f-49098e73a986.jpeg
1272	1272	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728974767_img_%25118.jpg_%25e98369d0-955e-4ede-af2c-9594dfe75b64.jpeg
1273	1273	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728922520_img_%25128.jpg_%25728d6795-9083-4b57-96e5-29ddde40ae38.jpeg
1274	1274	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728869393_img_%2559.jpg_%255060abe3-c3e4-4d1b-ad20-a8ed505d3870.jpeg
1275	1275	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728854731_img_%2572.jpg_%2506256408-8823-4c67-a15d-734e0fef9b76.jpeg
1276	1276	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728819618_img_%25download_4.jpg_%2528d92832-f8a6-4686-a761-2c979980ab98.jpeg
1277	1277	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728805308_img_%2532.jpg_%257c8f26df-1ed4-43bd-9505-50b8013fe7ea.jpeg
1278	1278	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728762023_img_%2527.jpg_%25b0d8146c-112d-497c-8ce5-0d18fe11c95c.jpeg
1279	1279	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728780067_img_%25th%20%283%29.jpg_%25a7e61902-5412-42e8-bbca-291f6688d8e0.jpeg
1280	1280	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718647636_img_%25Gboppgwi.-360x480%20%281%29.jpg_%2552a4fc73-9128-4b2c-916c-b39da41d4419.jpeg
1281	1281	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728717167_img_%2553.jpg_%25e3332456-da8e-4fad-827c-d9ec9553b747.jpeg
1282	1282	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728693152_img_%25115.jpg_%252087e4f2-e4bc-46fe-abcd-2e7a79e7d328.jpeg
1283	1283	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728669701_img_%25kosan-putri-bersih-nyaman-kamar-mandi-dalam-413169630.jpg_%258dc2ab93-8678-47e6-bf54-552911e1f8de.jpeg
1284	1284	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728636618_img_%2586.jpg_%255cea607e-9212-493c-b44c-e069a38e0f3d.jpeg
1285	1285	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728609231_img_%25143.jpg_%25b0d5f694-268c-4aad-b4a0-c08e0f757415.jpeg
1286	1286	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678099193_img_%25Screenshot%202025-04-26%20213700_%253d3be882-f266-426d-97d4-59c2d9cd4d5d.png
1287	1287	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728578797_img_%25148.jpg_%2572196787-fd30-4788-a45f-14ee21e74d38.jpeg
1288	1288	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728554935_img_%25158.jpg_%25ad3b1d51-3831-4b37-8592-7097ab522494.jpeg
1289	1289	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728539978_img_%25175.jpg_%25383bd4b2-db6b-445f-a6de-33ec488184d7.jpeg
1290	1290	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728526038_img_%25snapedit_1745679166503_%2544973a59-4b58-4697-9167-5555e1d6480f.jpeg
1291	1291	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728511680_img_%25122.jpg_%251e518e57-91dc-4478-8cd4-6cf803e03a94.jpeg
1292	1292	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728483122_img_%25164.jpg_%25070a5ad2-4d63-434e-b091-a5f3dc386205.jpeg
1293	1293	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728467754_img_%25135.jpg_%25d0761705-3a49-420b-9b49-0bd4b3b05277.jpeg
1294	1294	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728454466_img_%25snapedit_1745074090053.jpg_%2528229045-8adf-4cad-8393-386919c62b15.jpeg
1295	1295	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728405426_img_%25snapedit_1745678755398_%2518346031-7d08-46d2-9441-f2f94c233586.jpeg
1296	1296	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728375049_img_%2542.jpg_%25b3a0e950-446a-4105-9852-ea86842dce47.jpeg
1297	1297	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728360849_img_%25106.jpg_%2534f7c1d0-a984-4352-b780-ce92d444b208.jpeg
1298	1298	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728345784_img_%2582.jpg_%25f7d34100-492c-476c-b58d-6f9edd82f778.jpeg
1299	1299	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728306500_img_%2581.jpg_%255114259e-03a3-47f1-91c9-cac7afbd9f16.jpeg
1300	1300	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728285635_img_%25142.jpg_%2552d06ad4-56f2-40ec-ab55-bef98003fd01.jpeg
1301	1301	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728266544_img_%25123.jpg_%25c15f6517-16dd-415f-b83d-962e9276e61c.jpeg
1302	1302	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728243199_img_%25108.jpg_%255f0e2c44-4aae-4828-af84-6300d499c9f7.jpeg
1303	1303	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728229986_img_%25129.jpg_%258bcaecd3-33c7-45ab-80f6-af309fd59b79.jpeg
1304	1304	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728213249_img_%2526.jpg_%259ed4d6fe-0e34-4715-9690-cb6ed65ab66c.jpeg
1305	1305	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728196327_img_%25144.jpg_%25f878df96-ccd7-4d9d-bfff-c94a7089c899.jpeg
1306	1306	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728176224_img_%2566.jpg_%25d725ef00-386d-4772-8e2e-d4169f27fe24.jpeg
1307	1307	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728165026_img_%25images.jpg_%25050fc801-d719-454f-b6ae-b2e9f420356b.jpeg
1308	1308	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728145437_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2001_04_11%20PM_%25122d327b-9e69-4ac1-9089-d7310b21a5c8.png
1309	1309	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728125449_img_%2533.jpg_%2578320ee2-e6b0-4738-9723-16c357257e6a.jpeg
1310	1310	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728084498_img_%2577.jpg_%2558473cde-462f-466e-87fa-394a58978cf6.jpeg
1311	1311	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728054716_img_%2576.jpg_%25e0ce0bdb-2dca-4ba3-ad96-42694557b665.jpeg
1312	1312	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728038163_img_%25124.jpg_%2595a5514a-a0ce-4540-89e9-b628e6360ef5.jpeg
1313	1313	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745728009721_img_%25167.jpg_%256badf91e-8fb6-425b-a4d8-183a03df7b3b.jpeg
1314	1314	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727989137_img_%2513.jpg_%251a415329-25be-407f-89a6-6acd52a50703.jpeg
1315	1315	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727966206_img_%25snapedit_1745072680356.jpg_%25b95ccb97-481f-40eb-9bd7-a4421d35c304.jpeg
1316	1316	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727953675_img_%2592.jpg_%25d860d2bf-1496-4c4d-9c11-dc8a6827cb8f.jpeg
1317	1317	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727941398_img_%25snapedit_1745130203029.jpg_%2578534c86-3676-4122-94c8-d95837da293f.jpeg
1318	1318	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727914649_img_%2511.jpg_%251ccfd146-b89c-4b77-8918-eafd58fd97ac.jpeg
1319	1319	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727888263_img_%25kost-single-pasutri-dekat-rshs-1991331145.jpg_%25067bb67d-e8b6-414a-9fbc-39a58c1847fb.jpeg
1320	1320	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727863299_img_%2574.jpg_%25851b8574-c0f9-4d50-9cfc-60a684c47f0f.jpeg
1321	1321	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727825244_img_%25ChatGPT%20Image%20Apr%2020%2C%202025%2C%2001_52_17%20PM_%258cbe8abf-0533-4fe4-b3aa-3c117ad64c88.png
1322	1322	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727797412_img_%2536.jpg_%25d2d5a4e9-f632-4fc8-bbe3-cd10eecfe842.jpeg
1323	1323	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727785505_img_%2565.jpg_%252b69d7a8-132b-402c-b7b6-4f217b276c4d.jpeg
1324	1324	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727762641_img_%25150.jpg_%250306c7ba-741c-45b5-9c35-5445411f2853.jpeg
1325	1325	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727722099_img_%2589.jpg_%256bee859e-7041-4893-8384-3909e4dae808.jpeg
1326	1326	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727695489_img_%25177.jpg_%2515bdebd2-25a3-4696-abe8-b29323fdd290.jpeg
1327	1327	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727677337_img_%25snapedit_1745678963622_%2561750830-a6b0-4b80-8c4a-fc78df9ba183.jpeg
1328	1328	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727655818_img_%25180.jpg_%258329435a-6477-4c99-a25a-08f026ab1fcd.jpeg
1329	1329	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727634158_img_%25170.jpg_%252f79a39d-3399-4198-93d7-b6802fc0055e.jpeg
1330	1330	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727612446_img_%25140.jpg_%255c644871-8c49-46a0-9cf0-58fbe65e12ae.jpeg
1331	1331	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727563832_img_%2582.jpg_%25a8861c5c-4d2e-4800-8e65-0c9d3846608d.jpeg
1332	1332	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727515414_img_%252.jpg_%25d5689cc6-d1ea-4ed3-a18e-f3299c050f26.jpeg
1333	1333	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727460248_img_%25rumah-kost-subagio-118077431_x2.jpg_%25ecf5e56d-32e4-428a-971a-f307270b2f51.jpeg
1334	1334	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727438799_img_%2544.jpg_%254d333e28-4f9d-43f3-97a2-054b1b76c528.jpeg
1335	1335	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727381679_img_%2595.jpg_%255f3118ed-cc8e-4145-ba5a-f3a052b3e33e.jpeg
1336	1336	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727358120_img_%25kamar-kost-sederhana-di-sarijadi-1690635730.jpg_%2560e56531-2bb4-4151-834d-e3f449067065.jpeg
1337	1337	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727314678_img_%25kost-batununggal-dekat-kampus-telkom-elok-hou-1658590576_x2.jpg_%25b8f0c3f7-abc8-457c-b67e-f0f9137c82ab.jpeg
1338	1338	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727298995_img_%2529.jpg_%25967549fa-7133-4e59-b347-941c2206aec5.jpeg
1339	1339	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727275271_img_%25105.jpg_%25cbd7f969-79c1-431e-9016-a81ad88d2bda.jpeg
1340	1340	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727252047_img_%25110.jpg_%255bc629ef-a4a0-4a13-983b-a12ec6d7ddf9.jpeg
1341	1341	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727215020_img_%25125.jpg_%2550b98efe-e742-4047-bcb0-d7106bc0d48d.jpeg
1342	1342	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727183248_img_%25snapedit_1745131091135.jpg_%2559ef0395-e4bd-44b7-a667-965a3f887d8b.jpeg
1343	1343	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727141328_img_%25140.jpg_%25067deb2b-7171-4a40-9258-3f3d44968f4c.jpeg
1344	1344	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727114297_img_%25135.jpg_%2516489423-f14d-4658-941b-d1a94e34ef75.jpeg
1345	1345	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727088594_img_%25121.jpg_%25c78c9d5b-3d45-4025-9713-651472cc3168.jpeg
1346	1346	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727030759_img_%25119.jpg_%25ecf30237-0e1c-4ae7-bf68-648df07206af.jpeg
1347	1347	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745726997024_img_%25snapedit_1745112776953.jpg_%256347c432-6d70-4afa-877d-971f4b23665c.jpeg
1348	1348	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745726954377_img_%25kamar-kost-sederhana-di-sarijadi-1690635730.jpg_%25c24bc8d7-9cd2-4590-8d7e-4328639d446d.jpeg
1349	1349	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745730867532_img_%25bb3906d4-48dc-4e25-8b90-0cded2678b9c_%253522b20a-0f20-444d-beee-f69f6496d1f9.png
1350	1350	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745720185130_img_%25Xb4voPbN.-360x480%20%281%29.jpg_%25ff0cbbd5-8ef5-4dd6-b8de-86622f6a4575.jpeg
1351	1351	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745720124007_img_%25SbsOr3fP-360x480%20%282%29.jpg_%252cfa031b-62c4-4e7d-b308-93a995a034b8.jpeg
1352	1352	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719979800_img_%25zyAyGSwH-540x720%20%281%29.jpg_%255c21565a-ee0a-49bf-b34d-0f9cc26e6f80.jpeg
1353	1353	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719622294_img_%255UVLhbLv-540x720%20%281%29.jpg_%2505a3111f-8178-4bef-9330-4ebe0b87473d.jpeg
1354	1354	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719417864_img_%254h9SuWWN-360x480%20%281%29.jpg_%2537e18faa-7cee-475b-bfc7-1868073fba5a.jpeg
1355	1355	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745719212284_img_%25lw6ZQnHS-360x480%20%281%29.jpg_%25a463fb5c-bf29-465b-a753-a2b362232e16.jpeg
1356	1356	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718920525_img_%25wFTD5sY4-540x720%20%281%29.jpg_%251fd8caad-1fb6-4d1e-ac9e-37edaa98ae29.jpeg
1357	1357	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718778541_img_%251jk4bd6l-360x480%20%281%29.jpg_%256b47d1c2-0ed3-47ff-8073-96d0dee0b330.jpeg
1358	1358	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718647636_img_%25Gboppgwi.-360x480%20%281%29.jpg_%2552a4fc73-9128-4b2c-916c-b39da41d4419.jpeg
1359	1359	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718378312_img_%25LK8lzQWE.-360x480%20%281%29.jpg_%2519e8d378-f698-481f-aafe-972a22d7d099.jpeg
1360	1360	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718228539_img_%258WoQBebx-360x480%20%281%29.jpg_%25174b4902-85c6-4300-bb2c-cc165ffea232.jpeg
1361	1361	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745718074576_img_%25cBv86IP0-360x480%20%281%29.jpg_%25c30ce484-122f-4ee4-a582-3954ab65be4f.jpeg
1362	1362	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745717704101_img_%25N2J3XbhC-360x480%20%281%29.jpg_%25a50b967d-eed8-4364-9e67-6eed9ccb0e75.jpeg
1363	1363	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745717296867_img_%25CY2Ibxdr-360x480%20%281%29.jpg_%25fb6e58f4-091f-4f30-90bc-244fcc8fd5d8.jpeg
1364	1364	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745717017407_img_%25Betterimage.ai_1745717094831_%2552aecd95-9802-487a-9850-0dfc7b419c6e.jpeg
1365	1365	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716992588_img_%25L0A34vUg.-540x720%20%281%29.jpg_%251a73318a-05df-4366-ae73-96a6d1ef831c.jpeg
1366	1366	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716585099_img_%256mJGVQY3.-360x480%20%281%29.jpg_%25a9594356-c8ae-42e8-991b-ba8de0238c70.jpeg
1367	1367	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716565649_img_%25Qjyu5aSW-360x480%20%281%29.jpg_%251ed9aa05-1380-41f7-a2ff-d9e6e8361308.jpeg
1368	1368	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716248651_img_%25yhIloaas.-540x720%20%281%29.jpg_%257ab8e433-f072-4e1f-b9bf-8905c5913f5e.jpeg
1369	1369	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745716224367_img_%257CGMuJSd.-540x720%20%281%29.jpg_%2594d21f4d-0b27-45d4-9e06-ac81b84b7063.jpeg
1370	1370	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715925946_img_%252Ia5MLG5-540x720%20%281%29.jpg_%25ad83ba65-b10d-45eb-bb1d-5ffca85a5788.jpeg
1371	1371	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715714134_img_%25elnCS7Y9-540x720%20%281%29.jpg_%25364b6c26-c417-461e-b394-68523c78fd16.jpeg
1372	1372	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715579673_img_%25Betterimage.ai_1745715627172_%252177f5cb-8cef-4ea4-8cf5-25060da4c947.jpeg
1373	1373	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745715385903_img_%2534sb8qQd-360x480%20%281%29.jpg_%2567fad1d9-57ad-4e7d-b520-7c9156aadd6d.jpeg
1374	1374	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745686067034_img_%25UMKHuUrU-540x720%20%281%29.jpg_%2572b05370-8af2-48a2-af95-ad9966f405fa.jpeg
1375	1375	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685938309_img_%25vHtdq903-360x480%20%281%29.jpg_%259fb27409-68e8-4993-b52a-bb18498794ce.jpeg
1376	1376	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685848553_img_%25oOkKsoSE.-360x480.jpg_%25e117116e-e2a5-48d4-ac56-e63f5e509985.jpeg
1377	1377	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685786901_img_%2510KrrycH.-360x480%20%281%29.jpg_%257170e84a-78ae-4a0c-a01d-12354d5fa260.jpeg
1378	1378	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685711870_img_%25nEMSFgzW-360x480%20%281%29.jpg_%25c7ef5407-3cf4-4a19-95aa-4f99ec1423d0.jpeg
1379	1379	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685614379_img_%25KM9ZoFNK.-540x720%20%281%29.jpg_%2551de5cd5-6cf0-4695-9822-8d028c1b0dad.jpeg
1380	1380	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685509706_img_%25kS54hARW.-360x480%20%281%29.jpg_%25fd5a90e2-7f8c-4872-833d-6c8ccae9ab1b.jpeg
1381	1381	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685374118_img_%25Yo43gYjW-360x480%20%281%29.jpg_%25486892a9-1123-41a1-896e-51a16b0f5f04.jpeg
1382	1382	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685252160_img_%25kS54hARW.-360x480%20%281%29.jpg_%25b7a6913c-fbbb-4f2b-a845-b1c1e1dd610b.jpeg
1383	1383	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685161671_img_%25Offql8TK-360x480%20%281%29.jpg_%25f88a7092-4b33-42ac-9a24-191d954b0f3b.jpeg
1384	1384	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745685070991_img_%25yTeYv7Me-360x480%20%281%29.jpg_%259d303dec-9267-4ba8-ac11-6bceb5495b77.jpeg
1385	1385	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684968549_img_%259J1CJdyS.-540x720%20%281%29.jpg_%2550744963-47fe-4379-92f5-d86ad3dd2c61.jpeg
1386	1386	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745727298995_img_%2529.jpg_%25967549fa-7133-4e59-b347-941c2206aec5.jpeg
1387	1387	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684577560_img_%25UGZ4QnYc-360x480%20%281%29.jpg_%2593894c78-1722-4bd3-979a-71eb761a507c.jpeg
1388	1388	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684470329_img_%25TtlTkhRA.-360x480%20%281%29.jpg_%2568d37caf-89f5-49c5-869f-02f33ee79a25.jpeg
1389	1389	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684328567_img_%25FJDlJ6JV-360x480%20%281%29.jpg_%25541906e0-4f86-4d6a-8c71-fac88419ee66.jpeg
1390	1390	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684251086_img_%25jQf5etNn-540x720%20%281%29.jpg_%2502ae639d-f161-47b1-aa10-c12d23814780.jpeg
1391	1391	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684139773_img_%25LUkHMpk5-360x480%20%281%29.jpg_%254a7f6d1c-d229-4ccd-9974-6da475d1afb3.jpeg
1392	1392	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745684000011_img_%25Md5uRUQl.-360x480%20%281%29.jpg_%2544bff415-d0cd-4e81-a5b3-8a495a363c25.jpeg
1393	1393	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683885913_img_%25HJ18hnVl.-540x720%20%281%29.jpg_%25d14a2c11-182e-4768-b7a2-03c9b10da5d6.jpeg
1394	1394	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683750887_img_%25qZpqLyKT-540x720%20%281%29.jpg_%251d8a6dda-4399-4fe0-ba9d-4f0edfcd2e29.jpeg
1395	1395	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683625667_img_%25y90mMDVu-360x480%20%281%29.jpg_%2580b0934b-caf7-406a-8a9f-db405d6ddf4d.jpeg
1396	1396	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683524765_img_%2514OLfTDU-360x480%20%281%29.jpg_%25f40d6c54-ace4-4b63-8ab6-bf9fcb9456bd.jpeg
1397	1397	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683252008_img_%25snapedit_1745683366960.jpg_%25a451c554-cc2a-446b-876f-c018064b9d76.jpeg
1398	1398	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683105901_img_%25snapedit_1745683222626.jpg_%25ebaf2bac-e79a-4b91-a1d7-82df00888e44.jpeg
1399	1399	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682930714_img_%25dc3fedf6-aa13-47d1-b613-2527a9b8ff10_%256a195dc9-20d6-49f2-9c68-8c34427cfbc7.png
1400	1400	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682890813_img_%2553d3ff3c-704a-4dce-8e71-635bbe1fc74d_%25df0bae6c-ed4c-4401-99b9-c457b6c8d837.png
1401	1401	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745683016486_img_%25ChatGPT%20Image%20Apr%2026%2C%202025%2C%2010_58_49%20PM_%25a58dda0a-23e0-41f8-a3b8-389b130c427c.png
1402	1402	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682720112_img_%25e1580e5e-3a5a-4565-b496-e8871451b610_%251f5a1fbb-2b7d-4eab-852e-2f54547e7240.png
1403	1403	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682688393_img_%2508fc5c3c-80fe-4674-84bb-39cf20a8aa98_%25db58122d-7669-4b38-9452-f7291797e9dc.png
1404	1404	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682479387_img_%25a640492f-d21d-45af-89d1-30322b35e88e_%2558278f7f-1484-48cb-9c9c-3821cab4d19a.png
1405	1405	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682522231_img_%25ChatGPT%20Image%20Apr%2026%2C%202025%2C%2010_50_34%20PM_%2599cea16c-ad57-44d3-8bb3-baf03124b3dc.png
1406	1406	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745682434736_img_%25e37bc554-bf05-4744-a8b7-7d8cc986c5b9_%251d9b03f6-d62a-4ef5-8764-ab962ce49550.png
1407	1407	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681611822_img_%25fe5bca43-9270-428c-a932-e89989327322_%25ec9f9ac2-24e1-4653-94d4-7f4f2df5cb16.png
1408	1408	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681564185_img_%250fc482ca-3600-45fb-9b4d-b26d77f5441a_%25321118c7-620c-4b25-96fa-120591bafd08.png
1409	1409	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681537933_img_%254252f922-9c83-4148-96eb-a6971826719d_%25acdf0884-f621-4763-9976-8f4653a5baf5.png
1410	1410	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681468476_img_%25cbd40244-d779-43e4-a90d-714866b72df7_%25dee4641b-f196-4e72-a3c8-5869e6aaf6ee.png
1411	1411	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681434379_img_%25bb9e2d9b-ae45-46f4-9a41-e49c79720cbd_%2583904b56-ca2a-4e93-8cdd-7d66ddfd9584.png
1412	1412	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681313339_img_%257126d1d0-fb6a-4625-baea-1bda44eae814_%25abd09186-0d8d-4784-aaa7-61676f3f82ad.png
1413	1413	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681275347_img_%25d3a5f1f5-1c7e-4f05-8e31-ebae40c3b6a1_%25dac09fe4-3ed9-43fe-bd2a-a54bdf3b4222.png
1414	1414	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681234675_img_%259abc1def-de24-4ef4-a601-ecf205add8d8_%252eec4bcf-b9fb-4c5a-8d96-a12b3bf89d5c.png
1415	1415	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681192493_img_%25fcd113be-503c-47e7-81f3-ed7390a6225e_%25c2c0c561-85fd-46f8-bf27-a3962e8e2e1b.png
1416	1416	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681053041_img_%256d1a6770-541f-4a62-91a7-eef193da11a0_%2596d35214-6c0f-4fe1-b7e4-8255dfbb9ec9.png
1417	1417	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745681025684_img_%25d26e9152-4d7f-4e66-aec7-1894893b6094_%250dcb866d-98c8-4a1c-a8db-cf977d1ad7e2.png
1418	1418	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680995624_img_%25e16b8412-c052-4da0-be63-807055510347_%25c6508e13-4a94-49b8-a0f6-036e8f20c428.png
1419	1419	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680957601_img_%2582386784-be14-4cef-9781-607d08fa7f18_%25988f7a58-0a62-48ec-88f6-b96d1a8b4059.png
1420	1420	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680819607_img_%25689d5353-fbb4-446e-9570-88fa41454d99_%256e61e6e0-25eb-405e-abfc-e17382ffb4a7.png
1421	1421	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680784530_img_%25d22d056c-8d5f-4f23-b945-6d90f5933d40_%25b01c46ee-df3b-4859-a318-61fc13512a35.png
1422	1422	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680732290_img_%25e33498e4-503d-478a-b0b3-3482c96aba08_%2538dc5527-d622-44ef-8c9b-21209f35b04f.png
1423	1423	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680681219_img_%256fa6037f-a996-46f0-b8bb-536b8bdd900c_%25dc786d28-f9f0-44c2-8334-39816776f0dd.png
1424	1424	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680570759_img_%256def1e96-b1c0-42a0-81ac-3c1fc7453172_%256fc20f08-688d-4143-b1a5-ceda6c5a369b.png
1425	1425	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680538899_img_%2503532d15-cacd-49ce-afbf-1ce01e488c19_%256b0ae54e-9573-4dcf-a1f6-59878765ae0b.png
1426	1426	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680490877_img_%253baa4346-8ac7-4073-b4a9-ff878fa35eb3_%25abbd51e5-f6ac-41c2-bf35-99226c77cf7f.png
1427	1427	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680459552_img_%25ad655755-9d21-46b6-9c1d-9a201d99ece4_%25880b8af8-8090-4d62-be37-c228b71b230c.png
1428	1428	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680372045_img_%25b9ece2e1-1e16-4b6a-9e1b-6c5e5518be12_%257f216701-faf4-4d25-839e-8b93e39a6081.png
1429	1429	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680245021_img_%253f111ca1-8b5f-42d7-ba0c-28d30f857427_%2565d3b37a-7c2e-497a-af1f-957571462201.png
1430	1430	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680216580_img_%251caf50ee-43a7-4924-9843-3c5cf3d7bed9_%25e77bca21-2d53-497a-bba5-a11fa065fde6.png
1431	1431	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680180690_img_%2529054191-f441-4695-bcdd-5c4dcef69467_%25b17528de-fa98-4c23-81e5-c743c667d350.png
1432	1432	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680139839_img_%25bb3906d4-48dc-4e25-8b90-0cded2678b9c_%254acfa5d8-aa67-4338-a9f5-69ca49e365d7.png
1433	1433	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745680041925_img_%25c0814739-e474-402c-b313-bbbd67287b01_%2593a24f6c-f7e0-4c02-81ed-b906a5adbbb0.png
1434	1434	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679998896_img_%25ea140517-4cf3-437f-815b-6ca733580629_%2550426b78-b6dd-4971-b01f-af4ca279d3be.png
1435	1435	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679930168_img_%25578113ce-7cdb-40fd-ada8-1e18a4ae80fd_%2596689d6b-6402-4f38-bb61-5c5249d9da2c.png
1436	1436	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679698110_img_%25Screenshot%202025-04-26%20220132_%25e0c71a37-543d-4419-9593-624ede50c37f.png
1437	1437	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679541686_img_%25Screenshot%202025-04-26%20215720_%252d330f56-f2a4-4526-b1d5-2f9822ba3cde.png
1438	1438	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679406469_img_%25snapedit_1745679481327_%25887f0656-94b4-462d-b73f-a217abc4b32a.jpeg
1439	1439	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679393757_img_%25snapedit_1745679463783_%256866fa1c-e3ab-43a1-98bb-eb1f567289d6.jpeg
1440	1440	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679247545_img_%25snapedit_1745679369605_%257527c056-93a8-4129-89a5-7b8ef2a82067.jpeg
1441	1441	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679205031_img_%25snapedit_1745679302560_%25da055c70-f204-4f37-a86a-61f612bab7b0.jpeg
1442	1442	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679107377_img_%25snapedit_1745679199931_%25f580986b-00da-4319-b603-4cb6e273a350.jpeg
1443	1443	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679092107_img_%25snapedit_1745679166503_%25aec8215e-01fb-46d6-b779-1e9688e266e2.jpeg
1444	1444	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745679020171_img_%25snapedit_1745679019081_%2588ac7536-ccef-40c6-b766-bba7b57f020c.jpeg
1445	1445	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678864756_img_%25snapedit_1745678963622_%2531874df6-43c5-4971-8dfa-ece23615fea3.jpeg
1446	1446	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678823231_img_%25snapedit_1745678902292_%25e1e5f1fe-3737-458a-81d6-746c6b5a5a83.jpeg
1447	1447	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678738593_img_%25snapedit_1745678801885_%259e6c25b0-900c-427a-a032-4624b8ce7d17.jpeg
1448	1448	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678661319_img_%25snapedit_1745678755398_%254a9df92a-4fa6-4104-b08b-c4087622eeee.jpeg
1449	1449	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678616107_img_%25snapedit_1745678704137_%253b44af88-3770-4adb-9edb-cf10d3fff632.jpeg
1450	1450	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673961000_img_%25Screenshot%202025-04-06%20203755_%25c2d65c36-5314-49da-a022-21703f86c5ce.png
1451	1451	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678437994_img_%25Screenshot%202025-04-26%20214241_%25ac1d1b6b-d707-4abb-bd0c-1346e088bcf0.png
1452	1452	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678409163_img_%25Screenshot%202025-04-26%20214214_%2548c302dc-2da5-40ef-90ad-94cef68f9e4a.png
1453	1453	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678381661_img_%25Screenshot%202025-04-26%20214141_%251a784534-5d7d-4fcd-9a3b-82326e106650.png
1454	1454	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678315083_img_%25Screenshot%202025-04-26%20214032_%25ab9f8b3e-d712-4962-b1ea-649bcdf287e1.png
1455	1455	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678213456_img_%25Screenshot%202025-04-26%20213856_%25f78cce6f-0efe-4042-9590-698da586a520.png
1456	1456	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678157744_img_%25Screenshot%202025-04-26%20213757_%2584c66213-650b-4106-a6c7-469696b4dc9f.png
1457	1457	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678128970_img_%25Screenshot%202025-04-26%20213728_%258b6eb7f2-40e3-43fa-95f3-7647eb931c18.png
1458	1458	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745678099193_img_%25Screenshot%202025-04-26%20213700_%253d3be882-f266-426d-97d4-59c2d9cd4d5d.png
1459	1459	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745677739420_img_%25Screenshot%202025-04-26%20213050_%2595368d92-e6bf-48ff-8bf3-ad1e3cf81b6c.png
1460	1460	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673747233_img_%25snapedit_1745075820870.jpg_%256f60486e-f05c-4aa4-9e9d-102c7a3e6931.jpeg
1461	1461	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673667994_img_%25snapedit_1745074090053.jpg_%257cb5d07b-a28c-4ebe-bff3-e6997c50b349.jpeg
1462	1462	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745333029567_img_%25image272_%25e99d9370-6ade-4c84-aa42-bf436f5df2b5.png
1463	1463	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673548630_img_%25snapedit_1745072680356.jpg_%25bfbbc633-1352-4755-84ba-33506bfc7b53.jpeg
1464	1464	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673477147_img_%25Screenshot%202025-04-19%20204659_%25efa4ad3a-856e-4be0-9944-e582197dd4dd.png
1465	1465	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673350770_img_%25snapedit_1745071376790.jpg_%25af257aed-2c6c-4a28-9c81-58a3dd412e4c.jpeg
1466	1466	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673260886_img_%25snapedit_1744431774210.jpg_%258a91aeca-194f-4411-81d5-4a320ac33caf.jpeg
1467	1467	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673178154_img_%25snapedit_1744431111188.jpg_%25edef0edb-0d45-4864-a0a0-c90a0386eac2.jpeg
1468	1468	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745673093962_img_%25snapedit_1744430404114.jpg_%25a1654de6-c86e-46d2-9b49-e6440e3d0682.jpeg
1469	1469	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672990843_img_%25mG5aCAYy-540x720.jpg_%25e49196dc-e2f6-41a7-bb1b-366085dbbb6e.jpeg
1470	1470	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672932541_img_%25TrzFpYLc-540x720.jpg_%251de2acc2-0643-4118-9d6f-9ed1a5066247.jpeg
1471	1471	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672745966_img_%25Screenshot%202025-04-06%20205753_%25ad125b46-400f-41b3-aad3-59171ab395b5.png
1472	1472	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672645824_img_%25Screenshot%202025-04-06%20205401_%254e8ff39c-387e-43b0-b5fe-1e40d2070f76.png
1473	1473	https://mapidstorage.s3.ap-southeast-1.amazonaws.com/general_image/ggnt_muhammadrizki/1745672509397_img_%25Screenshot%202025-04-06%20203755_%258b552dc8-325c-467b-84e9-e7a9517907b9.png
\.


--
-- TOC entry 4902 (class 0 OID 16488)
-- Dependencies: 222
-- Data for Name: kost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kost (id_kost, nama_kost, alamat, deskripsi, harga_sewa, luas, status_properti, jenis_sertifikat, luas_tanah, longitude, latitude, panjang, lebar) FROM stdin;
1	Kost She House Cikutra Bandung	Cibeunying Kaler	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.643022	-6.898421	3.00	3.00
2	Kost Gd Home Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62835942209	-6.8885982931695	3.00	4.00
3	Kost Boyke Cikutra Baru Tipe B Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1100000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.63994857669	-6.8945054490575	4.00	4.00
4	Kost Anggrek Barokah Bandung Wetan Bandung	Kecamatan Bandung Wetan	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.630161	-6.91091	3.00	4.00
5	Kost Imah Incu Antapani Bandung	Antapani	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6535622	-6.9090813	3.00	4.00
6	Kost Bu Sur Tipe C Cibeunying Kidul Bandung	Cibeunying Kidul	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.643093	-6.903634	3.00	3.00
7	Kost Kumeli 30 Executive Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1800000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.633124	-6.897115	4.00	4.50
8	Kost Ibu Eti Antapani Bandung	Antapani	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.66079034656	-6.9177588959882	3.00	4.00
9	Kost Cendana Excecutive Bandung Wetan Bandung	Kecamatan Bandung Wetan	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62849152088	-6.9089839436991	3.00	4.00
10	Kost Cigadung Selatan Tipe C Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	800000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.6264547	-6.8867998	2.50	3.00
11	Kost Sadang Cikutra Cibeunying Kaler Bandung	Cibeunying Kaler	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62847978622	-6.8860962091806	3.00	4.00
12	Kos Wahjoewono Antapani Bandung	Antapani	\N	725000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.654582	-6.907883	2.50	3.60
13	Kost Griya Tjipoe Sepoeloeh Bandung Wetan Bandung	Bandung Wetan	\N	1250000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.6271508	-6.9036371	3.00	3.50
14	Kost Bidan Maria 2 Antapani Bandung	Antapani	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6572429	-6.9157305	3.00	4.00
15	Kost Galuh Kencana Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	560000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63378	-6.899319	3.00	3.00
16	Kost Audry Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1000000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.6396717	-6.8944428	4.00	4.00
17	Kost Mukti Medium Room 1 Cimenyan Bandung	Cimenyan	\N	1300000.00	21	Sewa	Sertifikat Hak Milik (SHM)	21	107.634633	-6.886073	6.30	3.30
18	Kost Bengawan 83 Tipe A Bandung Wetan Bandung	Bandung Wetan	\N	1450000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.630005	-6.910741	4.00	4.00
19	Kost Bekalivron XV Residence Exclusive Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	2900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.641856	-6.901319	3.00	4.00
20	Kost Muararajeun Lama 1 Tipe B Cibeunying Kaler Bandung	Cibeunying Kaler	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63034828007	-6.9022165615702	3.00	3.00
21	Kost Pak Niza Kiaracondong Bandung	Kecamatan Kiaracondong	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.65723	-6.90335	3.00	4.00
22	Kost Saninten 13 Bandung Wetan Bandung	Kecamatan Bandung Wetan	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62736566365	-6.9080603075882	3.00	4.00
23	Kost Elroi Bojong Koneng Atas Cikutra Tipe C Cimenyan Bandung	Cimenyan	\N	1800000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.647313	-6.888007	4.00	4.00
24	Kost Paviliun Cemara Tipe B Coblong Bandung	Coblong	\N	1100000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.627964	-6.890604	4.00	4.00
25	Kost Ibu Enung Cicaheum Kiaracondong Bandung	Kiaracondong	\N	650000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.65311487019	-6.9049948212978	4.00	4.00
26	Kost Mukti Large Room Cimenyan Bandung	Cimenyan	\N	1350000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.6346327737	-6.8860732420056	4.00	5.00
27	Kost Baitul Jamil Guesthause Cimenyan Bandung	Kecamatan Cimenyan	\N	1800000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.633628	-6.887951	5.00	3.50
28	Kost Dago 2 Tipe B Coblong Bandung	Coblong	\N	2300000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.6286024	-6.8903768	6.00	3.00
29	Kost Putih Terusan Cikutra Tipe Ac Cibeunying Kaler Bandung	Cibeunying Kaler	\N	2000000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.64140468091	-6.897186561896	3.00	5.00
30	Kost Crysant House Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.629766	-6.898987	3.00	3.00
31	Kost Paviliun Cemara VVIP Coblong Bandung	Coblong	\N	1550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6280512	-6.890744	3.00	4.00
32	Kost Bekalivron XV Residence Tipe Standar Balkon Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	2750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.641856	-6.901319	3.00	4.00
33	Kost Rkm Tipe B Cibeunying Kidul Bandung	Cibeunying Kidul	\N	2250000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.6474838	-6.905526	2.80	3.00
34	Kost Kumeli 30 Tipe B3 Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1500000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.633124	-6.897115	4.00	6.00
35	Kost Bu Eti 2 Antapani Bandung	Kecamatan Antapani	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.655776	-6.917719	3.00	4.00
36	Kost Cilaki Ninggasnar Tipe A Bandung Wetan Bandung	Kecamatan Bandung Wetan	\N	1200000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.629129	-6.906698	4.00	4.00
37	Kost Supratman Pavilion Tipe A Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63300299644	-6.9099555070882	3.00	3.00
38	Kost Pondokan Syarifah Cibeunying Kidul Bandung	Cibeunying Kidul	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.643917	-6.89893	3.00	3.00
39	Kost Dflamboyan Antapani Bandung	Kecamatan Antapani	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6573222	-6.9080988	3.00	4.00
40	Kost Megumi Cikutra 1 Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.643769	-6.896988	3.00	4.00
41	Kost Muararajeun Lama 1 Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.630348	-6.902217	3.00	4.00
42	Kost Nin Ae Tipe C Mandalajati Bandung	Kecamatan Mandalajati	\N	1350000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.65824258327	-6.8977920153206	3.00	4.00
43	Kost Kaaz Tipe A Kiaracondong Bandung	Kiaracondong	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.64867614955	-6.9139559041291	3.00	4.00
44	Kost Bandung Paviliun Cemara Balkon 3 Coblong Bandung	Coblong	\N	1450000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.627964	-6.890604	3.00	4.00
45	Kost Batik Pekalongan 5 Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63104196638	-6.8956467961541	3.00	4.00
46	Kost Suci Residence Tipe C Cibeunying Kidul Bandung	Cibeunying Kidul	\N	1250000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.654176	-6.8986271	3.00	4.00
47	Kost Gemilang Berkah Tipe A Cimenyan Bandung	Kecamatan Cimenyan	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.633713	-6.887548	3.00	3.00
48	Kost Palm Bridge Tipe E Cimenyan Bandung	Cimenyan	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63364136219	-6.8878437083678	3.00	3.00
49	Kost Pondok Salsabila Tipe 2 Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	800000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.64215301722	-6.9045910809607	2.00	3.00
50	Kost Orange Tipe Studio A Antapani Bandung	Kecamatan Antapani	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.655995	-6.915408	3.00	3.00
51	Kost Mukti Tipe D Cimenyan Bandung	Cimenyan	\N	1310000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.634638	-6.885951	3.00	4.00
52	Kost Pondok Ferren Tipe B Cibeunying Kidul Bandung	Cibeunying Kidul	\N	600000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.644665	-6.899615	2.00	3.00
53	Kost Egy Tipe B Kiaracondong Bandung	Kiaracondong	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.64833517373	-6.9156610302062	3.00	4.00
54	Kost Mukti Tipe A Cimenyan Bandung	Kecamatan Cimenyan	\N	1350000.00	21	Sewa	Sertifikat Hak Milik (SHM)	21	107.6345891	-6.8862081	3.50	6.00
55	Kost Pondok Salsabila Tipe 1 Cibeunying Kidul Bandung	Cibeunying Kidul	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6419666037	-6.9045807627777	3.00	3.00
56	Kost Evelyn Home 1 Cibeunying Kidul Bandung	Cibeunying Kidul	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.64379519969	-6.8977870225798	3.00	4.00
57	Kost Cikaso 86E Cibeunying Kidul Bandung	Cibeunying Kidul	\N	1350000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.633055	-6.9098564	3.00	3.00
58	Kost Mukti Tipe E Cimenyan Bandung	Cimenyan	\N	1270000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.634633	-6.886073	4.00	5.00
59	Kost F30 Tipe B Antapani Bandung	Antapani	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.652353	-6.913104	3.00	4.00
60	Kost Boemi Bodaz Tipe B Cimenyan Bandung	Kecamatan Cimenyan	\N	1200000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.652169	-6.893571	6.00	4.00
61	Kost Suci Residence Tipe A Cibeunying Kidul Bandung	Cibeunying Kidul	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.65363454819	-6.8983938066327	3.00	4.00
62	Kost Nelly Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.630533	-6.892846	3.00	4.00
63	Kost Mami Lilis Tipe Medium Kiaracondong Bandung	Kiaracondong	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.647648	-6.909674	3.00	4.00
64	Kost Sunrise Tipe C Cibeunying Kidul Bandung	Cibeunying Kidul	\N	775000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.641061	-6.902117	3.00	3.00
65	Kost Humaira Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1150000.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.633121	-6.899317	2.00	3.50
66	Kost Deadims Antapani Bandung	Kecamatan Antapani	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.653246	-6.91391	3.00	3.00
67	Kost Supratman Tipe D Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.630283	-6.904561	3.00	4.00
68	Kost Bu Nina Tipe A Antapani Bandung	Kecamatan Antapani	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.658208	-6.91651	3.00	3.00
69	Kost Pondok Cisokan Baru 8 Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1400000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63300836086	-6.9016909970055	3.00	3.00
70	Kost Terusan Cisokan Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63286352158	-6.9027607649219	3.00	4.00
71	Kost Pinta Pahlawan Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.634756	-6.898588	3.00	4.00
72	Kost Wartong Muararajeun Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62790579349	-6.9006415303623	3.00	3.00
73	Kost Mardi Tipe A Antapani Bandung	Antapani	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.655949	-6.915651	3.00	3.00
74	Kost CK 38 Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63340365142	-6.8901474017435	3.00	3.00
75	Kost Amanda Tipe B Antapani Bandung	Kecamatan Antapani	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.64579277486	-6.9130113088966	3.00	3.00
76	Kost Paviliun Cemara Tipe VIP Coblong Bandung	Coblong	\N	1550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.627964	-6.890604	3.50	3.50
77	Kost Nin Ae Tipe A Mandalajati Bandung	Kecamatan Mandalajati	\N	1800000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.65824258327	-6.8977920153206	6.00	4.00
78	Kost BP52 Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63053536415	-6.8943996022058	3.00	4.00
79	Kost Nafaa Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.643763	-6.899139	3.00	3.00
80	Kost Vanilla Alamanda Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.634453	-6.888335	3.00	4.00
81	Kost Sapujagat 22 Paviliun Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62963145971	-6.8977587303806	3.00	3.00
82	Kost Ibu Tati Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	600000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.626792	-6.89798	2.50	2.50
83	Kost Cikutra Barat Tipe A Coblong Bandung	Coblong	\N	1700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62808851898	-6.892411141548	3.00	3.00
84	Kost 99 Pusat Kota Tipe Mezanine 2 Cimenyan Bandung	Kecamatan Cimenyan	\N	1700000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.633948	-6.887307	2.00	4.00
85	Kost Supratman Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630283	-6.904561	3.00	3.00
86	Kost Sukamulus Cibeunying Kidul Bandung	Cibeunying Kidul	\N	450000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.638115	-6.908322	3.00	3.00
87	Kost Qta Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1100000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.630947	-6.8999	2.50	4.00
88	Kost Pondok Bunga Tipe C Cibeunying Kaler Bandung	Cibeunying Kaler	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.626884	-6.897756	3.00	3.00
89	Kost Sukamulya 74 Bandung	Kecamatan Cibeunying Kidul	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.642723	-6.905719	3.00	3.00
90	Kost Mala Djumiati Tipe VVIP Antapani Bandung	Antapani	\N	775000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.661584	-6.915709	3.00	3.00
91	Kost Rezky Ahmad Yani Kiaracondong Bandung	Kiaracondong	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.653455	-6.90389	3.00	4.00
92	Kost Master Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62789271772	-6.8886648643339	3.00	4.00
93	Kost Pahlawan Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6348406449	-6.8958475052018	3.00	3.00
94	Kost Bumi Putri Sukasenang Tipe B Cibeunying Kidul Bandung	Cibeunying Kidul	\N	1450000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63493379231	-6.8995660817822	3.00	4.00
95	Kost Sumitra Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1200000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.6422576	-6.8958566	3.00	2.50
96	Kost F30 Tipe A Antapani Bandung	Antapani	\N	1500000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.652353	-6.913104	4.00	5.00
97	Kost Pondok Mahmudah Antapani Bandung	Kecamatan Antapani	\N	800000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.65912234783	-6.9125543211667	2.50	3.00
98	Kost Bumi Sukasenang Tipe A Cibeunying Kidul Bandung	Cibeunying Kidul	\N	1350000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63511389494	-6.8998064155355	3.00	4.00
99	Kost Master Tipe B Cibeunying Kaler Bandung	Cibeunying Kaler	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62789271772	-6.8886648643339	3.00	3.00
100	Kost Bengawan 83 Tipe B Bandung Wetan Bandung	Bandung Wetan	\N	1350000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.630005	-6.910741	3.50	3.50
101	Kost Muararajeun Kaler Exclusive Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.628964	-6.901616	3.00	4.00
102	Kost Alfa Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	870000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62792993337	-6.8872848421851	3.00	3.00
103	Kost Bidan Maria 1 Antapani Bandung	Antapani	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.653929	-6.914223	3.00	4.00
104	Kost Syariah Hilmi Cibeunying Kidul Bandung	Cibeunying Kidul	\N	975000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63510484248	-6.9103069868769	3.00	4.00
105	Kost Paviliun CemaraTipe Balkon 1 Coblong Bandung	Coblong	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6280512	-6.890744	3.00	4.00
106	Kost Permai 17A Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1350000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.628352	-6.888654	3.00	3.00
107	Kost Bekarbon Cibeunying Kidul Bandung	Cibeunying Kidul	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.64250002801	-6.9010785587777	3.00	3.00
108	Kost Pondok Bunga Tipe E Cibeunying Kaler Bandung	Cibeunying Kaler	\N	600000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.626884	-6.897756	3.00	2.00
109	Kost Muararajeun Lama 2 Tipe C1 Cibeunying Kaler Bandung	Cibeunying Kaler	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630439	-6.902196	3.00	3.00
110	Kost Bengawan 83 Tipe C1 Bandung Wetan Bandung	Kecamatan Bandung Wetan	\N	1250000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.630005	-6.910741	3.20	3.20
111	Kost Paras Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63011	-6.888417	3.00	4.00
112	Kost Bengawan 83 Tipe D Bandung Wetan Bandung	Bandung Wetan	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630005	-6.910741	3.20	2.70
113	Kost Bu Linda Cikutra 1 Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	800000.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.641536	-6.898709	2.70	2.50
114	Kost Vinz Global House VVIP Antapani Bandung	Antapani	\N	990000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.655346	-6.91534	3.00	4.00
115	Kost Palapa Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.632167	-6.908427	3.00	4.00
116	Kost Muararajeun Lama 2 Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630439	-6.902196	3.50	2.50
117	Kost Batik Jogja 7 Sukaluyu Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1150000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6307451	-6.8957217	3.00	3.00
118	Kost Fira Tipe B Cibeunying Kaler Bandung	Cibeunying Kaler	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630835	-6.902214	3.00	3.00
119	Kost Puri Artha Sony n Sist 2 Cibeunying Kidul Bandung	Cibeunying Kidul	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.64143519104	-6.9011910610768	3.00	4.00
120	Kost Favorite Tipe A Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.643732	-6.894143	4.00	3.00
121	Kost Pondok Bunga Tipe B Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.627618	-6.897162	3.00	4.00
122	Kost Balqis Batununggal Bandung	Kecamatan Batununggal	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.642446	-6.911877	3.00	3.00
123	Kost Abizar Batununggal Bandung	Kecamatan Batununggal	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63401	-6.917491	3.00	4.00
124	Kost G Standar Coblong Bandung	Kecamatan Coblong	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.625911	-6.890559	3.00	4.00
125	Kost Bahagia Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1350000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.6382925	-6.8968894	3.00	3.50
126	Kost Sant In Residence Executive Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633532	-6.890739	3.00	4.00
127	Kost Urban Residence Tipe A Kiaracondong Bandung	Kiaracondong	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.650672	-6.906712	3.00	3.00
128	Kost Kirana Tipe A Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.65638649464	-6.9017435867729	3.00	3.00
129	Kost Shakira Tipe A Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	1500000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.63835668564	-6.9024465582925	2.00	4.00
130	Kost Sidomukti Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630736	-6.893252	3.00	3.00
131	Kost Sidomukti 65 Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63106845319	-6.8930828387663	3.00	4.00
132	Kost Elroi Bojong Koneng Atas Cikutra Tipe D Cimenyan Bandung	Cimenyan	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.647313	-6.888007	3.00	4.00
133	Kost Elroi Bojong Koneng Atas Cikutra Tipe B Cimenyan Bandung	Cimenyan	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.647313	-6.888007	3.00	4.00
134	Kost Apik Never T2 Widyatama Tipe B Cibeunying Kidul Bandung	Cibeunying Kidul	\N	764200.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.64594686396	-6.8955397736688	3.00	4.00
135	Kost Paviliun Surya Bj Kaler Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6304052	-6.8893463	3.00	4.00
136	Kost Rumah Surya Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6315921545	-6.8889354760209	3.00	4.00
137	Kost Kumeli 30 Standart Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633124	-6.897115	3.00	4.00
138	Kost Safa Tipe C Mandalajati Bandung	Kecamatan Mandalajati	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.65741277486	-6.9000221009726	3.00	4.00
139	Kost Apik Mekar II Padasuka Tipe B Cibeunying Kidul Bandung	Cibeunying Kidul	\N	685000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.66207539018	-6.8866500128521	3.00	3.00
140	Kost Pak Resmana Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	800000.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.644235	-6.897503	3.50	2.00
141	Kost Alpha Tipe C Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1220000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6275914	-6.8879323	3.00	4.00
142	Kost Apik Bintang Kumeli Tipe D Cibeunying Kaler Bandung	Bojongloa Kaler	\N	832500.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.63218811347	-6.8971730404579	2.50	2.50
143	Kost Bu Sur Tipe A Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	550000.00	4	Sewa	Sertifikat Hak Milik (SHM)	4	107.643211	-6.903799	2.00	2.00
144	Kost Apik Teduh Sukaluyu Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	745000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.6281153	-6.8965983	2.50	3.00
145	Kost Wisma Karya Kiaracondong Bandung	Kiaracondong	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.657915	-6.903293	2.10	4.20
146	Kost Apik Bintang Kumeli Tipe B Cibeunying Kaler Bandung	Cibeunying Kaler	\N	945000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.63218811347	-6.8971730404579	4.00	4.00
147	Kost Apik Bintang Kumeli Tipe C Cibeunying Kaler Bandung	Cibeunying Kaler	\N	899000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63218811347	-6.8971730404579	3.00	3.00
148	Kost Singgahsini Rumah Kita Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	896200.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630718	-6.8912	3.00	3.00
149	Kost Na Jeges Cigadung Selatan 27 Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62913497215	-6.8886745206269	3.00	3.00
150	Kost Hegar CH4 Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.627752	-6.887501	3.00	3.00
151	Kost Alpha Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	870000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6275914	-6.8879323	3.00	4.00
152	Kost Apik Teduh Sukaluyu Tipe B Cibeunying Kaler Bandung	Cibeunying Kaler	\N	790000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6281153	-6.8965983	3.00	3.00
153	Kost Apik Mekar II Padasuka Tipe A Cibeunying Kidul Bandung	Cibeunying Kidul	\N	790000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.66207539018	-6.8866500128521	3.00	3.00
154	Kost La Cimbeleuit Kota Bandung	Kecamatan Cidadap	\N	900000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.60501682758	-6.8634673446865	2.50	2.50
155	Kost Bukit Jarian Cidadap Bandung	Kecamatan Cidadap	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60535478592	-6.8781348543049	3.00	4.00
156	Kost Gergirr Sukasari Bandung	Kecamatan Sukasari	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.587689	-6.863104	3.00	3.00
157	Kost Ciwaruga Parongpong Bandung Barat	Kecamatan Parongpong	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.581482	-6.853648	3.50	3.50
158	Kost Bukit Sari 9 Ciumbuleuit Bandung	Cidadap	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.603217	-6.880069	3.00	4.00
159	Kost 8th Loft Nhi Upi Appt X Sukasari Bandung	Kecamatan Sukasari	\N	4750000.00	25	Sewa	Sertifikat Hak Milik (SHM)	25	107.593241	-6.8691233	5.00	5.00
160	Kost Gumara Sukasari Bandung	Sukasari	\N	900000.00	0	Sewa	Sertifikat Hak Milik (SHM)	0	107.578104	-6.867757	0.00	0.00
161	Kost Jalan Pak Gatot Sukasari Bandung	Sukasari	\N	700000.00	0	Sewa	Sertifikat Hak Milik (SHM)	0	107.5890747	-6.8652598	0.00	0.00
162	Kost Mama Khansa Sukasari Bandung	Kecamatan Sukasari	\N	650000.00	0	Sewa	Sertifikat Hak Milik (SHM)	0	107.585243	-6.862616	0.00	0.00
163	Kost Kartika II Tipe A Sukasari Bandung	Kecamatan Sukasari	\N	600000.00	0	Sewa	Sertifikat Hak Milik (SHM)	0	107.589645	-6.8668	0.00	0.00
164	Kost Guswin Sukasari Bandung	Sukasari	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5858738	-6.8657755	3.00	4.00
165	Kost Ciumbuleuit 96 Cidadap Bandung	Cidadap	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.604103	-6.880382	3.00	4.00
166	Kost Ikhwan Parongpong Bandung Barat	Parongpong	\N	500000.00	0	Sewa	Sertifikat Hak Milik (SHM)	0	107.575721	-6.864295	0.00	0.00
167	Kost Guest House Kami No Ko Tipe Meteor Sukajadi Bandung	Sukajadi	\N	1600000.00	0	Sewa	Sertifikat Hak Milik (SHM)	0	107.5896429	-6.8794209	0.00	0.00
168	Kost Bukit Sari Cidadap Bandung	Cidadap	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.603128	-6.879706	3.00	3.00
169	Kost Karizma Guesthouse Sukasari Bandung	Sukasari	\N	1900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5802806	-6.8741749	3.00	4.00
170	Kost Pondok Puspita Sukasari Bandung	Sukasari	\N	1075000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5933484	-6.8568371	3.00	4.00
171	Kost Apik Muh Unpar Tipe B Cidadap Bandung	Cidadap	\N	781800.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60398238206	-6.8756618943683	3.00	3.00
172	Kost Singgahsini Bukit Indah UNPAR Tipe A Ciumbuleuit Bandung	Kecamatan Cidadap	\N	1221000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6034816	-6.8724722	3.00	3.00
173	Kost Apik Ciumbuleuit 1 Tipe A Cidadap Bandung	Cidadap	\N	718000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.604271	-6.878851	3.00	3.00
174	Kost Lima Lapan Tipe A Sukasari Bandung Barat	Kecamatan Sukasari	\N	1300000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.578416	-6.873081	4.00	6.00
175	Kost Singgahsini Bukit Indah UNPAR Tipe B Ciumbuleuit Bandung	Cidadap	\N	1313000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6034816	-6.8724722	3.50	3.50
176	Kost Alis Ciumbuleuit Cidadap Bandung	Cidadap	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6082266	-6.8737973	3.00	4.00
177	Kost Bapak Yusup Sariwangi Sarijadi Polban Parongpong Bandung	Parongpong	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.57498983294	-6.853942741378	3.00	4.00
178	Kost Stockholm Residence Cidadap Bandung	Cidadap	\N	1620000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.59875051677	-6.8600836740292	3.00	4.00
179	Kost Graha Setiabudi Superior Non View Cidadap Bandung	Kecamatan Cidadap	\N	2500000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.59836494923	-6.8793438118487	3.00	4.50
180	Kost Cisdah 15 Tipe A Coblong Bandung	Coblong	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61215250939	-6.8780433169206	3.00	3.00
181	Kost Cipedes 97 Keyz Tipe A 6 Sukasari Bandung	Kecamatan Sukasari	\N	900000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.59019	-6.87165	5.00	2.80
182	Kost Ciumbuleuit Type A Cidadap Bandung	Cidadap	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.606673	-6.860424	3.00	4.00
183	Kost Wisma Panorama Cidadap Bandung	Kecamatan Cidadap	\N	1400000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.595993	-6.865522	3.00	3.00
184	Kost Nyonya Residence Tipe Exclusive Sukasari Bandung	Sukasari	\N	1449000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.584441	-6.875873	3.00	4.00
185	Kost Pondok Teratai Unpar Tipe H Cidadap Bandung	Cidadap	\N	1850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60610211641	-6.8762515106792	3.00	4.00
186	Kost Sandila 136 Sukasari Bandung	Kecamatan Sukasari	\N	1600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.584607	-6.868351	3.00	4.00
187	Kost Guest House Kami No Ko Tipe Star Sukajadi Bandung	Sukajadi	\N	2500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5896429	-6.8794209	3.00	4.00
188	Kost Ikhwan Parongpong Bandung Barat	Parongpong	\N	500000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.575721	-6.864295	3.80	2.50
189	Kost Cepot Coblong Bandung	Kecamatan Coblong	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61114936322	-6.878484360519	3.00	3.00
190	Kost H Bahrun Tipe A Cidadap Bandung	Cidadap	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60511338711	-6.8777436698432	3.00	3.00
191	Kost Guest House Kami No Ko Tipe Meteor Sukajadi Bandung	Sukajadi	\N	1600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5896429	-6.8794209	3.00	4.00
192	Kost Cisitu Lama Tipe 2 Coblong Bandung	Coblong	\N	1200000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.610939	-6.879698	3.00	3.80
193	Kost Guest House Kami No Ko Tipe Cloud Sukajadi Bandung	Sukajadi	\N	1800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5896429	-6.8794209	3.00	4.00
194	Kost Sandila Tipe A Sukasari Bandung	Sukasari	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.58438	-6.8681539	3.00	4.00
195	Kost Guest House Kami No Ko Tipe Rain Sukajadi Bandung	Sukajadi	\N	2200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5896429	-6.8794209	3.00	4.00
196	Kost Genah I Tipe A Cidadap Bandung	Cidadap	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6085766	-6.8728413	3.00	3.00
197	Kost New Resik By Puspita Sukasari Bandung	Kecamatan Sukasari	\N	1007000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.592934	-6.856739	2.60	3.50
198	Kost Paviliun Bukit Sari 3 VIP Cidadap Bandung	Kecamatan Cidadap	\N	2500000.00	64	Sewa	Sertifikat Hak Milik (SHM)	64	107.603077	-6.87971	8.00	8.00
199	Kost Graha Setiabudi Superior Non View Cidadap Bandung	Kecamatan Cidadap	\N	2500000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.59836494923	-6.8793438118487	3.00	4.50
200	Kost Bumi Katineung 23 VVIP Coblong Bandung	Coblong	\N	1000000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.611965	-6.879923	3.00	2.60
201	Kost Apik Muh Unpar Tipe A Cidadap Bandung	Cidadap	\N	935800.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60398238206	-6.8756618943683	4.00	3.00
202	Kost Geger Kalong Hilir Belakang Sukasari Bandung	Sukasari	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5875009	-6.8660066	3.00	3.00
203	Kost Graha Setiabudi Tipe Superior View Cidadap Bandung	Kecamatan Cidadap	\N	2750000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.59836494923	-6.8793438118487	3.00	4.50
204	Kos Pondok Teratai Unpar Tipe C Cidadap Bandung	Cidadap	\N	1150000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60610211641	-6.8762515106792	3.00	4.00
205	Kost Skynest 52 Executive Cidadap Bandung	Kecamatan Cidadap	\N	2200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.606609	-6.875713	3.00	4.00
206	Kost Pondok Teratai Unpar Tipe E Cidadap Bandung	Cidadap	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60610211641	-6.8762515106792	3.00	4.00
207	Kost Rumah Alida Cidadap Bandung	Kecamatan Cidadap	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6010526	-6.8794368	3.00	4.00
208	Kost Pondok Teratai Unpar Tipe G Cidadap Bandung	Cidadap	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60610211641	-6.8762515106792	3.00	4.00
209	Kost Guest House Kami No Ko Tipe Galaxy Sukajadi Bandung	Sukajadi	\N	1900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5896429	-6.8794209	3.00	4.00
210	Kost Fitri Tipe A Sukasari Bandung	Sukasari	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.57892061025	-6.8791144696437	3.00	3.00
211	Kost Holland Sukasari Bandung	Kecamatan Sukasari	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.576813	-6.877153	3.00	3.00
212	Kost Cipedes Tengah Tipe B Premium Sukajadi Bandung	Sukajadi	\N	1950000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.59059928358	-6.8800018802315	4.00	3.50
213	Kost Py Sukasari Bandung	Kecamatan Sukasari	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.589834	-6.869592	3.00	4.00
214	Kost Ibu Henny Sukasari Bandung	Sukasari	\N	1500000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.5806105	-6.8723706	3.00	5.00
215	Kost Pojok Bapak Ade II Tipe A Cidadap Bandung	Cidadap	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.598748	-6.859183	3.00	4.00
216	Kost Zahwa Cidadap Bandung	Cidadap	\N	1250000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60871961713	-6.872193209328	3.00	3.00
217	Kost Mangle Tipe A Cidadap Bandung	Kecamatan Cidadap	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.596135	-6.860186	3.00	3.00
218	Kost Cipedes Tengah Tipe A Sukajadi Bandung	Sukajadi	\N	1900000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.59052518755	-6.8799915615132	4.50	3.50
219	Kost Geger Arum Sukasari Bandung	Sukasari	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5866034627	-6.8612786967128	3.00	3.00
220	Kost Cikendi 100 Cidadap Bandung	Cidadap	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60193496943	-6.874654424109	2.90	3.00
221	Kost The Chrysant Tipe A Coblong Bandung	Kecamatan Coblong	\N	1650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61208176613	-6.8790615445038	3.00	3.00
222	Kost Hf Stay Coblong Bandung	Coblong	\N	1795000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.612034	-6.876204	3.00	4.00
223	Kost Mangle Tipe B Cipaku Bandung	Kecamatan Cidadap	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.596135	-6.860186	3.00	3.00
224	Kost Dosteng Tipe A Lembang Bandung Barat	Kecamatan Lembang	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60553	-6.845513	3.00	4.00
225	Kost Guest House 223F Tipe A Sukasari Bandung	Sukasari	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.59456023574	-6.8755148809627	3.00	4.00
226	Kost Bumi Katineung Tipe Vvip Coblong Bandung	Kecamatan Coblong	\N	1050000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.610027	-6.879651	3.00	3.00
227	Kost Olive Residence Tipe Single Sukasari Bandung	Sukasari	\N	1950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.591193	-6.878325	3.00	3.00
228	Kost SR 11 Deluxe Sukasari Bandung	Kecamatan Sukasari	\N	775000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.57975041866	-6.8767554672697	3.00	3.00
229	Kost Wisma Langit Biru I Tipe B Sukasari Bandung	Kecamatan Sukasari	\N	2100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.595330365	-6.8745342596043	3.00	4.00
230	Kost Silver Cidadap Bandung	Kecamatan Cidadap	\N	1600000.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.606851	-6.87595	3.00	2.20
231	Kost Pondok Binangkit Tipe A Sukasari Bandung	Kecamatan Sukasari	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.592776	-6.856902	3.00	4.00
232	Kost Ana Sukasari Bandung	Sukasari	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.58051216602	-6.8763240751353	3.00	4.00
233	Kost 87 Gang Bukit Sastra Cidadap Bandung	Kecamatan Cidadap	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.603424	-6.875918	3.00	4.00
234	Kost Lili 2 Cidadap Bandung	Cidadap	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.59505141526	-6.865436952823	3.00	3.00
235	Kost Green Home Sari Asih Sukasari Bandung	Kecamatan Sukasari	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.57758319378	-6.8753494470194	3.00	3.00
236	Kost Shopia Tipe B Cidadap Bandung	Kecamatan Cidadap	\N	800000.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.602707	-6.878035	2.70	2.70
237	Kost Mama Khansa Sukasari Bandung	Kecamatan Sukasari	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.585243	-6.862616	3.00	3.00
238	Kost Ibu Maya Gerlong Tipe B Sukasari Bandung	Sukasari	\N	8898859.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.59090687968	-6.8690958259704	3.00	3.00
239	Kost Ibu Maya Gerlong Tipe E Sukasari Bandung	Sukasari	\N	8888880.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5910863	-6.8694971	3.00	3.00
240	Kost Kartika II Tipe A Sukasari Bandung	Kecamatan Sukasari	\N	600000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.589645	-6.8668	3.00	2.50
241	Kost Pondok Azkya Tipe B Sukasari Bandung	Sukasari	\N	1500000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.5903377682	-6.8650188653146	4.00	5.00
242	Kost Pondok Azkya Tipe A Sukasari Bandung	Sukasari	\N	2670000.00	30	Sewa	Sertifikat Hak Milik (SHM)	30	107.5903377682	-6.8650188653146	5.00	6.00
243	Kost Cisitu Lama Tipe 3 Coblong Bandung	Coblong	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.610939	-6.879698	3.00	4.00
244	Kost 8th Loft Nhi Upi Tipe Appt Sukasari Bandung	Kecamatan Sukasari	\N	4750000.00	25	Sewa	Sertifikat Hak Milik (SHM)	25	107.593241	-6.8691233	5.00	5.00
245	Kost Bapak Barnas Tipe A Sukasari Bandung	Kecamatan Sukasari	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.584542	-6.860868	3.00	3.00
246	Kost Deeva 2 Coblong Bandung	Kecamatan Coblong	\N	1700000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.612001	-6.880366	4.00	4.00
247	Kost Gegerkalong Hilir Sukasari Bandung	Sukasari	\N	1600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.58418478072	-6.868013375699	3.00	4.00
248	Kost Satu Sepuluh Coblong Bandung	Kecamatan Coblong	\N	2000000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.6121498	-6.8770382	5.00	4.00
249	Kost Sumer Coblong Bandung	Coblong	\N	2700000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.611985	-6.879655	4.00	5.00
250	Kost Cisdah 15 Bigsize Coblong Bandung	Coblong	\N	1350000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.61215250939	-6.8780433169206	4.00	5.00
251	Kost Abadi Tipe A Sukasari Bandung	Kecamatan Sukasari	\N	900000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.586091	-6.863186	2.50	2.50
252	Kost Bu Moen Sukasari Bandung	Sukasari	\N	900000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.57715336978	-6.8740239762029	2.50	2.50
253	Kost Mainroad Ciumbuleuit 113 Tipe AC Cidadap Bandung	Kecamatan Cidadap	\N	2200000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.603641	-6.878265	3.00	5.00
254	Kost Empat Dua Tipe A Sukasari Bandung	Kecamatan Sukasari	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.591602	-6.866789	3.00	3.00
255	Kost Pondok Geranium Cidadap Bandung	Cidadap	\N	2220000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.6086825	-6.8725031	4.00	4.00
256	Kost Chaadejaa Tipe A Sukasari Bandung	Kecamatan Sukasari	\N	850000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.587397	-6.864151	2.50	2.50
257	Kost Itaewon Living Tipe B Cidadap Bandung	Kecamatan Cidadap	\N	2000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60407805443	-6.8745558958747	3.00	3.00
258	Kost Pondok Asri By Puspita Sukasari Bandung	Kecamatan Sukasari	\N	920000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.593507	-6.856489	3.00	4.00
259	Kost Ibu Dodo Cidadap Bandung	Cidadap	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.604823	-6.877974	3.00	3.00
260	Kost Ibu Usie Sukasari Bandung	Kecamatan Sukasari	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.59589195251	-6.845988837761	3.00	3.00
261	Kost Bapak Yusup Sarijadi Bandung	Sukasari	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5797165877	-6.8733006853374	3.00	4.00
262	Kost Angel House Tipe A Cidadap Bandung	Kecamatan Cidadap	\N	1250000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.595814	-6.8717	3.00	3.00
263	Kost Bukit Resik Tipe A Cidadap Bandung	Cidadap	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.602934	-6.878377	3.00	4.00
264	Kost Tropical Large Cidadap Bandung	Kecamatan Cidadap	\N	2800000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.60693146343	-6.8738446218357	3.00	8.00
265	Kost Pondok Teratai Unpar Tipe B Cidadap Bandung	Cidadap	\N	1350000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60610211641	-6.8762515106792	3.00	4.00
266	Kost Guest House Kami No Ko Tipe Sun Sukajadi Bandung	Sukajadi	\N	2000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.589643	-6.879421	3.00	4.00
267	Kost Aamir Sukasari Bandung	Kecamatan Sukasari	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.586045	-6.863388	3.00	3.00
268	Kost Gumara Sukasari Bandung	Sukasari	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.578104	-6.867757	3.00	3.00
269	Kost Cozy Place Tipe C Sukasari Bandung	Sukasari	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.579433	-6.874973	3.00	3.00
270	Kost Jalan Pak Gatot Sukasari Bandung	Sukasari	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5890747	-6.8652598	3.00	3.00
271	Kost Helma Tipe A Sukasari Bandung	Sukasari	\N	800000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.595892	-6.865681	2.50	2.50
272	Kost Bidan Merry Sukasari Bandung	Kecamatan Sukasari	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5754243508	-6.8803034529944	3.00	3.00
273	Kost Cipedes 97 Keyz Tipe A Sukasari Bandung	Kecamatan Sukasari	\N	800000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.59019	-6.87165	4.00	2.80
274	Kost Bu Nia Cidadap Bandung	Kecamatan Cidadap	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.607745	-6.873711	3.00	4.00
275	Kost Wida Gegerkalong Sukasari Bandung	Sukasari	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.57894542068	-6.8672228081478	3.00	3.00
276	Kost Admasetiabudhi Garden View Tipe Non AC Sukasari Bandung	Sukasari	\N	2800000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.584718	-6.862225	4.00	4.00
277	Kost Rumah Ibu Nina Cidadap Bandung	Kecamatan Cidadap	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.594552	-6.865078	3.00	3.00
278	Kost Graha Setiabudi Tipe Suite Cidadap Bandung	Kecamatan Cidadap	\N	3500000.00	23	Sewa	Sertifikat Hak Milik (SHM)	23	107.59836494923	-6.8793438118487	4.50	5.00
279	Kost Ibu Rum Tipe B Sukasari Bandung	Sukasari	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5776648	-6.8799952	3.00	4.00
280	Kost Ibu Tami Sama Sukasari Bandung	Sukasari	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.588963	-6.863485	3.00	3.00
281	Kost Ibu Lisa Coblong Bandung	Kecamatan Coblong	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.611978	-6.87989	3.00	4.00
282	Kost Bukit Resik ISHI Cidadap Bandung	Kecamatan Cidadap	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6030132	-6.8785062	3.00	4.00
283	Kost Admasetiabudhi Garden View Tipe AC Sukasari Bandung	Sukasari	\N	3100000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.584718	-6.862225	4.00	4.00
284	Kost Rns Superior Room Sukasari Bandung	Kecamatan Sukasari	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5799403	-6.8766414	3.00	4.00
285	Kost Gerlong Hilir Tipe D Sukasari Bandung	Sukasari	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.57955797017	-6.8676372321437	3.00	4.00
286	Kost Panorama 9 Tipe A Cidadap Bandung	Kecamatan Cidadap	\N	1600000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.5948997	-6.8657209	4.00	5.00
287	Kost Graha Annisa Gegerkalong Bandung	Sukasari	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.58629031479	-6.8678569266458	3.00	3.00
288	Kost Gegerkalong Tengah Sukasari Bandung	Sukasari	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5916285	-6.8671403	3.00	3.00
289	Kost Al Mar Atusshalihah 2 Sukasari Bandung	Sukasari	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.59068	-6.869092	3.00	3.00
290	Kost Bu Eva Sukasari Bandung	Kecamatan Sukasari	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.588041	-6.871799	3.00	3.00
291	Kost Pondok Teratai Unpar Tipe A Cidadap Bandung	Cidadap	\N	2000000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.60610211641	-6.8762515106792	4.00	5.00
292	Kost Cipedes 39 Sukasari Bandung	Kecamatan Sukasari	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.59019	-6.87165	3.00	3.00
293	Kost Gergir 113 Tipe Executive Sukasari Bandung	Kecamatan Sukasari	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.587612	-6.862932	3.00	3.00
294	Kost Kosak Elfata Home Upi Sukasari Bandung	Kecamatan Sukasari	\N	1500000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.5889487192	-6.8616824738943	2.50	2.50
295	Kost Pa Aang II Tipe A Sukasari Bandung	Sukasari	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.578317	-6.873234	3.00	3.00
296	Kost Exclusive Sarijadi 93 Tipe Standard Sukasari Bandung	Kecamatan Sukasari	\N	1700000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.581502	-6.869558	3.00	5.00
297	Kost DBee House Cidadap Bandung	Kecamatan Cidadap	\N	2000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60361738503	-6.8730004119556	3.00	4.00
298	Kost Itaewon Living Tipe D Cidadap Bandung	Kecamatan Cidadap	\N	2000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60407805443	-6.8745558958747	3.00	3.00
299	Kost Radivi Tipe Deluxe Sukasari Bandung	Kecamatan Sukasari	\N	1300000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.584424	-6.868246	2.50	3.00
300	Kost Cozy Place Tipe A Sukasari Bandung	Sukasari	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.579433	-6.874973	3.00	4.00
301	Kost Guest House Kami No Ko Tipe Rainbow Sukajadi Bandung	Sukajadi	\N	1800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5896429	-6.8794209	3.00	4.00
302	Kost DiRaben 29 Tipe Special Cidadap Bandung	Kecamatan Cidadap	\N	950000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.608404	-6.874011	3.50	4.00
303	Kost Hilma 4 Tipe A Cidadap Bandung	Cidadap	\N	850000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.596223	-6.865742	3.00	2.50
304	Kost Tropical Medium Cidadap Bandung	Kecamatan Cidadap	\N	2400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60693146343	-6.8738446218357	3.00	4.00
305	Kost Ummu Asfar Tipe A Coblong Bandung	Coblong	\N	1450000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.611883	-6.876629	3.00	3.00
306	Kost Wina Cidadap Bandung	Cidadap	\N	1400000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.607047	-6.87318	3.00	3.00
307	Kost Sarijadi Raya Tipe A Sukasari Bandung	Kecamatan Sukasari	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5818997621	-6.8689424157189	3.00	4.00
308	Kost Home 39 Tipe A Cidadap Bandung	Cidadap	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.604851	-6.878346	3.00	3.00
309	Kost Al Mar Atusshalihah Sukasari Bandung	Kecamatan Sukasari	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.592417	-6.865301	3.00	3.00
310	Kost E House Standar Parongpong Bandung Barat	Kecamatan Parongpong	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.57403731346	-6.8676215872283	2.50	3.50
311	Kost 8th Loft Nhi Upi Tipe Deluxe Sukasari Bandung	Kecamatan Sukasari	\N	3250000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.593241	-6.8691233	3.00	3.00
312	Kost Bu Yani Tipe A Coblong Bandung	Coblong	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.608478	-6.87931	3.00	3.00
313	Kost CSI 1 Coblong Bandung	Coblong	\N	1900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.612149	-6.87705	3.00	4.00
314	Kost Hampton Residence Tipe VVIP Cidadap Bandung	Kecamatan Cidadap	\N	2200000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.59848967195	-6.8600617042248	3.50	4.50
315	Kost E House Superior Parongpong Bandung Barat	Kecamatan Parongpong	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.57403731346	-6.8676215872283	3.50	3.50
316	Kost Rumah De Ha Sukasari Sarijadi Bandung	Sukasari	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.578182	-6.8788239	3.00	4.00
317	Kost Gladisa Living Place Cidadap Bandung	Cidadap	\N	1500000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.59678848088	-6.8547346624954	5.00	3.00
318	Kost King Unpar Cidadap Bandung	Cidadap	\N	1600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60687224567	-6.8776495395354	3.00	3.00
319	Kost Picung Sukasari Bandung	Kecamatan Sukasari	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.58810818195	-6.8723190331679	3.00	4.00
320	Kost Bulan Cidadap Bandung	Cidadap	\N	1600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60788679123	-6.8725959786455	3.00	3.00
321	Kost Gerlong 20B Standart Sukasari Bandung	Kecamatan Sukasari	\N	500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.587914	-6.864215	3.00	3.00
322	Kost Setrasari VI Sukasari Bandung	Sukasari	\N	1800000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.58973896503	-6.8753357434384	4.00	4.00
323	Kost Busas Cidadap Bandung	Cidadap	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.603763	-6.87595	3.00	3.00
324	Kost Surya Boarding House Sukasari Bandung	Sukasari	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5772308	-6.8678523	3.00	4.00
325	Kost Mainroad Ciumbuleuit 113 Ekslusive Cidadap Bandung	Kecamatan Cidadap	\N	1900000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.603641	-6.878265	3.00	5.00
326	Kost Pondok Teratai Unpar Tipe E Cidadap Bandung	Cidadap	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60610211641	-6.8762515106792	3.00	4.00
327	Kost Rumah Alida Cidadap Bandung	Kecamatan Cidadap	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6010526	-6.8794368	3.00	4.00
328	Kost Pondok Teratai Unpar Tipe G Cidadap Bandung	Cidadap	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60610211641	-6.8762515106792	3.00	4.00
329	Kost Cozy Place Tipe B Sukasari Bandung	Sukasari	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.579433	-6.874973	3.00	3.00
330	Kost Betah Nidera Sukasari Bandung	Sukasari	\N	1200000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.594918	-6.875176	2.50	3.00
331	Kost The Theresia Tipe A Cidadap Bandung	Cidadap	\N	1100000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.603641	-6.874125	2.30	2.80
332	Kost Guest House Kami No Ko Tipe Galaxy Sukajadi Bandung	Sukajadi	\N	1900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5896429	-6.8794209	3.00	4.00
333	Kost Holland Sukasari Bandung	Kecamatan Sukasari	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.576813	-6.877153	3.00	3.00
334	Kost Rumah Firdaus Sukasari Bandung	Kecamatan Sukasari	\N	2000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.57542669773	-6.8802332191782	3.00	3.00
335	Kost Angel House Tipe B Cidadap Bandung	Cidadap	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.595814	-6.8717	3.00	3.00
336	Kost Bukit Sari Cidadap Bandung	Cidadap	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.603128	-6.879706	3.00	3.00
337	Kost Karizma Guesthouse Sukasari Bandung	Sukasari	\N	1900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5802806	-6.8741749	3.00	4.00
338	Kost Pondok Puspita Sukasari Bandung	Sukasari	\N	1075000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5933484	-6.8568371	3.00	4.00
339	Kost Apik Muh Unpar Tipe B Cidadap Bandung	Cidadap	\N	781800.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60398238206	-6.8756618943683	3.00	3.00
340	Kost Singgahsini Bukit Indah UNPAR Tipe A Ciumbuleuit Bandung	Kecamatan Cidadap	\N	1221000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6034816	-6.8724722	3.00	3.00
341	Kost Apik Ciumbuleuit 1 Tipe A Cidadap Bandung	Cidadap	\N	718000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.604271	-6.878851	3.00	3.00
342	Kost Lima Lapan Tipe A Sukasari Bandung Barat	Kecamatan Sukasari	\N	1300000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.578416	-6.873081	4.00	6.00
343	Kost Wisma Cemara Sukasari Bandung	Kecamatan Sukasari	\N	2600000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.5800598	-6.8802385	4.00	5.00
344	Kost Singgahsini Bukit Indah UNPAR Tipe B Ciumbuleuit Bandung	Cidadap	\N	1313000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6034816	-6.8724722	3.50	3.50
345	Kost Sarijadi Cijerokaso Tipe B Sukasari Bandung	Sukasari	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5785825	-6.8713319	3.00	4.00
346	Kost Wisma Rafflesia Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.530984	-6.886124	3.00	3.00
347	Kost Bilqis AR Tipe C Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	750000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.5221524	-6.8834987	4.00	6.00
348	Kost Dinni Setiamanah Cimahi Tengah Cimahi	Cimahi Tengah	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.53910522908	-6.8728209967271	3.00	4.00
349	Kost Paduka Homestay Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	1000000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.5251631	-6.8760308	4.00	5.00
350	Kost Wisma Rizqy 3 Cimahi Selatan	Kecamatan Cimahi Selatan	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.524672	-6.886113	3.00	3.00
351	Kost Pondok Dairi Cimahi Tengah Cimahi	Cimahi Tengah	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.526193	-6.878614	3.00	4.00
352	Kost Pariwisata Cimahi Selatan Cimahi	Cimahi Selatan	\N	550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.521182	-6.900284	3.00	4.00
353	Kost Pinky2 Cimahi Tengah Cimahi	Cimahi Tengah	\N	800000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.53089129925	-6.8848879345501	4.00	4.00
354	Kost Home 72 Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.533371	-6.904684	3.50	3.50
355	Homestay Cluster Harris Tipe A Cimahi Tengah	Cimahi Tengah	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5390638	-6.8945589	3.00	4.00
356	Kost Bapak Rusan Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.526371	-6.88306	3.00	4.00
357	Kost Ibu Rahmat Cimahi Tengah Cimahi	Cimahi Tengah	\N	1150000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.54576314241	-6.876558411652	3.00	4.00
358	Kost Pondok Intan Cimahi Selatan Cimahi	Cimahi Selatan	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.522095	-6.889696	3.00	3.00
359	Kost Sekar Kemuning Tipe A Cimahi Selatan	Cimahi Selatan	\N	1500000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.51990396529	-6.8896644292437	3.00	5.00
360	Homestay Cluster Harris Tipe B1 Cimahi Tengah	Cimahi Tengah	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5390638	-6.8945589	3.00	4.00
361	Kost Bu Sisil I Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	250000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5382182	-6.9049583	3.00	4.00
362	Kost Pondok Radella Tipe A Cimahi Selatan Cimahi	Cimahi Selatan	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.52333953977	-6.885230112912	3.00	3.00
363	Kost Bu Rita 3 Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.53311552107	-6.8890546383139	3.00	4.00
364	Kost Wisma Amelia Cimahi Selatan	Kecamatan Cimahi Selatan	\N	500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.523779	-6.8852127	3.00	3.00
365	Kost Pondok Pak Abdul Tipe A Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	900000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.523372	-6.885194	3.00	2.00
366	Kost Hawarra Cimahi Selatan Cimahi	Cimahi Selatan	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.523819	-6.888928	3.00	4.00
367	Kost Mutiara Cimahi Selatan Cimahi	Cimahi Selatan	\N	350000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.522515	-6.887069	3.00	4.00
368	Rumah Kontrakan 3KT Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.528802	-6.879354	3.00	4.00
369	Kost Edelweiss Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	750000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.522043	-6.888779	4.00	4.00
370	Kost Elkana Baru Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	1200000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.518079	-6.890207	4.00	5.00
371	Kost Istana Mamain VVIP Cimahi Tengah Cimahi	Cimahi Tengah	\N	1125000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.5293158	-6.8846253	4.00	6.00
372	Kost Pondok Bali Tipe A Cimahi Selatan	Cimahi Selatan	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.52225156873	-6.8894783632079	3.00	4.00
373	Kost Jl Warung Contong Cimahi	Cimahi Tengah	\N	500000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.53338776529	-6.8835634889343	4.00	4.00
374	Kost Hidayah Pondok Cimahi Selatan	Cimahi Selatan	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.521088	-6.889465	3.00	4.00
375	Kost Bu Hj Nina Syariah Cimahi Selatan	Cimahi Selatan	\N	650000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.524836	-6.901648	4.00	4.00
376	Kost Wisma Prima Minimalis B Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	450000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.544241	-6.875191	3.00	3.50
377	Kost Pondok Pak Abdul J Tipe A Cimahi Selatan Cimahi	Cimahi Selatan	\N	800000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.523328	-6.885183	3.00	2.50
378	Kost Putih Tipe B Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5220132	-6.8833976	3.00	3.00
379	Kost Flower Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5270427	-6.8865229	3.00	4.00
380	Kost Gonimi Tipe A Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	1000000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.529329	-6.879524	3.00	5.00
381	Kost Griya De Rost Cimahi Tengah	Cimahi Tengah	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5312015	-6.8845865	3.00	4.00
382	Kost Saung Jannahh Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5241274	-6.8830922	3.00	4.00
383	Kost Pondok Mandiri 1 Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.521277	-6.883875	3.00	4.00
384	Kost House Homy 80 Cimahi Tengah	Cimahi Tengah	\N	1000000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.54226788878	-6.8763264051865	2.00	4.00
385	Kost Simpang 1 Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.543087	-6.879734	3.00	4.00
386	Kost Gria Living Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.52174496651	-6.8833115143185	3.00	3.00
387	Kost Roy VVIP Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	2500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.537086	-6.881914	3.00	4.00
388	Kost Rumah Michigan 39 Tipe C Cimahi Selatan Cimahi	Cimahi Selatan	\N	700000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.51543	-6.89163	3.00	2.50
389	Kost Homy Delapan Puluh Cimahi Tengah	Cimahi Tengah	\N	700000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.54190981388	-6.876031154327	3.00	5.00
390	Kost Brighton Cimahi Tengah	Kecamatan Cimahi Tengah	\N	400000.00	5	Sewa	Sertifikat Hak Milik (SHM)	5	107.538323	-6.897688	2.60	2.10
391	Kost Bonsar Tipe A Cimahi Tengah Cimahi	Cimahi Tengah	\N	500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.539065	-6.889139	3.00	4.00
392	Kost Endang Tipe A Cimahi Tengah	Cimahi Tengah	\N	1500000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.5395326	-6.8914383	4.00	4.00
393	Kost Ian Jufriansyah Cimahi Tengah Cimahi	Cimahi Tengah	\N	800000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.53236	-6.876612	2.00	4.00
394	Kost Pondok Zahra Cimahi Tengah Cimahi	Cimahi Tengah	\N	1300000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.52931952477	-6.8857933086669	3.50	4.00
395	Kost Rumah Pasundan 2 Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	550000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.545201	-6.872594	3.00	3.00
396	Kost Ria Lestari Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	750000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.53296498209	-6.8835641546531	3.80	3.00
397	Kost Arunika Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	850000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.53465410322	-6.8950117162191	4.00	4.00
398	Kost Leuwi Gajah Tipe A Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.533364	-6.904678	3.00	3.00
399	Kost Dewi Cmh Cimahi Selatan Cimahi	Cimahi Selatan	\N	800000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.538212	-6.900617	3.70	4.00
400	Kost Ibu Ita 2 Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	500000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.53331501037	-6.8890909195647	2.50	2.50
401	Kost Kiluna Cimahi Selatan	Cimahi Selatan	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5237451	-6.8853867	3.00	4.00
402	Kost Nuy Tipe A Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	850000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.53877699375	-6.8744630263379	3.00	8.00
403	Kost Saweri Gading Tipe 2 Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	1550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.53003835678	-6.8860489433989	3.00	4.00
404	Kost Rian 2 Cimahi Tengah Cimahi	Cimahi Tengah	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.523794	-6.881746	2.30	3.80
405	Kost Warung Contong Timur Tipe A Cimahi Tengah Cimahi	Cimahi Tengah	\N	850000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.533913	-6.8838644	3.00	3.50
406	Kost Rumah Oriza Sativa Tipe A Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	450000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.541148	-6.87182	2.00	3.00
407	Kost Wisma Inti II Cimahi Selatan	Cimahi Selatan	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.52256773412	-6.8893478839408	3.00	3.00
408	Kost Pasadena Tipe A Cimahi Tengah Cimahi	Cimahi Tengah	\N	750000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.52551514655	-6.8830349079482	4.00	4.00
409	Kost Aurora Cimahi Selatan	Cimahi Selatan	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.52108246088	-6.8877285400481	3.00	4.00
410	Kost Puri Putri Cibeber Cimahi Selatan	Cimahi Selatan	\N	500000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.52028484944	-6.8995366655458	5.00	2.00
411	Kost Bapak Atang Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	550000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.522011	-6.885673	3.00	3.00
412	Kost Gatsu I Executive Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	1300000.00	30	Sewa	Sertifikat Hak Milik (SHM)	30	107.542999	-6.881394	5.00	6.00
413	Kost Rumah Mama Nie Cimahi Tengah Cimahi	Cimahi Tengah	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.539768	-6.889596	3.00	4.00
414	Kost Pondok Azaliya Tipe A Cimahi Selatan Cimahi	Cimahi Selatan	\N	900000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.523351	-6.886471	3.00	2.00
415	Kost Wisma Cahaya Prima Unjani Cimahi Selatan	Cimahi Selatan	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5239333	-6.8876946	3.00	4.00
416	Kost Rumah Michigan 39 Tipe B Cimahi Selatan Cimahi	Cimahi Selatan	\N	1000000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.51543	-6.89163	3.50	3.00
417	Kost Sehi Cimahi Tengah	Cimahi Tengah	\N	1200000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.5395469	-6.8918144	4.00	4.00
418	Kost Pasadena 1 Cimahi Tengah	Cimahi Tengah	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.52551246434	-6.8830026205515	3.00	4.00
419	Kost Pondok Syafka Tipe A Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	750000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.5276738	-6.8853416	3.60	3.00
420	Kost Saweri Gading Tipe B Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	1300000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.53003835678	-6.8860489433989	3.00	5.00
421	Kost Suwarga Cimahi Selatan	Cimahi Selatan	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.524062	-6.88732	3.00	4.00
422	Kost Griya Nurie Cimahi Tengah Cimahi	Cimahi Tengah	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5224128	-6.8841947	3.50	3.50
423	Kost Pelita Tipe A Cimahi Selatan Cimahi	Cimahi Selatan	\N	1100000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.52126254895	-6.8930975549317	5.00	3.00
424	kos sks Executive Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	1300000.00	28	Sewa	Sertifikat Hak Milik (SHM)	28	107.542936	-6.881388	4.00	7.00
425	Kost Sogiran Hijau Cimahi Tengah Cimahi	Cimahi Tengah	\N	550000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.529378	-6.884908	3.00	3.00
426	Kost Parahyangan Tipe A Cimahi Selatan Cimahi	Cimahi Selatan	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.52086922526	-6.8876443273573	3.00	3.00
427	Kost Pondok Sembilan Tipe A Cimahi Selatan Cimahi	Cimahi Selatan	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.522255	-6.884118	3.00	4.00
428	Kost Indah Pasar Atas Cimahi Tengah	Kecamatan Cimahi Tengah	\N	500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5458281	-6.8730069	3.00	3.00
429	Kost Pasadena Tipe B Cimahi Tengah Cimahi	Cimahi Tengah	\N	600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.525515	-6.883035	3.00	4.00
430	Kost Cimahi Ezra Cimahi Tengah	Cimahi Tengah	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.52482011914	-6.8817097914402	3.00	4.00
431	Kost Mamah Dedeh Cimahi Tengah Cimahi	Cimahi Tengah	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.527783	-6.886074	3.00	3.00
432	Kost Amanda De Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.52082262188	-6.8898212039685	3.00	3.00
433	Kost Bagaswara Type A Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.519469	-6.890913	3.00	3.00
434	Kost Unjani Belakang Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.523309	-6.885432	3.00	4.00
435	Kost Murah Cimahi Baros	Cimahi Selatan	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.53779765218	-6.9001765423364	3.00	3.00
436	Kost Pondok Barokah Cimahi Selatan Cimahi	Cimahi Selatan	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5221352	-6.8888793	3.00	3.00
437	Kost Hasanah I Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	800000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.528424	-6.886558	4.00	2.50
438	Kost Bu Eli Cimahi Tengah Cimahi	Cimahi Tengah	\N	750000.00	40	Sewa	Sertifikat Hak Milik (SHM)	40	107.540956	-6.877314	4.00	10.00
439	Kost Pelangii Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.52334121615	-6.888199198843	3.00	4.00
440	Kost Basar Tipe A Cimahi Selatan Cimahi	Cimahi Selatan	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.534717	-6.894983	3.00	3.00
441	Kost Assyifa Tipe A Cimahi Utara Cimahi	Kecamatan Cimahi Utara	\N	900000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.54461951554	-6.8677823636746	4.00	4.00
442	Kost Rumah Forsare Cimahi Selatan Cimahi	Cimahi Selatan	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.520934	-6.889492	3.00	3.00
443	Kost Ayas Kostmate Unjani Cimahi	Cimahi Selatan	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5219501555	-6.8888113208626	3.00	3.00
444	Kost Pondok Ujungan Cimahi Selatan Cimahi	Cimahi Selatan	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5175473094	-6.8915770107737	3.00	4.00
445	Kost Griya Felicia Unjani Cimahi Selatan Cimahi	Cimahi Selatan	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.521085	-6.889438	3.00	4.00
446	Kost Aralia Cimahi Selatan Cimahi	Cimahi Selatan	\N	850000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.52038240433	-6.8868048624841	2.50	2.50
447	Kost Pudji Tipe A Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.521404	-6.89297	3.00	4.00
448	Kost Bu Neneng Ngamprah Bandung Barat	Kecamatan Ngamprah	\N	550000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.520921	-6.868444	3.00	3.00
449	Kost Pondok Muhasabah Tipe B Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	825000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5210846	-6.8894631	3.00	3.00
450	Kost De Kozy Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	1500000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.524186	-6.887476	4.00	4.00
451	Kost Guest House Tipe A Cimahi Tengah Cimahi	Cimahi Tengah	\N	1000000.00	25	Sewa	Sertifikat Hak Milik (SHM)	25	107.533337	-6.872101	5.00	5.00
452	Kost 202 Tipe A Cimahi Utara Cimahi	Cimahi Utara	\N	550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5449799	-6.868408	3.00	4.00
453	Kost Pondok Sagala Dulur Cimahi Tengah Cimahi	Cimahi Tengah	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.52367246896	-6.879827127715	3.00	4.00
454	Kost Pondok Halimun Tipe D Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5211111	-6.8931754	3.00	4.00
455	Kost Diffa Unjani House Tipe A Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.530141	-6.886709	3.00	4.00
456	Kost Istiqomah Cimahi Selatan Cimahi	Cimahi Selatan	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.522586	-6.889342	3.00	3.00
457	Kost Alha 1 Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	570000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.515856	-6.89697	3.00	4.00
458	Kost Wisma Rizqy 1 Tipe B Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5210846	-6.8894631	3.00	4.00
459	Kost Rahmat I Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.53066364676	-6.8844938299831	3.00	4.00
460	Kost 58 Cimahi Selatan Cimahi	Cimahi Selatan	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.53774300218	-6.9002883791545	3.00	4.00
461	Kost Dzawani Exclusive Sanghyang Pancanaka Hill Suite Padalarang Bandung Barat	Kecamatan Padalarang	\N	2800000.00	28	Sewa	Sertifikat Hak Milik (SHM)	28	107.514401	-6.8919546	4.00	7.00
462	Kost Pak Joko Cibeber Cimahi	Cimahi Selatan	\N	600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5209151	-6.8896363	3.00	4.00
463	Kost Bagus Tipe A Cimahi Tengah Cimahi	Cimahi Tengah	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.52942614257	-6.8795232246141	3.00	3.00
464	Kost Raffysha Tipe C Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	700000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.532755	-6.883575	4.00	4.00
465	Kost 9 Tipe A Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.53814902157	-6.8766799071016	3.00	4.00
466	Kost Kareumbi Cimahi Selatan Cimahi	Cimahi Selatan	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.514709	-6.89187	3.00	4.00
467	Kost Pondok Bali Executive Cimahi Tengah Cimahi	Cimahi Tengah	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.526778	-6.878159	3.00	4.00
468	Kost 9 Tipe B Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.53814902157	-6.8766799071016	3.00	4.00
469	Kost Pondok Intan Barokah Cimahi Selatan Cimahi	Cimahi Selatan	\N	700000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.522895	-6.888118	2.50	3.00
470	Kost Guest House Tipe B Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.532177	-6.873874	3.00	4.00
471	Kost Wisma Rizqy 2 Tipe A Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.515999	-6.892549	3.00	4.00
472	Kost Dzawani Exclusive Unjani Deluxe Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	2000000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.5241602	-6.88617	4.00	6.00
473	Kost My Sriwijaya Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.53603041172	-6.8816978084556	3.00	3.00
474	Kost Guest House Tipe Single Bed Cimahi Tengah Cimahi	Cimahi Tengah	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.533337	-6.872101	3.00	4.00
475	Kost Pondok Halimun Tipe A Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	800000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.521111	-6.893175	5.00	3.00
476	Kost Dzawani Exclusive Sanghyang Pancanaka Hill Deluxe Padalarang Bandung Barat	Kecamatan Padalarang	\N	2200000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.514401	-6.8919546	4.00	5.00
477	Kost Dzawani Exclusive Unjani Superior Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	1850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5241602	-6.88617	3.00	4.00
478	Kost Reall Tipe B Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.543906	-6.868838	3.00	4.00
479	Kost Dzawani Exclusive Unjani Standard Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5241602	-6.88617	3.00	4.00
480	Kost Pondok Halimun Tipe B Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.521111	-6.893175	3.00	4.00
481	Kost Reall Tipe A Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	400000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.543906	-6.868838	4.00	4.00
482	Kost Raffysha Tipe A Cimahi Tengah Cimahi	Cimahi Tengah	\N	880000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.53295	-6.883577	4.00	4.00
483	Kost Dzawani Exclusive Unjani 2 Deluxe Cimahi Selatan Cimahi	Cimahi Selatan	\N	2250000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.5217265	-6.8902156	4.00	4.50
484	Kost Mangkoes House Kamar Mandi Luar Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.542004	-6.878644	3.00	3.00
485	Kost Dzawani Exclusive Unjani 2 Superior Cimahi Selatan Cimahi	Cimahi Selatan	\N	2000000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.5217265	-6.8902156	3.50	4.00
486	Kost Pondok Calista Cimahi Selatan Cimahi	Cimahi Selatan	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5209633	-6.889424	3.00	4.00
487	Kost Bintang Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.533018	-6.888783	3.00	3.00
488	Kost Pondok Khoirunisa Cimahi Selatan	Cimahi Selatan	\N	800000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.52018727362	-6.8848107113837	4.00	2.50
489	Kost Wisma Rizqy 3 Tipe A Cimahi Selatan Cimahi	Cimahi Selatan	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.524533	-6.886239	3.00	4.00
490	Kost Dzawani Exclusive Unjani 2 Standard Cimahi Selatan Cimahi	Cimahi Selatan	\N	1850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5217265	-6.8902156	3.00	4.00
491	Kost Cisangkan Tipe A Cimahi Tengah Cimahi	Cimahi Tengah	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.536963	-6.869124	3.00	4.00
492	Kost Unjani 98 Cimahi Tengah Cimahi	Kecamatan Cimahi Tengah	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.528738	-6.886342	3.00	3.00
493	Kost Wisma Rizqy 1 Tipe A Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5210846	-6.8894631	3.00	4.00
494	Kost Degas Cozy House Cimahi Tengah Cimahi	Cimahi Tengah	\N	1300000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.52777021378	-6.8760890727739	5.00	3.50
495	Kost Bougenville BP Ampi Tipe A Cimahi Tengah Cimahi	Cimahi Tengah	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.537663	-6.89045	3.00	3.00
496	Kost Pondok Halimun Tipe C Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5211111	-6.8931754	4.00	3.00
497	Kost Dzawani Exclusive Sanghyang Pancanaka Hill Standard Padalarang Bandung Barat	Kecamatan Padalarang	\N	1900000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.514401	-6.8919546	3.00	5.00
498	Kost Guest House Tipe C Cimahi Tengah Cimahi	Cimahi Tengah	\N	1500000.00	35	Sewa	Sertifikat Hak Milik (SHM)	35	107.53117	-6.873838	5.00	7.00
499	Kost Pondok 86 Cimahi Selatan Cimahi	Kecamatan Cimahi Selatan	\N	1250000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.522516	-6.887073	4.00	4.00
500	Kost Pak Teguh 178 Coblong Bandung	Kecamatan Coblong	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.607001	-6.89303	3.00	3.00
501	Kost Bangbayang Residence Tipe A Coblong Bandung	Kecamatan Coblong	\N	1600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61795043945	-6.88040897013	3.00	3.00
502	Kost Home 39 Tipe A Cidadap Bandung	Cidadap	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.604851	-6.878346	3.00	3.00
503	Kost Paras Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63011	-6.888417	3.00	4.00
504	Kost Pak Haji Oyon Coblong Bandung	Coblong	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.622566	-6.894562	3.00	4.00
505	Kost San Alexander Tipe Golden Coblong Bandung	Coblong	\N	1507000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.614004	-6.872597	2.00	4.00
506	Kost Sigmaa Tipe I Coblong Bandung	Coblong	\N	1350000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.616493	-6.887144	3.00	3.50
507	Kost Rumah Alhamra Fatimah Middle Coblong Bandung	Coblong	\N	2200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.618794	-6.886142	3.00	2.90
508	Kost Bulan Cidadap Bandung	Cidadap	\N	1600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60788679123	-6.8725959786455	3.00	3.00
509	Kost Viola Tipe A Sukajadi Bandung	Sukajadi	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.596844	-6.891506	3.00	4.00
510	Kost Jurang 91 Sukajadi Bandung	Sukajadi	\N	999999.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6007065177	-6.8852101414191	3.00	3.00
511	Kost Sidomukti 65 Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63106845319	-6.8930828387663	3.00	4.00
512	Kost Zara Residence Coblong Bandung	Kecamatan Coblong	\N	1000000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.619891	-6.873568	4.00	4.00
513	Kost Eya Eza Tipe 1 Bandung Wetan Bandung	Bandung Wetan	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.608348	-6.896348	3.00	3.00
514	Kost Pa Cecep Tipe A Sukajadi Bandung	Sukajadi	\N	450000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.596569	-6.900152	3.00	4.00
515	Kost Taneva Dago Coblong Bandung	Coblong	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61443205178	-6.8733858715309	3.00	4.00
516	Kost Selina Coblong Bandung	Coblong	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.616326	-6.871462	3.00	3.00
517	Kost Deha Coblong Bandung	Kecamatan Coblong	\N	865000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.615927	-6.878917	3.00	4.00
518	Kost Muararajeun Lama 1 Tipe C Cibeunying Kaler Bandung	Cibeunying Kaler	\N	750000.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.630439	-6.902196	3.50	2.00
519	Kost PVJ Tipe A1 Sukajadi Bandung	Sukajadi	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5973232463	-6.8895066559014	3.00	3.00
520	Kost Zeta Tipe T Standard Coblong Bandung	Kecamatan Coblong	\N	1400000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.618087	-6.887143	4.00	3.50
521	Kost Dara Tipe A Coblong Bandung	Coblong	\N	1350000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.616003	-6.886805	3.00	3.00
522	Kost Tuisda Coblong Bandung	Kecamatan Coblong	\N	1650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.616475	-6.886859	3.00	4.00
523	Kost Favorit Tipe Executive Coblong Bandung	Kecamatan Coblong	\N	2100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.620052	-6.883193	3.00	3.00
524	Kost Pondok Latief Tipe L Coblong Bandung	Coblong	\N	1800000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.61858	-6.88336	3.00	5.00
525	Kost Amara Residence Cidadap Bandung	Kecamatan Cidadap	\N	2350000.00	13	Sewa	Sertifikat Hak Milik (SHM)	13	107.60317146778	-6.8748062108084	5.00	2.50
526	Kost Sejahtera Tipe A1 Sukajadi Bandung	Sukajadi	\N	1350000.00	25	Sewa	Sertifikat Hak Milik (SHM)	25	107.60072160512	-6.8930605376351	5.00	5.00
527	Kost Murah Tipe A Coblong Bandung	Coblong	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.622487	-6.890915	3.00	3.00
528	Kost Anvaya Cipaganti Tipe Alamanda B Coblong Bandung	Kecamatan Coblong	\N	1650000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.602747	-6.897536	2.80	3.60
529	Kost Omahku Kirana Tipe B Coblong Bandung	Coblong	\N	2000000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.620062	-6.885993	3.00	2.80
530	Kost Jurang 65 Standard Sukajadi Bandung	Kecamatan Sukajadi	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.600446	-6.887043	3.00	4.00
531	Kost Nangkasuni 47F Pondok Kanz Putra Coblong Bandung	Coblong	\N	915000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61099580675	-6.8821847833895	3.00	3.00
532	Kost Hegar CH4 Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.627752	-6.887501	3.00	3.00
533	Kost Cantika Coblong Bandung	Kecamatan Coblong	\N	1650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6065921	-6.8946222	3.00	3.00
534	Kost Deeva 1 Coblong Bandung	Coblong	\N	1600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61264503002	-6.8811332763965	3.00	4.00
535	Kost Alana Residence Coblong Bandung	Kecamatan Coblong	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61693656445	-6.8715094993086	3.00	3.00
536	Kost Paviliun CemaraTipe Balkon 1 Coblong Bandung	Coblong	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6280512	-6.890744	3.00	4.00
537	Kost Pondok Putri Ganesha Coblong Bandung	Coblong	\N	2000000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.6138338	-6.8802224	4.00	4.00
538	Kost Taman Bandung Wetan Bandung	Kecamatan Bandung Wetan	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60765578598	-6.9023982956031	3.00	4.00
539	Kost Ayahome Tipe A Coblong Bandung	Coblong	\N	1500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.614036	-6.875781	3.00	3.00
540	Kost Padma Coblong Bandung	Coblong	\N	1950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61319488287	-6.8757089412293	3.00	4.00
541	Kost Mamah Yeni Bandung Wetan Bandung	Bandung Wetan	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60857310146	-6.8968869969687	3.00	3.00
542	Kost Miracolo Tipe A Sukajadi Bandung	Sukajadi	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.59833376855	-6.8841786126657	3.00	3.00
543	Kost Elsan Coblong Bandung	Kecamatan Coblong	\N	2250000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6193198	-6.8859155	3.00	3.00
544	Kost Komura Standart Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.629742	-6.900529	3.00	4.00
545	Kost Dago 227 Tipe A Coblong Bandung	Kecamatan Coblong	\N	2200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61540435255	-6.8810567183415	3.00	3.00
546	Kost Aulia Coblong Bandung	Kecamatan Coblong	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.614778	-6.874398	3.00	3.00
547	Kost Premium Fira 3 Ciung Residence Tipe VVIP Coblong Bandung	Kecamatan Coblong	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.621312	-6.897663	3.00	4.00
548	Kost Gelatik Coblong Bandung	Coblong	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62222386897	-6.8962822080882	3.00	3.00
549	Kost Muararajeun Lama 2 Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630439	-6.902196	3.50	2.50
550	Kost Edelweis Tipe A1 Cidadap Bandung	Cidadap	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.602891	-6.878283	3.00	3.00
551	Kost Rumah Singgah Bukit Pandawa Tipe B Coblong Bandung	Coblong	\N	1150000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.617262	-6.8773927	3.00	4.00
552	Kost Apik Bintang Kumeli Tipe D Cibeunying Kaler Bandung	Bojongloa Kaler	\N	832500.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.63218811347	-6.8971730404579	2.50	2.50
553	Kost Graha Setiabudi Tipe Superior View Cidadap Bandung	Kecamatan Cidadap	\N	2750000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.59836494923	-6.8793438118487	3.00	4.50
554	Kost Pondok Teratai Unpar Tipe E Cidadap Bandung	Cidadap	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60610211641	-6.8762515106792	3.00	4.00
555	Kost Apik Lusya Cihampelas Walk Tipe B Sukajadi Bandung	Kecamatan Sukajadi	\N	988000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.602113	-6.8929206	3.00	3.00
556	Kost Graha Setiabudi Superior Non View Cidadap Bandung	Kecamatan Cidadap	\N	2500000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.59836494923	-6.8793438118487	3.00	4.50
557	Kost Ibu Nani Sukajadi Bandung	Kecamatan Sukajadi	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.598095	-6.881712	3.00	3.00
558	Kost Apik Muh Unpar Tipe A Cidadap Bandung	Cidadap	\N	935800.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60398238206	-6.8756618943683	4.00	3.00
559	Kost Guyub Ciliwung Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630447	-6.902793	3.00	3.00
560	Kost Bumi Katineung 23 VVIP Coblong Bandung	Coblong	\N	1000000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.611965	-6.879923	3.00	2.60
561	Kost Apik Bintang Kumeli Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1267000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.63218811347	-6.8971730404579	4.00	4.00
562	Kost Singgahsini Imperial Dago Tipe B Coblong Bandung	Coblong	\N	2463000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.61432418157	-6.8755376625223	4.00	4.00
563	Kost Gurls Cave Coblong Bandung	Coblong	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6168649	-6.8864232	3.00	3.00
564	Kost Pondok Teratai Unpar Tipe G Cidadap Bandung	Cidadap	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60610211641	-6.8762515106792	3.00	4.00
565	Kost Rumah Griya Kartika Tipe B Sukajadi Bandung	Kecamatan Sukajadi	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5962676	-6.8822818	3.00	4.00
566	Kost Bumi Ayu Tubagus C Coblong Bandung	Coblong	\N	1750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61877655983	-6.8831677189692	3.00	3.00
567	Kost 47 AC Coblong Bandung	Coblong	\N	2000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.613289	-6.87976	3.00	4.00
568	Kost The Theresia Tipe A Cidadap Bandung	Cidadap	\N	1100000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.603641	-6.874125	2.30	2.80
569	Kost Oma Bangbayang 6 Coblong Bandung	Coblong	\N	825000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.616536	-6.881106	3.00	4.00
570	Kost F3 Family Tipe A Cimenyan Bandung	Cimenyan	\N	1025000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633982	-6.878424	3.00	4.00
571	Kost Valley Tipe A Coblong Bandung	Coblong	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62505862862	-6.8864643495446	3.00	4.00
572	Kost Mamah Ety Tipe A Sukajadi Bandung	Sukajadi	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.597507	-6.888765	3.00	3.00
573	Kost Griya Barokah II Tipe A Coblong Bandung	Kecamatan Coblong	\N	550000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61935524642	-6.8895113158743	3.00	3.00
574	Kost Ciumbuleuit Tipe C Cidadap Bandung	Cidadap	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.604042	-6.8817739	3.00	4.00
575	Kost Sigmaa Tipe J Coblong Bandung	Coblong	\N	1500000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.61649265885	-6.8871437108948	4.00	4.00
576	Kost 47 Non AC Coblong Bandung	Coblong	\N	1600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.613289	-6.87976	3.00	4.00
577	Kost Hijau Daun Tipe B Coblong Bandung	Kecamatan Coblong	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6079139486	-6.8944242332363	3.00	3.00
578	Kost C177 Executive Coblong Bandung	Kecamatan Coblong	\N	2500000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.603845	-6.888485	2.60	4.00
579	Kost Rumah Surya Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6315921545	-6.8889354760209	3.00	4.00
580	Kost Surya Dago Coblong Bandung	Kecamatan Coblong	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6183507	-6.8731598	3.00	3.00
581	Kost Apik PUMA Ciwalk Tipe B Coblong Bandung	Coblong	\N	2275000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.60388009186	-6.8939799038585	3.00	3.50
582	Kost Singgahsini Imperial Dago Tipe C Coblong Bandung	Coblong	\N	2185000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61432418157	-6.8755376625223	3.00	3.00
583	Kost Putri Green House H.Hasan Coblong Bandung	Coblong	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61721551418	-6.8984660348527	3.00	4.00
584	Kost Apik Bintang Kumeli Tipe B Cibeunying Kaler Bandung	Cibeunying Kaler	\N	945000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.63218811347	-6.8971730404579	4.00	4.00
585	Kost Apik PUMA Ciwalk Tipe D Coblong Bandung	Coblong	\N	1129000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60388009186	-6.8939799038585	3.00	3.00
586	Kost Apik Haur Mekar Unpad Tipe A Coblong Bandung	Coblong	\N	729000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.6203	-6.89332	3.00	3.30
587	Kost Alpha Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	870000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6275914	-6.8879323	3.00	4.00
588	Kost Plesiran 19 Tipe A Bandung Wetan Bandung	Bandung Wetan	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.607748	-6.896004	3.00	4.00
589	Kost Apik Muh Unpar Tipe B Cidadap Bandung	Cidadap	\N	781800.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60398238206	-6.8756618943683	3.00	3.00
590	Kost Apik Pondok Paskal Tipe A Cicendo Bandung	Cicendo	\N	746600.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.59715938064	-6.9020892242147	3.00	2.50
591	Kost Singgahsini Bukit Indah UNPAR Tipe B Ciumbuleuit Bandung	Cidadap	\N	1313000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6034816	-6.8724722	3.50	3.50
592	Kost Singgahsini Rumah Kita Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	896200.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630718	-6.8912	3.00	3.00
593	Kost Omahku Kirana Tipe A Coblong Bandung	Coblong	\N	2000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.619869	-6.887059	3.00	3.00
594	Kost Bukit Dago Selatan 49A Coblong Bandung	Coblong	\N	2000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61746539216	-6.870902348105	3.00	4.00
595	Kost Anggrek Bulan Coblong Bandung	Coblong	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6238426	-6.8970114	3.00	3.00
596	Kost Apik TBI 1517 Tipe A Coblong Bandung	Coblong	\N	1330000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61904839179	-6.8821926885901	3.00	3.00
597	Kost Singgahsini Dago Asri D14 Tipe C Coblong Bandung	Kecamatan Coblong	\N	1697000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.6147656	-6.8775875	4.00	4.00
598	Kost 3M House Cibiru Bandung	Cibiru	\N	900000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.72057108581	-6.9250958611189	3.00	5.00
599	Kost Natamas Paviliun Panyileukan Bandung	Panyileukan	\N	1400000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.7161257	-6.9400487	4.00	4.00
600	Kost Karyain Executive Cibiru Bandung	Cibiru	\N	850000.00	13	Sewa	Sertifikat Hak Milik (SHM)	13	107.72193197161	-6.9222598067831	2.50	5.10
601	Kost Ababil B Cibiru Bandung	Kecamatan Cibiru	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.719705	-6.933564	3.00	3.00
602	Kost Uwais 354 Tipe G Cibiru Bandung	Cibiru	\N	600000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.725926	-6.929587	3.00	2.50
603	Kost Nugraha Tipe A 2 Cileunyi Bandung	Kecamatan Cileunyi	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.73044597358	-6.9433219540478	3.00	3.00
604	Kost Ibu Ratmi Tipe A Kota Cibiru Bandung	Cibiru	\N	600000.00	5	Sewa	Sertifikat Hak Milik (SHM)	5	107.7201235	-6.9339462	2.00	2.50
605	Kost Gina Rifa Cileunyi Bandung	Cileunyi	\N	700000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.733018	-6.93667	5.00	3.00
606	Kost Lebah Villas Tipe A Non AC Cibiru Bandung	Cibiru	\N	1150000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.72571	-6.915977	3.00	4.00
607	Kost HOA Stu VVIP Cileunyi Bandung	Cileunyi	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.725549	-6.930833	3.00	3.00
608	Kost Oren 8 Tipe B Cileunyi Bandung	Cileunyi	\N	650000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.7271803841	-6.9368952083752	4.00	4.00
609	Kost Pondok Flamboyan 1 Panyileukan Bandung	Kecamatan Panyileukan	\N	799999.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.716319	-6.938893	3.00	4.00
610	Kost Adiba Cipadung Wetan Bandung	Panyileukan	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.716073	-6.933833	3.00	4.00
611	Kost Wisma Nusantara Cibiru Bandung	Kecamatan Cibiru	\N	750000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.719211	-6.929337	3.00	5.00
612	Kost Green House Tipe B Cibiru Bandung	Cibiru	\N	850000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.717704	-6.9249644	3.00	6.00
613	Kost Pondok Pituin S2TR Cibiru Bandung	Cibiru	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.719202	-6.93228	3.00	3.00
614	Kost Squad Pahrevi Cibiru Bandung	Cibiru	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.724093	-6.929852	3.00	3.00
615	Kost Adinda Azzam I Ujung Berung Bandung	Kecamatan Ujung Berung	\N	700000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.710426	-6.913946	4.00	2.70
616	Kost Lebah Villas VVIP Cibiru Bandung	Cibiru	\N	1550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.72571	-6.915977	3.00	4.00
617	Kost Umy Tipe A Cibiru Bandung	Cibiru	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.722915	-6.930556	3.00	3.00
618	Kost Riva Cipadung Cibiru Bandung	Cibiru	\N	600000.00	21	Sewa	Sertifikat Hak Milik (SHM)	21	107.71745838225	-6.925555166519	3.00	7.00
619	Kost Mekar Biru Cileunyi Bandung	Cileunyi	\N	550000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.72120811045	-6.9430899803423	4.50	3.00
620	Kost Pondok Enral Cileunyi Bandung	Kecamatan Cileunyi	\N	550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.726542	-6.940797	3.00	4.00
621	Kost Pak Daryono Cibiru Bandung	Kecamatan Cibiru	\N	600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.7172907	-6.9271137	3.00	4.00
622	Kost Arzela Cilengkrang Bandung	Cilengkrang	\N	560000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.71380320191	-6.9170336472342	4.00	5.00
623	Kost Arjuna Cibiru Bandung	Kecamatan Cibiru	\N	500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.71542225033	-6.9293227852369	3.00	3.00
624	Kost Lio Utara 49 Cibiru Bandung	Cibiru	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.71963499486	-6.9289100793544	3.00	3.00
625	Kost Bidan 93 Cibiru Bandung	Cibiru	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.7141087	-6.9278673	3.00	4.00
626	Kost Berkah Jaya Tipe C Cibiru Bandung	Cibiru	\N	1000000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.718885	-6.926212	4.00	5.00
627	Kost Arana I Cibiru Bandung	Cibiru	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.718946	-6.930668	3.00	4.00
628	Kost Rahadian Aprilianto Tipe A+ Panyileukan Bandung	Panyileukan	\N	900000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.717723	-6.938666	3.00	5.00
629	Kost Pondok Ummy Tipe VVIP Cibiru Bandung	Cibiru	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.722472	-6.929971	3.00	3.00
630	Kost Ibu Cucu Sukamulya Cinambo Bandung	Cinambo	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6996245	-6.9159875	3.00	4.00
631	Kost Hayundara Panyileukan Bandung	Kecamatan Panyileukan	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.712977	-6.948603	3.00	3.00
632	Kost Sauyunan II Tipe A Panyileukan Bandung	Panyileukan	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.716201	-6.943815	3.00	4.00
633	Kost Arjuna VVIP Cileunyi Bandung	Kecamatan Cileunyi	\N	1280000.00	25	Sewa	Sertifikat Hak Milik (SHM)	25	107.723917	-6.942774	5.00	5.00
634	Kost Cempaka Putri 1 Cibiru Bandung	Panyileukan	\N	580000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.71599687864	-6.9329197559081	3.00	3.00
635	Kost Arsenn Tipe A Panyileukan Bandung	Kecamatan Panyileukan	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.7058753	-6.9222193	3.00	4.00
636	Kost Pondok Bahagia Cipadung Tipe Large Cibiru Bandung	Kecamatan Cibiru	\N	950000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.718167	-6.925055	4.00	4.50
637	Kost Ciper 26 Tipe A Cibiru Bandung	Kecamatan Cibiru	\N	750000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.71696820855	-6.9290199124068	2.00	3.00
638	Kost Asesa Cileunyi Bandung	Cileunyi	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.725307	-6.944065	3.00	3.00
639	Kost Pak Heru Type B Cibiru Bandung	Cibiru	\N	950000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.72085942328	-6.9286458142689	3.50	4.00
640	Kost Asrama Syuhada Cibiru Bandung	Kecamatan Cibiru	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.717146	-6.929442	3.00	3.00
641	Kost Pandanwangi Permatabiru Tipe A Cileunyi Bandung	Cileunyi	\N	500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.726472	-6.941232	3.00	3.00
642	Kost BD Imas Panyileukan Bandung	Kecamatan Panyileukan	\N	700000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.7143651247	-6.9422799019715	3.00	2.50
643	Kost Mageta Cibiru Bandung	Kecamatan Cibiru	\N	500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7206405	-6.9305864	3.00	3.00
644	Kost Gardenia Cibiru Bandung	Cibiru	\N	600000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.716874	-6.924395	3.00	6.00
645	Kost Shina Panyileukan Bandung	Panyileukan	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71477818489	-6.9422958772363	3.00	4.00
646	Kost Yangti Cibiru Bandung	Cibiru	\N	865000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.71906	-6.925206	3.00	3.00
647	Kost Mamah Erik Sukasari Cibiru Bandung	Kecamatan Cibiru	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.72145789117	-6.922907830559	3.00	4.00
648	Kost Kostku Turki Tipe A Panyileukan Bandung	Kecamatan Panyileukan	\N	1050000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.7097006	-6.9458888	3.00	4.00
649	Kost Annisa Cendekia Tipe B Cibiru Bandung	Kecamatan Cibiru	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.71391451359	-6.9314485476359	3.00	3.00
650	Kost Bougenville Cibiru Bandung	Cibiru	\N	710000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.715985	-6.930919	3.00	3.00
651	Kost Bu Yanto I Cileunyi Bandung	Kecamatan Cileunyi	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.727838	-6.938009	3.00	4.00
652	Kost Rumah Satata Panyileukan Bandung	Panyileukan	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.709535	-6.942523	3.00	4.00
653	Kost Puri Asri Cileunyi Bandung	Kecamatan Cileunyi	\N	500000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.733031	-6.934343	3.00	4.50
654	Kost Pak Ronny Tipe A Panyileukan Bandung	Kecamatan Panyileukan	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7118209	-6.9475415	3.00	3.00
655	Kost Anugrah 1 Cibiru Bandung	Cibiru	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7223635371	-6.926413593184	3.00	3.00
656	Kost Bapak Dodi Tipe A Cileunyi Bandung	Cileunyi	\N	500000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.732542	-6.937201	2.50	2.50
657	Kost Griya Biru Cibiru Bandung	Cibiru	\N	800000.00	28	Sewa	Sertifikat Hak Milik (SHM)	28	107.71935336292	-6.9282733799737	4.00	7.00
658	Kost Com Tipe A Cibiru Bandung	Kecamatan Cibiru	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7151966095	-6.9282161335681	3.00	3.00
659	Kost Bunda Yuyun Cileunyi Bandung	Cileunyi	\N	800000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.72987365723	-6.9392073159525	2.70	4.00
660	Kos Ibu Dewi Panyileukan Bandung	Panyileukan	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.709868	-6.939416	3.00	3.00
661	Kost Ibu Eti Panyileukan Bandung	Panyileukan	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.714793	-6.942289	3.00	4.00
662	Kost Omah Annisa Tipe A Cibiru Bandung	Cibiru	\N	800000.00	135	Sewa	Sertifikat Hak Milik (SHM)	135	107.724125	-6.922721	3.00	45.00
663	Kost Harmoni Abadi Kiaracondong Bandung	Kiaracondong	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.70403862	-6.9150945416085	3.00	4.00
664	Kost Budi Tipe A Cibiru Bandung	Cibiru	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.722472	-6.929971	3.00	3.00
665	Kost Riva Manisi Cibiru Bandung	Cibiru	\N	550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.72090435028	-6.923966567027	3.00	4.00
666	Kost Kharisma Panyileukan Bandung	Panyileukan	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.7158221	-6.9328496	3.00	4.00
667	Kost Asy Syurfa Cibiru Bandung	Cibiru	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71952401847	-6.9346413335486	3.00	4.00
668	Kost Ibnu Sina Tipe A Cibiru Bandung	Cibiru	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.720832	-6.929729	3.00	4.00
669	Kost Tiandi's House Cileunyi Bandung	Cileunyi	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.72255826741	-6.935660104944	3.00	4.00
670	Kost Fazima 1 Buana Panyileukan Bandung	Kecamatan Panyileukan	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.70721502602	-6.9376903190561	3.00	4.00
671	Kost Harmony Standard Cileunyi Bandung	Cileunyi	\N	600000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.72681	-6.93041	3.00	5.00
672	Kost Nuraeni Tipe B Cibiru Bandung	Cileunyi	\N	500000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.72501718253	-6.9334824409651	4.00	5.00
673	Kost Ibu Lena Tipe B Cileunyi Bandung	Cileunyi	\N	700000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.71965846419	-6.940027051381	4.00	4.00
674	Kost Pak Aceng Tipe A Cibiru Bandung	Cibiru	\N	500000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.71146666259	-6.9186445699868	4.00	4.00
675	Kost Star Tipe Executive Cileunyi Bandung	Kecamatan Cileunyi	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.72979	-6.928371	3.00	4.00
676	Kost Ganesha Cibiru Bandung	Cibiru	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.71737154573	-6.9249514128064	3.00	3.00
677	Kost Darma Syariah Ujungberung Bandung	Ujung Berung	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.70629201084	-6.9147790118247	3.00	4.00
678	Kost Gina Rifa Cileunyi Bandung	Cileunyi	\N	700000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.733018	-6.93667	5.00	3.00
679	Kost Arsenn Tipe B Panyileukan Bandung	Kecamatan Panyileukan	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7058753	-6.9222193	3.00	3.00
680	Kost Bu Devi Panyileukan Bandung	Kecamatan Panyileukan	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.714053	-6.94449	3.00	3.00
681	Kost Anugrah Bu Yati Tipe A Cileunyi Bandung	Cileunyi	\N	770000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.72529345006	-6.9332827463779	3.50	4.00
682	Kost Bage Panyileukan Bandung	Panyileukan	\N	1000000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.69980274141	-6.9290881420173	2.00	5.00
683	Kost Vgh Cibiru Bandung	Kecamatan Cibiru	\N	590000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.71267533302	-6.9292598808959	3.00	3.50
684	Kost Graha 08 Tipe A Panyileukan Bandung	Kecamatan Panyileukan	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.709116	-6.938411	3.00	4.00
685	Kost Pak Heru Type A Cibiru Bandung	Cibiru	\N	950000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.72079	-6.928977	3.50	4.00
686	Kost Pak Mizan Tipe A Cibiru Bandung	Kecamatan Cibiru	\N	600000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.712469	-6.927328	3.00	8.00
687	Kost PinPin Cinambo Bandung	Kecamatan Cinambo	\N	900000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.70036667585	-6.9171761009553	5.00	4.00
688	Kost Pondok Az Zahara Tipe A Cibiru Bandung	Cibiru	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.72556368262	-6.9332334883667	3.00	3.00
689	Kost Madani Tipe A Panyileukan Bandung	Kecamatan Panyileukan	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71282989532	-6.9470261958559	3.00	4.00
690	Kost Bumi Asri Tipe B Panyileukan Bandung	Panyileukan	\N	1100000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.70791179939	-6.9206506205014	3.00	2.50
691	Kost Al Barokah Cibiru Lantai Atas Cileunyi Bandung	Cileunyi	\N	550000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.72427152842	-6.9333942425329	3.00	6.00
692	Rumah Kontrakan Cibiru Panyileukan Bandung	Panyileukan	\N	500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7180424	-6.9388771	3.00	3.00
693	Kost C5 Tipe A Panyileukan Bandung	Kecamatan Panyileukan	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71495856345	-6.9404843453116	3.00	4.00
694	Kost Bunda 2 Tipe B Cibiru Bandung	Kecamatan Cibiru	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7229342	-6.9256112	2.50	3.50
695	Kost Elyza Queen Ujung Berung Bandung	Ujung Berung	\N	750000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.708055	-6.918296	2.00	8.00
696	Kost Bunda 1 Tipe C Cibiru Bandung	Cibiru	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.722807	-6.925405	3.00	3.00
697	Kost Nugraha Tipe B 2 Cileunyi Bandung	Kecamatan Cileunyi	\N	1000000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.73044597358	-6.9433219540478	3.00	2.50
698	Kost Triple D Tipe D Panyileukan Bandung	Kecamatan Panyileukan	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.714603	-6.941621	3.00	3.00
699	Kost Bilqies 2 Tipe C Cibiru Bandung	Cibiru	\N	700000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.72498030216	-6.9282410956644	2.00	4.00
700	Kost D Muri Cibiru Bandung	Kecamatan Cibiru	\N	810000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71483182907	-6.9255748034791	3.00	4.00
701	Kost Uwais 354 Tipe B Cibiru Bandung	Cibiru	\N	650000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.725926	-6.929587	3.00	2.50
702	Kost AJS Tipe B Cileunyi Bandung	Cileunyi	\N	800000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.72520154523	-6.937206951747	3.50	4.00
703	Kost Bilqies 2 Tipe B Cibiru Bandung	Cibiru	\N	600000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.72498030216	-6.9282410956644	4.00	4.00
704	Kost AJS Tipe A Cileunyi Bandung	Cileunyi	\N	900000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.72520154523	-6.937206951747	3.20	3.50
705	Kost Bumi Pandanwangi Cileunyi Bandung	Kecamatan Cileunyi	\N	750000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.726064	-6.939823	2.50	4.00
706	Rumah Kontrakan Marzia Ujung Berung Bandung	Kecamatan Ujung Berung	\N	1000000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.7082708	-6.9172862	4.00	4.00
707	Kost Bunda 1 Tipe C1 Cibiru Bandung	Cibiru	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.722807	-6.925405	3.00	4.00
708	Kost Ababil Tipe B Cibiru Bandung	Cibiru	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7201235	-6.9339462	3.00	3.00
709	Kost Ibu Ratmi Tipe B Kota Cibiru Bandung	Cibiru	\N	600000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.7201235	-6.9339462	2.00	3.00
710	Kost Ibu Hj Tati Tipe C Panyileukan Bandung	Kecamatan Panyileukan	\N	650000.00	5	Sewa	Sertifikat Hak Milik (SHM)	5	107.71068345755	-6.9473776480107	2.20	2.40
711	Kost Madani Tipe B Panyileukan Bandung	Kecamatan Panyileukan	\N	500000.00	5	Sewa	Sertifikat Hak Milik (SHM)	5	107.71291505545	-6.9470784477553	1.50	3.00
712	Kost Natamas Family I Panyileukan Bandung	Panyileukan	\N	600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71388400346	-6.944350691154	3.00	4.00
713	Kost Triple D Tipe C Panyileukan Bandung	Panyileukan	\N	650000.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.716022	-6.940063	2.60	2.60
714	Rumah Kontrakan Hj Henni Ujung Berung Bandung	Ujung Berung	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.708097	-6.913946	3.00	3.00
715	Kost Ababil 2 Cibiru Bandung	Cibiru	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.719823	-6.933581	3.00	3.00
716	Kost Nugraha Tipe A 1 Cileunyi Bandung	Kecamatan Cileunyi	\N	1200000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.73044597358	-6.9433219540478	3.20	2.40
717	Kost Bilqies 3 Tipe A Cileunyi Bandung	Cileunyi	\N	600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.724958	-6.928157	3.00	4.00
718	Kost Ilaa Khairi Ummah Tipe B Cibiru Bandung	Cibiru	\N	700000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.720113	-6.933949	4.00	2.50
719	Kost Rida Yulan Tipe 1 Cileunyi Bandung	Cileunyi	\N	750000.00	27	Sewa	Sertifikat Hak Milik (SHM)	27	107.725934	-6.937103	3.80	7.00
720	Kost Faris House Tipe A Cileunyi Bandung	Kecamatan Cileunyi	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.726863	-6.938361	3.00	3.00
721	Kost Pondok Asri Cibiru Bandung	Cibiru	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.718479	-6.928405	3.00	4.00
722	Kost Pak Dardiri Cibiru Bandung	Cibiru	\N	600000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.71606657967	-6.9291448952517	2.50	3.00
723	Kost Raoseun House Tipe A Cibiru Bandung	Cibiru	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.720597	-6.927426	3.00	4.00
724	Kost Ibu Hayati Tipe B Cibiru Bandung	Cibiru	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.719566	-6.9238066	3.00	3.00
725	Kost Lavista Executive Cibiru Bandung	Cibiru	\N	2100000.00	53	Sewa	Sertifikat Hak Milik (SHM)	53	107.715431	-6.92928	6.50	8.10
726	Kost G Homes Panyileukan Bandung	Panyileukan	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71040987223	-6.9421976959126	3.00	4.00
727	Kost Mimikos Panyileukan Bandung	Panyileukan	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.705938	-6.932417	3.00	3.00
728	Kost Bunda 2 Tipe C Cibiru Bandung	Kecamatan Cibiru	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7229342	-6.9256112	2.50	3.50
729	Kost Rumah Vyna Tipe B Cileunyi Bandung	Cileunyi	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71441206336	-6.9488327103867	3.00	4.00
730	Kost Triple D Tipe B1 Panyileukan Bandung	Kecamatan Panyileukan	\N	750000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.7161127	-6.9400446	2.20	2.80
731	Kost Triple D Tipe B Panyileukan Bandung	Kecamatan Panyileukan	\N	500000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.7160222	-6.9400626	2.00	3.00
732	Kost Tifania Boarding House Tipe A Panyileukan Bandung	Panyileukan	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.717327	-6.938896	3.00	4.00
733	Kost Bilqies Tipe A Cibiru Bandung	Cibiru	\N	600000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.72445090115	-6.9280710205551	4.00	6.00
734	Kost Biring Tipe Standart Panyileukan Bandung	Kecamatan Panyileukan	\N	945000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7001645	-6.927988	3.00	3.00
735	Kost Uwais 354 Tipe J Cibiru Bandung	Cibiru	\N	750000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.725926	-6.929587	4.00	4.00
736	Kost Ibu Hayati Tipe A Cibiru Bandung	Cibiru	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.719566	-6.9238066	3.00	3.00
737	Kost Tiara House 1 Panyileukan Bandung	Panyileukan	\N	1100000.00	48	Sewa	Sertifikat Hak Milik (SHM)	48	107.7149746567	-6.9443962870203	6.00	8.00
738	Kost Home Cileunyi Bandung	Cileunyi	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.718367	-6.948085	3.00	4.00
739	Kost Paviliun Lia Tipe A Cileunyi Bandung	Cileunyi	\N	850000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.725401	-6.936706	5.00	3.00
740	Kost Pondok Gayo 2 Cibiru Bandung	Cibiru	\N	600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.721978	-6.928896	3.00	4.00
741	Kost Putriayu Tipe A1 Panyileukan Bandung	Kecamatan Panyileukan	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.716008	-6.940541	3.00	3.00
742	Kost Bilqies Tipe B Cibiru Bandung	Cibiru	\N	600000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.72445090115	-6.9280710205551	4.00	6.00
743	Kost Rida Yulan Tipe 2 Cileunyi Bandung	Cileunyi	\N	650000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.725934	-6.937103	3.50	4.60
744	Kost Rumah Barokah Tipe A Cileunyi Bandung	Kecamatan Cileunyi	\N	630000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.726599	-6.92529	4.00	6.00
745	Kost Pak Yanto Cibiru Bandung	Cibiru	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.71419413388	-6.9231288307598	3.00	3.00
746	Kost Icha 1 Panyileukan Bandung	Kecamatan Panyileukan	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.702563	-6.918199	3.00	4.00
747	Kost Clement Jl Cilameta 38 Gedebage Bandung	Gedebage	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.7037957	-6.9457466	3.00	4.00
748	Kost Rose Panyileukan Bandung	Kecamatan Panyileukan	\N	675000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.713509	-6.942831	3.00	2.50
749	Kost F36 Tipe A Cileunyi Bandung	Cileunyi	\N	500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.727363	-6.939405	3.00	4.00
750	Kos Pak Yanto 2 Cibiru Bandung	Cibiru	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.721905	-6.917419	3.00	3.00
751	Kost Putriayu 2 Panyileukan Bandung	Kecamatan Panyileukan	\N	550000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.716059	-6.940057	3.00	2.50
752	Kost Yoslinaa Tipe C Ujung Berung Bandung	Ujung Berung	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.70630575716	-6.9161436433405	3.00	3.00
753	Kost Biring Cibiru Tipe A Cileunyi Bandung	Kecamatan Cileunyi	\N	745000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7265423	-6.9482739	3.00	3.00
754	Kost Ababil Tipe A Cibiru Bandung	Cibiru	\N	650000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.7201235	-6.9339462	2.00	3.00
755	Kost Pondok Delima Cibiru Bandung	Cibiru	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.7236512	-6.9225885	3.00	4.00
756	Kost Paviliun Lia Tipe B Cileunyi Bandung	Cileunyi	\N	855000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.725401	-6.936706	5.00	3.00
757	Kost Natamas Vvip Panyileukan Bandung	Panyileukan	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.713371	-6.944626	3.00	4.00
758	Kost Aamir Cibiru Cileunyi Bandung	Cileunyi	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.725951	-6.944334	3.00	3.00
759	Kost Pondok Al Amanah Tipe A Cibiru Bandung	Kecamatan Cibiru	\N	600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71622121334	-6.9302610241208	3.00	4.00
760	Kost Bu Jein 2 Cibiru Bandung	Kecamatan Cibiru	\N	700000.00	21	Sewa	Sertifikat Hak Milik (SHM)	21	107.71233	-6.923373	3.00	7.00
761	Kost Tiara House 4 Panyileukan Bandung	Kecamatan Panyileukan	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71497499198	-6.9443932916715	3.00	4.00
762	Kost Ibu Hj Tati Tipe B Panyileukan Bandung	Kecamatan Panyileukan	\N	850000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.71068345755	-6.9473776480107	3.00	2.50
763	Kost Yoslinaa Tipe B1 Besar Ujung Berung Bandung	Ujung Berung	\N	1100000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.70630575716	-6.9161436433405	4.00	4.00
764	Kost Triple D A3 Panyileukan Bandung	Kecamatan Panyileukan	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.714603	-6.941621	3.00	3.00
765	Kost Ws Savindra Cibiru Bandung	Cibiru	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71592281759	-6.9305103111157	3.00	4.00
766	Kost Ilaa Khairi Ummah Tipe C Cibiru Bandung	Cibiru	\N	750000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.720113	-6.933949	4.00	2.70
767	Kost Bunda 2 Tipe A Cibiru Bandung	Kecamatan Cibiru	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7229342	-6.9256112	2.50	3.50
768	Kost VGH 1 Cimencrang Tipe A Panyileukan Bandung	Panyileukan	\N	992000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.7080857	-6.9413398	3.00	4.00
769	Kost AJS Tipe C Cileunyi Bandung	Kecamatan Cileunyi	\N	1500000.00	40	Sewa	Sertifikat Hak Milik (SHM)	40	107.725293	-6.937584	5.00	8.00
770	Kost Asrama Al Afiyah Cibiru Bandung	Kecamatan Cibiru	\N	600000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.716042	-6.929534	3.00	6.00
771	Kost Wisma Elok 2 Tipe A Cibiru Bandung	Cibiru	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.71736	-6.926433	3.00	3.00
772	Kost Classy Panyileukan Bandung	Panyileukan	\N	900000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.7077178	-6.9414224	4.00	4.00
773	Kost Pondok Kartika Tipe A Cileunyi Bandung	Cileunyi	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.728124	-6.941335	3.00	3.00
774	Kost Elite Cipadung Cibiru Bandung	Cibiru	\N	1100002.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.719488	-6.923908	3.00	5.00
775	Kost Wisma Elok 1 Cibiru Bandung	Cibiru	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.717315	-6.926357	3.00	4.00
776	Kost Kobi Tipe Superior Cibiru Bandung	Cileunyi	\N	950000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.7155314387	-6.9476361477243	5.00	4.00
777	Kost Natamas Family Orange 2 Panyileukan Bandung	Kecamatan Panyileukan	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.714012	-6.944544	3.00	4.00
778	Kost Natama III Panyileukan Bandung	Panyileukan	\N	800000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.713785	-6.944563	3.50	3.00
779	Kost Cibiru Village Cileunyi Bandung	Cileunyi	\N	1500000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.72339344025	-6.9460873247489	3.00	5.00
780	Kost VGH 3 Cibiru Bandung	Kecamatan Cibiru	\N	690000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.712916	-6.929323	3.00	4.00
781	Kost Rumah Sewa D Tipe A Cileunyi Bandung	Kecamatan Cileunyi	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.721354	-6.944956	3.00	4.00
782	Kost Hidayah 1 Panyileukan Bandung	Panyileukan	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.71283358335	-6.9487967665396	3.00	3.00
783	Kost Panghegar Tipe A Panyileukan Bandung	Panyileukan	\N	540000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7031397447	-6.9239272929722	2.50	3.50
784	Kost Kobi Tipe Deluxe Cibiru Bandung	Cileunyi	\N	1200000.00	23	Sewa	Sertifikat Hak Milik (SHM)	23	107.71552920341	-6.947674185562	5.00	4.50
785	Kost Pondok Shellica Panyileukan Bandung	Panyileukan	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.7161427	-6.9400756	3.00	4.00
786	Kost Kobi Tipe Standard Cibiru Bandung	Cileunyi	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.7155314387	-6.9476680978896	3.00	4.00
787	Kost Wisma Elok 2 Tipe B Cibiru Bandung	Cibiru	\N	650000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.71736	-6.926433	3.00	3.50
788	kost Salwa Putra Tipe B Cibiru Bandung	Cibiru	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.7173125	-6.9283869	4.00	3.00
789	Kost Talita Panyileukan Bandung	Panyileukan	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71628424525	-6.9415863087002	3.00	4.00
790	Kost Pa Sapaat Cileunyi Bandung	Cileunyi	\N	800000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.734262	-6.922891	4.00	4.00
791	Kost Az Zahra Living Tipe VIP Cileunyi Bandung	Kecamatan Cileunyi	\N	1150000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71886553615	-6.940467038708	3.00	4.00
792	Kost DS Tipe A Cileunyi Bandung	Cileunyi	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.720066	-6.941846	3.00	3.00
793	Kost Pondok Khasanah Cibiru Bandung	Cileunyi	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.72295992821	-6.9332671036317	3.00	4.00
794	Kost Flamboyan Barat 17 Tipe B Panyileukan Bandung	Kecamatan Panyileukan	\N	1250000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.7155855298	-6.9384005591067	3.00	3.00
795	Kost Bunda 1 Tipe A Cibiru Bandung	Cibiru	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.722807	-6.925405	3.00	4.00
796	Kost Flamboyan Barat 17 Tipe A Panyileukan Bandung	Kecamatan Panyileukan	\N	900000.00	700	Sewa	Sertifikat Hak Milik (SHM)	700	107.71554563195	-6.9384704514624	28.00	25.00
797	Kost Tiara House 2 Panyileukan Bandung	Kecamatan Panyileukan	\N	1100000.00	48	Sewa	Sertifikat Hak Milik (SHM)	48	107.71434400231	-6.9448003261093	6.00	8.00
798	Kost Triple D Tipe A2 Panyileukan Bandung	Kecamatan Panyileukan	\N	800000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.7160222	-6.9400626	2.00	3.00
799	Kost Az Zahra Living Tipe VVIP Cileunyi Bandung	Kecamatan Cileunyi	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.71895438433	-6.9404843453116	3.00	4.00
800	Kost Tiara Guest House 1 Tipe A Panyileukan Bandung	Kecamatan Panyileukan	\N	2000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.714694	-6.944098	3.00	3.00
801	Kost Berkah Lija Cileunyi Bandung	Kecamatan Cileunyi	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.720841	-6.940419	3.00	3.00
802	Kost DS Tipe B Cileunyi Bandung	Cileunyi	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.720066	-6.941846	3.00	3.00
803	Kost Bowie Tipe B Cibiru Bandung	Cibiru	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.7152461	-6.9239391	3.00	4.00
804	Kost Megaria Tipe B Bojongsoang Bandung	Bojongsoang	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63282563537	-6.9801014833907	3.00	4.00
805	Kost Pavillion Yani Bojongsoang Bandung	Bojongsoang	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.631821	-6.983014	3.00	4.00
806	Kost Kita Tipe Executive Dayeuhkolot Bandung	Dayeuhkolot	\N	1250000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.625949	-6.974233	5.00	3.60
807	Kost Bu Sari Tipe B Bojongsoang Bandung	Kecamatan Bojongsoang	\N	500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.634642	-6.974653	3.00	3.00
808	Kost Pondok Amanah Tipe B Dayeuhkolot Bandung	Dayeuhkolot	\N	1150000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.62946784656	-6.9779726087306	3.00	2.50
809	Kost Kirana 2 Dayeuhkolot Bandung	Dayeuhkolot	\N	2500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63226974756	-6.9772454606003	3.00	4.00
810	Kost Mi Casa Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1780000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.6331994	-6.9770418	3.50	3.00
811	Kost Pondokan Tlies Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.630017	-6.97946	3.00	4.00
812	Kost Pondok DR Dayeuhkolot Bandung	Dayeuhkolot	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63141814619	-6.9782238716751	3.00	3.00
813	Kost Salsabila 12 Bandung Kidul Bandung	Kecamatan Bandung Kidul	\N	400000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.613984	-6.959814	3.00	3.00
814	Kost Permata Buah Batu D12 Tipe A Bojongsoang Bandung	Kecamatan Bojongsoang	\N	1250000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.638815	-6.973899	2.50	4.40
815	Kost BBR Bandung Kidul Bandung	Bandung Kidul	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.64072105289	-6.9596912872639	3.50	3.50
816	Kost Paviliun Pondok Al Affan Tipe AC Dayeuhkolot Bandung	Dayeuhkolot	\N	1450000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.625124	-6.967294	3.00	5.00
817	Kost Homey Residence Executive Dayeuhkolot Bandung	Dayeuhkolot	\N	2500000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.628676	-6.978746	3.00	5.00
818	Kost Puri Damai Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633532	-6.976789	3.50	3.30
819	Kost Cakra Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63210512698	-6.970524985887	3.00	3.00
820	Kost Permata Buah Batu Bojongsoang Bandung	Kecamatan Bojongsoang	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.639423	-6.972147	3.00	3.00
821	Kost Cherry Field Tipe Vip Bojongsoang Bandung	Kecamatan Bojongsoang	\N	999999.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.646021	-6.971355	3.00	4.00
822	Kost Adhyaksa Kavling Jatira Tipe B Dayeuhkolot Bandung	Dayeuhkolot	\N	850000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.636018	-6.966198	4.00	4.00
823	Kost Tify Tipe A Bojongsoang Bandung	Bojongsoang	\N	833300.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.63461466879	-6.9762883462914	2.30	2.90
824	Kost Pondok Rosely Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.633438	-6.970835	3.00	3.00
825	Kost Bu Muchtar Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633024	-6.977572	3.00	4.00
826	Kost Al Hikmah Tipe B Dayeuhkolot Bandung	Dayeuhkolot	\N	500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63588905334	-6.9678556054856	3.00	3.00
827	Kost Huni Tipe A Bojongsoang Bandung	Bojongsoang	\N	1050000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63941884041	-6.9724881572073	3.00	3.00
828	Kost T2 Palem Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.634486	-6.96913	3.00	4.00
829	Kost Pondok Raudhah Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	2025000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62859344482	-6.968228341226	3.00	4.00
830	Kost Al Hikmah Tipe B2 Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	550000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.635937	-6.967519	3.00	3.00
831	Kost Malea Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	880000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6341433	-6.971773	3.00	3.00
832	Kost Pondok Turki Telkom University Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.632998	-6.967722	3.00	4.00
833	Kost Ayanto Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.627953	-6.968513	3.00	4.00
834	Kost Bu Ayi Dayeuhkolot Bandung	Dayeuhkolot	\N	670000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.6297851	-6.9794017	2.70	3.80
835	Kost Doll Menggo Bojongsoang Bandung	Bojongsoang	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633855	-6.978561	3.00	4.00
836	Kost Graha Pelita Dayeuhkolot Bandung	Dayeuhkolot	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.632617	-6.977622	3.00	4.00
837	Kost De Bess Dayeuhkolot Bandung	Dayeuhkolot	\N	2000000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.6342133	-6.9707579	4.00	4.00
838	Kost Mika Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1000000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.6227	-6.967794	3.00	6.00
839	Kost Fadilah Dayeuhkolot Bandung	Dayeuhkolot	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.632309	-6.970497	3.00	4.00
840	Kost Annafi 2 Tipe Non AC Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63061	-6.978368	3.00	4.00
841	Kost Pondok Surya 2 Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633585	-6.970497	3.00	4.00
842	Kost Vandana Triratna Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6322107	-6.977338	3.00	4.00
843	Kost Ibu Jovi Tipe A Buah Batu Bandung	Bandung Kidul	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6471266	-6.9625755	3.00	3.00
844	Kost Vila Asri Tipe A Dayeuhkolot Bandung	Dayeuhkolot	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633056	-6.975786	3.00	4.00
845	Kost Erlindawati Bojongsoang Bandung	Bojongsoang	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63820379972	-6.9712321811144	3.00	3.00
846	Kost Tify Tipe D Bojongsoang Bandung	Kecamatan Bojongsoang	\N	724967.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.63461466879	-6.9762883462914	2.50	2.30
847	Kost Zone Tipe C Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	900000.00	64	Sewa	Sertifikat Hak Milik (SHM)	64	107.635329	-6.971569	8.00	8.00
848	Kost Ekslusif HD Studio Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	2500000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.6341215	-6.9671761	3.00	5.00
849	Kost Genius 2 Dayeuhkolot Bandung	Dayeuhkolot	\N	800000.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.63177957386	-6.9700400989425	2.60	2.60
850	Kost Kirana Tipe A Bojongsoang Bandung	Bojongsoang	\N	550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.634503	-6.97961	4.00	3.00
851	Kost Pak Apek Bojongsoang Bandung	Kecamatan Bojongsoang	\N	500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.635591	-6.974258	3.00	3.00
852	Kost Bu Dewi Bojongsoang Bandung	Kecamatan Bojongsoang	\N	1400000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.637638	-6.971989	3.00	3.00
853	Kost Zayan Tipe B Bojongsoang Bandung	Bojongsoang	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.636327	-6.969927	3.00	4.00
854	Kost Perak 19 Tipe A Buahbatu Bandung	Kecamatan Buahbatu	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.645185	-6.9587	3.00	3.00
855	Kost Ciganitri Indah Residence C12 Bojongsoang Bandung	Kecamatan Bojongsoang	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.643509	-6.971445	3.00	4.00
856	Kost Harapan Indah Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	775000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633682	-6.97001	3.00	4.00
857	Kost Pondok Dana 2 Dayeuhkolot Bandung	Dayeuhkolot	\N	1000000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.629854	-6.975553	2.50	3.00
858	Kost Cherry Field Ciganitri Tipe M Bawah Bojongsoang Bandung	Kecamatan Bojongsoang	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.64122	-6.972157	3.00	3.00
859	Kost Graha 9 Tipe B Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6299543	-6.979085	3.00	3.00
860	Kost Pga 1 B Bojongsoang Bandung	Kecamatan Bojongsoang	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63515	-6.975157	3.00	3.00
861	Kost Pondok Amanah Tipe C Dayeuhkolot Bandung	Dayeuhkolot	\N	800000.00	5	Sewa	Sertifikat Hak Milik (SHM)	5	107.62946784656	-6.9779726087306	2.50	2.00
862	Kost Qubilah Tipe B Bandung Kidul Bandung	Kecamatan Bandung Kidul	\N	2000000.00	28	Sewa	Sertifikat Hak Milik (SHM)	28	107.6432887	-6.9626474	7.00	4.00
863	Kost Paviliun Jannah Tipe B Bandung Kidul	Bandung Kidul	\N	2000000.00	60	Sewa	Sertifikat Hak Milik (SHM)	60	107.64341332018	-6.9627021707085	4.00	15.00
864	Kost Misfalah Home Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63478	-6.968409	2.20	4.00
865	Kost Ibu Eti Sumiati Dayeuhkolot Bandung	Dayeuhkolot	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62808717787	-6.9792967935778	3.00	4.00
866	Kost Cantik Pesbal Tipe Excutive Bojongsoang Bandung	Kecamatan Bojongsoang	\N	1750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.637185	-6.979286	3.00	3.00
867	Kost Eksklusif Batununggal VIP Bandung Kidul Bandung	Kecamatan Bandung Kidul	\N	2650000.00	28	Sewa	Sertifikat Hak Milik (SHM)	28	107.624921	-6.957685	5.50	5.00
868	Kost Arsyad 1 Bojongsoang Bandung	Bojongsoang	\N	830000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.63590045273	-6.9707682611656	3.00	6.00
869	Kost Waluyo Tipe Ekonomis Dayeuhkolot Bandung	Dayeuhkolot	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.631867	-6.977537	3.00	4.00
870	Kost Pondok Serumpun 1832 Bojongsoang Bandung	Kecamatan Bojongsoang	\N	550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63428039849	-6.9738063627283	3.00	4.00
871	Kost Pondok Aminah Dayeuhkolot Bandung	Dayeuhkolot	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63353943333	-6.9772484508336	3.00	3.00
872	Kost Bunga Bakung Buahbatu Bandung	Buahbatu	\N	1100000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.64748625457	-6.9555075682572	4.00	4.00
873	Kost Pondok Dana Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6351812	-6.9715698	3.00	4.00
874	Kost Qubilah Tipe C Bandung Kidul Bandung	Kecamatan Bandung Kidul	\N	1700000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.6432887	-6.9626474	5.00	4.00
875	Kost Pondok Cemara Tipe A Bojongsoang Bandung	Kecamatan Bojongsoang	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.635046	-6.97652	3.00	4.00
876	Kost Zayn Tipe B Bojongsoang Bandung	Bojongsoang	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.636307	-6.96996	3.00	4.00
877	Kost Arsyfa Tipe A Bojongsoang Bandung	Bojongsoang	\N	900000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.6350947	-6.976687	5.00	4.00
878	Kost Andir Baleendah Bandung	Baleendah	\N	700000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.6151072979	-6.9874611028835	3.00	5.00
879	Kost Anna Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1000000.00	21	Sewa	Sertifikat Hak Milik (SHM)	21	107.635567	-6.970633	3.00	7.00
880	Kost Pondok Mutiara Standard Room Dayeuhkolot Bandung	Dayeuhkolot	\N	1833333.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62990370393	-6.9790831412114	3.00	4.00
881	Kost Cherry Field Ciganitri Tipe M Bojongsoang Bandung	Kecamatan Bojongsoang	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.64122	-6.972157	3.00	3.00
882	Kost Aa Hsb Dayeuhkolot Bandung	Dayeuhkolot	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633446	-6.971117	3.00	4.00
883	Kost Pondok Rafassya Tipe A Dayeuhkolot Bandung	Dayeuhkolot	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63315	-6.971057	3.00	3.00
884	Kost Dlya Dayeuhkolot Bandung	Dayeuhkolot	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.631416	-6.97847	3.00	3.00
885	Kost H Wawan SukapuraIndah Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6333122	-6.9689177	3.00	4.00
886	Kost Andika Tipe A1 Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62156236917	-6.9724954787327	3.00	4.00
887	Kost Kita Tipe A Dayeuhkolot Bandung	Dayeuhkolot	\N	1100000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.625949	-6.974233	3.70	3.10
888	Kost Eksklusif Batununggal Tipe B Bandung Kidul Bandung	Kecamatan Bandung Kidul	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.624921	-6.957685	3.00	4.00
889	Kost Wood 123 Bojongsoang Bandung	Kecamatan Bojongsoang	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63431	-6.979334	3.50	3.50
890	Kost Happy C10 Bojongsoang Bandung	Bojongsoang	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.643406	-6.971227	3.00	4.00
891	Kost Sigma Mengger Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1000000.00	13	Sewa	Sertifikat Hak Milik (SHM)	13	107.6229015	-6.967165	2.50	5.00
892	Kost Maslahat Tipe B Buahbatu Bandung	Buahbatu	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6467794925	-6.9572980754262	3.00	4.00
893	Kost 24 Perumahan Garden City Bojongsoang Bandung	Bojongsoang	\N	1200000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.6403683424	-6.9697033068918	3.00	3.50
894	Kost Buah Batu Telkom Pondok SAE Dayeuhkolot Bandung	Dayeuhkolot	\N	1500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63318136334	-6.9664824710852	3.00	3.00
895	Kost Pondok Indriati Dayeuhkolot Bandung	Dayeuhkolot	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.633254	-6.966696	3.00	3.00
896	Kost Pondok Annisa Bojongsoang Bandung	Kecamatan Bojongsoang	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6332340017	-6.974615055519	3.00	3.00
897	Kost Delima Tipe A Bojongsoang Bandung	Kecamatan Bojongsoang	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.634431	-6.97585	3.00	4.00
898	Kost Sazira Tipe A Bojongsoang Bandung	Kecamatan Bojongsoang	\N	1500000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.63415131718	-6.9735837223692	3.00	6.00
899	Kost Zavira 2 Bojongsoang Bandung	Kecamatan Bojongsoang	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.637402	-6.967525	3.00	4.00
900	Kost Bu Sari Tipe A Bojongsoang Bandung	Bojongsoang	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63472564518	-6.9742206931597	3.00	3.00
901	Kost Azura 2 Bojongsoang Bandung	Kecamatan Bojongsoang	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.64743629843	-6.974817394896	3.00	3.00
902	Kost Ruth Tipe B Bandung Kidul	Bandung Kidul	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.64092858881	-6.9612844254115	3.00	3.00
903	Kost Pondok 1 Tipe Balkon Bojongsoang Bandung	Kecamatan Bojongsoang	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6374973	-6.9727223	3.00	3.00
904	Kost Dandelion 1 Bandung	bandung	\N	1600000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.63360884041	-6.965822193684	3.00	5.00
905	Kost Ruth Tipe A Bandung Kidul Bandung	Bandung Kidul	\N	1100000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.640929	-6.961284	2.00	5.00
906	Kost Pondok Vianur Tipe B Lengkong Bandung	Kecamatan Lengkong	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63585016131	-6.9710092067344	3.00	3.00
907	Kost Cherry Field Ciganitri Tipe L Bojongsoang Bandung	Kecamatan Bojongsoang	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.64122	-6.972157	3.00	4.00
908	Kost Pondok Rusmana Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.634127	-6.971589	3.00	4.00
909	Kost Green House Bojongsoang Bandung	Bojongsoang	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.635168	-6.976155	3.00	4.00
910	Kost Yeoja II Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	700000.00	105	Sewa	Sertifikat Hak Milik (SHM)	105	107.633551	-6.978068	3.00	35.00
911	Kost Ruth Tipe C Bandung Kidul Bandung	Bandung Kidul	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.64092858881	-6.9612844254115	3.00	4.00
912	Kost Pondok Amanah Tipe A Dayeuhkolot Bandung	Dayeuhkolot	\N	1350000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.62946784656	-6.9779726087306	3.00	3.50
913	Kost Ahira STT Telkom Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.625709	-6.973221	3.00	3.00
914	Kost Bu Sari Tipe B Bojongsoang Bandung	Kecamatan Bojongsoang	\N	500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.634642	-6.974653	3.00	3.00
915	Kost Bapak Dedi Rahmat Tipe 1 Bojongsoang Bandung	Bojongsoang	\N	600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.647671	-6.975324	3.00	4.00
916	Kost Griya Asri 1 Bojongsoang Bandung	Kecamatan Bojongsoang	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6356369257	-6.9873812342455	3.00	3.00
917	Kost Gray House Bojongsoang Bandung	Bojongsoang	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.635084	-6.976496	3.00	4.00
918	Kost Narrafa Tipe A Buahbatu Bandung	Buahbatu	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.646908	-6.956211	3.00	3.00
919	Kost Cherry Field Ciganitri Tipe S Bojongsoang Bandung	Kecamatan Bojongsoang	\N	900000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.64122	-6.972157	2.00	3.00
920	Kost Kita Tipe B Dayeuhkolot Bandung	Dayeuhkolot	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.625949	-6.974233	3.40	2.50
921	Kost H Wawan Sukapura Indah Tipe C Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1250000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6333122	-6.9689177	3.00	3.00
922	Kost Permata Tipe C Bojongsoang Bandung	Bojongsoang	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63685464859	-6.9734253115262	3.00	4.00
923	Kost Mandiri Tipe AA Buahbatu Bandung	Buahbatu	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.64773234725	-6.9597182445243	3.00	4.00
924	Kost Zayn Vvip Bojongsoang Bandung	Bojongsoang	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.636307	-6.96996	3.00	4.00
925	Kost Pak Yanto Dayeuhkolot Bandung	Dayeuhkolot	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.625857	-6.968418	3.00	4.00
926	Kost H Wawan Sukapura Indah Tipe B Dayeuhkolot Bandung	Dayeuhkolot	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6331619	-6.9683375	3.00	4.00
927	Kost Vianur Tipe A Bojongsoang Bandung	Kecamatan Bojongsoang	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63602852821	-6.971199566958	3.00	3.00
928	Kost Wisma Arnatha 1 Bojongsoang Bandung	Kecamatan Bojongsoang	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.636445	-6.978127	3.00	4.00
929	Kost Ruth Tipe D Bandung Kidul Bandung	Kecamatan Bandung Kidul	\N	700000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.641146	-6.961216	2.00	3.00
930	Kost Demang Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.633589	-6.977836	3.00	3.00
931	Kost Anugerah Bandung Kidul	Bandung Kidul	\N	1250000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.64559015626	-6.9593272990641	3.00	4.00
932	Kost Maslahat Tipe A Buahbatu Bandung	Buahbatu	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6467794925	-6.9572980754262	3.00	4.00
933	Kost Megaria Tipe B Bojongsoang Bandung	Bojongsoang	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63282563537	-6.9801014833907	3.00	4.00
934	Kost Pavillion Yani Bojongsoang Bandung	Bojongsoang	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.631821	-6.983014	3.00	4.00
935	Kost Abu Oranye Lt II Bojongsoang Bandung	Kecamatan Bojongsoang	\N	500000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.647713	-6.975243	4.00	4.00
936	Kost Umi Tipe A Bojongsoang Bandung	Bojongsoang	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.636307	-6.96996	3.00	3.00
937	Kost Raflesia 3 Dayeuhkolot Bandung	Dayeuhkolot	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6305188	-6.9796208	3.00	4.00
938	Kost Azarya Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	2900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.629843	-6.979573	3.00	3.00
939	Kost Pondok Soendawa Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63320684433	-6.9668142016236	3.00	4.00
940	Kost Ibu Eti Sumiati Dayeuhkolot Bandung	Dayeuhkolot	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6281388104	-6.9792036118724	3.00	4.00
941	Kost Sukses Mandiri Bandung Kidul Bandung	Bandung Kidul	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63518905264	-6.963436004876	3.00	3.00
942	Kost Marzia House Buahbatu Bandung	Buahbatu	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6425106	-6.9571174	3.00	3.00
943	Kost Megaria Tipe A Bojongsoang Bandung	Bojongsoang	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63280652463	-6.9801058096763	3.00	3.00
944	Kost Cemerlang Buahbatu Bandung	Buahbatu	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.641367	-6.955747	3.00	3.00
945	Kost Kita Tipe Executive Dayeuhkolot Bandung	Dayeuhkolot	\N	1250000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.625949	-6.974233	5.00	3.60
946	Kost The QIM Student Habitation Telkom University Sukabirus Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1917000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.628988	-6.981573	4.00	4.00
947	Kost Pondok Muslimah 2 Dayeuhkolot Bandung	Kecamatan Bojongsoang	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.638064	-6.972187	3.00	3.00
948	Kost Qubilah Tipe A Bandung Kidul Bandung	Bandung Kidul	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.64329362661	-6.9627028363156	3.00	3.00
949	Kost Raflesia 1 Dayeuhkolot Bandung	Dayeuhkolot	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63228416443	-6.9782068992556	3.00	4.00
950	Kost Seven Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	2500000.00	30	Sewa	Sertifikat Hak Milik (SHM)	30	107.63352368027	-6.966037516104	5.00	6.00
951	Kost Serenity Bojongsoang Bandung	Kecamatan Bojongsoang	\N	1500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.637991	-6.971313	3.00	3.00
952	Kost Dorminary Tipe B Bandung Kidul Bandung	Bandung Kidul	\N	1700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6436519	-6.9594395	3.00	3.00
953	Kost Graha 9 Tipe C Dayeuhkolot Bandung	Dayeuhkolot	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.631014	-6.9795961	3.00	3.00
954	Kost Pondok Imut I Bandung Kidul Bandung	Bandung Kidul	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.639816	-6.965243	3.00	4.00
955	Kost Caliahomestay Tipe A Bojongsoang Bandung	Bojongsoang	\N	1600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63971	-6.971894	3.00	3.00
956	Kost Pondok Juara Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63024568558	-6.9788778085493	3.00	3.00
957	Kost Sky Garden Logam Tipe VIP Bojongsoang Bandung	Bojongsoang	\N	3000000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.644168	-6.958964	4.00	4.00
958	Kost Clover Tipe A Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6347289	-6.9689988	3.00	3.00
959	Kost Pondok Vanboo Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6259411	-6.9685092	3.00	3.00
960	Kost Pondok Amanah Tipe B Dayeuhkolot Bandung	Dayeuhkolot	\N	1150000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.62946784656	-6.9779726087306	3.00	2.50
961	Kost Jaka Utama Bandung Kidul Bandung	Bandung Kidul	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.648325	-6.963949	3.00	3.00
962	Kost Sky Garden Logam Tipe Deluxe A Bojongsoang Bandung	Bojongsoang	\N	2150000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.644075	-6.95887	4.00	4.00
963	Kost Ekslusif UNE Bojongsoang Bandung	Dayeuhkolot	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63100005686	-6.9740300013681	3.00	4.00
964	Kost Wisma Arnatha Tipe A Dayeuhkolot Bandung	Dayeuhkolot	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.635462	-6.972403	3.00	4.00
965	Kost Casa De Willova Bojongsoang Bandung	Bojongsoang	\N	920000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6340752095	-6.9738083595024	3.00	4.00
966	Kost Pondok Yani Bojongsoang Bandung	Bojongsoang	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63510651886	-6.9767123255417	3.00	3.00
967	Kost Marzia House 2 Bojongsoang Bandung	Bojongsoang	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63941347599	-6.9731527702044	3.00	4.00
968	Kost Rumah Sazira Depan Universitas Telkom Tipe A Bojongsoang Bandung	Bojongsoang	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.633916	-6.973692	3.00	3.00
969	Kost Triel House Dayeuhkolot Bandung	Dayeuhkolot	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6345587	-6.9679002	3.00	4.00
970	Kost Tnd VIP Dayeuhkolot Bandung	Dayeuhkolot	\N	915000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.633243	-6.971174	4.00	4.00
971	Kost Puri Indah 2 Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.632692	-6.977159	3.50	3.50
972	Kost Wisma Maulana Tipe A Dayeuhkolot Bandung	Dayeuhkolot	\N	600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.629316	-6.977876	3.00	4.00
973	Kost Pondok Indriati 1 Dayeuhkolot Bandung	Dayeuhkolot	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63278	-6.970709	3.00	3.00
974	Kost Raflesia 2 Tipe B Dayeuhkolot Bandung	Dayeuhkolot	\N	1700000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.63216257093	-6.9782938689247	3.00	5.00
975	Kost Dorminary Tipe A Bandung Kidul Bandung	Bandung Kidul	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6438254	-6.959471	3.00	3.00
976	Kost Pondok Hijau Bjs 102 Tipe A Bojongsoang Bandung	Kecamatan Bojongsoang	\N	800000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.634527	-6.979367	5.00	3.50
977	Kost Barokah Cipagalo 69 Bojongsoang Bandung	Bojongsoang	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63669371605	-6.9699109725151	3.00	4.00
978	Kost Yeoja Executive Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633551	-6.978068	3.00	4.00
979	Kost Permata Type A Bojongsoang Bandung	Kecamatan Bojongsoang	\N	1400000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.63691365719	-6.9736862234745	2.80	2.80
980	Kost Titik Awal Tipe Standard Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1200000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.62910004705	-6.9820559620254	2.50	4.00
981	Kost Rumah Daun Telkom University Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1250000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.630519	-6.978917	3.00	4.00
982	Kost Puri Indah 3 Telkom University Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633208	-6.976962	3.00	4.00
983	Kost Andika Tipe B1 Dayeuhkolot Bandung	Kecamatan Dayeuhkolot	\N	500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62156236917	-6.9724954787327	3.00	4.00
984	Kost Muslimah GBA1 Bojongsoang Bandung	Bojongsoang	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.632945	-6.9855712	3.00	3.00
985	Kost Graha Afina Tipe A Dayeuhkolot Bandung	Dayeuhkolot	\N	1450000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.633879	-6.976836	3.00	3.00
986	Kost Eksklusif Batununggal Tipe VIP Bandung Kidul Bandung	Bandung Kidul	\N	2950000.00	30	Sewa	Sertifikat Hak Milik (SHM)	30	107.624921	-6.957685	5.00	6.00
987	Kost Singgahsini Sukabirus Residence Tipe B Citereup Bandung	Dayeuhkolot	\N	1221000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.6291026	-6.9804498	4.00	5.00
988	Kost Singgahsini Sukabirus Residence Tipe A Citereup Bandung	Kecamatan Dayeuhkolot	\N	1138200.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6291026	-6.9804498	4.00	3.00
989	Kost Citepus Paviliun Cicendo Bandung	Kecamatan Cicendo	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.585813	-6.902356	3.00	4.00
990	Kost Bumi Uwa Tipe B Cimahi Utara Cimahi	Cimahi Utara	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.56864707917	-6.8830259207349	3.00	3.00
991	Kost Casa De Lemon Casa 4 Sukajadi Bandung	Kecamatan Sukajadi	\N	1400000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.58292	-6.885772	2.50	3.00
992	Kost Nyonya Residence Tipe VIP Sukasari Bandung	Sukasari	\N	1350000.00	13	Sewa	Sertifikat Hak Milik (SHM)	13	107.584441	-6.875873	3.00	4.20
993	Kost Elite Ddr 203 Tipe A Sukajadi Bandung	Kecamatan Sukajadi	\N	1300005.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.582943	-6.883129	3.00	4.00
994	Kost Icarus 1 Tipe A1 Sukajadi Bandung	Sukajadi	\N	1400000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.581338	-6.882566	4.00	5.00
995	Kost Guest House Kami No Ko Tipe Moon Sukajadi Bandung	Sukajadi	\N	1800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5896429	-6.8794209	3.00	4.00
996	Kost Casa De Lemon Casa 5 Sukajadi Bandung	Kecamatan Sukajadi	\N	1500000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.5811667	-6.8827674	3.00	3.50
997	Kost Casa De Lemon Casa 2 Sukajadi Bandung	Sukajadi	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.581199	-6.882637	3.00	3.00
998	Kost Shoeny Gegerkalong Setiabudi Bandung	Sukasari	\N	800000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.59029820561	-6.8686528190603	3.00	5.00
999	Kost 23 House Tipe Standard Non AC Sukajadi Bandung	Sukajadi	\N	1400000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.582003	-6.887821	3.00	3.00
1000	Kost Exclusive Sarijadi 93 Tipe Standard Sukasari Bandung	Kecamatan Sukasari	\N	1700000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.581502	-6.869558	3.00	5.00
1001	Kost Icarus 1 Tipe B Sukajadi Bandung	Sukajadi	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.581349	-6.882555	3.00	4.00
1002	Kost Parwis 22 Tipe B Sukajadi Bandung	Sukajadi	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5769227	-6.8857191	3.00	3.00
1003	Kost Pink Tipe A Sukasari Bandung	Kecamatan Sukasari	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.578493	-6.880047	3.00	3.00
1004	Kost Nara Tipe A Sukajadi Bandung	Kecamatan Sukajadi	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.592143	-6.893052	3.00	3.00
1005	Kost Chez Moi Executive Sukajadi Bandung	Kecamatan Sukajadi	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.588584	-6.890531	2.00	6.00
1006	Kost Pa Hj Ande Sukajadi Bandung	Sukajadi	\N	600000.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.59414717555	-6.8871254037668	2.70	2.70
1007	Kost Sarijadi 33 Tipe B Sukasari Bandung	Sukasari	\N	650000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.57654750596	-6.8821976253127	2.80	2.80
1008	Kost Radiant Tipe A+ Cicendo Bandung	Cicendo	\N	1700000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.595074	-6.900428	4.00	5.00
1009	Kost Sukagalih 136 Executive 1 Sukajadi Bandung	Kecamatan Sukajadi	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.588807	-6.8930641	3.00	3.00
1010	Kost Anggieta Tipe A1 Cicendo Bandung	Cicendo	\N	650000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.590566	-6.898487	4.00	4.00
1011	Kost Icarus 1 Tipe A Sukajadi Bandung	Sukajadi	\N	1600000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.581336	-6.882523	4.00	5.00
1012	Kost Parwis 22 Tipe C Sukajadi Bandung	Sukajadi	\N	1000000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.5769227	-6.8857191	4.50	3.00
1013	Kost Cipedes 97 Keyz Tipe A Sukasari Bandung	Kecamatan Sukasari	\N	800000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.59019	-6.87165	4.00	2.80
1014	Kost Nyonya Residence Tipe Exclusive Sukasari Bandung	Sukasari	\N	1449000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.584441	-6.875873	3.00	4.00
1015	Kost Pondok Cengkeh Tipe A Sukajadi Bandung	Kecamatan Sukajadi	\N	1300000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.593396	-6.887031	4.00	5.00
1016	Kost Anggieta Tipe B Cicendo Bandung	Cicendo	\N	700000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.590566	-6.898487	4.00	4.00
1017	Kost Sukagalih 136 Excecutive Sukajadi Bandung	Kecamatan Sukajadi	\N	1900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.588807	-6.8930641	3.00	3.00
1018	Kost Pondok 76 Tipe A 77 Sukajadi Bandung	Sukajadi	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.596355	-6.897654	3.00	4.00
1019	Kost 8th Loft Nhi Upi Tipe Bunked Bed Sukasari Bandung	Kecamatan Sukasari	\N	2500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.593241	-6.8691233	3.00	3.00
1020	Kost Sukagalih 136 Double Lux Sukajadi Bandung	Kecamatan Sukajadi	\N	2100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.588799	-6.893096	3.00	4.00
1021	Kost Lavender Inn Sukajadi Bandung	Kecamatan Sukajadi	\N	1450000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.582993	-6.887117	3.00	4.00
1022	Kost Niji House Sukasari Bandung	Sukasari	\N	1350000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.57974505424	-6.8811640475172	3.00	3.00
1023	Kost Guest House Kami No Ko Tipe Galaxy Sukajadi Bandung	Sukajadi	\N	1900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5896429	-6.8794209	3.00	4.00
1024	Kost Bu Yuyun Tipe B Sukajadi Bandung	Sukajadi	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.594235	-6.888639	3.00	4.00
1025	Kost Cozy Place Tipe C Sukasari Bandung	Sukasari	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.579433	-6.874973	3.00	3.00
1026	Kost Guest House Kami No Ko Tipe Sky Sukajadi Bandung	Sukajadi	\N	1600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5896429	-6.8794209	3.00	4.00
1027	Kost Aruni Ekslusif Maranatha Double Bed VIP Sukajadi Bandung	Kecamatan Sukajadi	\N	2400000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.58339285851	-6.888109993393	3.50	4.50
1028	Kost Guest House Kami No Ko Tipe Rain Sukajadi Bandung	Sukajadi	\N	2200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5896429	-6.8794209	3.00	4.00
1029	Kost Bu Moen Sukasari Bandung	Sukasari	\N	900000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.57715336978	-6.8740239762029	2.50	2.50
1030	Kost Srikandi Sukasari Bandung	Kecamatan Sukasari	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.57323499769	-6.8828884496363	3.00	4.00
1031	Kost Oma Nuy Tipe 1 Sukasari Bandung	Kecamatan Sukasari	\N	685000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.57631383836	-6.8761776147537	3.00	3.00
1032	Kost EL Tipe A Sukajadi Bandung	Kecamatan Sukajadi	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5786184	-6.8851503	3.00	4.00
1033	Kost E House Superior Parongpong Bandung Barat	Kecamatan Parongpong	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.57403731346	-6.8676215872283	3.50	3.50
1034	Kost Sarijadi Raya Tipe A Sukasari Bandung	Kecamatan Sukasari	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5818997621	-6.8689424157189	3.00	4.00
1035	Kost 23 House Tipe Standard AC Sukajadi Bandung	Sukajadi	\N	1600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.582003	-6.887821	3.00	3.00
1036	Kost Habibah Cicendo Bandung	Cicendo	\N	1150000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.59021673352	-6.9001635612754	3.00	4.00
1037	Kost JK Sukajadi Bandung	Kecamatan Sukajadi	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5904901	-6.8841338	3.00	3.00
1038	Kost Pondok Anugerah Tipe Standart Sukajadi Bandung	Sukajadi	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5785545	-6.8876306	3.00	3.00
1039	Kost Surya Boarding House Sukasari Bandung	Sukasari	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5772308	-6.8678523	3.00	4.00
1040	Kost Viola Tipe A Sukajadi Bandung	Sukajadi	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.596844	-6.891506	3.00	4.00
1041	Kost Pondok Gerlong Sukasari Bandung	Sukasari	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.58669834584	-6.8689913475507	3.00	4.00
1042	Kost Sukagalih 139 Tipe Large Sukajadi Bandung	Kecamatan Sukajadi	\N	900000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.590126	-6.893287	3.50	4.00
1043	Kost 8th Loft Nhi Upi Tipe Loft Sukasari Bandung	Kecamatan Sukasari	\N	2250000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.593241	-6.8691233	3.00	3.00
1044	Kost Pa Ade Cicendo Bandung	Cicendo	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.58919648826	-6.8983528662082	3.00	3.00
1045	Kost Amalia Exclusif Sukajadi Bandung	Sukajadi	\N	1800000.00	21	Sewa	Sertifikat Hak Milik (SHM)	21	107.583636	-6.888136	3.50	6.00
1046	Kost Sukatenang Paskal Tipe Exclusive Cicendo Bandung	Kecamatan Cicendo	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.596161	-6.904163	3.00	4.00
1047	Kost Wisma Komando2 Tipe B Cimahi Utara	Cimahi Utara	\N	1700000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.56130252033	-6.8737856440417	4.00	4.00
1048	Kost Elite 2 Tipe A Sukajadi Bandung	Kecamatan Sukajadi	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.582161	-6.88665	3.00	4.00
1049	Kost Rumah De Ajeng Tipe A Sukasari Bandung	Kecamatan Sukasari	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.58050143719	-6.8770909942144	3.00	3.00
1050	Kost Bumi Kupa 2 Cicendo Bandung	Kecamatan Cicendo	\N	775000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.56329908967	-6.8939312795311	4.00	6.00
1051	Kost The Sally Sukajadi Bandung	Kecamatan Sukajadi	\N	1000000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.5964981	-6.8943703	4.00	4.00
1052	Kost Pucuk Merah 1 Cicendo Bandung	Kecamatan Cicendo	\N	675000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5608535856	-6.8955372881967	3.00	3.00
1053	Kost Rumah De Ha Sukasari Sarijadi Bandung	Sukasari	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.578182	-6.8788239	3.00	4.00
1054	Kost Wisma Komando2 Tipe C Cimahi Utara	Cimahi Utara	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.56121702492	-6.8737473644237	3.00	4.00
1055	Kost Cibogo 25 C Pasteur Tipe A Sukajadi Bandung	Sukajadi	\N	1050000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.57917654887	-6.888725388749	2.00	4.00
1056	Kost Nick Tipe A Cicendo Bandung	Cicendo	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5943782	-6.9031738	3.00	3.00
1057	Kost E House Tipe Deluxe Parongpong Bandung Barat	Kecamatan Parongpong	\N	1500000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.5733886	-6.8690294	3.50	4.00
1058	Kost Pa Cecep Tipe A Sukajadi Bandung	Sukajadi	\N	450000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.596569	-6.900152	3.00	4.00
1059	Kost Muslim Pariwisata 15 Tipe C Sukajadi Bandung	Kecamatan Sukajadi	\N	1800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5770659	-6.8859178	3.50	2.70
1060	Kost Cipedes Tengah 141 Tipe A Sukajadi Bandung	Sukajadi	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5902908	-6.884333	3.00	4.00
1061	Kost Sukatenang Paskal Tipe Standart Cicendo Bandung	Cicendo	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.59617	-6.904229	3.00	3.00
1062	Kost Cibogo Homes Eksklusif Tipe A Sukajadi Bandung	Sukajadi	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.579015	-6.883157	3.00	4.00
1063	Kost Sarijadi Cijerokaso Tipe B Sukasari Bandung	Sukasari	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5785825	-6.8713319	3.00	4.00
1064	Kost Thya Sukajadi Bandung	Kecamatan Sukajadi	\N	1100000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.590483	-6.892166	5.00	4.00
1065	Kost 8th Loft Nhi Upi Tipe Deluxe Sukasari Bandung	Kecamatan Sukasari	\N	3250000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.593241	-6.8691233	3.00	3.00
1066	Kost Glory Guesthouse Tipe B Sukajadi Bandung	Sukajadi	\N	1350000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.582168	-6.8878232	3.00	4.00
1067	Kost Gloria Eco Rooms Tipe A-2 Sukajadi Bandung	Sukajadi	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.57899135351	-6.8891005723741	3.00	3.00
1068	Kost Hasanah Sukajadi Bandung	Sukajadi	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5907689333	-6.8891405150315	3.00	4.00
1069	Kost Sitimurgi Sukajadi Bandung	Kecamatan Sukajadi	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.577737	-6.884658	3.00	3.00
1070	Kost Casa Feby Superior Sukajadi Bandung	Kecamatan Sukajadi	\N	1800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5826244	-6.8897252	3.00	4.00
1071	Kost Picung Sukasari Bandung	Kecamatan Sukasari	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.58810818195	-6.8723190331679	3.00	4.00
1072	Kost E House Standar Parongpong Bandung Barat	Kecamatan Parongpong	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.57403731346	-6.8676215872283	2.50	3.50
1073	Kost DHomey 1 Tipe Vip Sukajadi Bandung	Kecamatan Sukajadi	\N	2200000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.58094131947	-6.8821877826654	5.00	3.00
1074	Kost Sukagalih 94 Tipe A Sukajadi Bandung	Kecamatan Sukajadi	\N	1200000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.590456	-6.892234	4.00	5.00
1075	Kost Cibogo 25 C Pasteur Tipe C Sukajadi Bandung	Sukajadi	\N	861850.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.579177	-6.888725	2.00	3.00
1076	Kost Vieza's Rumah Butik Tipe B Sukajadi Bandung	Sukajadi	\N	1150000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.58607280849	-6.8862393912367	3.00	3.00
1077	Kost West London College VIP Sukajadi Bandung	Sukajadi	\N	1600000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.58152302355	-6.8851369126045	3.00	3.50
1078	Kost Pak Fery Tipe A Sukajadi Bandung	Sukajadi	\N	550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.593508	-6.884892	3.00	4.00
1079	Kost Jesz Tipe C Sukajadi Bandung	Sukajadi	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.58582830429	-6.8861015349022	3.00	4.00
1080	Kost Setrasari VI Sukasari Bandung	Sukasari	\N	1800000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.58973896503	-6.8753357434384	4.00	4.00
1081	Kost Sukagalih 125 Tipe B Sukajadi Bandung	Sukajadi	\N	1400000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.59039141238	-6.8928162236811	4.00	4.00
1082	Kost Indi Sarijadi Sukasari Bandung	Kecamatan Sukasari	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.577573	-6.875527	3.00	3.00
1083	Kost Puri Syailendra Deluxe Sukajadi Bandung	Sukajadi	\N	2600000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.57993	-6.8817418	3.00	5.00
1084	Kost Infinite Residence Tipe B Sukajadi Bandung	Sukajadi	\N	1550000.00	19	Sewa	Sertifikat Hak Milik (SHM)	19	107.5843799	-6.8869206	3.50	5.50
1085	Kost Puri Syailendra Superior Sukajadi Bandung	Sukajadi	\N	2300000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.57993	-6.8817418	3.00	5.00
1086	Kost Casa Mia Exclusive Pasteur Sukajadi Bandung	Kecamatan Sukajadi	\N	1900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5857424736	-6.8881312961885	3.00	4.00
1087	Kost Chelsea Home Tipe A Sukajadi Bandung	Sukajadi	\N	1350000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.58366644382	-6.8822849743426	4.00	4.00
1088	Kost Griya Santosa 2 Kamar Mandi Dalam Sukajadi Bandung	Sukajadi	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.58250772953	-6.8869915952826	3.00	4.00
1089	Kost Puri Syailendra Tipe Superior Sukajadi Bandung	Sukajadi	\N	2300000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.57993	-6.8817418	3.00	5.00
1090	Kost Icarus Tipe C Sukajadi Bandung	Sukajadi	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.581338	-6.882566	3.00	3.00
1091	Kost Sukagalih 125 Tipe C Sukajadi Bandung	Sukajadi	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.590391	-6.892816	3.00	4.00
1092	Kost Pucuk Merah 2 Cicendo Bandung	Cicendo	\N	875000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.56090790033	-6.8942424961433	3.00	4.00
1093	Kost Cibogo Homes Eksklusif Tipe B Sukajadi Bandung	Sukajadi	\N	1400000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.579015	-6.883157	3.00	5.00
1094	Kost Sarijadi 33 Tipe A Sukajadi Bandung	Sukajadi	\N	650000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.57708530873	-6.8821361857767	2.50	3.00
1095	Kost Casa Feby Standard Sukajadi Bandung	Kecamatan Sukajadi	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5825769	-6.8896904	3.00	4.00
1096	Kost Vania Bagus Tipe A Andir Bandung	Andir	\N	2200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.56644163281	-6.8927576415699	3.00	3.00
1097	Kost Betah Nidera Sukasari Bandung	Sukasari	\N	1200000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.594918	-6.875176	2.50	3.00
1098	Kost Sukalestari Sukajadi Bandung	Sukajadi	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.579937	-6.887338	3.00	4.00
1099	Kost Graha Setiabudi Tipe Superior View Cidadap Bandung	Kecamatan Cidadap	\N	2750000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.59836494923	-6.8793438118487	3.00	4.50
1100	Kost Graha Setiabudi Superior Non View Cidadap Bandung	Kecamatan Cidadap	\N	2500000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.59836494923	-6.8793438118487	3.00	4.50
1101	Kost Rennicks Tipe A Parongpong Bandung Barat	Kecamatan Parongpong	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5648043	-6.8689988	3.00	3.00
1102	Kost Apik Karunia Maranatha Tipe A Sukajadi Bandung	Sukajadi	\N	2371000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.58099252557	-6.8885654242276	3.00	4.00
1103	Kost Apik Karunia Maranatha Tipe B Sukajadi Bandung	Sukajadi	\N	2095000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.58099252557	-6.8885654242276	3.00	3.50
1104	Kost Angel House Tipe B Cidadap Bandung	Cidadap	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.595814	-6.8717	3.00	3.00
1105	Kost Jr House Pasteur Sukajadi Bandung	Sukajadi	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.58392930031	-6.8889624373245	3.00	3.00
1106	Kost Singgahsini Abc Sukakarya Tipe C Sukajadi Bandung	Kecamatan Sukajadi	\N	1405000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.5830341	-6.8863936	3.50	4.00
1107	Kost Mamah Ety Tipe A Sukajadi Bandung	Sukajadi	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.597507	-6.888765	3.00	3.00
1108	Kost Radiant Tipe B Cicendo Bandung	Kecamatan Cicendo	\N	1600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.595074	-6.900428	3.00	4.00
1109	Kost Maranatha 1 Tipe B Sukajadi Bandung	Kecamatan Sukajadi	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.583516	-6.888888	3.00	3.00
1110	Kost Graha Annisa Gegerkalong Bandung	Sukasari	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.58629031479	-6.8678569266458	3.00	3.00
1111	Kost Robi Sukajadi Bandung	Sukajadi	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.59347561747	-6.8874818933502	3.00	3.00
1112	Kost Malmultekosta Cicendo Bandung	Cicendo	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.57292687893	-6.8934676163277	3.00	3.00
1113	Kost Na Jeges 98 Babakan Sukajadi Bandung	Sukajadi	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5831927	-6.8854821	3.00	4.00
1114	Kost Bidan Merry Sukasari Bandung	Kecamatan Sukasari	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5754243508	-6.8803034529944	3.00	3.00
1115	Kost Nara Tipe B Sukajadi Bandung	Kecamatan Sukajadi	\N	585000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.592143	-6.893052	3.00	4.00
1116	Kost Parwis 22 Tipe A Sukajadi Bandung	Sukajadi	\N	900000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.5769227	-6.8857191	2.50	3.00
1117	Kost Holland Sukasari Bandung	Kecamatan Sukasari	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.576813	-6.877153	3.00	3.00
1118	Kost Singgahsini Mega Home Tipe C Cicendo Bandung	Cicendo	\N	2365000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.5693014	-6.8938927	5.00	3.00
1119	Kost Room BakJer 50 Sukajadi Bandung	Sukajadi	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.58245207369	-6.8893844980245	3.00	4.00
1120	Kost Tulip 2 Tipe A Sukajadi Bandung	Kecamatan Sukajadi	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.58272230625	-6.8850636837785	3.00	4.00
1121	Kost Westlondoncoliving Superior Room Sukajadi Bandung	Kecamatan Sukajadi	\N	1800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.581585	-6.885068	3.00	3.00
1122	Kost Maranatha Suka Residence Executive Sukajadi Bandung	Kecamatan Sukajadi	\N	1650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5832241	-6.8873338	3.00	4.00
1123	Kost Singgahsini Budi Indah 3 Tipe A Cimahi	Cimahi Utara	\N	853000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.566132	-6.877781	4.00	3.50
1124	Kost Ruang 59 Sukajadi Bandung	Sukajadi	\N	2000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.581302	-6.885074	3.00	4.00
1125	Kost Karizma Guesthouse Sukasari Bandung	Sukasari	\N	1900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5802806	-6.8741749	3.00	4.00
1126	Kost Ibu Wiwin Romlah Type A Sukajadi Bandung	Kecamatan Sukajadi	\N	550000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.58692163974	-6.8882631072147	3.00	3.00
1127	Kost Singgahsini Abc Sukakarya Tipe A Sukajadi Bandung	Kecamatan Sukajadi	\N	1015000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.5830341	-6.8863936	3.00	3.50
1128	Kost Apik Karunia Maranatha Tipe D Sukajadi Bandung	Sukajadi	\N	1129000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.58099252557	-6.8885654242276	3.00	3.00
1129	Kost Wisma Cemara Sukasari Bandung	Kecamatan Sukasari	\N	2600000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.5800598	-6.8802385	4.00	5.00
1130	Kost Lima Lapan Tipe A Sukasari Bandung Barat	Kecamatan Sukasari	\N	1300000.00	24	Sewa	Sertifikat Hak Milik (SHM)	24	107.578416	-6.873081	4.00	6.00
1131	Kost Singgahsini Mega Home Tipe A Cicendo Bandung	Cicendo	\N	1465000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5693014	-6.8938927	4.00	3.00
1132	Kost Apik Pondok Paskal Tipe A Cicendo Bandung	Cicendo	\N	746600.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.59715938064	-6.9020892242147	3.00	2.50
1133	Kost Apik Karunia Maranatha Tipe E Sukajadi Bandung	Sukajadi	\N	1092200.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.58099252557	-6.8885654242276	3.00	2.50
1134	Kost Singgahsini Mega Home Tipe B Cicendo Bandung	Cicendo	\N	1735000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5693014	-6.8938927	4.00	3.00
1135	Kost Paledang 304 Tipe A Andir Bandung	Andir	\N	1150000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.569897	-6.902063	3.00	3.00
1136	Kost Miracolo Tipe A Sukajadi Bandung	Sukajadi	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.59833376855	-6.8841786126657	3.00	3.00
1137	Kost Apik Setiabudi Damar Home Tipe C Bandung	Kecamatan Sukajadi	\N	1020000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.5982929	-6.8818395	3.00	3.50
1138	Kost Apik Setiabudi Damar Home Tipe D Bandung	Kecamatan Sukajadi	\N	1245000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.5982929	-6.8818395	3.50	4.00
1139	Kost Apik Setiabudi Damar Home Tipe B Bandung	Kecamatan Sukajadi	\N	975000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5982929	-6.8818395	3.00	3.00
1140	Kost Apik Setiabudi Damar Home Tipe A Bandung	Kecamatan Sukajadi	\N	835000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.5982929	-6.8818395	2.50	3.00
1141	Kost Singgahsini Dy Culture Maranatha Tipe A Sukajadi Bandung	Sukajadi	\N	2533000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.58071629005	-6.8811941129547	6.00	3.00
1142	Kost Singgahsini Dy Culture Maranatha Tipe C Sukajadi Bandung	Sukajadi	\N	1477000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.58071629005	-6.8811941129547	3.00	4.00
1143	Kost Singgahsini Dy Culture Maranatha Tipe B Sukajadi Bandung	Sukajadi	\N	1600000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.58071629005	-6.8811941129547	4.00	4.00
1144	Kost Adamy 1 Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	650000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.63901	-6.897377	2.50	2.50
1145	Kost Muararajeun Lama 1 Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.630348	-6.902217	3.00	4.00
1146	Kost Pav Cemara Non Balkon 1 Coblong Bandung	Kecamatan Coblong	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62811	-6.8907337	3.00	4.00
1147	Kost Imah Incu Antapani Bandung	Antapani	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6535622	-6.9090813	3.00	4.00
1148	Kost Rumah Alhamra Khodijah Coblong Bandung	Coblong	\N	2500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.618794	-6.886142	3.00	3.00
1149	Kost Tubagus Ismail Dalam 56 Tipe A Coblong Bandung	Coblong	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6169513166	-6.8886954870663	3.00	3.00
1150	Kost Sunrise Tipe C Cibeunying Kidul Bandung	Cibeunying Kidul	\N	775000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.641061	-6.902117	3.00	3.00
1151	Kost Nelly Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.630533	-6.892846	3.00	4.00
1152	Kost Awiligar 54 Tipe C Cibeunying Cimenyan Bandung	Cimenyan	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63364069164	-6.8875228347138	3.50	3.50
1153	Kost Sigmaa Tipe Studio AC Coblong Bandung	Coblong	\N	1600000.00	25	Sewa	Sertifikat Hak Milik (SHM)	25	107.61649265885	-6.8871437108948	5.00	5.00
1154	Kost Kubangsari VI Coblong Bandung	Coblong	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61767417192	-6.8887301040659	3.00	4.00
1155	Kost Iwan Tipe A Coblong Bandung	Coblong	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.619079	-6.887991	3.00	4.00
1156	Kost Manteron Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	900000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.63075396419	-6.8963767376064	2.00	3.00
1157	Kost Pondok Cisokan Baru 8 Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1400000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63300836086	-6.9016909970055	3.00	3.00
1158	Kost Bu Linda Cikutra 1 Tipe VVIP Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	850000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.641536	-6.898709	3.20	2.50
1159	Kost Sigmaa Tipe F Coblong Bandung	Coblong	\N	1400000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.616493	-6.887144	4.00	4.00
1160	Kost Pondok Aceuk Coblong Bandung	Coblong	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62492116541	-6.8924114744012	3.00	4.00
1161	Kost Terusan Cisokan Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63286352158	-6.9027607649219	3.00	4.00
1162	Kost Paviliun Cemara Tipe VIP Coblong Bandung	Coblong	\N	1550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.627964	-6.890604	3.50	3.50
1163	Kost Bara Indah Tipe A Coblong Bandung	Coblong	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.617707	-6.89664	3.00	3.00
1164	Kost Pondok Latief Executive 1 Coblong Bandung	Coblong	\N	3000000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.61858	-6.88336	4.00	4.00
1165	Kost Rumah Dahlia Bandung	Sumur Bandung	\N	700000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.62759131905	-6.9126661703408	3.00	3.50
1166	Kost Bapak Engkus Coblong Bandung	Coblong	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6181933	-6.8864285	3.00	3.00
1167	Kost Sadang Cikutra Cibeunying Kaler Bandung	Cibeunying Kaler	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62847978622	-6.8860962091806	3.00	4.00
1168	Kost Kumeli 30 Tipe B Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1350000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633124	-6.897115	3.00	4.00
1169	Kost Dinata Coblong Bandung	Coblong	\N	825000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6172685	-6.8811839	3.00	3.00
1170	Kost Cendana House Coblong Bandung	Coblong	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61821161956	-6.885669818402	3.00	3.00
1171	Kost Boy Coblong Bandung	Coblong	\N	600000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.620447	-6.884974	2.50	2.50
1172	Kost Kappaa Tipe C Coblong Bandung	Coblong	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.618211	-6.886206	3.00	4.00
1173	Kost Yubifa Tipe A Coblong Bandung	Coblong	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62063	-6.882022	3.00	3.00
1174	Kost Ciung Tipe A Coblong Bandung	Coblong	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62156873941	-6.8976758508698	3.00	3.00
1175	Kost Rkm Tipe B Cibeunying Kidul Bandung	Cibeunying Kidul	\N	2250000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.6474838	-6.905526	2.80	3.00
1176	Kost Menara Air 7 Coblong Bandung	Coblong	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62372255325	-6.8868691039008	3.00	3.00
1177	Kost Sukamulus Cibeunying Kidul Bandung	Cibeunying Kidul	\N	450000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.638115	-6.908322	3.00	3.00
1178	Kost Qta Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1100000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.630947	-6.8999	2.50	4.00
1179	Kost H 16 Sweet House Coblong Bandung	Kecamatan Coblong	\N	2400000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.61654	-6.898539	3.00	5.00
1180	Kost Ambar Coblong Bandung	Kecamatan Coblong	\N	1500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6252403	-6.8896011	3.00	3.00
1181	Kost Rumah Alhamra Fatimah Middle Coblong Bandung	Coblong	\N	2200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.618794	-6.886142	3.00	2.90
1182	Kost Rumah Alhamra Fatimah Back Coblong Bandung	Coblong	\N	2200000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.618794	-6.886142	2.80	2.80
1183	Kost F30 Tipe A Antapani Bandung	Antapani	\N	1500000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.652353	-6.913104	4.00	5.00
1184	Kost Rezky Ahmad Yani Kiaracondong Bandung	Kiaracondong	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.653455	-6.90389	3.00	4.00
1185	Kost Master Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62789271772	-6.8886648643339	3.00	4.00
1186	Kost Bengawan 83 Tipe C1 Bandung Wetan Bandung	Kecamatan Bandung Wetan	\N	1250000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.630005	-6.910741	3.20	3.20
1187	Kost Tuisda Coblong Bandung	Kecamatan Coblong	\N	1650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.616475	-6.886859	3.00	4.00
1188	Kost Budi Coblong Bandung	Coblong	\N	550000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6165783	-6.8866447	3.00	3.00
1189	Kost Murah Tipe A Coblong Bandung	Coblong	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.622487	-6.890915	3.00	3.00
1190	Kost Pahlawan Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6348406449	-6.8958475052018	3.00	3.00
1191	Kost Gagak Tipe C Cibeunying Kaler Bandung	Cibeunying Kaler	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6248681	-6.8987146	3.00	3.00
1192	Kost Temurasa Living Tubis Coblong Bandung	Coblong	\N	2600000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.62447960675	-6.8878217398465	4.00	4.00
1193	Kost Bumi Putri Sukasenang Tipe B Cibeunying Kidul Bandung	Cibeunying Kidul	\N	1450000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63493379231	-6.8995660817822	3.00	4.00
1194	Kost Sumitra Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1200000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.6422576	-6.8958566	3.00	2.50
1195	Kost Bu Linda Cikutra 1 Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	800000.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.641536	-6.898709	2.70	2.50
1196	Kost Intan II Tipe A Coblong Bandung	Coblong	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6249563694	-6.8907834867593	3.00	3.00
1197	Kost Komura Standart Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	550000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.629742	-6.900529	3.00	4.00
1198	Kost Bumi Sukasenang Tipe A Cibeunying Kidul Bandung	Cibeunying Kidul	\N	1350000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63511389494	-6.8998064155355	3.00	4.00
1199	Kost Dyns House Tipe A Cibeunying Kidul Bandung	Cibeunying Kidul	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.645877	-6.897381	3.00	3.00
1200	Kost Cikutra Home Deluxe Superior Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6389545	-6.8943411	3.00	4.00
1201	Kost Premium Fira 3 Ciung Residence Tipe VVIP Coblong Bandung	Kecamatan Coblong	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.621312	-6.897663	3.00	4.00
1202	Kost Omahku Kirana Tipe B Coblong Bandung	Coblong	\N	2000000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.620062	-6.885993	3.00	2.80
1203	Kost Nunia House Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1250000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.62744545937	-6.8791148025062	3.00	3.50
1204	Kost Master Tipe B Cibeunying Kaler Bandung	Cibeunying Kaler	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62789271772	-6.8886648643339	3.00	3.00
1205	Kost Bengawan 83 Tipe D Bandung Wetan Bandung	Bandung Wetan	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630005	-6.910741	3.20	2.70
1206	Kost Pak Haji Oyon Coblong Bandung	Coblong	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.622566	-6.894562	3.00	4.00
1207	Kost Muararajeun Lama 2 Tipe C1 Cibeunying Kaler Bandung	Cibeunying Kaler	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630439	-6.902196	3.00	3.00
1208	Kost Muararajeun Lama 2 Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630439	-6.902196	3.50	2.50
1209	Kost Bangbayang Residence Coblong Bandung	Kecamatan Coblong	\N	1220000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.617963	-6.880518	4.00	4.00
1210	Kost Zeta Tipe T Standard Coblong Bandung	Kecamatan Coblong	\N	1400000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.618087	-6.887143	4.00	3.50
1211	Kost Anggrek Bulan Coblong Bandung	Coblong	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6238426	-6.8970114	3.00	3.00
1212	Kost Alfa Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	870000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62792993337	-6.8872848421851	3.00	3.00
1213	Kost Bidan Maria 1 Antapani Bandung	Antapani	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.653929	-6.914223	3.00	4.00
1214	Kost Pondok Ina 2 Kiaracondong Bandung	Kiaracondong	\N	1600000.00	13	Sewa	Sertifikat Hak Milik (SHM)	13	107.64673054218	-6.9123572804359	3.90	3.30
1215	Kost Bahagia Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1350000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.6382925	-6.8968894	3.00	3.50
1216	Kost Palapa Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.632167	-6.908427	3.00	4.00
1217	Kost Paviliun CemaraTipe Balkon 1 Coblong Bandung	Coblong	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6280512	-6.890744	3.00	4.00
1218	Kost I Here Sukasari II Coblong Bandung	Coblong	\N	1150000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62183428735	-6.8934729419665	3.00	4.00
1219	Kost Supratman Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630283	-6.904561	3.00	3.00
1220	Kost Rumah 22 Coblong Bandung	Kecamatan Coblong	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.620197	-6.88575	3.00	3.00
1221	Kost Bangbayang Residence Tipe A Coblong Bandung	Kecamatan Coblong	\N	1600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61795043945	-6.88040897013	3.00	3.00
1222	Kost Urban Residence Tipe A Kiaracondong Bandung	Kiaracondong	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.650672	-6.906712	3.00	3.00
1223	Kost Clover Coblong Bandung	Coblong	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61926473069	-6.892614384701	3.00	4.00
1224	Kost Gagak Satu 25 Standard Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1050000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.6249667	-6.8987144	3.00	2.70
1225	Kost 42 Dago Coblong Bandung	Kecamatan Coblong	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.618009	-6.880834	4.00	3.00
1226	Kost Gedung Putih 1 Coblong Bandung	Coblong	\N	1800000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.6184174791	-6.8839818929877	4.00	5.00
1227	Kost Kubangsari II Tipe B Coblong Bandung	Coblong	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61684000492	-6.8887810309933	3.00	3.00
1228	Kost Shakira Tipe A Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	1500000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.63835668564	-6.9024465582925	2.00	4.00
1229	Kost Pondok Bunga Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	550000.00	3	Sewa	Sertifikat Hak Milik (SHM)	3	107.626884	-6.897756	3.00	1.00
1230	Kost Sigmaa Tipe I Coblong Bandung	Coblong	\N	1350000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.616493	-6.887144	3.00	3.50
1231	Kost Bangbayang 22 Tipe A Coblong Bandung	Kecamatan Coblong	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.617373	-6.88122	3.00	4.00
1232	Kost Sidomukti 65 Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63106845319	-6.8930828387663	3.00	4.00
1233	Kost Pondok Bunga Tipe B Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.627618	-6.897162	3.00	4.00
1234	Kost Batik Jogja 7 Sukaluyu Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1150000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6307451	-6.8957217	3.00	3.00
1235	Kost Bekarbon Cibeunying Kidul Bandung	Cibeunying Kidul	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.64250002801	-6.9010785587777	3.00	3.00
1236	Kost Permai 17A Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1350000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.628352	-6.888654	3.00	3.00
1237	Kost Elsan Coblong Bandung	Kecamatan Coblong	\N	2250000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6193198	-6.8859155	3.00	3.00
1238	Kost Favorit Tipe Executive Coblong Bandung	Kecamatan Coblong	\N	2100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.620052	-6.883193	3.00	3.00
1239	Kost Pondok Bunga Tipe C Cibeunying Kaler Bandung	Cibeunying Kaler	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.626884	-6.897756	3.00	3.00
1240	Kost Sigmaa Tipe B1 Coblong Bandung	Coblong	\N	1220000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.61649265885	-6.8871437108948	3.00	3.20
1241	Kost Bengawan 83 Tipe B Bandung Wetan Bandung	Bandung Wetan	\N	1350000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.630005	-6.910741	3.50	3.50
1242	Kost Puri Artha Sony n Sist 2 Cibeunying Kidul Bandung	Cibeunying Kidul	\N	650000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.64143519104	-6.9011910610768	3.00	4.00
1243	Kost Gelatik Coblong Bandung	Coblong	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62222386897	-6.8962822080882	3.00	3.00
1244	Kost Favorit Executive Coblong Bandung	Coblong	\N	2000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62003	-6.883139	3.00	4.00
1245	Kost Ruma Single Deluxe Coblong Bandung	Kecamatan Coblong	\N	2000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.623175	-6.885068	3.00	4.00
1246	Kost 99 Pusat Kota Standard Cimenyan Bandung	Cimenyan	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6344822	-6.8864999	3.00	4.00
1247	Kost Pondok Kinanti Cigadung Cibeunying Kaler Bandung	Cibeunying Kaler	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62907356024	-6.8832599210848	3.00	3.00
1248	Kost Balqis Batununggal Bandung	Kecamatan Batununggal	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.642446	-6.911877	3.00	3.00
1249	Kost Muararajeun Lama 1 Tipe C Cibeunying Kaler Bandung	Cibeunying Kaler	\N	750000.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.630439	-6.902196	3.50	2.00
1250	Kost Lux Dekat ITB Tipe A Coblong Bandung	Coblong	\N	1800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62006770819	-6.8853492761358	3.00	3.00
1251	Kost Paras Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.63011	-6.888417	3.00	4.00
1252	Kost Megumi Sekeloa Tipe VIP Coblong Bandung	Kecamatan Coblong	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61855	-6.886563	3.00	4.00
1253	Kost ALKEN Sadang Serang Coblong Bandung	Coblong	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.624172	-6.890466	3.00	4.00
1254	Kost Kanayakan Baru 6 Coblong Bandung	Kecamatan Coblong	\N	1500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61830449104	-6.8783052802243	3.00	3.00
1255	Kost Wisma Salsabila 79 Coblong Bandung	Coblong	\N	1200000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.619894	-6.887954	4.00	5.00
1256	Kost Lelly Chandra Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1400000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62300908566	-6.8809788288294	3.00	3.00
1257	Kost Pondok Bunga Sukaluyu Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	850000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6306764	-6.8977527	3.00	4.00
1258	Kost G Standar Coblong Bandung	Kecamatan Coblong	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.625911	-6.890559	3.00	4.00
1259	Kost Exclusive Sofia House Bandung	Coblong	\N	2600000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.61625814953	-6.8810988793375	4.50	4.00
1260	Kost Pondok Latief Tipe F Bandung	Coblong	\N	2500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61858	-6.88336	3.00	4.00
1261	Kost Pondok Barokah 1 Tipe A2 Coblong Bandung	Coblong	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61739756912	-6.8883722839966	3.00	3.00
1262	Kost Paviliun Surya Bj Kaler Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6304052	-6.8893463	3.00	4.00
1263	Kost Alpha Tipe C Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1220000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6275914	-6.8879323	3.00	4.00
1264	Kost Elroi Bojong Koneng Atas Cikutra Tipe B Cimenyan Bandung	Cimenyan	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.647313	-6.888007	3.00	4.00
1265	Kost Apik Bintang Kumeli Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1267000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.63218811347	-6.8971730404579	4.00	4.00
1266	Kost Apik Tubagus Ismail 20 Tipe A Coblong Bandung	Coblong	\N	808200.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.61640788513	-6.8891544157007	2.50	2.50
1267	Kost Roniuly Tipe A Coblong Bandung	Kecamatan Coblong	\N	950000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.617983	-6.889871	3.00	3.20
1268	Kost F3 Family Tipe A Cimenyan Bandung	Cimenyan	\N	1025000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633982	-6.878424	3.00	4.00
1269	Kost Apik Never T2 Widyatama Tipe B Cibeunying Kidul Bandung	Cibeunying Kidul	\N	764200.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.64594686396	-6.8955397736688	3.00	4.00
1270	Kost Singgahsini Sadang Green Tipe D Coblong Bandung	Coblong	\N	1150000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.62476958867	-6.8912455898163	2.50	3.00
1271	Kost Kappaa Tipe B Coblong Bandung	Kecamatan Coblong	\N	1300000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.618211	-6.886206	3.00	3.50
1272	Kost Ibu Nenden 1 Tipe A Coblong Bandung	Coblong	\N	1400000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.618652	-6.880713	4.00	4.00
1273	Kost Putra Ciheulang II Coblong Sekeloa Bandung	Coblong	\N	1150000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6189334	-6.8865039	3.00	3.00
1274	Kost Bu Sur Tipe A Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	550000.00	4	Sewa	Sertifikat Hak Milik (SHM)	4	107.643211	-6.903799	2.00	2.00
1275	Kost Kumeli 30 Standart Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.633124	-6.897115	3.00	4.00
1276	Kost Pak Resmana Cibeunying Kidul Bandung	Kecamatan Cibeunying Kidul	\N	800000.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.644235	-6.897503	3.50	2.00
1277	Kost Elroi Bojong Koneng Atas Cikutra Tipe D Cimenyan Bandung	Cimenyan	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.647313	-6.888007	3.00	4.00
1278	Kost Oma Bangbayang 6 Coblong Bandung	Coblong	\N	825000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.616536	-6.881106	3.00	4.00
1279	Kost Sigmaa Tipe J Coblong Bandung	Coblong	\N	1500000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.61649265885	-6.8871437108948	4.00	4.00
1280	Kost Rumah Surya Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6315921545	-6.8889354760209	3.00	4.00
1281	Kost Singgahsini Sadang Green Tipe C Coblong Bandung	Coblong	\N	1313000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.62476958867	-6.8912455898163	3.00	3.50
1282	Kost Apik Teduh Sukaluyu Tipe C Cibeunying Kaler Bandung	Cibeunying Kaler	\N	835000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.6281153	-6.8965983	3.00	3.50
1283	Kost Alpha Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	870000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6275914	-6.8879323	3.00	4.00
1284	Kost Lux Rumah Bunga Dago 1 Standard Coblong Bandung	Coblong	\N	2200000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.621186	-6.881059	5.00	4.00
1285	Kost Putri Green House H.Hasan Coblong Bandung	Coblong	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61721551418	-6.8984660348527	3.00	4.00
1286	Kost Apik Teduh Sukaluyu Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	745000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.6281153	-6.8965983	2.50	3.00
1287	Kost Apik Bintang Kumeli Tipe B Cibeunying Kaler Bandung	Cibeunying Kaler	\N	945000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.63218811347	-6.8971730404579	4.00	4.00
1288	Kost Apik Bintang Kumeli Tipe C Cibeunying Kaler Bandung	Cibeunying Kaler	\N	899000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.63218811347	-6.8971730404579	3.00	3.00
1289	Kost Valley Tipe A Coblong Bandung	Coblong	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62505862862	-6.8864643495446	3.00	4.00
1290	Kost Omahku Kirana Tipe A Coblong Bandung	Coblong	\N	2000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.619869	-6.887059	3.00	3.00
1291	Kost Apik Haur Mekar Unpad Tipe A Coblong Bandung	Coblong	\N	729000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.6203	-6.89332	3.00	3.30
1292	Kost Singgahsini Sadang Green Tipe B Coblong Bandung	Coblong	\N	1348000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.62476958867	-6.8912455898163	3.00	3.50
1293	Kost Ciung Eksklusif Coblong Bandung	Kecamatan Coblong	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62078285217	-6.8975097589551	3.00	4.00
1294	Kost Apik Teduh Sukaluyu Tipe B Cibeunying Kaler Bandung	Cibeunying Kaler	\N	790000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6281153	-6.8965983	3.00	3.00
1295	Kost Hegar CH4 Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.627752	-6.887501	3.00	3.00
1296	Kost Singgahsini Rumah Kita Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	896200.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.630718	-6.8912	3.00	3.00
1297	Kost Rumah Alhamra Tipe Zainab Coblong Bandung	Coblong	\N	1800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.618749	-6.886061	3.00	3.00
1298	Kost Singgahsini Ernawati BSC Tipe A Coblong Bandung	Coblong	\N	1897000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62042393791	-6.886237150133	4.00	3.00
1299	Kost Singgahsini Ernawati BSC Tipe B Coblong Bandung	Coblong	\N	1564000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62042393791	-6.886237150133	4.00	3.00
1300	Kost Apik TBI 1517 Tipe A Coblong Bandung	Coblong	\N	1330000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61904839179	-6.8821926885901	3.00	3.00
1301	Kos Pondok Teratai Unpar Tipe C Cidadap Bandung	Cidadap	\N	1150000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60610211641	-6.8762515106792	3.00	4.00
1302	Kost Betah Nidera Sukasari Bandung	Sukasari	\N	1200000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.594918	-6.875176	2.50	3.00
1303	Kost Apik Lusya Cihampelas Walk Tipe C Sukajadi Bandung	Kecamatan Sukajadi	\N	970000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.602113	-6.8929206	3.00	4.00
1304	Kost Surya Dago Coblong Bandung	Kecamatan Coblong	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6183507	-6.8731598	3.00	3.00
1305	Kost Paviliun CemaraTipe Balkon 1 Coblong Bandung	Coblong	\N	1400000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6280512	-6.890744	3.00	4.00
1306	Kost Master Tipe B Cibeunying Kaler Bandung	Cibeunying Kaler	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62789271772	-6.8886648643339	3.00	3.00
1307	Kost Gelatik Coblong Bandung	Coblong	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62222386897	-6.8962822080882	3.00	3.00
1308	Kost Rumah 22 Coblong Bandung	Kecamatan Coblong	\N	900000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.620197	-6.88575	3.00	3.00
1309	Kost Temurasa Living Tubis Coblong Bandung	Coblong	\N	2600000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.62447960675	-6.8878217398465	4.00	4.00
1310	Kost Alis Ciumbuleuit Cidadap Bandung	Cidadap	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6082266	-6.8737973	3.00	4.00
1311	Kost Nunia House Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1250000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.62744545937	-6.8791148025062	3.00	3.50
1312	Kost Exclusive Sofia House Bandung	Coblong	\N	2600000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.61625814953	-6.8810988793375	4.50	4.00
1313	Kost Bumina Epic Tipe C Coblong Bandung	Kecamatan Coblong	\N	1800000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.617521	-6.88631	2.40	4.40
1314	Kost Dago 227 Tipe A Coblong Bandung	Kecamatan Coblong	\N	2200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61540435255	-6.8810567183415	3.00	3.00
1315	Kost Exclusive Tubagus Ismail 8 Coblong Bandung	Kecamatan Coblong	\N	1600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.620921	-6.884225	3.00	4.00
1316	Kost San Alexander Tipe Golden Coblong Bandung	Coblong	\N	1507000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.614004	-6.872597	2.00	4.00
1317	Kost Adelia ITB Coblong Bandung	Coblong	\N	2500000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.613691	-6.877947	4.00	5.00
1318	Kost Pondokan Lingga 2 Cidadap Bandung	Cidadap	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6063603	-6.8830369	3.00	4.00
1319	Kost Favorit Executive Coblong Bandung	Coblong	\N	2000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62003	-6.883139	3.00	4.00
1320	Kost Miracolo Tipe A Sukajadi Bandung	Sukajadi	\N	650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.59833376855	-6.8841786126657	3.00	3.00
1321	Kost G VIP Coblong Bandung	Kecamatan Coblong	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.625911	-6.890559	3.00	4.00
1322	Kost Sangkuriang Residental Coblong Bandung	Kecamatan Coblong	\N	1200000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.6096581	-6.8796317	4.00	2.50
1323	Kost Sigmaa Tipe I Coblong Bandung	Coblong	\N	1350000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.616493	-6.887144	3.00	3.50
1324	Kost Pondok Putri Ganesha Coblong Bandung	Coblong	\N	2000000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.6138338	-6.8802224	4.00	4.00
1325	Kost Gold Tipe Diamond Coblong Bandung	Coblong	\N	2200000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.61549387127	-6.8712521924109	6.00	3.00
1326	Kost G Standar Coblong Bandung	Kecamatan Coblong	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.625911	-6.890559	3.00	4.00
1327	Kost Lanang Tipe A Coblong Bandung	Coblong	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.614058	-6.881438	3.00	3.00
1328	Kost Deeva 1 Coblong Bandung	Coblong	\N	1600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61264503002	-6.8811332763965	3.00	4.00
1329	Kost Intan II Tipe A Coblong Bandung	Coblong	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6249563694	-6.8907834867593	3.00	3.00
1330	Kost Gold Tipe Crystal Coblong Bandung	Coblong	\N	1400000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.61549387127	-6.8712521924109	2.90	2.20
1331	Kost H 16 Sweet House Coblong Bandung	Kecamatan Coblong	\N	2400000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.61654	-6.898539	3.00	5.00
1332	Kost Pondok Dac 16 Tipe A Coblong Bandung	Kecamatan Coblong	\N	2150000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.616017	-6.877316	3.00	4.00
1333	0	Kecamatan Coblong	\N	1250000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6066096	-6.894303	3.00	3.00
1334	Kost Jalak Tipe A Coblong Bandung	Kecamatan Coblong	\N	1500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.620976	-6.897891	3.00	4.00
1335	Kost Pondok Latief Tipe L Coblong Bandung	Coblong	\N	1800000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.61858	-6.88336	3.00	5.00
1336	Kost Ibu Tini 1 Tipe A Bandung Wetan Bandung	Kecamatan Bandung Wetan	\N	600000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6079031	-6.8979688	3.00	4.00
1337	Kost Rasionas Coblong Bandung	Kecamatan Coblong	\N	1400000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6037993	-6.898901	3.00	3.00
1338	Kost Griya 99 Tipe C Coblong Bandung	Coblong	\N	1200000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.617455	-6.873891	3.00	2.70
1339	Kost Rumah Alhamra Fatimah Middle Coblong Bandung	Coblong	\N	2200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.618794	-6.886142	3.00	2.90
1340	Kost Cantika Coblong Bandung	Kecamatan Coblong	\N	1650000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6065921	-6.8946222	3.00	3.00
1341	Kost Ruma Tipe Single C Coblong Bandung	Kecamatan Coblong	\N	1500000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.62344	-6.885696	2.00	3.00
1342	Kost Rumah Ceria Bandung Wetan Bandung	Bandung Wetan	\N	500000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.605762	-6.900828	2.50	2.50
1343	Kost Obi Coblong Bandung	Coblong	\N	1750000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.612645	-6.876543	3.50	3.00
1344	Kost Dara Tipe A Coblong Bandung	Coblong	\N	1350000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.616003	-6.886805	3.00	3.00
1345	Kost Bu Yani Tipe A Coblong Bandung	Coblong	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.608478	-6.87931	3.00	3.00
1346	Kost Imam Bonjol Dago Tipe Standard Coblong Bandung	Kecamatan Coblong	\N	2200000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.61544	-6.892902	4.00	4.00
1347	Kost Bu Gita Coblong Bandung	Coblong	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6200086996	-6.8921455246451	3.00	3.00
1348	Kost Pak Teguh 178 Coblong Bandung	Kecamatan Coblong	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.607001	-6.89303	3.00	3.00
1349	Kost Sigmaa Tipe B1 Coblong Bandung	Coblong	\N	1220000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.61649265885	-6.8871437108948	3.00	3.20
1350	Kost Home 39 Tipe A Cidadap Bandung	Cidadap	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.604851	-6.878346	3.00	3.00
1351	Kost Jurang 65 Standard Sukajadi Bandung	Kecamatan Sukajadi	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.600446	-6.887043	3.00	4.00
1352	Kost Wina Cidadap Bandung	Cidadap	\N	1400000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.607047	-6.87318	3.00	3.00
1353	Kost Bumi Nenda 1 Tipe Superior Coblong Bandung	Kecamatan Coblong	\N	2450000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.62163646519	-6.8807874336066	4.00	4.00
1354	Kost Omahku Kirana Tipe B Coblong Bandung	Coblong	\N	2000000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.620062	-6.885993	3.00	2.80
1355	Kost Aulia Coblong Bandung	Kecamatan Coblong	\N	1000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.614778	-6.874398	3.00	3.00
1356	Kost Wisma Salsabila 79 Coblong Bandung	Coblong	\N	1200000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.619894	-6.887954	4.00	5.00
1357	Kost Ciumbuleuit 66 Tipe B Mainroad VIP Cidadap Bandung	Cidadap	\N	1700000.00	15	Sewa	Sertifikat Hak Milik (SHM)	15	107.604146	-6.881052	3.00	5.00
1358	Kost Ts 44 Lynna Tipe Kamar Coblong Bandung	Coblong	\N	2400000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.608674	-6.881605	4.40	4.50
1359	Kost Sukatenang Paskal Tipe Standart Cicendo Bandung	Cicendo	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.59617	-6.904229	3.00	3.00
1360	Kost Taneva Dago Coblong Bandung	Coblong	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61443205178	-6.8733858715309	3.00	4.00
1361	Kost Gagak Tipe C Cibeunying Kaler Bandung	Cibeunying Kaler	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6248681	-6.8987146	3.00	3.00
1362	Kost Murah Tipe A Coblong Bandung	Coblong	\N	800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.622487	-6.890915	3.00	3.00
1363	Kost Elsan Coblong Bandung	Kecamatan Coblong	\N	2250000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6193198	-6.8859155	3.00	3.00
1364	Kost Selina Coblong Bandung	Coblong	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.616326	-6.871462	3.00	3.00
1365	Kost ALKEN Sadang Serang Coblong Bandung	Coblong	\N	800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.624172	-6.890466	3.00	4.00
1366	Kost Lux Dekat ITB Tipe A Coblong Bandung	Coblong	\N	1800000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62006770819	-6.8853492761358	3.00	3.00
1367	Kost Pondok 9 Tipe A Coblong Bandung	Coblong	\N	1000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.616877	-6.871619	3.00	4.00
1368	Kost Pondok Bunga Tipe B Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.627618	-6.897162	3.00	4.00
1369	Kost Rengganis 1B PAV Coblong Bandung	Coblong	\N	2019000.00	13	Sewa	Sertifikat Hak Milik (SHM)	13	107.61963	-6.871834	4.30	3.00
1370	Kost Maryam Residence Coblong Bandung	Kecamatan Coblong	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6170236	-6.8715464	3.00	3.00
1371	Kost Pondok Bunga Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	550000.00	3	Sewa	Sertifikat Hak Milik (SHM)	3	107.626884	-6.897756	3.00	1.00
1372	Kost Ambar Coblong Bandung	Kecamatan Coblong	\N	1500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6252403	-6.8896011	3.00	3.00
1373	Kost Rezadiansah Executive Coblong Bandung	Coblong	\N	2900000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.6216176	-6.8835598	4.00	4.00
1374	Kost Ciumbuleuit 66 Tipe Executive Cidadap Bandung	Cidadap	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60418	-6.880974	3.00	3.00
1375	Kost San Alexander Tipe Silver Coblong Bandung	Coblong	\N	1600000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.614004	-6.872597	2.00	4.00
1376	Kost Pondok Bunga Tipe E Cibeunying Kaler Bandung	Cibeunying Kaler	\N	600000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.626884	-6.897756	3.00	2.00
1377	Kost Nick Tipe A Cicendo Bandung	Cicendo	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5943782	-6.9031738	3.00	3.00
1378	Kost CSI 1 Coblong Bandung	Coblong	\N	1900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.612149	-6.87705	3.00	4.00
1379	Kost Pondok Latief Tipe F Bandung	Coblong	\N	2500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61858	-6.88336	3.00	4.00
1380	Kost Purabaya Type B Cicendo Bandung	Kecamatan Cicendo	\N	2500000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.5953284	-6.9072412	3.00	4.00
1381	Kost Ruma Single Deluxe Coblong Bandung	Kecamatan Coblong	\N	2000000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.623175	-6.885068	3.00	4.00
1382	Kost Gold Tipe Gold Coblong Bandung	Coblong	\N	1300000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.61549387127	-6.8712521924109	2.80	2.00
1383	Kost Ganeca Coblong Bandung	Coblong	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62010928243	-6.885317987471	3.00	3.00
1384	Kost Pondok Rempah Coblong Bandung	Kecamatan Coblong	\N	1400000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.612598	-6.87946	3.00	3.00
1385	Kost Sejahtera Tipe A1 Sukajadi Bandung	Sukajadi	\N	1350000.00	25	Sewa	Sertifikat Hak Milik (SHM)	25	107.60072160512	-6.8930605376351	5.00	5.00
1386	Kost 42 Dago Coblong Bandung	Kecamatan Coblong	\N	950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.618009	-6.880834	4.00	3.00
1387	Kost Bangbayang 22 Tipe A Coblong Bandung	Kecamatan Coblong	\N	750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.617373	-6.88122	3.00	4.00
1388	Kost Ibu Ida Tipe A Sukajadi Bandung	Sukajadi	\N	900000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.593545	-6.880811	2.10	3.00
1389	Kost Cisitu Baru 78 Coblong Bandung	Coblong	\N	1800000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.611712	-6.883391	2.50	4.00
1390	Kost Omahku Kirana Tipe C Coblong Bandung	Coblong	\N	2250000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.619869	-6.887059	3.00	3.00
1391	Kost Permai 17A Tipe A Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1350000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.628352	-6.888654	3.00	3.00
1392	Kost Busas Cidadap Bandung	Cidadap	\N	1200000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.603763	-6.87595	3.00	3.00
1393	Kost Tulus Tipe A Sukajadi Bandung	Sukajadi	\N	900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.59175598621	-6.8825912056962	3.00	4.00
1394	Kost Clover Coblong Bandung	Coblong	\N	1100000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61926473069	-6.892614384701	3.00	4.00
1395	Kost Gedung Putih 1 Coblong Bandung	Coblong	\N	1800000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.6184174791	-6.8839818929877	4.00	5.00
1396	Kost Tjihampelas 1 Bandung Wetan Bandung	Bandung Wetan	\N	1100000.00	4	Sewa	Sertifikat Hak Milik (SHM)	4	107.604973	-6.8991589	2.00	2.00
1397	Kost Kubangsari II Tipe B Coblong Bandung	Coblong	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61684000492	-6.8887810309933	3.00	3.00
1398	Kost Muararajeun Kaler Exclusive Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1900000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.628964	-6.901616	3.00	4.00
1399	Kost Ibu Ida Tipe D Bandung Sukajadi Bandung	Sukajadi	\N	850000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.593545	-6.880811	3.00	2.50
1400	Kost Patio Verde 2 Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1800000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.622427	-6.875991	3.00	4.00
1401	Kost Bangbayang Residence Tipe A Coblong Bandung	Kecamatan Coblong	\N	1600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61795043945	-6.88040897013	3.00	3.00
1402	Kost Ciung Eksklusif Coblong Bandung	Kecamatan Coblong	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62078285217	-6.8975097589551	3.00	4.00
1403	Kost Feby Tipe A Sukajadi Bandung	Kecamatan Sukajadi	\N	550000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.59402	-6.888353	3.00	3.00
1404	Kost Rumah Alhamra Aisyah Middle Coblong Bandung	Coblong	\N	2300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.618794	-6.886142	3.00	3.00
1405	Kost King Unpar Cidadap Bandung	Cidadap	\N	1600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60687224567	-6.8776495395354	3.00	3.00
1406	Kost Ummu Asfar Tipe A Coblong Bandung	Coblong	\N	1450000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.611883	-6.876629	3.00	3.00
1407	Kost Anggrek Bulan Coblong Bandung	Coblong	\N	1300000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6238426	-6.8970114	3.00	3.00
1408	Kost Zeta Tipe T Standard Coblong Bandung	Kecamatan Coblong	\N	1400000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.618087	-6.887143	4.00	3.50
1409	Kost Ayahome Tipe A Coblong Bandung	Coblong	\N	1500000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.614036	-6.875781	3.00	3.00
1410	Kost Titimplik Dalam Tipe Exclusive Coblong Bandung	Coblong	\N	1200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.620799	-6.895836	3.00	4.00
1411	Kost Di Raben Cidadap Bandung	Cidadap	\N	950000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60851878673	-6.8741364849191	3.00	3.00
1412	Kost Pa Rudi Cicendo Bandung	Cicendo	\N	1350000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.595141	-6.905774	3.00	4.00
1413	Kost Ibu Ida Tipe C Bandung Sukajadi Bandung	Sukajadi	\N	850000.00	7	Sewa	Sertifikat Hak Milik (SHM)	7	107.593545	-6.880811	2.20	3.00
1414	Kost Zara Residence Coblong Bandung	Kecamatan Coblong	\N	1000000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.619891	-6.873568	4.00	4.00
1415	Kost Gagak Type A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	750000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6248681	-6.8987146	3.00	3.00
1416	Kost Baais Tipe A Sumur Bandung Bandung	Sumur Bandung	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60714080185	-6.9080423341109	3.00	3.00
1417	Kost Rumah Singgah Bukit Pandawa Tipe C Coblong Bandung	Coblong	\N	1400000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.617262	-6.877393	3.00	3.00
1418	Kost Pondok Teratai Unpar Tipe E Cidadap Bandung	Cidadap	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60610211641	-6.8762515106792	3.00	4.00
1419	Kost 47 Non AC Coblong Bandung	Coblong	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.613289	-6.87976	3.00	4.00
1420	Kost Helena Asut Tipe A Bandung Wetan Bandung	Kecamatan Bandung Wetan	\N	700000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.608978	-6.896868	3.00	3.00
1421	Kost Safala Tipe B Coblong Bandung	Coblong	\N	850000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.603484	-6.890345	3.00	3.00
1422	Kost C177 Executive Coblong Bandung	Kecamatan Coblong	\N	2500000.00	10	Sewa	Sertifikat Hak Milik (SHM)	10	107.603845	-6.888485	2.60	4.00
1423	Kost Singgahsini Sadang Green Tipe D Coblong Bandung	Coblong	\N	1150000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.62476958867	-6.8912455898163	2.50	3.00
1424	Kost Rumah Singgah Bukit Pandawa Tipe B Coblong Bandung	Coblong	\N	1150000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.617262	-6.8773927	3.00	4.00
1425	Kost Apik Muh Unpar Tipe A Cidadap Bandung	Cidadap	\N	935800.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60398238206	-6.8756618943683	4.00	3.00
1426	Kost Lelly Chandra Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1400000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62300908566	-6.8809788288294	3.00	3.00
1427	Kost 47 AC Coblong Bandung	Coblong	\N	2200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.613289	-6.87976	3.00	4.00
1428	Kost Mamah Ety Tipe A Sukajadi Bandung	Sukajadi	\N	600000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.597507	-6.888765	3.00	3.00
1429	Kost Graha Setiabudi Superior Non View Cidadap Bandung	Kecamatan Cidadap	\N	2500000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.59836494923	-6.8793438118487	3.00	4.50
1430	Kost Apik Lusya Cihampelas Walk Tipe B Sukajadi Bandung	Kecamatan Sukajadi	\N	988000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.602113	-6.8929206	3.00	3.00
1431	Kost Skynest 52 Executive Cidadap Bandung	Kecamatan Cidadap	\N	2200000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.606609	-6.875713	3.00	4.00
1432	Kost Bumi Nenda 1 Standard Coblong Bandung	Kecamatan Coblong	\N	2050000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62163646519	-6.8807874336066	3.00	3.00
1433	Kos Pondok Teratai Unpar Tipe C Cidadap Bandung	Cidadap	\N	1150000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60610211641	-6.8762515106792	3.00	4.00
1434	Kost Putra Ciheulang II Coblong Sekeloa Bandung	Coblong	\N	1150000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6189334	-6.8865039	3.00	3.00
1435	Kost Apik Djuanda 197B Dago Tipe A Coblong Bandung	Coblong	\N	1697000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6148970567	-6.8824590933815	4.00	3.00
1436	Kost Alpha Tipe C Cibeunying Kaler Bandung	Kecamatan Cibeunying Kaler	\N	1220000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6275914	-6.8879323	3.00	4.00
1437	Kost Apik Cisitu Indah V Tipe C Coblong Bandung	Coblong	\N	817000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61389269949	-6.8744528853664	3.00	3.00
1438	Kost Pondok Teratai Unpar Tipe G Cidadap Bandung	Cidadap	\N	1700000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.60610211641	-6.8762515106792	3.00	4.00
1439	Kost Apik Teduh Sukaluyu Tipe B Cibeunying Kaler Bandung	Cibeunying Kaler	\N	790000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.6281153	-6.8965983	3.00	3.00
1440	Kost Omahku Kirana Tipe A Coblong Bandung	Coblong	\N	2000000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.619869	-6.887059	3.00	3.00
1441	Kost Lux Rumah Bunga Dago 1 Standard Coblong Bandung	Coblong	\N	2200000.00	20	Sewa	Sertifikat Hak Milik (SHM)	20	107.621186	-6.881059	5.00	4.00
1442	Kost Apik Pondok Paskal Tipe A Cicendo Bandung	Cicendo	\N	746600.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.59715938064	-6.9020892242147	3.00	2.50
1443	Kost Singgahsini Imperial Dago Tipe A Coblong Bandung	Coblong	\N	3015000.00	23	Sewa	Sertifikat Hak Milik (SHM)	23	107.61432418157	-6.8755376625223	4.50	5.00
1444	Kost Na Jeges Cigadung Selatan 27 Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1100000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.62913497215	-6.8886745206269	3.00	3.00
1445	Kost Renato Aldi Tipe B Coblong Bandung	Kecamatan Coblong	\N	1350000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62090623379	-6.8828588251086	3.00	4.00
1446	Kost Padma Coblong Bandung	Coblong	\N	1950000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.61319488287	-6.8757089412293	3.00	4.00
1447	Kost Singgahsini Bukit Indah UNPAR Tipe B Ciumbuleuit Bandung	Cidadap	\N	1313000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.6034816	-6.8724722	3.50	3.50
1448	Kost Apik Teduh Sukaluyu Tipe C Cibeunying Kaler Bandung	Cibeunying Kaler	\N	835000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.6281153	-6.8965983	3.00	3.50
1449	Kost Apik PUMA Ciwalk Tipe A Coblong Bandung	Coblong	\N	2545000.00	18	Sewa	Sertifikat Hak Milik (SHM)	18	107.60388009186	-6.8939799038585	4.00	4.50
1450	Kost Apik Banuarto Cisitu Lama Tipe A Coblong Bandung	Coblong	\N	720200.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.61311658729	-6.8823223262891	2.50	2.50
1451	Kost Singgahsini Sadang Green Tipe C Coblong Bandung	Coblong	\N	1313000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.62476958867	-6.8912455898163	3.00	3.50
1452	Kost Apik Ciumbuleuit 1 Tipe A Cidadap Bandung	Cidadap	\N	718000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.604271	-6.878851	3.00	3.00
1453	Kost Singgahsini Imperial Dago Tipe C Coblong Bandung	Coblong	\N	2185000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61432418157	-6.8755376625223	3.00	3.00
1454	Kost Apik PUMA Ciwalk Tipe D Coblong Bandung	Coblong	\N	1129000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60388009186	-6.8939799038585	3.00	3.00
1455	Kost Andhara Tipe A Cidadap Bandung	Cidadap	\N	1000000.00	6	Sewa	Sertifikat Hak Milik (SHM)	6	107.603662	-6.882169	2.50	2.50
1456	Kost Apik Muh Unpar Tipe B Cidadap Bandung	Cidadap	\N	781800.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.60398238206	-6.8756618943683	3.00	3.00
1457	Kost Singgahsini Imperial Dago Tipe D Coblong Bandung	Coblong	\N	1830000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.61432418157	-6.8755376625223	2.50	3.00
1458	Kost Apik PUMA Ciwalk Tipe B Coblong Bandung	Coblong	\N	2275000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.60388009186	-6.8939799038585	3.00	3.50
1459	Kost Singgahsini Sadang Green Tipe B Coblong Bandung	Coblong	\N	1348000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.62476958867	-6.8912455898163	3.00	3.50
1460	Kost Valley Tipe A Coblong Bandung	Coblong	\N	1750000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62505862862	-6.8864643495446	3.00	4.00
1461	Kost Renato Aldi Tipe A Coblong Bandung	Kecamatan Coblong	\N	1300000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62092232704	-6.8828961054128	3.00	4.00
1462	Kost Apik Setiabudi Damar Home Tipe A Bandung	Kecamatan Sukajadi	\N	835000.00	8	Sewa	Sertifikat Hak Milik (SHM)	8	107.5982929	-6.8818395	2.50	3.00
1463	Kost Apik Setiabudi Damar Home Tipe D Bandung	Kecamatan Sukajadi	\N	1245000.00	14	Sewa	Sertifikat Hak Milik (SHM)	14	107.5982929	-6.8818395	3.50	4.00
1464	Kost Apik Setiabudi Damar Home Tipe B Bandung	Kecamatan Sukajadi	\N	975000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.5982929	-6.8818395	3.00	3.00
1465	Kost Apik Setiabudi Damar Home Tipe C Bandung	Kecamatan Sukajadi	\N	1020000.00	11	Sewa	Sertifikat Hak Milik (SHM)	11	107.5982929	-6.8818395	3.00	3.50
1466	Kost Singgahsini Griya Nararya I Dago Barat Tipe A Coblong Bandung	Coblong	\N	2093000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.617516	-6.875484	3.00	4.00
1467	Kost Singgahsini Ernawati BSC Tipe B Coblong Bandung	Coblong	\N	1564000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62042393791	-6.886237150133	4.00	3.00
1468	Kost Singgahsini Ernawati BSC Tipe A Coblong Bandung	Coblong	\N	1897000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62042393791	-6.886237150133	4.00	3.00
1469	Kost Singgahsini Dago Asri D14 Tipe A Coblong Bandung	Kecamatan Coblong	\N	2305000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.6147656	-6.8775875	4.00	4.00
1470	Kost Apik TBI 1517 Tipe A Coblong Bandung	Coblong	\N	1330000.00	9	Sewa	Sertifikat Hak Milik (SHM)	9	107.61904839179	-6.8821926885901	3.00	3.00
1471	Kost Singgahsini Dago Asri D14 Tipe C Coblong Bandung	Kecamatan Coblong	\N	1697000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.6147656	-6.8775875	4.00	4.00
1472	Kost Apik Dago Pakar 4 Tipe A Cibeunying Kaler Bandung	Cibeunying Kaler	\N	1257000.00	12	Sewa	Sertifikat Hak Milik (SHM)	12	107.62337941381	-6.8763607455982	3.00	4.00
1473	Kost Singgahsini Dago Asri D14 Tipe B Coblong Bandung	Kecamatan Coblong	\N	2049000.00	16	Sewa	Sertifikat Hak Milik (SHM)	16	107.6147656	-6.8775875	4.00	4.00
\.


--
-- TOC entry 4903 (class 0 OID 16502)
-- Dependencies: 223
-- Data for Name: kost_fasilitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kost_fasilitas (id_kost, id_fasilitas) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
2	14
2	2
2	3
2	4
2	15
2	16
2	17
2	18
2	19
2	6
2	7
2	9
2	20
2	21
2	10
2	11
2	22
2	23
2	24
2	25
2	26
2	27
2	12
3	14
3	2
3	3
3	4
3	5
3	15
3	18
3	19
3	28
3	29
3	7
3	30
3	31
3	9
3	32
3	21
3	10
3	33
3	11
3	22
3	26
3	23
3	27
3	12
3	13
4	1
4	2
4	22
4	3
4	34
4	4
4	35
4	15
4	16
4	18
4	19
4	28
4	29
4	31
4	36
4	9
4	20
4	37
4	21
4	10
4	11
4	26
4	23
4	24
4	27
4	12
4	13
5	1
5	2
5	4
5	35
5	15
5	18
5	19
5	28
5	6
5	30
5	9
5	38
5	24
5	12
5	13
6	1
6	2
6	3
6	4
6	15
6	16
6	19
6	5
6	29
6	6
6	7
6	30
6	31
6	8
6	9
6	10
6	33
6	11
6	22
6	26
6	24
6	38
6	34
6	39
6	12
6	13
7	1
7	2
7	3
7	4
7	15
7	16
7	40
7	18
7	19
7	5
7	28
7	29
7	30
7	41
7	31
7	9
7	20
7	42
7	43
7	21
7	32
7	10
7	44
7	11
7	22
7	12
8	1
8	2
8	34
8	4
8	20
8	41
8	6
8	7
8	30
8	31
8	9
8	37
8	32
8	43
8	10
8	11
8	26
8	12
9	1
9	45
9	2
9	3
9	34
9	4
9	35
9	15
9	18
9	19
9	5
9	28
9	29
9	30
9	41
9	9
9	21
9	26
9	23
9	24
9	38
9	39
9	27
9	12
10	1
10	2
10	3
10	22
10	4
10	20
10	35
10	5
10	17
10	46
10	15
10	6
10	31
10	9
10	37
10	32
10	21
10	44
10	10
10	33
10	11
10	27
10	12
10	13
11	14
11	2
11	19
11	28
11	29
11	6
11	7
11	32
11	10
11	11
11	27
11	12
11	13
12	1
12	2
12	3
12	4
12	15
12	6
12	7
12	44
12	10
12	11
12	12
13	1
13	2
13	3
13	4
13	35
13	5
13	15
13	16
13	18
13	19
13	29
13	7
13	8
13	9
13	32
13	44
13	10
13	47
13	33
13	39
13	26
13	23
13	27
13	12
13	13
14	14
14	4
14	17
14	30
14	9
14	10
14	11
14	7
14	23
14	38
14	12
14	13
15	14
15	2
15	3
15	4
15	35
15	16
15	19
15	6
15	7
15	30
15	9
15	37
15	10
15	11
15	23
15	24
15	12
15	13
15	48
16	14
16	2
16	4
16	28
16	29
17	1
17	40
17	19
17	41
17	28
17	6
17	30
17	9
17	21
17	10
17	11
17	38
17	24
17	26
17	12
17	13
18	1
18	2
18	3
18	4
18	35
18	15
18	19
18	5
18	49
18	17
18	29
18	7
18	31
18	36
18	9
18	20
18	37
18	21
18	32
18	43
18	44
18	10
18	33
18	11
18	27
18	12
18	13
19	14
19	45
19	2
19	3
19	34
19	20
19	4
19	35
19	15
19	16
19	17
19	28
19	29
19	41
19	31
19	36
19	8
19	9
19	37
19	43
19	21
19	32
19	10
19	44
19	33
19	11
19	27
19	12
20	1
20	2
20	3
20	4
20	35
20	15
20	19
20	6
20	7
20	30
20	9
20	37
20	21
20	10
20	25
20	24
20	38
20	26
20	12
20	13
21	14
21	2
21	3
21	4
21	5
21	50
21	15
21	16
21	19
21	28
21	29
21	6
21	30
21	9
21	20
21	32
21	21
21	10
21	33
21	11
21	22
21	34
21	51
21	12
21	13
22	1
22	2
22	3
22	22
22	34
22	4
22	15
22	18
22	19
22	5
22	28
22	6
22	30
22	31
22	9
22	32
22	10
22	44
22	33
22	11
22	26
22	52
22	12
22	13
22	48
23	14
23	2
23	3
23	4
23	35
23	15
23	16
23	18
23	19
23	5
23	28
23	29
23	30
23	31
23	36
23	9
23	20
23	42
23	21
23	32
23	44
23	33
23	11
23	22
23	26
23	12
23	48
24	14
24	2
24	3
24	4
24	35
24	5
24	17
24	15
24	18
24	19
24	29
24	7
24	31
24	36
24	9
24	37
24	20
24	32
24	21
24	10
24	33
24	11
24	22
24	53
24	27
24	12
24	13
25	14
25	2
25	4
25	35
25	19
25	28
25	6
25	7
25	30
25	10
25	11
25	24
25	12
25	13
26	1
26	4
26	35
26	19
26	41
26	40
26	28
26	29
26	6
26	30
26	9
26	21
26	10
26	11
26	38
26	24
26	26
26	12
26	13
27	14
27	45
27	2
27	4
27	15
27	16
27	19
27	5
27	28
27	29
27	41
27	31
27	20
27	37
27	32
27	47
27	10
27	44
27	33
27	11
27	22
27	26
27	27
27	12
27	13
28	14
28	2
28	3
28	22
28	4
28	35
28	5
28	41
28	49
28	50
28	46
28	28
28	29
28	30
28	31
28	36
28	32
28	44
28	10
28	33
28	11
28	54
28	55
28	23
28	56
28	27
28	12
28	13
29	1
29	45
29	2
29	3
29	4
29	15
29	16
29	17
29	18
29	19
29	5
29	28
29	29
29	41
29	31
29	36
29	9
29	20
29	21
29	33
29	11
29	23
29	24
29	38
29	27
29	12
30	14
30	2
30	3
30	35
30	15
30	19
30	5
30	41
30	28
30	29
30	31
30	36
30	9
30	21
30	10
30	33
30	11
30	23
30	24
30	55
30	38
30	27
30	12
30	13
31	14
31	2
31	3
31	4
31	35
31	5
31	17
31	15
31	16
31	18
31	19
31	28
31	29
31	31
31	36
31	9
31	37
31	20
31	32
31	21
31	44
31	10
31	33
31	11
31	53
31	27
31	12
31	13
32	14
32	45
32	2
32	3
32	34
32	20
32	4
32	35
32	15
32	16
32	17
32	28
32	29
32	41
32	31
32	36
32	8
32	9
32	37
32	43
32	21
32	32
32	10
32	44
32	33
32	11
32	27
32	12
33	14
33	45
33	2
33	3
33	34
33	4
33	35
33	15
33	16
33	18
33	17
33	28
33	29
33	31
33	36
33	9
33	21
33	32
33	33
33	26
33	23
33	24
33	38
33	52
33	27
33	12
33	48
34	1
34	2
34	3
34	4
34	15
34	18
34	19
34	5
34	29
34	7
34	31
34	9
34	20
34	42
34	43
34	21
34	32
34	10
34	44
34	11
34	22
34	12
35	1
35	2
35	3
35	4
35	35
35	15
35	16
35	18
35	19
35	29
35	6
35	7
35	30
35	31
35	8
35	9
35	20
35	37
35	43
35	32
35	47
35	10
35	33
35	11
35	26
35	12
36	1
36	2
36	3
36	4
36	35
36	15
36	19
36	5
36	29
36	7
36	31
36	8
36	10
36	33
36	11
36	22
36	38
36	12
37	14
37	2
37	4
37	15
37	16
37	18
37	19
37	6
37	7
37	31
37	36
37	9
37	21
37	11
37	22
37	26
37	23
37	38
37	12
38	1
38	2
38	4
38	15
38	28
38	6
38	21
38	10
38	23
38	24
38	25
38	27
38	12
38	13
39	14
39	35
39	19
39	41
39	28
39	6
39	9
39	21
39	26
39	23
39	38
39	12
39	13
39	48
40	1
40	2
40	3
40	4
40	35
40	15
40	16
40	18
40	19
40	41
40	28
40	29
40	30
40	31
40	9
40	20
40	33
40	11
40	24
40	38
40	27
40	12
40	13
40	48
41	1
41	2
41	3
41	4
41	35
41	15
41	19
41	16
41	28
41	29
41	30
41	9
41	37
41	21
41	10
41	25
41	38
41	24
41	12
41	13
41	48
42	1
42	45
42	2
42	3
42	4
42	15
42	16
42	19
42	5
42	28
42	29
42	7
42	41
42	31
42	36
42	9
42	20
42	21
42	11
42	23
42	24
42	25
42	57
42	38
42	27
42	12
42	13
42	48
43	14
43	2
43	3
43	4
43	15
43	18
43	19
43	5
43	40
43	16
43	28
43	6
43	31
43	9
43	10
43	33
43	22
43	26
43	24
43	52
43	12
43	13
43	48
44	14
44	2
44	3
44	4
44	15
44	17
44	18
44	5
44	28
44	29
44	7
44	31
44	36
44	37
44	20
44	32
44	21
44	44
44	10
44	33
44	11
44	53
44	26
44	27
44	12
44	13
45	1
45	2
45	3
45	22
45	34
45	4
45	20
45	35
45	17
45	18
45	15
45	28
45	29
45	6
45	7
45	41
45	30
45	31
45	8
45	9
45	42
45	43
45	32
45	44
45	33
45	11
45	26
45	24
45	27
45	12
45	13
46	1
46	2
46	3
46	4
46	35
46	19
46	5
46	29
46	7
46	41
46	31
46	9
46	20
46	10
46	33
46	26
46	23
46	24
46	34
46	12
47	1
47	2
47	4
47	35
47	19
47	6
47	30
47	8
47	9
47	37
47	32
47	33
47	11
47	24
47	7
47	51
47	12
47	13
48	1
48	2
48	3
48	4
48	19
48	29
48	7
48	9
48	37
48	10
48	11
48	26
48	24
48	38
48	51
48	12
49	14
49	2
49	15
49	28
49	6
49	7
49	30
49	31
49	8
49	9
49	37
49	21
49	47
49	10
49	33
49	11
49	24
49	38
49	12
50	1
50	2
50	3
50	4
50	35
50	15
50	16
50	17
50	18
50	19
50	5
50	6
50	7
50	30
50	41
50	8
50	9
50	21
50	10
50	11
50	22
50	26
50	24
50	38
50	12
50	13
50	48
51	1
51	2
51	3
51	4
51	15
51	40
51	19
51	5
51	46
51	41
51	28
51	6
51	30
51	9
51	37
51	21
51	32
51	10
51	11
51	38
51	24
51	12
52	1
52	2
52	19
52	15
52	29
52	8
52	9
52	21
52	10
52	24
52	7
52	12
52	13
53	14
53	35
53	28
53	6
53	30
53	9
53	37
53	10
53	33
53	12
53	13
54	14
54	2
54	3
54	35
54	19
54	40
54	41
54	28
54	29
54	30
54	9
54	21
54	32
54	10
54	11
54	38
54	24
54	51
54	52
54	12
54	13
54	48
55	14
55	2
55	15
55	28
55	6
55	7
55	31
55	47
55	10
55	33
55	24
55	38
55	12
55	13
56	1
56	2
56	4
56	16
56	28
56	6
56	30
56	9
56	10
56	11
57	14
57	45
57	2
57	3
57	4
57	35
57	28
57	29
57	31
57	36
57	37
57	21
57	44
57	33
57	11
57	34
57	27
57	12
58	1
58	4
58	35
58	19
58	41
58	40
58	28
58	29
58	6
58	30
58	9
58	21
58	10
58	11
58	38
58	24
58	26
58	12
58	13
59	1
59	2
59	3
59	22
59	4
59	15
59	18
59	19
59	5
59	28
59	29
59	30
59	41
59	31
59	36
59	9
59	20
59	32
59	44
59	33
59	11
59	26
59	23
59	24
59	27
59	12
60	14
60	2
60	3
60	4
60	20
60	15
60	19
60	41
60	28
60	6
60	30
60	24
60	48
61	1
61	2
61	3
61	4
61	5
61	19
61	29
61	7
61	41
61	30
61	31
61	9
61	20
61	33
61	34
61	54
61	26
61	24
61	23
61	12
62	1
62	2
62	3
62	4
62	15
62	16
62	19
62	5
62	6
62	7
62	30
62	9
62	21
62	10
62	33
62	22
62	24
62	12
62	13
62	48
63	14
63	2
63	3
63	4
63	19
63	28
63	6
63	30
63	10
63	23
63	24
63	48
64	1
64	2
64	4
64	35
64	15
64	19
64	28
64	6
64	9
64	10
64	11
64	22
64	24
64	7
64	12
64	13
65	14
65	2
65	3
65	4
65	35
65	16
65	19
65	5
65	28
65	29
65	41
65	31
65	9
65	21
65	32
65	10
65	44
65	33
65	11
65	26
65	23
65	25
65	12
65	13
65	48
66	1
66	2
66	3
66	4
66	35
66	15
66	16
66	18
66	19
66	49
66	28
66	6
66	30
66	9
66	20
66	37
66	43
66	10
66	33
66	11
66	26
66	24
66	12
67	14
67	45
67	2
67	3
67	4
67	35
67	15
67	16
67	19
67	5
67	29
67	6
67	7
67	30
67	31
67	8
67	9
67	20
67	32
67	21
67	44
67	10
67	33
67	11
67	26
67	12
67	13
68	1
68	2
68	4
68	35
68	15
68	16
68	17
68	18
68	19
68	28
68	6
68	30
68	9
68	21
68	10
68	11
68	26
68	23
68	24
68	25
68	38
68	27
68	12
68	13
68	48
69	14
69	2
69	3
69	4
69	35
69	5
69	15
69	16
69	18
69	19
69	28
69	29
69	7
69	31
69	36
69	9
69	20
69	32
69	43
69	21
69	10
69	33
69	11
69	22
69	34
69	27
69	12
69	13
70	14
70	2
70	3
70	4
70	5
70	28
70	29
70	31
70	36
70	9
70	20
70	43
70	44
70	10
70	33
70	11
70	34
70	12
71	1
71	2
71	4
71	35
71	6
71	7
71	9
71	26
71	24
72	14
72	2
72	4
72	19
72	28
72	6
72	30
72	9
72	10
72	11
72	23
72	24
72	38
72	12
73	14
73	2
73	4
73	15
73	19
73	49
73	28
73	29
73	30
73	9
73	37
73	43
73	21
73	10
73	11
73	23
73	24
73	38
73	12
74	14
74	2
74	3
74	4
74	5
74	17
74	15
74	16
74	18
74	19
74	28
74	29
74	6
74	7
74	41
74	30
74	31
74	8
74	36
74	9
74	37
74	20
74	32
74	43
74	21
74	44
74	10
74	33
74	11
74	27
74	12
74	13
75	14
75	45
75	2
75	3
75	4
75	35
75	15
75	18
75	19
75	29
75	7
75	31
75	9
75	20
75	32
75	11
75	22
75	23
75	24
75	38
75	12
76	14
76	2
76	3
76	4
76	35
76	5
76	15
76	18
76	19
76	16
76	29
76	7
76	31
76	36
76	9
76	20
76	32
76	21
76	10
76	33
76	11
76	22
76	53
76	26
76	27
76	12
76	13
77	1
77	45
77	2
77	4
77	15
77	5
77	28
77	29
77	7
77	41
77	31
77	36
77	9
77	20
77	21
77	11
77	23
77	24
77	25
77	57
77	38
77	27
77	12
77	13
77	48
78	1
78	2
78	35
78	19
78	28
78	29
78	7
78	9
78	10
78	11
78	23
78	24
78	38
78	12
79	1
79	2
79	3
79	4
79	35
79	15
79	18
79	19
79	6
79	30
79	31
79	9
79	10
79	23
79	24
79	7
79	38
79	48
80	14
80	2
80	3
80	4
80	35
80	15
80	18
80	19
80	5
80	28
80	29
80	31
80	9
80	10
80	26
80	23
80	54
80	24
80	52
80	48
81	1
81	2
81	4
81	15
81	16
81	18
81	19
81	29
81	8
81	9
81	23
81	24
81	55
81	7
81	27
81	12
82	14
82	2
82	28
82	29
82	9
82	43
82	21
82	11
82	24
82	12
83	14
83	34
83	58
83	29
83	31
83	36
83	9
83	21
83	10
83	33
83	23
83	24
83	52
83	27
83	12
84	14
84	45
84	2
84	3
84	34
84	4
84	15
84	19
84	50
84	28
84	29
84	31
84	36
84	20
84	42
84	21
84	11
84	23
84	38
84	12
85	1
85	45
85	2
85	3
85	4
85	20
85	35
85	5
85	46
85	15
85	18
85	29
85	6
85	7
85	30
85	8
85	9
85	32
85	44
85	10
85	33
85	11
85	26
85	23
85	12
85	13
86	1
86	2
86	3
86	35
86	17
86	15
86	16
86	19
86	6
86	7
86	30
86	31
86	8
86	9
86	37
86	21
86	10
86	11
86	22
86	39
86	54
86	23
86	27
86	12
86	13
87	1
87	2
87	4
87	35
87	16
87	19
87	28
87	6
87	9
87	37
87	20
87	32
87	10
87	11
87	34
87	24
87	38
87	52
87	12
88	1
88	2
88	4
88	35
88	19
88	6
88	7
88	30
88	31
88	9
88	21
88	32
88	47
88	44
88	11
88	22
88	26
88	24
88	12
88	13
89	14
89	2
89	59
89	4
89	15
89	19
89	28
89	6
89	30
89	31
89	9
89	10
89	33
89	11
89	22
89	24
89	12
89	13
90	1
90	2
90	3
90	4
90	35
90	15
90	16
90	18
90	19
90	49
90	28
90	29
90	6
90	7
90	30
90	31
90	9
90	37
90	20
90	32
90	43
90	10
90	33
90	11
90	26
90	23
90	48
91	1
91	2
91	4
91	19
91	28
91	29
91	6
91	30
91	31
91	9
91	37
91	32
91	10
91	11
91	23
91	24
91	12
92	14
92	19
92	28
92	29
92	37
92	32
92	21
92	44
92	10
92	33
92	11
92	51
92	26
92	27
92	12
92	13
93	14
93	2
93	3
93	4
93	35
93	15
93	16
93	19
93	28
93	29
93	31
93	9
93	37
93	21
93	47
93	24
93	38
93	12
94	1
94	2
94	3
94	4
94	5
94	28
94	29
94	41
94	36
94	9
94	20
94	21
94	44
94	10
94	11
94	27
94	12
94	13
95	14
95	2
95	3
95	5
95	28
95	29
95	31
95	9
95	37
95	10
95	33
95	12
96	1
96	45
96	2
96	59
96	4
96	35
96	15
96	16
96	18
96	19
96	5
96	28
96	29
96	30
96	41
96	31
96	36
96	9
96	20
96	32
96	44
96	33
96	11
96	22
96	26
96	23
96	24
96	27
96	12
97	1
97	2
97	4
97	35
97	15
97	19
97	28
97	6
97	30
97	9
97	20
97	32
97	10
97	33
97	11
97	23
97	26
97	24
97	25
97	12
97	13
98	14
98	2
98	3
98	4
98	5
98	16
98	28
98	29
98	41
98	31
98	36
98	9
98	20
98	32
98	21
98	44
98	10
98	11
98	39
98	27
98	12
98	13
99	1
99	17
99	58
99	28
99	29
99	9
99	37
99	20
99	32
99	43
99	21
99	42
99	44
99	10
99	33
99	27
99	12
99	13
100	1
100	2
100	3
100	4
100	35
100	15
100	16
100	17
100	19
100	5
100	49
100	29
100	7
100	31
100	36
100	9
100	20
100	37
100	21
100	32
100	43
100	44
100	10
100	33
100	11
100	27
100	12
100	13
101	14
101	45
101	2
101	3
101	34
101	4
101	15
101	18
101	19
101	5
101	28
101	29
101	31
101	36
101	9
101	20
101	21
101	32
101	10
101	33
101	11
101	22
101	23
101	24
101	12
101	13
102	1
102	2
102	3
102	4
102	35
102	5
102	15
102	18
102	19
102	16
102	29
102	6
102	7
102	41
102	30
102	31
102	9
102	37
102	32
102	10
102	33
102	11
102	39
102	38
102	24
102	12
102	48
103	14
103	2
103	3
103	4
103	35
103	15
103	19
103	28
103	6
103	30
103	9
103	20
103	32
103	21
103	10
103	11
103	7
103	23
103	38
103	24
103	12
103	13
104	14
104	2
104	4
104	35
104	16
104	19
104	28
104	29
104	30
104	9
104	21
104	10
104	11
104	38
104	12
104	13
105	14
105	2
105	3
105	4
105	35
105	5
105	17
105	15
105	16
105	18
105	19
105	28
105	29
105	31
105	36
105	9
105	37
105	20
105	32
105	21
105	44
105	10
105	33
105	11
105	53
105	27
105	12
105	13
106	14
106	2
106	22
106	3
106	20
106	4
106	35
106	15
106	16
106	18
106	19
106	28
106	29
106	31
106	36
106	9
106	37
106	43
106	10
106	44
106	11
106	23
106	24
106	12
106	48
107	14
107	2
107	4
107	35
107	19
107	28
107	6
107	31
107	9
107	32
107	21
107	10
107	11
107	26
107	7
107	23
107	38
107	24
107	12
107	13
108	1
108	2
108	4
108	35
108	19
108	6
108	7
108	30
108	31
108	9
108	21
108	32
108	47
108	44
108	10
108	11
108	22
108	26
108	24
108	12
108	13
109	1
109	2
109	3
109	4
109	35
109	15
109	19
109	28
109	6
109	30
109	9
109	37
109	21
109	10
109	38
109	24
109	23
109	12
109	13
109	48
110	1
110	2
110	3
110	4
110	35
110	15
110	16
110	17
110	19
110	5
110	49
110	29
110	7
110	31
110	36
110	9
110	20
110	37
110	21
110	32
110	43
110	44
110	10
110	33
110	11
110	27
110	12
110	13
111	1
111	2
111	3
111	4
111	35
111	16
111	19
111	5
111	28
111	29
111	30
111	31
111	9
111	20
111	21
111	32
111	44
111	33
111	11
111	26
111	23
111	24
111	27
111	12
111	13
111	48
112	1
112	2
112	3
112	4
112	35
112	15
112	16
112	19
112	5
112	49
112	29
112	7
112	31
112	36
112	9
112	20
112	37
112	21
112	43
112	32
112	44
112	10
112	33
112	11
112	27
112	12
112	13
113	14
113	2
113	3
113	4
113	35
113	19
113	28
113	6
113	30
113	9
113	21
113	10
113	11
113	23
113	24
113	25
113	12
114	14
114	45
114	2
114	3
114	34
114	4
114	35
114	15
114	5
114	58
114	28
114	29
114	31
114	36
114	20
114	42
114	21
114	10
114	11
114	22
114	23
114	26
114	24
114	38
114	12
114	13
114	48
115	1
115	2
115	4
115	28
115	6
115	30
115	31
115	10
115	26
115	23
115	24
115	7
115	12
116	1
116	2
116	3
116	4
116	35
116	15
116	19
116	40
116	41
116	28
116	6
116	30
116	9
116	37
116	21
116	10
116	25
116	24
116	12
116	13
117	14
117	2
117	3
117	4
117	15
117	16
117	18
117	19
117	28
117	29
117	31
117	9
117	10
117	11
117	22
117	39
117	38
117	24
117	12
118	1
118	2
118	3
118	4
118	35
118	15
118	19
118	5
118	28
118	6
118	30
118	9
118	37
118	21
118	42
118	10
118	24
118	25
118	23
118	57
118	38
118	12
118	13
118	48
119	14
119	2
119	3
119	4
119	5
119	41
119	17
119	28
119	29
119	7
119	30
119	31
119	9
119	37
119	20
119	32
119	21
119	44
119	10
119	33
119	11
119	22
119	27
119	12
119	13
120	1
120	2
120	3
120	4
120	35
120	5
120	15
120	16
120	18
120	19
120	28
120	29
120	30
120	31
120	9
120	20
120	21
120	10
120	11
120	39
120	26
120	23
120	24
120	38
120	27
120	12
120	13
121	1
121	2
121	4
121	35
121	19
121	28
121	6
121	7
121	30
121	31
121	9
121	21
121	32
121	47
121	44
121	10
121	11
121	22
121	26
121	24
121	12
121	13
122	14
122	2
122	34
122	4
122	35
122	50
122	15
122	16
122	19
122	18
122	28
122	6
122	7
122	30
122	9
122	37
122	20
122	32
122	43
122	21
122	44
122	10
122	33
122	11
122	12
122	13
123	14
123	2
123	3
123	4
123	35
123	15
123	16
123	18
123	19
123	5
123	41
123	28
123	29
123	30
123	31
123	36
123	9
123	20
123	37
123	43
123	21
123	10
123	33
123	11
123	26
123	23
123	12
123	13
124	1
124	2
124	3
124	4
124	35
124	19
124	5
124	29
124	6
124	7
124	31
124	36
124	9
124	20
124	42
124	21
124	32
124	44
124	11
124	22
124	23
124	54
124	27
124	12
124	13
125	14
125	2
125	3
125	4
125	35
125	15
125	28
125	6
125	31
125	36
125	9
125	37
125	20
125	21
125	10
125	11
125	24
125	27
125	12
126	14
126	45
126	2
126	3
126	34
126	4
126	15
126	19
126	5
126	28
126	29
126	31
126	36
126	9
126	20
126	42
126	21
126	32
126	11
126	22
126	23
126	57
126	38
126	12
126	48
127	1
127	2
127	4
127	15
127	40
127	19
127	28
127	6
127	30
127	8
127	9
127	42
127	21
127	23
127	38
127	12
128	1
128	2
128	4
128	35
128	15
128	19
128	18
128	29
128	6
128	7
128	30
128	9
128	37
128	32
128	10
128	33
128	11
128	26
128	23
128	54
128	24
128	12
128	13
128	48
129	14
129	45
129	2
129	3
129	4
129	15
129	19
129	16
129	5
129	28
129	29
129	41
129	31
129	9
129	20
129	21
129	10
129	47
129	44
129	11
129	22
129	24
129	38
129	27
129	12
130	1
130	2
130	3
130	4
130	15
130	19
130	5
130	29
130	6
130	7
130	8
130	9
130	37
130	32
130	10
130	11
130	27
130	12
130	13
130	48
131	14
131	2
131	28
131	29
131	6
131	31
131	36
131	9
131	44
131	11
131	26
131	24
131	38
131	52
131	27
131	12
131	13
131	48
132	14
132	2
132	3
132	4
132	35
132	15
132	16
132	18
132	19
132	5
132	28
132	29
132	30
132	31
132	36
132	9
132	20
132	42
132	21
132	32
132	44
132	33
132	11
132	22
132	26
132	12
132	48
133	14
133	45
133	2
133	3
133	4
133	35
133	15
133	16
133	18
133	19
133	5
133	28
133	29
133	30
133	31
133	36
133	9
133	20
133	42
133	21
133	32
133	44
133	33
133	11
133	22
133	26
133	12
133	48
134	1
134	2
134	3
134	4
134	35
134	15
134	16
134	19
134	28
134	6
134	30
134	9
134	32
134	21
134	44
134	10
134	11
134	34
134	39
134	56
134	24
134	48
135	14
135	41
135	28
135	37
135	10
135	44
135	11
135	24
135	51
135	27
135	48
136	14
136	2
136	4
136	29
136	6
136	30
136	8
136	9
136	37
136	32
136	48
137	1
137	2
137	3
137	4
137	15
137	18
137	19
137	5
137	29
137	7
137	31
137	9
137	20
137	42
137	43
137	21
137	32
137	10
137	44
137	11
137	22
137	12
138	14
138	2
138	3
138	59
138	4
138	49
138	28
138	6
138	24
138	48
139	14
139	2
139	3
139	4
139	5
139	15
139	19
139	29
139	6
139	7
139	30
139	31
139	9
139	20
139	32
139	21
139	10
139	11
139	24
139	48
140	1
140	2
140	4
140	28
140	6
140	30
140	9
140	21
140	10
140	11
140	22
140	54
140	24
140	25
140	38
140	52
141	1
141	2
141	3
141	4
141	35
141	5
141	16
141	15
141	18
141	19
141	28
141	29
141	30
141	31
141	36
141	9
141	32
141	10
141	11
141	23
141	26
141	24
141	7
141	38
141	52
141	12
141	48
142	14
142	2
142	3
142	4
142	5
142	15
142	19
142	29
142	31
142	9
142	20
142	32
142	21
142	10
142	11
142	24
142	52
142	27
142	48
143	1
143	2
143	3
143	4
143	35
143	15
143	16
143	19
143	5
143	29
143	6
143	7
143	30
143	31
143	8
143	9
143	10
143	33
143	11
143	22
143	26
143	24
143	38
143	34
143	39
143	12
143	13
144	1
144	2
144	3
144	4
144	15
144	19
144	6
144	7
144	30
144	9
144	10
144	11
144	13
145	14
145	2
145	4
145	35
145	15
145	19
145	28
145	6
145	30
145	9
145	47
145	11
145	26
145	24
145	12
145	13
146	14
146	2
146	3
146	4
146	35
146	5
146	15
146	16
146	19
146	29
146	7
146	31
146	9
146	20
146	32
146	21
146	10
146	11
146	24
146	52
146	27
146	48
147	14
147	2
147	3
147	4
147	5
147	15
147	16
147	29
147	7
147	31
147	9
147	20
147	32
147	21
147	10
147	11
147	24
147	52
147	27
147	48
148	14
148	2
148	35
148	15
148	19
148	28
148	29
148	30
148	31
148	9
148	21
148	10
148	11
148	7
148	13
149	14
149	2
149	3
149	59
149	4
149	5
149	17
149	58
149	28
149	29
149	30
149	31
149	36
149	9
149	37
149	20
149	43
149	10
149	33
149	11
149	22
149	26
149	27
149	12
149	13
150	14
150	2
150	3
150	22
150	4
150	35
150	15
150	16
150	19
150	5
150	49
150	28
150	29
150	31
150	36
150	9
150	37
150	20
150	43
150	32
150	10
150	44
150	33
150	11
150	26
150	12
150	13
151	1
151	2
151	3
151	4
151	5
151	16
151	15
151	18
151	19
151	29
151	7
151	30
151	31
151	9
151	37
151	32
151	10
151	33
151	11
151	23
151	24
151	38
151	12
151	48
152	1
152	2
152	3
152	4
152	15
152	19
152	6
152	7
152	30
152	9
152	10
152	11
152	13
153	14
153	2
153	3
153	4
153	5
153	15
153	19
153	28
153	29
153	30
153	31
153	9
153	20
153	32
153	21
153	10
153	11
153	24
153	48
154	14
154	2
154	4
154	35
154	15
154	16
154	18
154	19
154	29
154	7
154	30
154	41
154	31
154	9
154	20
154	21
154	32
154	44
154	33
154	11
154	22
154	23
154	25
154	12
154	13
155	14
155	2
155	3
155	4
155	35
155	15
155	19
155	5
155	6
155	7
155	8
155	20
155	37
155	21
155	32
155	10
155	33
155	11
155	26
155	24
155	12
155	13
155	48
156	1
156	2
156	4
156	19
156	6
156	7
156	30
156	9
156	47
156	10
156	26
156	24
157	1
157	2
157	4
157	35
157	15
157	19
157	28
157	30
157	9
157	20
157	10
157	33
157	11
157	26
157	54
157	24
157	12
158	14
158	2
158	3
158	4
158	20
158	35
158	5
158	41
158	17
158	19
158	28
158	29
158	6
158	7
158	30
158	31
158	36
158	8
158	9
158	32
158	42
158	44
158	10
158	33
158	11
158	12
158	13
159	14
159	45
159	2
159	3
159	34
159	4
159	20
159	35
159	15
159	17
159	19
159	28
159	29
159	41
159	31
159	36
159	9
159	42
159	21
159	32
159	10
159	44
159	33
159	11
159	26
159	27
159	12
159	13
159	48
160	9
160	10
160	33
160	26
160	23
160	24
160	38
160	52
160	48
161	9
161	20
161	32
161	42
161	44
161	10
161	33
161	11
161	22
161	27
161	12
161	13
162	9
162	11
162	24
163	32
163	10
163	33
163	11
163	22
163	24
163	25
163	7
163	12
163	13
164	1
164	2
164	3
164	4
164	17
164	29
164	9
165	1
165	2
165	3
165	4
165	35
165	19
165	28
165	29
165	6
165	7
165	30
165	8
165	20
165	37
165	32
165	21
165	10
165	33
165	11
165	26
165	24
166	6
166	7
166	30
166	9
166	37
166	21
166	11
166	23
166	24
166	56
166	34
166	12
167	9
167	20
167	32
167	10
167	44
167	33
167	11
167	24
167	25
167	7
167	48
168	1
168	2
168	3
168	35
168	19
168	5
168	29
168	6
168	7
168	30
168	9
168	20
168	42
168	21
168	32
168	10
168	44
168	33
168	11
168	26
168	12
169	14
169	45
169	2
169	59
169	34
169	35
169	15
169	16
169	19
169	28
169	29
169	31
169	36
169	9
169	21
169	32
169	44
169	33
169	11
169	22
169	26
169	23
169	38
169	12
170	14
170	2
170	3
170	4
170	35
170	15
170	19
170	29
170	6
170	7
170	41
170	30
170	31
170	9
170	37
170	20
170	43
170	10
170	33
170	11
170	22
170	34
170	39
170	12
170	13
171	14
171	2
171	3
171	4
171	35
171	5
171	15
171	19
171	6
171	7
171	31
171	8
171	9
171	21
171	10
171	11
171	39
171	24
171	48
172	14
172	2
172	3
172	4
172	5
172	15
172	16
172	19
172	28
172	29
172	31
172	36
172	9
172	32
172	21
172	11
172	7
172	34
172	13
173	1
173	2
173	3
173	4
173	15
173	18
173	19
173	6
173	7
173	30
173	8
173	9
173	13
174	14
174	2
174	3
174	4
174	15
174	18
174	5
174	28
174	29
174	30
174	31
174	36
174	9
174	21
174	32
174	33
174	11
174	26
174	23
174	12
175	14
175	2
175	3
175	4
175	5
175	15
175	16
175	19
175	28
175	29
175	31
175	36
175	9
175	32
175	21
175	11
175	7
175	34
175	13
176	1
176	2
176	3
176	4
176	35
176	5
176	15
176	16
176	18
176	19
176	28
176	29
176	7
176	41
176	31
176	36
176	9
176	32
176	42
176	11
176	34
176	23
176	38
177	14
177	2
177	4
177	28
177	6
177	30
177	37
177	12
178	14
178	2
178	3
178	4
178	5
178	41
178	58
178	46
178	28
178	29
178	31
178	36
178	9
178	20
178	32
178	21
178	44
178	10
178	33
178	11
178	26
178	56
178	27
178	12
179	14
179	45
179	2
179	3
179	4
179	15
179	19
179	5
179	28
179	29
179	36
179	9
179	20
179	21
179	11
179	22
179	23
179	27
179	12
180	1
180	2
180	3
180	35
180	19
180	6
180	7
180	30
180	41
180	31
180	9
180	11
180	24
180	38
180	12
180	13
181	1
181	2
181	4
181	15
181	28
181	6
181	30
181	24
181	25
181	12
182	1
182	2
182	3
182	59
182	4
182	16
182	18
182	19
182	28
182	29
182	7
182	41
182	31
182	9
182	37
182	10
182	33
182	26
182	24
182	38
182	12
183	1
183	2
183	3
183	4
183	35
183	16
183	17
183	18
183	19
183	5
183	50
183	28
183	6
183	7
183	30
183	9
183	42
183	21
183	32
183	10
183	11
183	26
183	24
183	25
183	27
183	12
183	13
184	14
184	2
184	3
184	22
184	4
184	35
184	15
184	19
184	5
184	29
184	41
184	30
184	31
184	36
184	9
184	20
184	37
184	10
184	33
184	11
184	23
184	56
184	54
184	27
184	12
184	13
184	48
185	1
185	2
185	3
185	4
185	35
185	15
185	16
185	18
185	19
185	5
185	28
185	29
185	30
185	31
185	9
185	20
185	42
185	21
185	32
185	11
185	22
185	34
185	23
185	12
186	1
186	45
186	2
186	34
186	4
186	15
186	16
186	19
186	28
186	29
186	30
186	31
186	36
186	9
186	26
186	23
186	38
186	12
187	14
187	45
187	2
187	3
187	4
187	35
187	15
187	16
187	18
187	19
187	5
187	28
187	29
187	7
187	41
187	31
187	36
187	60
187	9
187	20
187	32
187	10
187	44
187	33
187	11
187	24
187	25
187	48
188	1
188	2
188	3
188	4
188	35
188	6
188	7
188	30
188	9
188	37
188	21
188	11
188	23
188	24
188	56
188	34
188	12
189	14
189	3
189	4
189	5
189	19
189	6
189	31
189	9
189	11
189	26
189	23
189	24
189	38
189	52
189	12
189	48
190	14
190	2
190	3
190	4
190	35
190	5
190	15
190	19
190	6
190	7
190	8
190	37
190	20
190	32
190	10
190	11
190	51
190	26
190	38
190	24
190	12
190	13
191	14
191	45
191	2
191	3
191	4
191	15
191	16
191	18
191	5
191	50
191	58
191	28
191	29
191	7
191	41
191	31
191	36
191	60
191	9
191	20
191	32
191	10
191	44
191	33
191	11
191	24
191	25
191	48
192	1
192	2
192	3
192	4
192	35
192	19
192	28
192	29
192	6
192	9
192	37
192	20
192	10
192	11
192	24
192	12
192	13
193	14
193	45
193	2
193	3
193	4
193	35
193	15
193	16
193	18
193	19
193	5
193	28
193	29
193	7
193	41
193	31
193	36
193	60
193	9
193	20
193	37
193	32
193	43
193	10
193	44
193	33
193	11
193	24
193	48
194	1
194	2
194	3
194	22
194	34
194	5
194	49
194	28
194	29
194	6
194	30
194	31
194	26
194	27
194	12
194	13
195	14
195	45
195	2
195	3
195	4
195	35
195	15
195	16
195	18
195	19
195	5
195	28
195	29
195	7
195	41
195	31
195	36
195	60
195	9
195	20
195	32
195	10
195	44
195	33
195	11
195	24
195	25
195	48
196	1
196	2
196	3
196	4
196	35
196	15
196	19
196	6
196	7
196	30
196	9
196	11
196	22
196	24
196	38
196	12
197	14
197	2
197	3
197	4
197	35
197	15
197	16
197	19
197	41
197	29
197	6
197	7
197	30
197	9
197	20
197	37
197	43
197	10
197	33
197	11
197	26
197	23
197	24
197	12
198	1
198	2
198	3
198	34
198	4
198	35
198	15
198	16
198	40
198	19
198	50
198	28
198	29
198	6
198	7
198	30
198	9
198	20
198	21
198	32
198	10
198	44
198	33
198	11
198	23
198	24
198	27
198	12
198	13
198	48
199	14
199	45
199	2
199	3
199	4
199	15
199	19
199	5
199	28
199	29
199	36
199	9
199	20
199	21
199	11
199	22
199	23
199	27
199	12
200	1
200	2
200	3
200	4
200	15
200	18
200	19
200	29
200	7
200	30
200	31
200	9
200	20
200	37
200	43
200	10
200	44
200	11
200	22
200	26
200	23
200	48
201	14
201	2
201	3
201	4
201	5
201	15
201	19
201	28
201	29
201	9
201	21
201	10
201	11
201	39
201	24
201	48
202	14
202	2
202	3
202	4
202	28
202	6
202	30
202	9
202	37
202	10
202	11
202	12
203	14
203	45
203	2
203	3
203	4
203	15
203	19
203	5
203	28
203	29
203	36
203	9
203	20
203	21
203	11
203	22
203	23
203	27
203	12
204	1
204	2
204	3
204	4
204	15
204	18
204	19
204	29
204	6
204	7
204	30
204	9
204	20
204	32
204	10
204	11
204	22
204	34
204	23
204	38
204	12
205	14
205	2
205	3
205	20
205	4
205	35
205	15
205	16
205	19
205	5
205	28
205	29
205	7
205	31
205	36
205	9
205	21
205	32
205	33
205	11
205	26
205	23
205	24
205	25
205	12
205	13
205	48
206	1
206	2
206	3
206	4
206	35
206	5
206	15
206	16
206	18
206	19
206	28
206	29
206	30
206	31
206	9
206	20
206	32
206	42
206	21
206	10
206	11
206	22
206	34
206	23
206	12
207	14
207	2
207	3
207	4
207	5
207	19
207	16
207	28
207	9
207	22
207	23
207	52
207	48
208	1
208	2
208	3
208	4
208	15
208	16
208	18
208	19
208	5
208	28
208	29
208	30
208	31
208	9
208	20
208	42
208	21
208	32
208	11
208	22
208	34
208	23
208	12
209	14
209	45
209	2
209	3
209	34
209	4
209	15
209	16
209	18
209	5
209	50
209	29
209	7
209	41
209	31
209	36
209	60
209	9
209	20
209	32
209	10
209	44
209	33
209	11
209	24
209	25
209	48
210	1
210	2
210	3
210	4
210	15
210	6
210	7
210	30
210	9
210	10
210	11
210	26
210	12
211	14
211	2
211	3
211	4
211	15
211	18
211	19
211	49
211	28
211	6
211	30
211	31
211	9
211	20
211	11
211	26
211	23
211	38
211	12
212	14
212	45
212	2
212	3
212	4
212	35
212	5
212	19
212	16
212	28
212	29
212	41
212	31
212	36
212	9
212	20
212	21
212	32
212	10
212	11
212	22
212	38
212	24
212	23
212	27
212	12
213	1
213	2
213	4
213	35
213	15
213	19
213	6
213	7
213	30
213	9
213	32
213	10
213	33
213	11
213	22
213	26
213	24
213	38
213	12
214	14
214	2
214	3
214	59
214	4
214	20
214	5
214	41
214	17
214	58
214	15
214	28
214	29
214	31
214	36
214	9
214	21
214	32
214	44
214	11
214	22
214	23
214	27
214	12
215	1
215	3
215	4
215	15
215	16
215	18
215	19
215	41
215	6
215	7
215	30
215	31
215	8
215	9
215	21
215	32
215	10
215	24
215	12
215	48
216	14
216	2
216	4
216	15
216	16
216	28
216	29
216	31
216	36
216	9
216	37
216	20
216	32
216	10
216	33
216	11
216	22
216	34
216	51
216	27
216	12
217	1
217	35
217	17
217	19
217	29
217	6
217	7
217	30
217	31
217	8
217	9
217	37
217	10
217	54
217	26
217	23
217	38
217	24
217	52
217	12
217	13
217	48
218	14
218	2
218	3
218	4
218	35
218	5
218	41
218	17
218	19
218	28
218	29
218	31
218	36
218	9
218	21
218	10
218	11
218	38
218	24
218	27
218	12
218	13
219	1
219	2
219	4
219	6
219	7
219	30
219	26
219	12
219	13
220	1
220	2
220	3
220	4
220	5
220	41
220	58
220	19
220	28
220	29
220	31
220	36
220	9
220	20
220	32
220	21
220	44
220	11
220	22
220	27
220	12
221	1
221	2
221	3
221	4
221	35
221	15
221	16
221	19
221	5
221	28
221	29
221	31
221	36
221	9
221	20
221	37
221	43
221	21
221	10
221	33
221	11
221	24
221	39
221	48
222	1
222	2
222	3
222	34
222	4
222	35
222	15
222	16
222	17
222	18
222	19
222	28
222	29
222	31
222	36
222	9
222	20
222	42
222	21
222	32
222	33
222	11
222	22
222	23
222	27
222	12
223	1
223	35
223	17
223	19
223	6
223	7
223	30
223	8
223	9
223	37
223	10
223	26
223	23
223	24
223	52
223	38
223	12
223	13
223	48
224	14
224	2
224	3
224	4
224	35
224	15
224	16
224	19
224	5
224	28
224	29
224	30
224	8
224	9
224	20
224	42
224	21
224	10
224	33
224	26
224	23
224	24
224	25
224	27
224	12
224	13
224	48
225	1
225	2
225	3
225	4
225	35
225	15
225	18
225	19
225	28
225	6
225	30
225	9
225	10
225	26
225	24
225	38
225	12
225	13
226	14
226	2
226	3
226	4
226	35
226	15
226	16
226	19
226	5
226	29
226	31
226	9
226	20
226	37
226	10
226	33
226	11
226	22
226	26
226	23
226	24
226	12
226	13
227	14
227	45
227	2
227	3
227	4
227	35
227	15
227	19
227	5
227	58
227	41
227	28
227	29
227	30
227	31
227	36
227	9
227	20
227	21
227	11
227	23
227	54
227	38
227	39
227	24
227	27
227	12
227	13
228	1
228	2
228	35
228	15
228	18
228	19
228	29
228	6
228	7
228	30
228	31
228	36
228	9
228	37
228	21
228	32
228	10
228	33
228	22
228	11
228	26
228	23
228	48
229	14
229	45
229	2
229	3
229	4
229	35
229	15
229	16
229	19
229	5
229	58
229	28
229	29
229	41
229	31
229	36
229	9
229	37
229	20
229	43
229	32
229	10
229	44
229	33
229	11
229	26
229	12
230	1
230	2
230	3
230	4
230	35
230	15
230	16
230	19
230	5
230	29
230	6
230	7
230	41
230	31
230	9
230	20
230	37
230	21
230	10
230	11
230	26
230	23
230	24
230	38
230	12
230	13
231	14
231	2
231	22
231	3
231	34
231	4
231	35
231	15
231	19
231	5
231	16
231	28
231	29
231	30
231	31
231	36
231	9
231	20
231	21
231	42
231	10
231	47
231	33
231	11
231	24
231	48
232	1
232	2
232	3
232	4
232	35
232	5
232	15
232	16
232	18
232	19
232	28
232	29
232	30
232	9
232	20
232	43
232	21
232	10
232	11
232	22
232	39
232	23
232	24
232	12
232	13
233	14
233	2
233	3
233	4
233	20
233	35
233	15
233	18
233	19
233	5
233	58
233	28
233	29
233	31
233	36
233	9
233	21
233	32
233	10
233	44
233	33
233	11
233	23
233	54
233	48
234	1
234	2
234	4
234	35
234	19
234	28
234	6
234	9
234	21
234	10
234	11
234	38
234	52
234	12
235	1
235	2
235	3
235	4
235	5
235	28
235	29
235	7
235	30
235	9
235	20
235	33
235	11
235	26
235	24
235	38
235	12
236	14
236	2
236	3
236	59
236	20
236	4
236	35
236	16
236	19
236	49
236	5
236	6
236	30
236	41
236	8
236	9
236	21
236	32
236	10
236	44
236	33
236	11
236	22
236	26
237	1
237	2
237	19
237	6
237	7
237	30
237	9
237	11
237	24
238	1
238	2
238	3
238	4
238	17
238	6
238	7
238	41
238	30
238	8
238	9
238	42
238	10
238	11
238	12
238	13
239	1
239	2
239	3
239	35
239	15
239	16
239	19
239	28
239	6
239	41
239	30
239	8
239	9
239	42
239	10
239	33
239	11
239	38
239	12
239	13
240	1
240	2
240	4
240	15
240	16
240	18
240	5
240	29
240	7
240	8
240	32
240	10
240	33
240	11
240	22
240	24
240	25
240	12
240	13
241	14
241	2
241	3
241	4
241	35
241	5
241	16
241	19
241	28
241	6
241	30
241	27
241	12
241	13
242	14
242	2
242	3
242	4
242	35
242	5
242	49
242	16
242	19
242	28
242	29
242	30
242	10
242	11
242	26
242	27
242	12
242	13
243	1
243	2
243	3
243	4
243	35
243	19
243	28
243	29
243	6
243	9
243	37
243	20
243	10
243	11
243	24
243	12
243	13
244	14
244	45
244	2
244	3
244	34
244	4
244	20
244	35
244	15
244	17
244	19
244	28
244	29
244	41
244	31
244	36
244	9
244	42
244	21
244	32
244	10
244	44
244	33
244	11
244	26
244	27
244	12
244	13
244	48
245	1
245	6
245	7
245	30
245	8
245	9
245	21
245	10
245	11
245	24
245	38
245	12
245	48
246	14
246	2
246	3
246	4
246	35
246	16
246	19
246	28
246	29
246	31
246	36
246	9
246	20
246	42
246	21
246	32
246	11
246	22
246	24
246	51
246	34
246	27
247	1
247	45
247	2
247	34
247	4
247	35
247	15
247	19
247	28
247	29
247	30
247	31
247	36
247	9
247	10
247	26
247	23
247	24
247	12
248	1
248	2
248	3
248	4
248	35
248	5
248	41
248	19
248	28
248	29
248	31
248	36
248	9
248	37
248	11
248	22
248	24
249	14
249	45
249	2
249	3
249	4
249	35
249	15
249	16
249	19
249	5
249	41
249	28
249	29
249	31
249	36
249	9
249	20
249	32
249	10
249	44
249	33
249	11
249	22
249	26
249	23
249	27
249	12
249	13
250	1
250	2
250	3
250	4
250	35
250	19
250	28
250	29
250	30
250	31
250	60
250	9
250	11
250	24
250	38
250	23
250	12
250	13
251	14
251	6
251	7
251	30
251	9
251	21
251	32
251	10
251	44
251	33
251	11
251	24
251	51
251	27
251	12
251	13
251	48
252	14
252	2
252	3
252	19
252	7
252	36
252	20
252	24
252	12
253	1
253	2
253	3
253	4
253	35
253	5
253	41
253	28
253	29
253	31
253	36
253	9
253	21
253	10
253	38
253	27
253	12
253	13
254	14
254	2
254	3
254	4
254	28
254	9
254	11
254	26
254	23
254	24
254	12
255	14
255	45
255	2
255	3
255	4
255	35
255	5
255	41
255	17
255	15
255	28
255	29
255	31
255	36
255	9
255	37
255	20
255	32
255	21
255	42
255	44
255	10
255	33
255	11
255	27
255	12
256	1
256	2
256	3
256	4
256	15
256	19
256	5
256	6
256	7
256	8
256	9
256	32
256	10
256	11
256	24
256	12
257	14
257	45
257	2
257	3
257	15
257	5
257	28
257	29
257	31
257	9
257	20
257	11
257	23
257	24
257	34
258	14
258	2
258	3
258	4
258	35
258	15
258	19
258	29
258	6
258	7
258	30
258	9
258	20
258	37
258	43
258	10
258	11
258	26
258	23
258	24
258	38
258	12
259	1
259	2
259	3
259	4
259	15
259	16
259	18
259	19
259	29
259	7
259	30
259	31
259	20
259	37
259	32
259	10
259	33
259	11
259	26
259	24
259	25
259	12
259	13
260	14
260	2
260	4
260	15
260	19
260	29
260	7
260	30
260	31
260	10
260	24
260	48
261	14
261	2
261	3
261	4
261	5
261	17
261	28
261	29
261	31
261	9
261	32
261	44
261	33
261	7
261	12
262	1
262	2
262	3
262	4
262	35
262	15
262	16
262	18
262	19
262	49
262	5
262	6
262	7
262	30
262	31
262	9
262	20
262	37
262	21
262	10
262	33
262	11
262	23
262	24
262	25
262	12
262	48
263	14
263	2
263	3
263	4
263	19
263	41
263	28
263	29
263	31
263	36
263	9
263	20
263	37
263	10
263	33
263	11
263	22
263	38
263	12
264	1
264	2
264	3
264	4
264	15
264	16
264	17
264	19
264	5
264	41
264	28
264	29
264	31
264	36
264	9
264	20
264	42
264	43
264	21
264	11
264	22
264	24
264	38
264	39
264	27
264	12
265	1
265	2
265	3
265	4
265	15
265	18
265	28
265	6
265	30
265	9
265	20
265	10
265	11
265	22
265	34
265	23
265	12
266	14
266	45
266	2
266	3
266	4
266	15
266	16
266	18
266	19
266	5
266	58
266	28
266	29
266	7
266	41
266	31
266	36
266	60
266	9
266	20
266	32
266	10
266	44
266	33
266	11
266	24
266	25
266	48
267	14
267	2
267	3
267	4
267	35
267	15
267	19
267	5
267	29
267	6
267	7
267	30
267	41
267	31
267	9
267	20
267	10
267	33
267	11
267	23
267	54
267	24
267	38
267	52
267	12
268	1
268	2
268	3
268	4
268	15
268	19
268	5
268	28
268	6
268	30
268	9
268	10
268	33
268	26
268	23
268	24
268	38
268	52
268	48
269	1
269	2
269	3
269	4
269	35
269	15
269	16
269	19
269	5
269	6
269	30
269	8
269	9
269	21
269	32
269	10
269	44
269	33
269	11
269	22
269	26
269	24
269	12
269	13
270	1
270	2
270	3
270	4
270	6
270	7
270	30
270	31
270	9
270	20
270	32
270	42
270	44
270	10
270	33
270	11
270	22
270	27
270	12
270	13
271	1
271	2
271	3
271	4
271	19
271	6
271	7
271	30
271	9
271	11
271	26
271	24
271	12
272	1
272	2
272	3
272	4
272	35
272	16
272	19
272	5
272	29
272	6
272	7
272	30
272	41
272	9
272	32
272	10
272	33
272	11
272	24
272	38
272	57
272	12
273	1
273	28
273	6
273	30
273	24
273	25
273	12
274	1
274	2
274	3
274	4
274	35
274	19
274	5
274	28
274	29
274	7
274	31
274	9
274	20
274	42
274	21
274	11
274	22
274	24
274	38
274	39
274	12
275	1
275	2
275	3
275	19
275	28
275	29
275	6
275	41
275	9
275	20
275	21
275	32
275	10
275	44
275	33
275	11
275	54
275	24
275	12
275	13
276	1
276	2
276	3
276	5
276	15
276	16
276	19
276	41
276	28
276	29
276	31
276	36
276	9
276	32
276	21
276	47
276	11
276	39
276	57
276	23
276	27
276	12
277	1
277	2
277	3
277	4
277	15
277	19
277	5
277	29
277	7
277	41
277	31
277	10
277	33
277	26
277	23
277	24
277	12
278	14
278	45
278	2
278	3
278	4
278	15
278	5
278	28
278	29
278	36
278	9
278	20
278	21
278	11
278	22
278	23
278	27
278	12
279	1
279	2
279	4
279	29
279	6
279	7
279	30
279	31
279	12
280	1
280	2
280	3
280	4
280	35
280	17
280	15
280	19
280	28
280	6
280	30
280	31
280	9
280	21
280	10
280	11
280	38
280	24
280	23
280	12
280	13
281	1
281	2
281	3
281	4
281	35
281	15
281	17
281	18
281	19
281	5
281	28
281	29
281	31
281	9
281	20
281	43
281	10
281	11
281	22
281	26
281	23
281	54
281	24
281	12
282	1
282	2
282	3
282	4
282	5
282	19
282	28
282	29
282	31
282	36
282	9
282	37
282	20
282	32
282	21
282	42
282	44
282	33
282	11
282	27
282	12
283	1
283	45
283	2
283	3
283	34
283	28
283	29
283	41
283	31
283	9
283	21
283	33
283	11
283	57
283	39
283	23
283	27
283	12
283	13
284	1
284	2
284	3
284	4
284	16
284	28
284	6
284	9
284	20
284	37
284	43
284	21
284	10
284	44
284	22
284	11
284	24
284	48
285	14
285	2
285	3
285	4
285	35
285	5
285	41
285	17
285	16
285	19
285	28
285	29
285	31
285	36
285	9
285	21
285	10
285	11
285	38
285	27
285	12
285	13
286	1
286	2
286	3
286	4
286	35
286	15
286	19
286	5
286	29
286	6
286	7
286	41
286	31
286	9
286	10
286	11
286	39
286	52
286	12
286	13
286	48
287	1
287	2
287	3
287	4
287	17
287	28
287	6
287	30
287	31
287	9
287	37
287	20
287	32
287	43
287	10
287	33
287	11
287	34
287	7
287	12
287	13
288	1
288	2
288	4
288	19
288	28
288	31
288	9
288	20
288	21
288	44
288	10
288	11
288	24
288	38
288	27
288	12
288	13
288	48
289	1
289	2
289	35
289	19
289	28
289	6
289	9
289	21
289	10
289	11
289	26
289	24
289	38
289	12
289	13
290	1
290	2
290	3
290	4
290	35
290	15
290	29
290	6
290	7
290	30
290	31
290	20
290	11
290	24
290	38
290	12
290	13
290	48
291	1
291	2
291	3
291	4
291	35
291	15
291	18
291	16
291	19
291	5
291	28
291	29
291	30
291	31
291	9
291	20
291	42
291	32
291	21
291	33
291	11
291	22
291	34
291	23
291	12
292	14
292	2
292	15
292	28
292	30
292	24
292	12
293	14
293	2
293	22
293	4
293	35
293	15
293	19
293	28
293	6
293	30
293	9
293	10
293	26
293	24
293	38
293	12
294	14
294	2
294	4
294	15
294	16
294	28
294	6
294	30
294	31
294	9
294	21
294	11
294	26
294	23
294	24
294	25
294	52
295	1
295	2
295	4
295	28
295	6
295	30
295	21
295	10
295	26
295	24
295	39
295	12
295	13
295	48
296	1
296	2
296	3
296	4
296	28
296	29
296	9
296	20
296	42
296	11
297	1
297	2
297	3
297	4
297	35
297	15
297	16
297	17
297	19
297	5
297	28
297	29
297	41
297	31
297	36
297	9
297	21
297	32
297	10
297	11
297	22
297	23
297	24
297	25
297	38
297	27
297	48
298	14
298	45
298	2
298	3
298	4
298	15
298	28
298	29
298	31
298	9
298	20
298	11
298	23
298	24
298	34
299	1
299	2
299	3
299	4
299	16
299	19
299	28
299	29
299	33
299	11
299	22
299	26
299	23
299	24
299	38
299	52
299	12
300	1
300	2
300	3
300	4
300	35
300	15
300	16
300	19
300	5
300	28
300	6
300	30
300	8
300	9
300	21
300	32
300	10
300	44
300	33
300	11
300	22
300	26
300	24
300	12
300	13
301	14
301	45
301	2
301	3
301	4
301	15
301	16
301	18
301	19
301	5
301	58
301	28
301	29
301	7
301	41
301	31
301	36
301	60
301	9
301	20
301	32
301	10
301	44
301	33
301	11
301	24
301	25
301	48
302	14
302	2
302	3
302	4
302	15
302	18
302	5
302	29
302	31
302	21
302	10
302	48
303	1
303	2
303	4
303	19
303	28
303	6
303	9
303	24
303	52
303	12
304	1
304	2
304	22
304	3
304	4
304	35
304	15
304	16
304	17
304	19
304	5
304	28
304	29
304	41
304	31
304	36
304	9
304	20
304	42
304	43
304	21
304	11
304	24
304	38
304	39
304	27
304	12
305	14
305	2
305	3
305	4
305	15
305	16
305	18
305	5
305	41
305	28
305	29
305	31
305	36
305	9
305	10
305	44
305	11
305	38
305	27
305	12
306	1
306	2
306	3
306	4
306	20
306	35
306	5
306	17
306	58
306	15
306	19
306	29
306	7
306	41
306	31
306	36
306	9
306	37
306	32
306	44
306	10
306	33
306	11
306	22
306	34
306	27
306	12
306	13
307	1
307	2
307	3
307	4
307	35
307	19
307	28
307	29
307	6
307	7
307	30
307	31
307	36
307	8
307	9
307	21
307	10
307	33
307	26
307	23
307	24
307	38
307	12
307	13
308	1
308	2
308	3
308	20
308	4
308	35
308	19
308	5
308	46
308	61
308	29
308	6
308	7
308	30
308	41
308	31
308	36
308	9
308	37
308	10
308	44
308	33
308	11
308	22
308	23
308	24
308	12
308	13
309	14
309	2
309	3
309	4
309	35
309	19
309	28
309	6
309	31
309	9
309	21
309	32
309	10
309	11
309	24
309	38
309	56
309	12
309	13
310	14
310	2
310	3
310	34
310	4
310	15
310	16
310	18
310	19
310	28
310	29
310	31
310	36
310	9
310	20
310	43
310	21
310	33
310	11
310	22
310	26
310	23
310	51
310	12
310	13
310	48
311	14
311	45
311	2
311	3
311	4
311	35
311	15
311	17
311	19
311	5
311	41
311	28
311	29
311	31
311	36
311	9
311	20
311	42
311	21
311	32
311	10
311	44
311	33
311	11
311	26
311	27
311	12
311	13
311	48
312	1
312	2
312	3
312	4
312	15
312	5
312	29
312	6
312	30
312	9
312	21
312	11
312	26
312	24
312	7
312	12
313	1
313	2
313	3
313	34
313	15
313	18
313	19
313	5
313	58
313	28
313	31
313	36
313	9
313	20
313	37
313	42
313	21
313	10
313	44
313	33
313	11
313	22
313	27
313	12
314	14
314	2
314	3
314	4
314	35
314	16
314	15
314	19
314	58
314	41
314	5
314	28
314	29
314	31
314	36
314	20
314	44
314	11
314	38
314	56
314	23
314	27
314	12
315	14
315	2
315	3
315	34
315	4
315	15
315	16
315	18
315	19
315	28
315	29
315	31
315	36
315	9
315	20
315	43
315	21
315	33
315	11
315	22
315	26
315	23
315	51
315	12
315	13
315	48
316	1
316	2
316	3
316	4
316	19
316	6
316	7
316	30
316	8
316	9
316	20
316	32
316	10
316	33
316	11
316	26
316	23
316	38
316	34
316	12
317	1
317	2
317	3
317	4
317	5
317	28
317	6
317	30
317	31
317	9
317	37
317	10
317	11
317	12
318	14
318	2
318	3
318	4
318	5
318	28
318	29
318	41
318	30
318	31
318	36
318	9
318	20
318	32
318	10
318	11
318	22
318	26
318	12
318	13
319	1
319	2
319	4
319	35
319	19
319	28
319	29
319	6
319	7
319	30
319	31
319	60
319	9
319	21
319	32
319	10
319	33
319	26
319	24
319	38
319	25
319	27
319	12
319	13
320	1
320	2
320	3
320	4
320	5
320	41
320	16
320	19
320	28
320	29
320	31
320	36
320	9
320	20
320	32
320	43
320	42
320	44
320	11
320	23
320	38
320	12
321	14
321	19
321	6
321	7
321	30
321	9
321	37
321	21
321	10
321	44
321	33
321	11
321	22
321	26
321	23
321	12
321	13
322	14
322	2
322	3
322	59
322	4
322	5
322	41
322	17
322	61
322	28
322	29
322	31
322	36
322	9
322	37
322	20
322	43
322	44
322	10
322	11
322	22
322	39
322	7
322	27
322	12
322	13
323	1
323	2
323	3
323	4
323	35
323	16
323	19
323	5
323	29
323	7
323	41
323	31
323	9
323	20
323	37
323	21
323	11
323	24
323	38
323	56
323	34
323	12
324	14
324	2
324	3
324	4
324	28
324	6
324	30
324	31
324	36
324	9
324	10
324	33
324	11
324	7
324	12
324	13
325	1
325	2
325	3
325	4
325	35
325	5
325	41
325	28
325	29
325	31
325	36
325	9
325	21
325	10
325	38
325	27
325	12
325	13
326	1
326	2
326	3
326	4
326	35
326	5
326	15
326	16
326	18
326	19
326	28
326	29
326	30
326	31
326	9
326	20
326	32
326	42
326	21
326	10
326	11
326	22
326	34
326	23
326	12
327	14
327	2
327	3
327	4
327	5
327	19
327	16
327	28
327	9
327	22
327	23
327	52
327	48
328	1
328	2
328	3
328	4
328	15
328	16
328	18
328	19
328	5
328	28
328	29
328	30
328	31
328	9
328	20
328	42
328	21
328	32
328	11
328	22
328	34
328	23
329	1
329	2
329	3
329	4
329	35
329	15
329	16
329	19
329	5
329	28
329	6
329	30
329	8
329	9
329	21
329	32
329	10
329	44
329	33
329	11
329	22
329	26
329	24
329	12
329	13
330	14
330	2
330	3
330	4
330	35
330	15
330	16
330	18
330	19
330	5
330	28
330	29
330	31
330	36
330	9
330	21
330	32
330	10
330	11
330	26
330	23
330	24
330	38
330	52
330	12
331	1
331	2
331	3
331	4
331	35
331	15
331	16
331	18
331	19
331	5
331	29
331	7
331	41
331	31
331	36
331	9
331	20
331	21
331	10
331	33
331	11
331	22
331	26
331	23
331	24
331	12
331	48
332	14
332	45
332	2
332	3
332	34
332	4
332	15
332	16
332	18
332	5
332	50
332	29
332	7
332	41
332	31
332	36
332	60
332	9
332	20
332	32
332	10
332	44
332	33
332	11
332	24
332	25
332	48
333	14
333	2
333	3
333	4
333	15
333	18
333	19
333	49
333	28
333	6
333	30
333	31
333	9
333	20
333	11
333	26
333	23
333	38
333	12
334	14
334	45
334	2
334	3
334	34
334	4
334	35
334	15
334	16
334	18
334	19
334	28
334	29
334	30
334	41
334	31
334	36
334	9
334	21
334	32
334	47
334	10
334	44
334	11
334	23
334	26
334	24
334	48
335	1
335	2
335	3
335	4
335	35
335	15
335	16
335	18
335	19
335	49
335	5
335	6
335	30
335	31
335	9
335	20
335	37
335	21
335	10
335	33
335	11
335	23
335	24
335	25
335	12
336	1
336	2
336	3
336	35
336	19
336	5
336	29
336	6
336	7
336	30
336	9
336	20
336	42
336	21
336	32
336	10
336	44
336	33
336	11
336	26
336	12
337	14
337	45
337	2
337	59
337	34
337	35
337	15
337	16
337	19
337	28
337	29
337	31
337	36
337	9
337	21
337	32
337	44
337	33
337	11
337	22
337	26
337	23
337	38
337	12
338	14
338	2
338	3
338	4
338	35
338	15
338	19
338	29
338	6
338	7
338	41
338	30
338	31
338	9
338	37
338	20
338	43
338	10
338	33
338	11
338	22
338	34
338	39
338	12
338	13
339	14
339	2
339	3
339	4
339	35
339	5
339	15
339	19
339	6
339	7
339	31
339	8
339	9
339	21
339	10
339	11
339	39
339	24
339	48
340	14
340	2
340	3
340	4
340	5
340	15
340	16
340	19
340	28
340	29
340	31
340	36
340	9
340	32
340	21
340	11
340	7
340	34
340	13
341	1
341	2
341	3
341	4
341	15
341	18
341	19
341	6
341	7
341	30
341	8
341	9
341	13
342	14
342	2
342	3
342	4
342	15
342	18
342	5
342	28
342	29
342	30
342	31
342	36
342	9
342	21
342	32
342	33
342	11
342	26
342	23
342	12
343	14
343	45
343	2
343	3
343	34
343	59
343	4
343	5
343	41
343	17
343	15
343	28
343	29
343	31
343	36
343	9
343	37
343	20
343	32
343	43
343	21
343	42
343	10
343	44
343	33
343	27
343	12
343	13
344	14
344	2
344	3
344	4
344	5
344	15
344	16
344	19
344	28
344	29
344	31
344	36
344	9
344	32
344	21
344	11
344	7
344	34
344	13
345	14
345	2
345	4
345	35
345	15
345	19
345	28
345	6
345	30
345	9
345	32
345	21
345	10
345	33
345	11
345	39
345	26
345	38
345	24
345	12
346	1
346	6
346	7
346	30
346	9
346	20
346	21
346	32
346	10
346	33
346	11
346	12
346	48
347	14
347	2
347	3
347	4
347	19
347	5
347	50
347	28
347	6
347	9
347	32
347	10
347	47
347	33
347	11
347	23
347	24
347	12
348	14
348	2
348	3
348	4
348	28
348	29
348	32
348	11
348	12
349	1
349	45
349	2
349	3
349	34
349	4
349	35
349	15
349	16
349	18
349	19
349	28
349	29
349	6
349	30
349	31
349	36
349	9
349	37
349	42
349	21
349	10
349	22
349	26
349	23
349	24
349	54
349	27
349	12
349	13
350	14
350	2
350	3
350	4
350	15
350	19
350	5
350	28
350	29
350	31
350	36
350	9
350	21
350	47
350	10
350	26
350	23
350	24
350	25
350	38
350	12
350	13
351	14
351	28
351	6
351	9
351	27
351	12
352	14
352	4
352	29
352	7
352	44
352	10
352	33
352	11
352	34
352	27
352	12
353	1
353	2
353	4
353	28
353	6
353	30
353	9
353	12
354	14
354	2
354	28
354	29
354	30
354	9
354	21
354	10
354	23
354	38
354	52
354	12
354	13
354	48
355	14
355	2
355	3
355	34
355	4
355	5
355	28
355	29
355	41
355	31
355	37
355	32
355	21
355	42
355	10
355	33
355	11
355	27
355	12
355	13
356	14
356	35
356	19
356	41
356	6
356	7
356	30
356	11
356	24
356	38
356	12
356	13
357	1
357	2
357	3
357	4
357	5
357	49
357	28
357	29
357	30
357	32
357	44
357	10
357	33
357	11
357	39
357	12
357	13
358	14
358	2
358	3
358	4
358	35
358	5
358	16
358	19
358	28
358	6
358	30
358	31
358	9
358	20
358	32
358	44
358	10
358	33
358	11
358	26
358	23
358	24
358	12
359	14
359	45
359	2
359	3
359	59
359	4
359	35
359	19
359	28
359	6
359	30
359	31
359	36
359	9
359	32
359	42
359	10
359	33
359	27
359	12
359	13
360	14
360	2
360	3
360	34
360	4
360	5
360	28
360	29
360	41
360	31
360	36
360	32
360	21
360	42
360	44
360	10
360	33
360	11
360	27
360	12
360	13
361	1
361	6
361	7
361	30
361	24
361	38
361	12
362	1
362	2
362	4
362	28
362	6
362	30
362	9
362	10
362	12
362	13
363	1
363	2
363	3
363	59
363	4
363	35
363	15
363	16
363	18
363	5
363	6
363	7
363	30
363	41
363	32
363	10
363	44
363	33
363	11
363	24
363	25
363	51
363	48
364	14
364	2
364	3
364	4
364	28
364	6
364	30
364	9
364	37
364	32
364	43
364	21
364	42
364	44
364	10
364	33
364	11
364	27
364	12
364	13
365	14
365	2
365	15
365	18
365	5
365	6
365	30
365	9
365	20
365	42
365	24
365	25
365	12
365	13
366	14
366	2
366	3
366	4
366	40
366	19
366	28
366	6
366	30
366	31
366	9
366	21
366	32
366	11
366	24
366	39
366	12
366	13
367	1
367	35
367	19
367	29
367	6
367	30
367	8
367	9
367	21
367	24
367	7
367	27
367	12
367	13
368	14
368	4
368	50
368	29
368	32
368	10
368	11
368	24
368	55
368	51
368	39
368	12
368	13
368	48
369	14
369	59
369	4
369	35
369	19
369	28
369	6
369	30
369	31
369	9
369	21
369	10
369	26
369	23
369	24
369	25
369	27
369	12
369	13
370	14
370	2
370	3
370	4
370	15
370	18
370	19
370	28
370	29
370	31
370	36
370	9
370	21
370	32
370	10
370	44
370	33
370	26
370	24
370	38
370	23
370	27
370	12
370	13
371	14
371	2
371	4
371	35
371	15
371	41
371	18
371	19
371	28
371	29
371	31
371	36
371	37
371	21
371	32
371	10
371	44
371	33
371	11
371	23
371	26
371	54
371	12
371	13
372	1
372	2
372	35
372	19
372	28
372	6
372	30
372	9
372	10
372	33
372	11
372	12
372	13
372	48
373	14
373	2
373	3
373	22
373	59
373	5
373	17
373	15
373	40
373	7
373	30
373	32
373	10
373	33
373	11
373	12
374	1
374	2
374	4
374	19
374	28
374	6
374	9
374	43
374	33
374	24
374	12
375	1
375	2
375	3
375	4
375	35
375	5
375	49
375	15
375	16
375	19
375	28
375	6
375	7
375	30
375	37
375	32
375	43
375	21
375	42
375	44
375	10
375	47
375	33
375	11
375	12
375	13
376	14
376	2
376	15
376	19
376	6
376	7
376	8
376	9
376	21
376	10
376	11
376	24
376	38
376	52
376	26
376	12
376	13
376	48
377	1
377	2
377	3
377	59
377	4
377	35
377	15
377	18
377	19
377	28
377	6
377	30
377	21
377	32
377	10
377	33
377	11
377	24
377	38
377	12
377	13
378	14
378	2
378	15
378	19
378	29
378	7
378	30
378	41
378	9
378	32
378	10
378	33
378	11
378	26
378	23
378	24
378	51
378	34
378	12
378	13
379	14
379	19
379	29
379	7
379	30
379	37
379	10
379	11
379	24
379	23
379	27
379	12
380	1
380	2
380	4
380	35
380	15
380	16
380	18
380	19
380	5
380	28
380	29
380	30
380	31
380	9
380	20
380	32
380	44
380	33
380	11
380	22
380	26
380	23
380	24
380	12
381	14
381	2
381	3
381	4
381	35
381	5
381	15
381	18
381	19
381	28
381	29
381	31
381	36
381	9
381	37
381	20
381	21
381	10
381	25
381	38
381	24
381	12
381	13
382	14
382	2
382	3
382	4
382	35
382	19
382	5
382	28
382	6
382	7
382	8
382	9
382	21
382	32
382	10
382	11
382	23
382	24
382	38
382	48
383	14
383	2
383	4
383	15
383	16
383	18
383	19
383	28
383	6
383	30
383	9
383	11
383	26
383	23
383	54
383	24
383	12
383	13
384	14
384	35
384	6
384	7
385	14
385	40
385	28
385	6
385	30
385	9
385	10
385	24
385	52
385	12
385	13
385	48
386	1
386	2
386	3
386	4
386	35
386	15
386	16
386	18
386	49
386	5
386	29
386	7
386	30
386	41
386	31
386	36
386	8
386	9
386	20
386	37
386	43
386	21
386	32
386	10
386	44
386	33
386	11
386	27
386	12
386	13
387	1
387	45
387	2
387	3
387	59
387	4
387	15
387	16
387	18
387	19
387	5
387	28
387	29
387	6
387	7
387	41
387	31
387	36
387	9
387	20
387	37
387	42
387	43
387	21
387	32
387	47
387	10
387	44
387	27
387	12
388	14
388	2
388	4
388	35
388	15
388	19
388	28
388	29
388	30
388	8
388	32
388	10
388	44
388	33
388	11
388	26
388	24
388	38
388	51
388	12
388	48
389	14
389	28
389	6
389	10
389	24
389	12
389	13
390	14
390	35
390	19
390	6
390	7
390	41
390	30
390	9
390	37
390	21
390	10
390	11
390	39
390	26
390	23
390	24
390	12
390	13
391	1
391	2
391	3
391	15
391	18
391	19
391	5
391	6
391	7
391	30
391	21
391	11
391	26
391	24
391	38
391	12
392	14
392	59
392	34
392	20
392	18
392	5
392	58
392	28
392	29
392	6
392	41
392	30
392	31
392	8
392	9
392	32
392	21
392	42
392	10
392	33
392	11
392	22
392	27
392	12
392	13
393	1
393	35
393	19
393	28
393	29
393	30
393	24
393	27
393	12
393	13
393	48
394	1
394	2
394	3
394	4
394	35
394	40
394	19
394	41
394	5
394	28
394	6
394	9
394	20
394	10
394	26
394	23
394	38
394	24
394	12
394	13
395	14
395	2
395	3
395	4
395	35
395	15
395	19
395	5
395	29
395	7
395	30
395	31
395	37
395	43
395	32
395	10
395	44
395	33
395	11
395	24
395	51
395	12
395	13
396	14
396	2
396	22
396	4
396	35
396	19
396	15
396	28
396	6
396	30
396	9
396	21
396	10
396	11
396	24
396	25
396	12
397	14
397	2
397	3
397	35
397	15
397	16
397	19
397	5
397	28
397	29
397	30
397	31
397	9
397	21
397	33
397	23
397	24
397	39
397	27
397	12
397	13
397	48
398	1
398	19
398	28
398	29
398	21
398	10
398	23
398	38
398	12
399	14
399	2
399	59
399	4
399	15
399	18
399	5
399	28
399	6
399	7
399	30
399	31
399	9
399	11
399	23
399	24
399	55
399	38
399	12
400	1
400	2
400	3
400	4
400	35
400	15
400	16
400	40
400	5
400	41
400	6
400	7
400	30
400	10
400	11
400	24
400	12
400	13
401	14
401	2
401	4
401	35
401	15
401	19
401	28
401	29
401	30
401	9
401	23
401	24
401	12
401	13
402	14
402	2
402	3
402	34
402	20
402	4
402	35
402	15
402	16
402	19
402	5
402	28
402	29
402	30
402	41
402	31
402	37
402	10
402	11
402	26
402	23
402	24
402	38
402	12
403	14
403	2
403	3
403	4
403	35
403	16
403	19
403	5
403	28
403	29
403	31
403	36
403	9
403	32
403	47
403	10
403	26
403	23
403	24
403	38
403	27
403	12
403	13
404	14
404	2
404	3
404	4
404	35
404	15
404	18
404	19
404	5
404	28
404	29
404	30
404	31
404	11
404	26
404	23
404	24
404	52
404	12
405	1
405	2
405	3
405	4
405	35
405	16
405	19
405	41
405	28
405	6
405	7
405	30
405	31
405	37
405	10
405	11
405	39
405	26
405	38
405	24
405	12
405	13
406	1
406	2
406	3
406	35
406	15
406	5
406	6
406	7
406	30
406	37
406	32
406	10
406	44
406	33
406	11
406	54
406	24
406	57
406	12
406	13
406	48
407	14
407	2
407	4
407	28
407	6
407	30
407	31
407	9
407	12
408	1
408	2
408	3
408	22
408	4
408	20
408	35
408	5
408	41
408	17
408	46
408	28
408	29
408	6
408	7
408	30
408	8
408	9
408	37
408	32
408	21
408	44
408	10
408	47
408	33
408	11
408	27
408	12
408	13
409	14
409	28
409	30
409	12
409	13
410	62
410	63
410	14
410	2
410	4
410	7
410	30
410	31
410	9
410	26
410	12
410	13
411	1
411	2
411	4
411	35
411	15
411	19
411	6
411	7
411	30
411	9
411	37
411	43
411	21
411	10
411	24
411	38
411	39
411	12
411	13
412	1
412	2
412	3
412	4
412	19
412	15
412	16
412	18
412	49
412	50
412	28
412	29
412	31
412	36
412	8
412	60
412	9
412	26
412	24
412	25
412	52
412	27
412	12
413	14
413	2
413	3
413	4
413	15
413	18
413	19
413	5
413	28
413	6
413	31
413	20
413	42
413	21
413	10
413	33
413	11
413	23
413	24
413	38
413	27
413	12
414	1
414	2
414	3
414	4
414	35
414	15
414	16
414	19
414	5
414	6
414	30
414	31
414	9
414	37
414	20
414	10
414	11
414	22
414	26
414	23
414	24
414	53
414	48
415	14
415	2
415	3
415	4
415	5
415	19
415	28
415	6
415	30
415	9
415	32
415	10
415	33
415	11
415	26
415	24
415	12
415	13
416	14
416	2
416	20
416	4
416	35
416	15
416	19
416	28
416	29
416	30
416	8
416	32
416	10
416	44
416	33
416	11
416	26
416	24
416	38
416	51
416	12
416	48
417	14
417	2
417	3
417	22
417	34
417	59
417	4
417	20
417	35
417	5
417	41
417	28
417	29
417	6
417	30
417	31
417	9
417	32
417	21
417	42
417	10
417	33
417	11
417	27
417	12
417	13
418	1
418	2
418	3
418	4
418	5
418	41
418	17
418	15
418	16
418	18
418	19
418	29
418	6
418	7
418	30
418	8
418	9
418	20
418	32
418	10
418	11
418	22
418	57
418	23
418	25
418	12
418	13
419	14
419	2
419	4
419	19
419	28
419	6
419	30
419	9
419	21
419	10
419	33
419	26
419	23
419	24
419	38
419	48
420	14
420	2
420	3
420	4
420	35
420	40
420	19
420	5
420	28
420	29
420	31
420	36
420	9
420	32
420	47
420	10
420	26
420	23
420	24
420	38
420	27
420	12
420	13
421	14
421	2
421	3
421	59
421	34
421	4
421	15
421	18
421	19
421	5
421	28
421	29
421	30
421	31
421	36
421	9
421	21
421	10
421	44
421	33
421	11
421	26
421	23
421	54
421	24
421	12
422	1
422	2
422	3
422	4
422	35
422	19
422	28
422	6
422	30
422	20
422	10
422	11
422	23
422	24
422	48
423	1
423	2
423	4
423	35
423	15
423	16
423	18
423	19
423	5
423	29
423	30
423	31
423	9
423	20
423	37
423	42
423	43
423	32
423	10
423	44
423	33
423	11
423	12
424	14
424	2
424	3
424	35
424	5
424	50
424	41
424	28
424	29
424	31
424	36
424	60
424	32
424	26
424	23
424	24
424	38
424	27
424	12
425	14
425	19
425	28
425	29
425	24
425	26
426	14
426	2
426	4
426	28
426	29
426	30
426	31
426	10
426	11
426	7
426	12
426	13
427	1
427	2
427	3
427	4
427	35
427	15
427	16
427	19
427	5
427	28
427	6
427	30
427	9
427	20
427	21
427	10
427	33
427	11
427	24
427	7
427	53
427	38
427	12
427	13
428	1
428	2
428	4
428	35
428	19
428	6
428	7
428	30
428	20
428	32
428	11
428	22
428	34
428	39
428	38
428	56
428	24
428	12
428	13
429	1
429	2
429	3
429	22
429	4
429	20
429	35
429	5
429	41
429	17
429	50
429	29
429	6
429	7
429	30
429	8
429	9
429	37
429	32
429	21
429	44
429	10
429	47
429	33
429	11
429	12
429	13
430	14
430	2
430	3
430	4
430	28
430	6
430	30
430	12
430	13
431	14
431	2
431	4
431	35
431	15
431	16
431	17
431	18
431	19
431	28
431	6
431	30
431	31
431	36
431	9
431	21
431	32
431	11
431	26
431	24
431	38
431	39
431	12
432	14
432	2
432	3
432	4
432	35
432	16
432	19
432	28
432	6
432	30
432	31
432	9
432	20
432	10
432	33
432	11
432	22
432	26
432	24
432	23
432	12
432	13
433	14
433	28
433	6
433	30
433	8
433	9
433	20
433	10
433	11
433	24
433	12
433	13
434	1
434	2
434	3
434	4
434	35
434	5
434	16
434	19
434	28
434	6
434	9
434	10
434	24
434	23
434	12
435	1
435	2
435	3
435	59
435	4
435	5
435	28
435	6
435	7
435	30
435	8
435	37
435	32
435	10
435	33
435	11
435	26
435	27
435	12
435	13
436	14
436	2
436	15
436	28
436	6
436	9
436	11
436	12
436	13
437	14
437	19
437	28
437	29
437	31
437	9
437	26
437	24
437	38
437	12
438	1
438	2
438	41
438	16
438	40
438	19
438	5
438	28
438	6
438	30
438	37
438	42
438	10
438	11
438	25
438	24
438	12
439	14
439	2
439	3
439	59
439	4
439	16
439	19
439	5
439	28
439	29
439	41
439	31
439	36
439	37
439	42
439	43
439	21
439	32
439	47
439	10
439	11
439	23
439	38
439	27
439	12
440	1
440	2
440	19
440	28
440	6
440	30
440	9
440	10
440	26
440	23
440	24
440	12
440	13
441	1
441	2
441	22
441	3
441	4
441	15
441	16
441	40
441	18
441	19
441	5
441	29
441	41
441	31
441	9
441	20
441	32
441	10
441	44
441	33
441	11
441	26
441	23
441	27
441	12
441	13
442	14
442	2
442	4
442	35
442	15
442	19
442	28
442	29
442	31
442	9
442	37
442	32
442	10
442	33
442	22
442	26
442	24
442	51
442	34
442	12
442	13
443	14
443	2
443	4
443	28
443	29
443	31
443	9
443	10
443	33
443	26
443	12
443	13
444	14
444	2
444	4
444	35
444	19
444	28
444	6
444	9
444	10
444	12
444	13
445	14
445	2
445	3
445	34
445	4
445	35
445	16
445	19
445	15
445	5
445	28
445	6
445	30
445	31
445	9
445	32
445	21
445	10
445	47
445	33
445	23
445	24
445	26
445	12
445	13
446	14
446	2
446	3
446	4
446	35
446	15
446	16
446	18
446	19
446	28
446	6
446	30
446	31
446	9
446	20
446	37
446	43
446	32
446	10
446	44
446	33
446	11
446	22
446	12
447	1
447	2
447	3
447	4
447	35
447	16
447	15
447	18
447	19
447	5
447	28
447	29
447	7
447	31
447	36
447	8
447	9
447	20
447	37
447	43
447	32
447	47
447	44
447	10
447	33
447	11
447	27
447	12
447	13
448	1
448	2
448	4
448	15
448	18
448	19
448	28
448	29
448	30
448	37
448	21
448	10
448	11
448	24
448	25
448	7
448	38
448	12
448	13
448	48
449	1
449	2
449	3
449	4
449	35
449	19
449	28
449	6
449	7
449	30
449	9
449	37
449	20
449	32
449	10
449	33
449	11
449	34
449	39
449	26
449	12
449	13
450	14
450	2
450	3
450	59
450	4
450	35
450	5
450	41
450	40
450	28
450	29
450	31
450	36
450	9
450	37
450	32
450	21
450	10
450	44
450	33
450	11
450	51
450	24
450	12
450	13
451	14
451	2
451	3
451	4
451	35
451	15
451	16
451	18
451	49
451	28
451	6
451	41
451	30
451	31
451	9
451	10
451	33
451	11
451	22
451	26
451	24
451	53
451	23
451	38
451	12
451	13
452	1
452	2
452	4
452	7
452	9
452	37
452	20
452	32
452	10
452	44
452	11
452	23
452	12
452	13
453	14
453	40
453	19
453	28
453	6
453	24
453	12
453	13
454	14
454	2
454	4
454	35
454	15
454	19
454	28
454	29
454	6
454	30
454	31
454	9
454	20
454	21
454	32
454	10
454	44
454	33
454	11
454	26
454	24
454	27
454	12
454	48
455	1
455	2
455	4
455	19
455	28
455	29
455	9
455	24
455	12
456	14
456	2
456	19
456	28
456	6
456	9
456	11
456	24
456	38
456	12
456	13
456	48
457	1
457	2
457	19
457	7
457	30
457	37
457	20
457	10
457	44
457	11
457	22
457	26
457	24
457	25
457	12
458	1
458	2
458	3
458	4
458	19
458	5
458	28
458	6
458	31
458	9
458	10
458	23
458	24
458	25
458	12
459	1
459	2
459	3
459	4
459	35
459	15
459	19
459	5
459	41
459	28
459	29
459	31
459	9
459	20
459	11
459	26
459	27
459	12
459	13
460	1
460	2
460	3
460	59
460	4
460	35
460	15
460	19
460	5
460	46
460	41
460	29
460	30
460	9
460	20
460	43
460	21
460	10
460	24
460	23
460	38
460	12
460	13
461	14
461	45
461	2
461	3
461	34
461	4
461	35
461	15
461	16
461	18
461	19
461	28
461	29
461	31
461	36
461	9
461	20
461	21
461	32
461	10
461	33
461	11
461	26
461	23
461	54
461	12
461	13
461	48
462	1
462	2
462	3
462	22
462	4
462	5
462	6
462	7
462	30
462	9
462	37
462	42
462	10
462	33
462	11
462	12
462	13
463	14
463	2
463	15
463	49
463	6
463	7
463	9
463	32
463	10
463	11
463	23
463	24
463	12
464	14
464	2
464	4
464	15
464	19
464	6
464	7
464	30
464	8
464	9
464	10
464	11
464	23
464	24
464	12
464	13
465	14
465	2
465	4
465	28
465	9
465	11
465	23
465	12
466	1
466	2
466	4
466	28
466	29
466	6
466	31
466	9
466	26
466	24
466	25
466	38
466	27
466	12
467	14
467	2
467	4
467	35
467	19
467	28
467	6
467	21
467	10
467	11
467	24
467	38
467	12
467	13
467	48
468	14
468	35
468	19
468	28
468	9
468	11
468	23
468	12
469	14
469	2
469	4
469	35
469	15
469	18
469	19
469	28
469	6
469	7
469	30
469	8
469	9
469	10
469	26
469	24
469	12
469	13
470	1
470	2
470	3
470	34
470	4
470	35
470	15
470	16
470	18
470	19
470	49
470	28
470	29
470	30
470	41
470	31
470	9
470	32
470	21
470	10
470	33
470	11
470	22
470	26
470	24
470	38
470	12
470	13
471	1
471	2
471	4
471	5
471	28
471	29
471	31
471	9
471	42
471	21
471	10
471	23
471	24
471	25
471	38
471	12
472	14
472	45
472	2
472	3
472	34
472	4
472	35
472	15
472	16
472	18
472	19
472	28
472	29
472	31
472	36
472	9
472	20
472	21
472	32
472	10
472	33
472	11
472	23
472	24
472	38
472	12
472	48
473	1
473	2
473	3
473	4
473	15
473	16
473	18
473	19
473	5
473	6
473	7
473	30
473	31
473	9
473	20
473	37
473	42
473	43
473	32
473	10
473	33
473	11
473	22
473	27
473	12
473	13
473	48
474	14
474	2
474	3
474	4
474	35
474	15
474	16
474	18
474	19
474	49
474	5
474	28
474	6
474	41
474	30
474	31
474	9
474	10
474	33
474	11
474	22
474	26
474	24
474	53
474	23
474	38
474	12
474	13
474	48
475	14
475	2
475	35
475	15
475	19
475	28
475	6
475	30
475	31
475	9
475	21
475	10
475	44
475	33
475	11
475	26
475	24
475	23
475	27
475	12
476	14
476	45
476	2
476	3
476	34
476	4
476	35
476	15
476	16
476	18
476	19
476	28
476	29
476	31
476	36
476	9
476	20
476	21
476	32
476	10
476	33
476	11
476	26
476	23
476	54
476	12
476	13
476	48
477	14
477	45
477	2
477	3
477	59
477	34
477	4
477	15
477	16
477	18
477	19
477	28
477	29
477	31
477	36
477	9
477	20
477	21
477	32
477	10
477	33
477	11
477	23
477	24
477	38
477	12
477	48
478	14
478	2
478	15
478	41
478	28
478	29
478	6
478	7
478	30
478	10
478	11
478	23
478	24
478	27
478	12
478	13
479	14
479	45
479	2
479	3
479	34
479	4
479	35
479	15
479	16
479	18
479	19
479	28
479	29
479	31
479	36
479	9
479	20
479	21
479	32
479	10
479	33
479	11
479	23
479	24
479	38
479	12
479	48
480	14
480	2
480	4
480	35
480	15
480	19
480	29
480	7
480	41
480	30
480	31
480	9
480	20
480	21
480	32
480	10
480	44
480	11
480	26
480	24
480	27
480	12
481	14
481	2
481	15
481	41
481	28
481	29
481	6
481	7
481	30
482	14
482	2
482	4
482	15
482	19
482	28
482	6
482	30
482	9
482	10
482	11
482	22
482	23
482	24
482	12
483	14
483	45
483	2
483	3
483	34
483	4
483	35
483	15
483	16
483	18
483	19
483	28
483	29
483	31
483	36
483	9
483	20
483	21
483	32
483	10
483	11
483	23
483	26
483	54
483	24
483	12
483	13
483	48
484	14
484	2
484	4
484	35
484	15
484	16
484	18
484	19
484	6
484	7
484	30
484	9
484	21
484	47
484	10
484	11
484	26
484	23
484	38
484	12
485	14
485	45
485	2
485	3
485	34
485	4
485	35
485	15
485	16
485	18
485	19
485	28
485	29
485	31
485	36
485	9
485	20
485	21
485	32
485	10
485	11
485	23
485	26
485	54
485	24
485	12
485	13
485	48
486	14
486	2
486	4
486	35
486	15
486	16
486	40
486	18
486	19
486	41
486	28
486	6
486	31
486	9
486	20
486	37
486	43
486	10
486	11
486	26
486	23
486	24
486	57
486	12
487	14
487	2
487	28
487	6
487	9
487	33
487	26
487	24
487	12
487	13
488	1
488	2
488	4
488	28
488	6
488	30
488	9
488	37
488	10
488	11
488	12
488	13
489	1
489	2
489	3
489	4
489	19
489	5
489	28
489	29
489	31
489	36
489	9
489	21
489	47
489	10
489	23
489	24
489	25
489	52
489	12
490	14
490	45
490	2
490	3
490	34
490	4
490	35
490	15
490	16
490	18
490	19
490	28
490	29
490	31
490	36
490	9
490	20
490	21
490	32
490	10
490	11
490	23
490	26
490	54
490	24
490	12
490	13
490	48
491	1
491	2
491	4
491	35
491	15
491	19
491	16
491	28
491	6
491	30
491	9
491	20
491	37
491	32
491	21
491	10
491	11
491	24
491	12
491	13
492	1
492	19
492	28
492	6
492	9
492	21
492	10
492	26
492	24
492	12
492	13
493	1
493	2
493	3
493	4
493	19
493	5
493	28
493	6
493	31
493	9
493	10
493	23
493	24
493	25
493	12
494	14
494	45
494	2
494	3
494	59
494	4
494	35
494	15
494	16
494	18
494	19
494	28
494	41
494	31
494	36
494	9
494	32
494	21
494	47
494	33
494	11
494	23
494	24
494	38
494	27
494	12
494	13
494	48
495	1
495	2
495	4
495	35
495	15
495	19
495	28
495	29
495	6
495	30
495	9
495	20
495	21
495	10
495	33
495	11
495	22
495	24
495	56
495	39
495	27
495	12
495	13
496	14
496	2
496	4
496	35
496	15
496	19
496	28
496	29
496	6
496	31
496	9
496	20
496	21
496	10
496	44
496	33
496	11
496	26
496	24
496	27
496	12
497	14
497	45
497	2
497	3
497	34
497	4
497	35
497	15
497	16
497	18
497	19
497	28
497	29
497	31
497	36
497	9
497	20
497	21
497	32
497	10
497	33
497	11
497	26
497	23
497	54
497	12
497	13
497	48
498	1
498	2
498	3
498	34
498	4
498	35
498	15
498	18
498	19
498	5
498	16
498	28
498	6
498	30
498	41
498	9
498	37
498	21
498	32
498	10
498	44
498	33
498	11
498	26
498	24
498	12
498	13
499	14
499	2
499	3
499	4
499	35
499	15
499	19
499	5
499	28
499	29
499	31
499	9
499	37
499	43
499	21
499	10
499	33
499	11
499	26
499	23
499	24
499	27
499	12
499	13
500	1
500	2
500	3
500	4
500	19
500	5
500	15
500	6
500	7
500	30
500	9
500	26
500	23
500	54
500	24
500	12
500	13
501	1
501	2
501	3
501	4
501	35
501	5
501	17
501	19
501	16
501	28
501	29
501	31
501	36
501	9
501	20
501	32
501	42
501	44
501	10
501	33
501	11
501	34
501	26
501	12
502	1
502	2
502	3
502	20
502	4
502	35
502	19
502	5
502	46
502	61
502	29
502	6
502	7
502	30
502	41
502	31
502	36
502	9
502	37
502	10
502	44
502	33
502	11
502	22
502	23
502	24
502	12
502	13
503	1
503	2
503	3
503	4
503	35
503	16
503	19
503	5
503	28
503	29
503	30
503	31
503	9
503	20
503	21
503	32
503	44
503	33
503	11
503	26
503	23
503	24
503	27
503	12
503	13
503	48
504	1
504	2
504	4
504	35
504	19
504	15
504	28
504	6
504	30
504	9
504	21
504	10
504	33
504	38
504	24
504	26
504	23
504	39
504	13
504	12
505	1
505	2
505	3
505	4
505	35
505	16
505	19
505	49
505	5
505	29
505	6
505	7
505	41
505	31
505	36
505	9
505	20
505	37
505	42
505	43
505	21
505	32
505	47
505	10
505	44
505	12
505	13
505	48
506	1
506	2
506	3
506	4
506	35
506	5
506	17
506	15
506	16
506	18
506	19
506	28
506	29
506	31
506	9
506	37
506	20
506	32
506	21
506	44
506	10
506	33
506	11
506	23
506	12
507	1
507	45
507	2
507	3
507	4
507	35
507	15
507	16
507	17
507	18
507	19
507	28
507	29
507	41
507	31
507	36
507	9
507	37
507	20
507	32
507	43
507	21
507	42
507	44
507	10
507	47
507	27
507	12
507	13
508	1
508	2
508	3
508	4
508	5
508	41
508	16
508	19
508	28
508	29
508	31
508	36
508	9
508	20
508	32
508	43
508	42
508	44
508	11
508	23
508	38
508	12
509	1
509	2
509	4
509	28
509	6
509	9
509	24
509	25
509	12
510	1
510	2
510	4
510	19
510	28
510	6
510	30
510	9
510	20
510	10
510	11
510	23
510	25
510	24
510	12
510	13
511	14
511	2
511	28
511	29
511	6
511	31
511	36
511	9
511	44
511	11
511	26
511	24
511	38
511	52
511	27
511	12
511	13
511	48
512	1
512	2
512	4
512	35
512	19
512	28
512	6
512	31
512	9
512	20
512	10
512	11
512	24
512	38
512	52
512	12
512	13
513	1
513	2
513	3
513	4
513	35
513	15
513	16
513	17
513	19
513	28
513	6
513	7
513	41
513	30
513	8
513	36
513	9
513	37
513	20
513	32
513	43
513	21
513	42
513	44
513	10
513	47
513	12
513	13
514	14
514	2
514	4
514	15
514	30
514	32
514	10
514	33
514	24
514	26
514	7
514	12
515	1
515	2
515	3
515	4
515	28
515	6
515	9
515	11
515	12
516	1
516	2
516	3
516	4
516	15
516	19
516	28
516	6
516	30
516	31
516	9
516	20
516	32
516	21
516	44
516	10
516	33
516	11
516	22
516	34
516	12
517	14
517	2
517	3
517	4
517	35
517	16
517	19
517	5
517	29
517	31
517	20
517	37
517	10
517	11
517	23
517	24
517	7
517	38
517	12
517	13
518	1
518	2
518	3
518	4
518	35
518	15
518	19
518	6
518	7
518	30
518	9
518	37
518	21
518	10
518	24
518	25
518	38
518	12
518	13
518	48
519	14
519	2
519	4
519	35
519	19
519	6
519	7
519	30
519	8
519	9
519	32
519	21
519	10
519	33
519	11
519	22
519	23
519	12
519	13
520	1
520	2
520	3
520	4
520	35
520	15
520	16
520	18
520	19
520	5
520	28
520	29
520	31
520	9
520	37
520	21
520	32
520	10
520	33
520	11
520	26
520	23
520	24
520	12
521	14
521	2
521	3
521	4
521	35
521	15
521	16
521	18
521	19
521	5
521	28
521	29
521	30
521	31
521	9
521	37
521	32
521	10
521	33
521	11
521	26
521	23
521	24
521	25
522	1
522	2
522	3
522	4
522	35
522	19
522	5
522	28
522	29
522	31
522	36
522	9
522	37
522	42
522	21
522	32
522	10
522	44
522	33
522	11
522	22
522	12
523	14
523	45
523	2
523	3
523	34
523	4
523	35
523	5
523	17
523	19
523	15
523	28
523	29
523	31
523	36
523	9
523	20
523	32
523	43
523	21
523	42
523	44
523	10
523	47
523	33
523	27
523	12
523	13
523	48
524	14
524	2
524	3
524	4
524	5
524	58
524	28
524	29
524	8
524	9
524	37
524	32
524	43
524	21
524	42
524	44
524	10
524	47
524	33
524	27
524	12
524	13
525	14
525	2
525	3
525	4
525	5
525	49
525	17
525	16
525	41
525	28
525	29
525	31
525	36
525	9
525	20
525	32
525	21
525	42
525	44
525	10
525	33
525	11
525	23
525	27
525	12
525	13
526	1
526	2
526	3
526	22
526	59
526	4
526	35
526	5
526	41
526	49
526	17
526	28
526	29
526	30
526	31
526	36
526	9
526	20
526	32
526	42
526	21
526	44
526	10
526	33
526	11
526	27
526	12
526	13
527	1
527	2
527	4
527	35
527	19
527	28
527	6
527	30
527	9
527	21
527	24
527	39
527	38
527	23
527	12
527	13
528	1
528	2
528	3
528	4
528	35
528	15
528	16
528	19
528	5
528	28
528	29
528	31
528	36
528	9
528	20
528	37
528	32
528	43
528	10
528	44
528	11
528	22
528	24
528	12
529	14
529	45
529	2
529	3
529	4
529	35
529	16
529	18
529	19
529	5
529	15
529	28
529	29
529	31
529	36
529	9
529	20
529	37
529	42
529	21
529	32
529	43
529	10
529	44
529	33
529	12
529	13
530	14
530	2
530	3
530	4
530	5
530	58
530	19
530	29
530	7
530	31
530	36
530	60
530	9
530	42
530	21
530	33
530	11
530	23
530	54
530	25
530	38
531	1
531	2
531	3
531	4
531	35
531	5
531	17
531	19
531	29
531	7
531	31
531	9
531	37
531	20
531	32
531	21
531	44
531	10
531	33
531	11
531	34
531	12
532	14
532	2
532	3
532	22
532	4
532	35
532	15
532	16
532	19
532	5
532	49
532	28
532	29
532	31
532	36
532	9
532	37
532	20
532	43
532	32
532	10
532	44
532	33
532	11
532	26
532	12
532	13
533	1
533	45
533	2
533	3
533	20
533	4
533	35
533	16
533	19
533	5
533	28
533	29
533	31
533	36
533	9
533	37
533	43
533	32
533	10
533	33
533	11
533	22
533	26
533	27
533	12
533	13
534	1
534	2
534	3
534	34
534	4
534	35
534	5
534	19
534	16
534	28
534	29
534	31
534	36
534	9
534	20
534	32
534	21
534	10
534	11
534	24
534	38
534	23
534	12
534	13
535	1
535	2
535	4
535	35
535	16
535	19
535	28
535	6
535	31
535	9
535	10
535	11
535	26
535	23
535	24
535	38
535	34
535	12
535	13
536	14
536	2
536	3
536	4
536	35
536	5
536	17
536	15
536	16
536	18
536	19
536	28
536	29
536	31
536	36
536	9
536	37
536	20
536	32
536	21
536	44
536	10
536	33
536	11
536	53
536	27
536	12
536	13
537	14
537	45
537	28
537	36
537	9
538	14
538	2
538	3
538	4
538	49
538	29
538	7
538	31
538	9
538	23
538	24
538	38
538	12
539	1
539	2
539	3
539	4
539	15
539	17
539	18
539	19
539	49
539	28
539	29
539	31
539	36
539	9
539	20
539	42
539	21
539	32
539	44
539	33
539	11
539	22
539	26
539	27
539	12
539	48
540	1
540	2
540	3
540	4
540	5
540	28
540	29
540	41
540	31
540	36
540	9
540	37
540	20
540	32
540	21
540	42
540	44
540	33
540	11
540	22
540	27
540	12
540	13
541	1
541	2
541	3
541	4
541	20
541	41
541	17
541	19
541	28
541	6
541	7
541	30
541	8
541	9
541	37
541	32
541	21
541	10
541	33
541	11
541	51
541	13
542	1
542	2
542	6
542	7
542	30
542	9
542	21
542	23
542	12
543	14
543	45
543	2
543	3
543	20
543	4
543	15
543	16
543	19
543	5
543	28
543	29
543	41
543	31
543	36
543	9
543	21
543	44
543	33
543	11
543	23
543	26
543	38
543	34
543	57
543	12
543	13
544	14
544	2
544	3
544	59
544	4
544	35
544	15
544	16
544	18
544	19
544	5
544	6
544	7
544	30
544	31
544	9
544	37
544	21
544	32
544	10
544	44
544	33
544	11
544	22
544	26
544	12
544	13
545	1
545	2
545	3
545	4
545	20
545	28
545	29
545	36
545	9
545	32
545	42
545	44
545	33
545	11
545	34
545	12
545	13
546	1
546	2
546	3
546	4
546	5
546	15
546	18
546	19
546	28
546	29
546	30
546	31
546	9
546	20
546	10
546	33
546	11
546	22
546	12
546	13
547	14
547	45
547	2
547	3
547	22
547	4
547	35
547	15
547	19
547	5
547	18
547	28
547	29
547	31
547	36
547	9
547	20
547	42
547	32
547	10
547	44
547	33
547	11
547	24
547	12
547	13
547	48
548	1
548	2
548	3
548	4
548	35
548	19
548	28
548	29
548	30
548	31
548	9
548	37
548	20
548	32
548	21
548	44
548	10
548	47
548	33
548	11
548	12
548	13
549	1
549	2
549	3
549	4
549	35
549	15
549	19
549	40
549	41
549	28
549	6
549	30
549	9
549	37
549	21
549	10
549	25
549	24
549	12
549	13
550	14
550	2
550	3
550	4
550	29
550	6
550	7
550	30
550	8
550	32
550	10
550	11
550	48
551	1
551	2
551	3
551	4
551	35
551	15
551	16
551	19
551	5
551	29
551	7
551	30
551	31
551	8
551	9
551	37
551	20
551	43
551	32
551	10
551	11
551	22
551	23
551	24
551	12
552	14
552	2
552	3
552	4
552	5
552	15
552	19
552	29
552	31
552	9
552	20
552	32
552	21
552	10
552	11
552	24
552	52
552	27
552	48
553	14
553	45
553	2
553	3
553	4
553	15
553	19
553	5
553	28
553	29
553	36
553	9
553	20
553	21
553	11
553	22
553	23
553	27
553	12
554	1
554	2
554	3
554	4
554	35
554	5
554	15
554	16
554	18
554	19
554	28
554	29
554	30
554	31
554	9
554	20
554	32
554	42
554	21
554	10
554	11
554	22
554	34
554	23
554	12
555	14
555	2
555	15
555	19
555	28
555	6
555	30
555	31
555	9
555	32
555	21
555	10
555	11
555	54
555	12
555	13
556	14
556	45
556	2
556	3
556	4
556	15
556	19
556	5
556	28
556	29
556	36
556	9
556	20
556	21
556	11
556	22
556	23
556	27
556	12
557	14
557	2
557	4
557	15
557	19
557	6
557	7
557	9
557	20
557	43
557	11
557	24
557	12
558	14
558	2
558	3
558	4
558	5
558	15
558	19
558	28
558	29
558	9
558	21
558	10
558	11
558	39
558	24
558	48
559	14
559	2
559	4
559	15
559	16
559	6
559	7
559	30
559	23
559	24
559	12
560	1
560	2
560	3
560	4
560	15
560	18
560	19
560	29
560	7
560	30
560	31
560	9
560	20
560	37
560	43
560	10
560	44
560	11
560	22
560	26
560	23
560	48
561	14
561	2
561	3
561	4
561	35
561	5
561	15
561	16
561	19
561	28
561	29
561	31
561	9
561	20
561	32
561	21
561	10
561	11
561	24
561	52
561	27
561	48
562	1
562	45
562	2
562	3
562	4
562	35
562	5
562	15
562	16
562	18
562	19
562	29
562	7
562	31
562	36
562	9
562	20
562	32
562	44
562	10
562	11
562	22
562	34
562	23
562	27
562	13
563	14
563	2
563	35
563	19
563	6
563	7
563	30
563	9
563	37
563	10
563	26
563	51
563	12
563	13
564	1
564	2
564	3
564	4
564	15
564	16
564	18
564	19
564	5
564	28
564	29
564	30
564	31
564	9
564	20
564	42
564	21
564	32
564	11
564	22
564	34
564	23
564	12
565	14
565	2
565	3
565	34
565	4
565	35
565	41
565	58
565	50
565	16
565	19
565	28
565	29
565	30
565	31
565	9
565	21
565	10
565	23
565	38
565	24
565	12
565	13
566	1
566	2
566	3
566	4
566	35
566	15
566	16
566	19
566	28
566	29
566	41
566	31
566	36
566	9
566	20
566	37
566	21
566	32
566	10
566	33
566	11
566	26
566	23
566	27
566	12
566	13
567	1
567	45
567	2
567	3
567	34
567	4
567	35
567	15
567	16
567	19
567	5
567	28
567	29
567	31
567	9
567	20
567	32
567	44
567	33
567	11
567	22
567	26
567	23
567	24
567	48
568	1
568	2
568	3
568	4
568	35
568	15
568	16
568	18
568	19
568	5
568	29
568	7
568	41
568	31
568	36
568	9
568	20
568	21
568	10
568	33
568	11
568	22
568	26
568	23
568	24
568	12
568	48
569	1
569	2
569	3
569	4
569	35
569	15
569	16
569	18
569	19
569	5
569	29
569	6
569	7
569	30
569	31
569	36
569	8
569	9
569	20
569	21
569	32
569	10
569	44
569	11
569	22
569	26
569	24
569	27
569	12
569	13
569	48
570	14
570	2
570	3
570	4
570	35
570	15
570	18
570	19
570	28
570	29
570	30
570	31
570	9
570	42
570	21
570	11
570	22
570	26
570	23
570	24
570	38
570	39
570	27
570	12
570	13
571	14
571	2
571	3
571	4
571	35
571	5
571	19
571	18
571	15
571	28
571	29
571	31
571	36
571	9
571	20
571	32
571	21
571	10
571	33
571	11
571	22
571	26
571	23
571	27
571	12
571	13
572	14
572	2
572	34
572	20
572	15
572	16
572	18
572	5
572	6
572	7
572	8
572	10
572	44
572	33
572	24
572	51
572	48
573	1
573	2
573	3
573	4
573	19
573	5
573	6
573	7
573	30
573	21
573	32
573	10
573	26
573	23
573	24
573	25
573	38
573	51
573	52
573	48
574	14
574	2
574	3
574	4
574	6
574	31
574	20
574	21
574	10
574	11
574	38
574	24
574	25
574	12
575	1
575	2
575	3
575	4
575	35
575	15
575	16
575	18
575	19
575	5
575	28
575	29
575	30
575	31
575	36
575	9
575	37
575	20
575	32
575	21
575	44
575	10
575	33
575	11
575	23
575	12
575	48
576	1
576	2
576	3
576	34
576	4
576	35
576	15
576	16
576	19
576	5
576	28
576	29
576	31
576	9
576	20
576	32
576	44
576	33
576	11
576	22
576	26
576	23
576	24
576	48
577	1
577	2
577	3
577	4
577	5
577	7
577	9
577	21
577	10
577	23
577	38
577	52
577	26
577	12
578	1
578	45
578	2
578	3
578	35
578	15
578	16
578	17
578	5
578	28
578	29
578	41
578	31
578	36
578	9
578	20
578	44
578	11
578	22
578	23
578	57
578	38
578	52
578	24
578	12
579	14
579	2
579	4
579	29
579	6
579	30
579	8
579	9
579	37
579	32
579	48
580	14
580	2
580	4
580	6
580	9
580	10
580	11
580	38
580	12
581	1
581	45
581	2
581	3
581	34
581	4
581	20
581	5
581	41
581	15
581	16
581	28
581	29
581	31
581	36
581	9
581	32
581	21
581	23
581	27
581	13
581	48
582	1
582	45
582	2
582	3
582	4
582	35
582	5
582	15
582	16
582	18
582	19
582	29
582	7
582	31
582	36
582	9
582	20
582	32
582	44
582	10
582	11
582	22
582	34
582	23
582	27
582	13
583	64
583	1
583	2
583	3
583	22
583	34
583	59
583	4
583	5
583	17
583	58
583	28
583	29
583	7
583	41
583	31
583	36
583	9
583	37
583	20
583	32
583	21
583	44
583	10
583	33
583	11
583	27
583	12
583	13
584	14
584	2
584	3
584	4
584	35
584	5
584	15
584	16
584	19
584	29
584	7
584	31
584	9
584	20
584	32
584	21
584	10
584	11
584	24
584	52
584	27
584	48
585	1
585	2
585	3
585	34
585	5
585	49
585	15
585	16
585	19
585	28
585	6
585	30
585	31
585	9
585	32
585	21
585	23
585	27
585	13
585	48
586	1
586	2
586	4
586	15
586	19
586	28
586	6
586	30
586	9
586	32
586	21
586	10
586	24
586	48
587	1
587	2
587	3
587	4
587	5
587	16
587	15
587	18
587	19
587	29
587	7
587	30
587	31
587	9
587	37
587	32
587	10
587	33
587	11
587	23
587	24
587	38
587	12
587	48
588	14
588	2
588	3
588	59
588	34
588	4
588	35
588	15
588	16
588	18
588	19
588	28
588	29
588	6
588	7
588	30
588	41
588	31
588	36
588	9
588	37
588	42
588	43
588	21
588	32
588	47
588	10
588	44
588	33
588	12
588	13
589	14
589	2
589	3
589	4
589	35
589	5
589	15
589	19
589	6
589	7
589	31
589	8
589	9
589	21
589	10
589	11
589	39
589	24
589	48
590	1
590	2
590	4
590	35
590	15
590	19
590	6
590	7
590	30
590	21
590	10
590	11
590	12
590	13
591	14
591	2
591	3
591	4
591	5
591	15
591	16
591	19
591	28
591	29
591	31
591	36
591	9
591	32
591	21
591	11
591	7
591	34
591	13
592	14
592	2
592	35
592	15
592	19
592	28
592	29
592	30
592	31
592	9
592	21
592	10
592	11
592	7
592	13
593	14
593	45
593	2
593	3
593	4
593	15
593	16
593	18
593	19
593	5
593	28
593	29
593	31
593	36
593	9
593	20
593	37
593	42
593	21
593	32
593	43
593	10
593	44
593	33
593	12
593	13
594	14
594	2
594	3
594	34
594	59
594	4
594	20
594	35
594	18
594	17
594	15
594	28
594	29
594	31
594	36
594	9
594	43
594	32
594	21
594	10
594	44
594	33
594	11
594	12
595	1
595	2
595	3
595	4
595	5
595	41
595	28
595	29
595	31
595	9
595	20
595	32
595	10
595	47
595	33
595	11
595	12
596	1
596	2
596	3
596	4
596	35
596	5
596	19
596	50
596	15
596	16
596	18
596	29
596	7
596	30
596	31
596	36
596	9
596	32
596	21
596	10
596	11
596	39
596	24
596	48
597	1
597	2
597	3
597	4
597	35
597	5
597	49
597	15
597	16
597	18
597	28
597	29
597	41
597	31
597	36
597	9
597	20
597	32
597	21
597	44
597	10
597	11
597	22
597	34
597	7
597	27
597	12
597	13
598	14
598	4
598	19
598	28
598	29
598	6
598	9
598	10
598	11
598	55
598	23
598	24
598	7
598	12
599	1
599	2
599	34
599	59
599	4
599	5
599	50
599	15
599	18
599	19
599	16
599	28
599	29
599	30
599	41
599	31
599	9
599	32
599	33
599	39
599	23
599	26
599	27
599	12
600	14
600	2
600	3
600	4
600	35
600	19
600	5
600	15
600	16
600	28
600	6
600	30
600	9
600	20
600	37
600	32
600	42
600	10
600	44
600	33
600	11
600	22
600	12
600	13
601	1
601	2
601	4
601	35
601	15
601	18
601	19
601	6
601	7
601	30
601	41
601	9
601	10
601	24
601	34
601	12
602	1
602	2
602	4
602	35
602	19
602	29
602	7
602	8
602	9
602	20
602	47
602	10
602	11
602	23
602	24
602	27
602	12
602	13
603	1
603	2
603	3
603	4
603	15
603	18
603	49
603	5
603	28
603	7
603	30
603	31
603	9
603	21
603	10
603	11
603	26
603	24
603	12
604	1
604	2
604	4
604	15
604	18
604	19
604	6
604	7
604	30
604	8
604	21
604	10
604	11
604	24
604	38
604	12
605	14
605	28
605	6
605	30
605	10
605	24
606	1
606	2
606	3
606	34
606	4
606	35
606	15
606	16
606	19
606	5
606	17
606	28
606	29
606	30
606	41
606	31
606	36
606	9
606	20
606	37
606	21
606	32
606	43
606	42
606	47
606	10
606	33
606	27
606	12
606	13
606	48
607	1
607	2
607	3
607	4
607	35
607	19
607	15
607	16
607	5
607	49
607	29
607	6
607	7
607	41
607	30
607	31
607	36
607	9
607	20
607	32
607	42
607	44
607	10
607	33
607	11
607	22
607	26
607	12
607	13
607	48
608	1
608	35
608	19
608	28
608	6
608	30
608	9
608	10
608	23
608	38
608	12
608	13
609	1
609	2
609	3
609	4
609	15
609	18
609	19
609	5
609	28
609	6
609	30
609	9
609	20
609	37
609	32
609	21
609	10
609	44
609	33
609	11
609	22
609	27
609	12
609	13
610	14
610	2
610	3
610	4
610	58
610	28
610	6
610	7
610	30
610	9
610	32
610	10
610	33
610	11
610	34
610	12
610	13
611	1
611	4
611	28
611	6
611	30
611	21
611	23
611	24
611	12
612	14
612	35
612	40
612	19
612	28
612	6
612	9
612	21
612	10
612	47
612	39
612	54
612	23
612	24
612	27
612	12
612	13
613	1
613	2
613	3
613	4
613	35
613	5
613	15
613	19
613	46
613	28
613	6
613	30
613	31
613	9
613	21
613	10
613	22
613	38
613	24
613	39
613	23
613	54
613	55
613	27
613	12
613	13
613	48
614	14
614	2
614	35
614	19
614	28
614	6
614	30
614	9
614	21
614	32
614	10
614	33
614	54
614	26
614	24
614	38
614	39
614	12
615	14
615	35
615	19
615	28
615	9
615	21
615	32
615	10
615	11
615	23
615	24
615	12
616	14
616	45
616	2
616	3
616	34
616	4
616	15
616	16
616	19
616	5
616	17
616	28
616	29
616	30
616	41
616	31
616	36
617	14
617	40
617	19
617	6
617	30
617	37
617	11
617	24
617	12
618	14
618	40
618	28
618	6
618	24
619	1
619	35
619	19
619	28
619	6
620	1
620	2
620	3
620	4
620	15
620	19
620	6
620	7
620	30
620	9
620	10
620	11
620	24
620	12
620	13
621	1
621	28
621	6
621	30
621	9
621	21
621	10
621	38
621	12
621	13
622	14
622	35
622	40
622	28
622	29
622	6
622	30
622	21
622	32
622	47
622	33
622	11
622	23
622	26
622	24
622	25
622	38
622	27
622	12
622	13
623	1
623	6
623	8
623	9
623	32
623	24
623	25
623	7
623	12
624	14
624	2
624	4
624	6
624	7
624	30
624	31
624	36
624	11
624	12
625	1
625	35
625	19
625	28
625	29
625	30
625	9
625	32
625	10
625	11
625	12
625	13
626	14
626	2
626	4
626	15
626	40
626	41
626	28
626	29
626	6
626	7
626	30
626	9
626	21
626	32
626	47
626	10
626	33
626	11
626	22
626	26
626	24
626	12
626	13
627	1
627	2
627	15
627	16
627	18
627	6
627	30
627	9
627	43
627	11
627	22
627	24
627	38
627	34
627	12
627	13
628	1
628	2
628	3
628	4
628	35
628	19
628	28
628	6
628	30
628	9
628	21
628	10
628	23
628	38
628	26
628	24
628	12
628	13
629	1
629	2
629	4
629	35
629	15
629	18
629	19
629	5
629	29
629	6
629	30
629	41
629	31
629	9
629	32
629	33
629	11
629	26
629	24
629	38
629	27
629	12
629	13
630	1
630	2
630	28
630	6
630	30
630	11
630	12
631	1
631	2
631	22
631	4
631	35
631	7
631	30
631	9
631	21
631	32
631	10
631	11
631	23
631	24
631	25
631	12
631	48
632	1
632	2
632	3
632	4
632	35
632	19
632	28
632	6
632	30
632	9
632	10
632	33
632	11
632	26
632	23
632	24
632	12
633	14
633	2
633	4
633	15
633	16
633	17
633	19
633	28
633	6
633	30
633	9
633	21
633	10
633	26
633	23
633	24
633	25
633	38
633	51
633	27
633	12
633	13
634	1
634	28
634	6
634	9
634	27
635	1
635	2
635	15
635	19
635	6
635	7
635	30
635	41
635	31
635	8
635	32
635	21
635	10
635	44
635	47
635	33
635	11
635	22
635	26
635	12
635	13
635	48
636	14
636	2
636	35
636	19
636	6
636	30
636	11
636	24
636	12
637	1
637	2
637	3
637	4
637	15
637	18
637	19
637	6
637	7
637	30
637	9
637	20
637	37
637	42
637	21
637	10
637	11
637	22
637	24
637	12
637	48
638	14
638	2
638	4
638	6
638	9
638	37
638	32
638	10
638	11
638	26
638	51
638	56
638	34
639	14
639	45
639	2
639	3
639	4
639	5
639	28
639	29
639	31
639	9
639	32
639	21
639	42
639	10
639	11
639	34
639	27
639	12
639	13
640	14
640	35
640	19
640	28
640	6
640	30
640	9
640	20
640	47
640	10
640	11
640	26
640	23
640	24
640	38
641	1
641	2
641	35
641	15
641	18
641	19
641	6
641	7
641	30
641	20
641	32
641	10
641	11
641	24
641	53
641	38
641	48
642	1
642	2
642	3
642	4
642	35
642	15
642	19
642	7
642	30
642	9
642	37
642	20
642	32
642	10
642	33
642	11
642	26
642	24
643	1
643	35
643	6
643	7
643	30
643	9
643	10
643	12
643	13
644	14
644	19
644	6
644	24
644	12
645	1
645	2
645	3
645	4
645	15
645	18
645	28
645	29
645	31
645	9
645	20
645	10
645	11
645	23
645	24
645	12
646	14
646	2
646	4
646	28
646	29
646	9
646	21
646	23
646	54
646	39
646	26
646	27
646	12
646	13
646	48
647	1
647	2
647	4
647	15
647	18
647	7
647	30
647	8
647	9
647	20
647	11
647	22
647	24
647	12
647	13
647	48
648	1
648	45
648	2
648	3
648	4
648	15
648	16
648	18
648	5
648	29
648	7
648	31
648	9
648	20
648	37
648	42
648	43
648	21
648	32
648	10
648	44
648	33
648	12
649	14
649	2
649	3
649	4
649	15
649	18
649	19
649	28
649	6
649	9
649	20
649	21
649	32
649	47
649	33
649	11
649	26
649	23
649	24
649	12
649	13
650	14
650	35
650	28
650	6
650	31
650	10
650	26
650	23
650	24
650	12
650	13
651	1
651	2
651	4
651	35
651	16
651	15
651	29
651	6
651	7
651	30
651	8
651	9
651	20
651	21
651	32
651	10
651	44
651	33
651	11
651	26
651	24
651	48
652	14
652	2
652	3
652	4
652	35
652	15
652	19
652	49
652	5
652	28
652	6
652	30
652	9
652	21
652	32
652	10
652	33
652	24
652	53
652	38
652	39
652	27
652	12
652	13
653	14
653	2
653	59
653	4
653	35
653	15
653	19
653	28
653	6
653	30
653	31
653	20
653	32
653	10
653	11
653	26
653	54
653	24
653	39
653	27
653	12
653	13
654	1
654	2
654	4
654	15
654	29
654	6
654	30
654	8
654	20
654	47
654	10
654	33
654	11
654	22
654	26
654	24
654	7
654	51
654	12
655	1
655	28
655	6
655	30
655	9
655	10
655	11
655	12
655	13
656	1
656	2
656	4
656	28
656	6
656	30
656	10
656	33
656	11
656	12
657	14
657	28
657	29
657	30
657	9
657	10
657	11
657	12
658	14
658	2
658	3
658	4
658	35
658	15
658	19
658	5
658	28
658	6
658	9
658	10
658	11
658	23
658	24
658	48
659	14
659	2
659	3
659	4
659	19
659	5
659	15
659	28
659	6
659	30
659	9
659	26
659	24
659	23
659	12
660	1
660	2
660	4
660	35
660	19
660	6
660	7
660	30
660	9
660	10
660	33
660	26
660	24
661	1
661	2
661	3
661	59
661	4
661	35
661	15
661	16
661	18
661	19
661	5
661	28
661	29
661	30
661	41
661	8
661	9
661	37
661	42
661	43
661	21
661	32
661	10
661	44
661	33
661	11
661	27
661	12
661	13
662	14
662	2
662	4
662	15
662	40
662	18
662	19
662	28
662	6
662	30
662	41
662	11
662	22
662	26
662	24
662	39
662	27
662	12
662	48
663	14
663	19
663	28
663	6
663	30
663	39
663	13
663	12
663	48
664	14
664	19
664	6
664	30
664	10
664	11
664	24
664	7
664	12
664	13
665	14
665	40
665	19
665	28
665	6
665	7
665	41
665	30
665	10
665	11
665	24
665	27
665	12
665	13
666	14
666	2
666	28
666	9
666	12
667	1
667	2
667	28
667	6
667	30
667	9
667	37
667	42
667	10
667	33
667	27
667	12
668	14
668	2
668	4
668	19
668	28
668	6
668	9
668	26
668	24
668	23
668	48
669	14
669	2
669	4
669	20
669	15
669	18
669	28
669	6
669	30
669	9
669	37
669	32
669	10
669	11
669	39
669	23
669	24
669	27
669	12
669	13
670	14
670	2
670	4
670	35
670	16
670	15
670	19
670	41
670	28
670	29
670	30
670	31
670	9
670	10
670	23
670	24
670	38
670	52
670	12
671	14
671	2
671	4
671	19
671	28
671	6
671	30
671	9
671	21
671	24
671	12
672	1
672	19
672	28
672	6
672	9
672	20
672	10
672	11
672	23
672	24
672	12
673	63
673	14
673	2
673	4
673	28
673	6
673	9
673	27
674	14
674	28
674	6
675	14
675	19
675	41
675	28
675	6
675	11
675	26
675	24
675	38
675	12
676	14
676	2
676	22
676	4
676	41
676	28
676	29
676	9
677	14
677	19
677	28
677	29
677	6
677	30
677	8
677	9
677	26
677	23
677	27
677	12
677	13
678	14
678	2
678	35
678	28
678	6
678	30
678	10
678	24
678	12
678	13
679	1
679	2
679	22
679	35
679	15
679	41
679	19
679	6
679	7
679	30
679	31
679	8
679	32
679	21
679	10
679	44
679	47
679	33
679	11
679	26
679	12
679	13
679	48
680	14
680	2
680	3
680	4
680	35
680	15
680	19
680	29
680	30
680	31
680	9
680	37
680	21
680	32
680	10
680	44
680	33
680	11
680	22
680	26
680	12
681	14
681	35
681	28
681	6
681	41
681	9
681	10
681	25
681	38
681	12
681	13
682	14
682	2
682	34
682	4
682	15
682	19
682	28
682	6
682	30
682	41
682	9
682	25
682	12
683	14
683	2
683	3
683	4
683	35
683	15
683	16
683	19
683	5
683	28
683	29
683	31
683	36
683	9
683	37
683	42
683	21
683	11
683	22
683	23
683	24
683	38
683	25
683	48
684	1
684	2
684	3
684	4
684	35
684	16
684	19
684	29
684	6
684	30
684	9
684	21
684	32
684	10
684	33
684	11
684	26
684	23
684	24
684	34
684	12
685	14
685	2
685	3
685	4
685	5
685	28
685	29
685	30
685	9
685	32
685	21
685	42
685	10
685	11
685	34
685	27
685	12
685	13
686	14
686	40
686	19
686	28
686	6
686	30
686	11
686	24
686	12
687	1
687	2
687	34
687	4
687	35
687	15
687	40
687	18
687	19
687	5
687	28
687	6
687	30
687	42
687	21
687	10
687	11
687	24
687	25
687	38
687	27
687	12
687	13
688	1
688	2
688	4
688	35
688	15
688	18
688	19
688	61
688	28
688	6
688	30
688	9
688	20
688	21
688	32
688	10
688	44
688	33
688	11
688	22
688	39
688	12
688	13
688	48
689	1
689	2
689	3
689	4
689	15
689	18
689	7
689	9
689	11
689	24
689	12
690	14
690	35
690	19
690	6
690	7
690	30
690	9
690	32
690	33
690	11
690	27
690	12
690	13
691	14
691	28
691	6
692	14
692	2
692	11
693	1
693	2
693	4
693	35
693	17
693	19
693	28
693	29
693	30
693	9
693	10
693	33
693	11
693	26
693	54
693	24
693	38
693	12
693	13
694	1
694	3
694	4
694	35
694	15
694	18
694	19
694	5
694	6
694	7
694	30
694	9
694	20
694	37
694	32
694	10
694	33
694	11
694	23
694	24
694	53
694	13
694	12
694	48
695	14
695	2
695	4
695	40
695	19
695	28
695	6
695	30
695	9
695	32
695	11
695	23
695	24
695	12
696	1
696	2
696	3
696	4
696	35
696	15
696	18
696	19
696	5
696	28
696	29
696	30
696	31
696	9
696	20
696	47
696	10
696	33
696	11
696	23
696	24
696	12
697	1
697	2
697	3
697	4
697	15
697	18
697	49
697	5
697	28
697	7
697	30
697	31
697	9
697	21
697	10
697	11
697	26
697	24
697	12
698	1
698	2
698	4
698	35
698	15
698	19
698	16
698	28
698	29
698	6
698	7
698	30
698	31
698	9
698	37
698	20
698	32
698	43
698	44
698	10
698	33
698	11
698	34
698	12
698	13
698	48
699	1
699	2
699	3
699	34
699	4
699	35
699	5
699	15
699	16
699	18
699	19
699	6
699	30
699	31
699	9
699	32
699	10
699	33
699	11
699	54
699	26
699	7
699	27
699	12
699	13
700	1
700	2
700	4
700	35
700	16
700	19
700	28
700	6
700	30
700	9
700	10
700	11
700	26
700	23
700	24
700	38
700	39
700	27
700	12
700	13
701	1
701	2
701	4
701	35
701	19
701	29
701	30
701	9
701	20
701	47
701	10
701	11
701	23
701	24
701	7
701	27
701	12
701	13
702	14
702	2
702	28
702	30
702	9
702	12
703	1
703	2
703	3
703	34
703	4
703	5
703	6
703	30
703	31
703	9
703	32
703	10
703	33
703	11
703	54
703	26
703	7
703	27
703	12
703	13
704	14
704	2
704	28
704	9
704	12
705	1
705	2
705	4
705	35
705	19
705	28
705	6
705	30
705	9
705	32
705	10
705	44
705	33
705	11
705	26
705	24
705	38
706	14
706	40
706	6
706	11
706	51
707	1
707	2
707	3
707	4
707	35
707	15
707	18
707	19
707	5
707	6
707	7
707	30
707	31
707	9
707	20
707	47
707	10
707	33
707	11
707	23
707	24
707	12
708	1
708	2
708	3
708	4
708	35
708	15
708	19
708	18
708	6
708	7
708	30
708	41
708	9
708	32
708	10
708	11
708	24
708	34
708	12
708	13
709	1
709	2
709	4
709	15
709	18
709	19
709	6
709	7
709	30
709	8
709	9
709	21
709	10
709	11
709	24
709	38
710	1
710	2
710	4
710	15
710	18
710	19
710	29
710	7
710	30
710	41
710	31
710	9
710	20
710	37
710	43
710	21
710	32
710	10
710	22
710	11
710	26
710	27
710	12
711	1
711	2
711	3
711	4
711	15
711	18
711	6
711	7
711	9
711	11
711	24
711	12
712	1
712	2
712	4
712	35
712	19
712	29
712	7
712	9
712	32
712	10
712	44
712	33
712	26
712	24
712	25
712	38
712	12
713	1
713	2
713	4
713	35
713	15
713	29
713	7
713	30
713	9
713	37
713	20
713	32
713	43
713	44
713	10
713	33
713	11
713	34
713	12
713	13
714	14
714	40
714	19
714	28
714	6
714	30
714	21
714	32
714	11
714	12
714	13
714	48
715	1
715	2
715	3
715	4
715	15
715	18
715	19
715	6
715	7
715	30
716	1
716	2
716	3
716	4
716	15
716	18
716	49
716	41
716	28
716	7
716	30
716	31
716	9
716	21
716	10
716	11
716	26
716	24
716	12
717	14
718	14
718	2
718	4
718	28
718	6
718	9
718	42
718	10
718	12
718	13
719	14
719	35
719	19
719	41
719	28
719	30
719	11
719	26
719	12
720	1
720	2
720	3
720	4
720	6
720	7
720	30
720	8
720	9
720	32
720	10
720	11
720	24
720	34
720	27
720	12
721	1
721	2
721	35
721	19
721	28
721	6
721	30
721	9
721	32
721	10
721	11
721	24
721	52
721	12
721	13
721	48
722	14
722	28
722	6
722	9
722	12
723	14
723	2
723	3
723	4
723	35
723	15
723	16
723	19
723	5
723	28
723	29
723	30
723	31
723	9
723	21
723	10
723	11
723	23
723	24
723	25
723	38
723	27
723	12
723	13
724	1
724	2
724	4
724	15
724	19
724	28
724	6
724	30
724	9
724	37
724	10
724	26
724	23
724	24
724	27
724	12
724	13
725	14
725	2
725	4
725	6
725	9
725	10
725	11
725	24
725	12
726	14
726	2
726	4
726	58
726	28
726	6
726	30
726	31
726	9
726	37
726	20
726	32
726	44
726	10
726	33
726	11
726	34
726	39
726	27
726	12
726	13
727	14
727	4
727	15
727	16
727	19
727	28
727	29
727	6
727	7
727	30
727	31
727	9
727	20
727	32
727	10
727	33
727	11
727	26
727	23
727	24
727	27
727	13
727	48
728	1
728	3
728	4
728	35
728	15
728	18
728	19
728	5
728	6
728	7
728	30
728	9
728	20
728	37
728	32
728	10
728	33
728	11
728	23
728	24
728	53
728	13
728	12
728	48
729	14
729	2
729	3
729	4
729	19
729	5
729	28
729	29
729	31
729	9
729	20
729	37
729	43
729	10
729	33
729	11
729	22
729	26
729	23
729	12
730	1
730	2
730	4
730	35
730	15
730	19
730	28
730	29
730	9
730	37
730	20
730	32
730	43
730	44
730	10
730	33
730	11
730	51
730	12
730	13
731	1
731	2
731	4
731	35
731	15
731	19
731	16
731	29
731	30
731	9
731	37
731	20
731	32
731	43
731	44
731	10
731	33
731	11
731	51
731	12
731	13
732	14
732	2
732	4
732	28
732	6
732	32
732	47
732	33
732	26
732	23
732	24
732	25
732	38
732	12
733	14
733	2
733	3
733	4
733	28
733	6
733	30
733	9
733	10
733	11
733	54
733	26
733	55
733	12
733	13
734	14
734	2
734	19
734	15
734	28
734	29
734	6
734	30
734	9
734	37
734	21
734	10
734	11
734	24
734	38
734	27
734	12
734	13
735	1
735	2
735	4
735	35
735	19
735	28
735	6
735	8
735	9
735	20
735	47
735	10
735	11
735	23
735	24
735	7
735	27
735	12
735	13
736	14
736	2
736	4
736	15
736	19
736	6
736	7
736	30
736	9
736	10
736	26
736	23
736	24
736	27
736	12
736	13
736	48
737	1
737	2
737	22
737	3
737	4
737	35
737	15
737	16
737	40
737	18
737	19
737	28
737	29
737	7
737	41
737	30
737	31
737	9
737	37
737	20
737	21
737	43
737	10
737	33
737	11
737	23
737	12
737	13
738	1
738	2
738	3
738	4
738	35
738	15
738	18
738	19
738	28
738	29
738	30
738	31
738	9
738	32
738	11
738	22
738	26
738	24
738	51
738	52
738	7
738	23
738	27
738	48
739	14
739	2
739	3
739	59
739	4
739	35
739	16
739	19
739	5
739	28
739	6
739	30
739	31
739	9
739	20
739	11
739	23
739	24
739	38
739	34
739	12
740	14
740	19
740	28
740	21
740	10
740	12
741	1
741	2
741	3
741	4
741	35
741	15
741	18
741	19
741	29
741	7
741	30
741	31
741	9
741	11
741	24
741	48
742	14
742	2
742	3
742	4
742	5
742	6
742	7
742	30
742	9
742	10
742	11
742	34
742	12
742	13
743	14
743	35
743	19
743	28
743	30
743	26
743	12
744	14
744	35
744	40
744	18
744	19
744	28
744	29
744	21
744	10
744	23
744	12
745	14
745	2
745	22
745	4
745	20
745	29
745	7
745	30
745	10
745	11
745	12
746	1
746	2
746	19
746	28
746	6
746	30
746	24
746	27
746	12
746	13
747	14
747	2
747	3
747	22
747	34
747	59
747	4
747	5
747	28
747	6
747	30
747	9
747	32
747	10
747	11
747	26
748	1
748	2
748	3
748	4
748	15
748	16
748	19
748	5
748	29
748	6
748	7
748	8
748	20
748	37
748	32
748	10
748	11
748	26
748	23
748	24
748	38
748	12
749	1
749	2
749	3
749	4
749	19
749	15
749	7
749	8
749	9
749	37
749	32
749	10
749	33
749	11
749	24
749	38
749	12
749	13
749	48
750	14
750	2
750	3
750	4
750	29
750	7
750	30
750	33
750	11
750	24
750	34
750	12
751	1
751	2
751	3
751	4
751	35
751	15
751	18
751	19
751	5
751	6
751	30
751	41
751	9
751	32
751	33
751	11
751	24
751	7
751	27
751	12
751	13
752	14
752	2
752	4
752	19
752	6
752	7
752	30
752	31
752	9
752	37
752	32
752	21
752	10
752	11
752	24
752	12
752	13
753	1
753	2
753	4
753	35
753	15
753	19
753	28
753	29
753	6
753	7
753	30
753	31
753	9
753	20
753	21
753	11
753	22
753	24
753	25
753	38
753	27
753	12
753	13
753	48
754	1
754	2
754	3
754	4
754	35
754	15
754	18
754	19
754	6
754	7
754	30
754	9
754	37
754	10
754	22
754	34
754	24
754	12
755	14
755	28
755	6
755	9
755	42
755	47
755	33
755	11
755	27
755	12
756	14
756	2
756	3
756	4
756	35
756	16
756	19
756	5
756	28
756	6
756	30
756	31
756	9
756	20
756	11
756	23
756	24
756	38
756	34
756	12
757	1
757	2
757	59
757	4
757	35
757	15
757	18
757	19
757	50
757	16
757	28
757	29
757	30
757	31
757	9
757	10
757	33
757	11
757	26
757	23
757	24
757	38
757	27
757	12
757	13
758	1
758	2
758	3
758	4
758	35
758	15
758	19
758	29
758	6
758	7
758	30
758	31
758	9
758	20
758	37
758	10
758	33
758	11
758	22
758	24
758	38
758	48
759	1
759	2
759	59
759	4
759	15
759	18
759	7
759	30
759	8
759	9
759	32
759	10
759	11
759	22
759	24
760	1
760	40
760	19
760	28
760	6
761	1
761	2
761	22
761	34
761	20
761	4
761	35
761	15
761	16
761	40
761	19
761	28
761	29
761	41
761	31
761	9
761	37
761	32
761	10
761	33
761	11
761	23
761	24
761	27
761	12
761	13
762	1
762	2
762	4
762	15
762	18
762	19
762	29
762	7
762	30
762	41
762	31
762	9
762	20
762	37
762	43
762	21
762	32
762	10
762	22
762	11
762	26
762	27
762	12
763	14
763	2
763	4
763	35
763	19
763	28
763	29
763	30
763	31
763	9
763	37
763	32
763	21
763	10
763	11
763	7
763	24
763	23
763	12
763	13
764	1
764	2
764	4
764	15
764	19
764	28
764	29
764	30
764	9
764	37
764	20
764	32
764	43
764	44
764	10
764	33
764	11
764	34
764	12
765	14
765	2
765	4
765	41
765	28
765	6
765	31
765	9
765	10
765	33
765	11
765	54
765	12
766	14
766	2
766	4
766	28
766	6
766	9
766	42
766	10
766	12
766	13
767	1
767	3
767	4
767	35
767	15
767	18
767	19
767	5
767	28
767	29
767	6
767	30
767	9
767	20
767	37
767	32
767	10
767	33
767	11
767	23
767	24
767	53
767	13
767	12
767	48
768	14
768	2
768	3
768	4
768	15
768	58
768	16
768	19
768	28
768	29
768	31
768	9
768	32
768	10
768	44
768	33
768	11
768	22
768	23
768	24
768	38
768	27
768	12
769	1
769	2
769	4
769	16
769	40
769	28
769	29
769	30
769	9
769	20
769	37
769	10
769	44
769	11
769	26
769	23
769	24
769	38
769	12
769	13
770	1
770	2
770	4
770	15
770	19
770	6
770	8
770	9
770	11
770	26
770	23
770	24
770	12
770	13
771	14
771	4
771	35
771	19
771	28
771	6
771	30
771	9
771	37
771	20
771	43
771	10
771	11
771	38
771	24
771	12
771	13
772	14
772	2
772	3
772	4
772	35
772	5
772	15
772	16
772	19
772	28
772	6
772	30
772	9
772	10
772	33
772	11
772	23
772	24
772	27
772	12
772	13
773	1
773	2
773	3
773	20
773	4
773	15
773	18
773	5
773	16
773	40
773	19
773	28
773	6
773	7
773	30
773	41
773	31
773	9
773	37
773	10
773	11
773	26
773	24
773	34
773	54
773	27
773	12
774	14
774	2
774	4
774	28
774	29
774	30
774	31
774	9
774	10
774	33
774	11
774	26
774	27
774	12
774	13
775	14
775	28
775	6
775	30
775	9
775	20
775	43
775	10
775	33
775	11
775	26
775	34
775	12
775	13
776	14
776	2
776	3
776	4
776	35
776	5
776	15
776	16
776	40
776	18
776	19
776	28
776	29
776	30
776	31
776	9
776	20
776	37
776	21
776	10
776	11
776	26
776	38
776	24
776	23
776	27
776	12
776	13
777	1
777	2
777	4
777	35
777	19
777	28
777	29
777	30
777	9
777	10
777	26
777	23
777	24
777	25
777	38
777	12
777	13
778	1
778	2
778	4
778	35
778	19
778	28
778	29
778	30
778	31
778	9
778	10
778	33
778	26
778	23
778	24
778	12
779	14
779	2
779	3
779	34
779	4
779	35
779	15
779	16
779	18
779	19
779	5
779	28
779	29
779	30
779	31
779	36
779	9
779	20
779	21
779	32
779	10
779	44
779	33
779	11
779	22
779	23
779	27
779	12
779	13
780	14
780	2
780	3
780	59
780	4
780	15
780	16
780	18
780	19
780	5
780	58
780	28
780	29
780	31
780	36
780	9
780	20
780	21
780	11
780	22
780	26
780	23
780	24
780	25
780	38
780	12
780	13
780	48
781	14
781	35
781	19
781	28
781	6
781	9
781	11
781	26
781	24
781	12
781	13
782	1
782	2
782	3
782	4
782	35
782	15
782	19
782	28
782	6
782	30
782	9
782	26
782	24
782	12
783	1
783	2
783	28
783	6
783	10
783	12
784	14
784	2
784	3
784	4
784	35
784	5
784	17
784	15
784	16
784	18
784	19
784	28
784	6
784	30
784	8
784	9
784	21
784	26
784	38
784	24
784	27
784	12
785	14
785	2
785	22
785	4
785	17
785	15
785	18
785	19
785	28
785	9
785	20
785	32
785	10
785	11
785	26
785	23
785	56
785	24
785	27
785	12
785	13
786	14
786	2
786	3
786	4
786	35
786	5
786	15
786	16
786	18
786	19
786	28
786	29
786	30
786	31
786	9
786	20
786	37
786	21
786	10
786	11
786	26
786	38
786	24
786	27
786	12
786	13
787	14
787	4
787	28
787	6
787	30
787	9
787	20
787	43
787	10
787	11
787	38
787	24
787	12
787	13
788	1
788	2
788	4
788	28
788	6
788	9
788	32
788	11
788	34
788	12
788	13
789	14
789	2
789	3
789	4
789	35
789	49
789	19
789	15
789	16
789	28
789	29
789	6
789	30
789	31
789	9
789	37
789	20
789	32
789	44
789	10
789	11
789	24
789	25
789	53
789	12
789	13
790	1
790	2
790	3
790	4
790	35
790	15
790	16
790	18
790	19
790	5
790	29
790	7
790	30
790	9
790	21
790	32
790	10
790	33
790	11
790	22
790	26
790	24
790	38
790	48
791	14
791	2
791	4
791	35
791	16
791	19
791	28
791	29
791	31
791	36
791	9
791	32
791	42
791	21
791	44
791	33
791	11
791	26
791	23
791	24
791	27
791	12
791	13
792	14
792	2
792	4
792	35
792	15
792	18
792	19
792	28
792	6
792	9
792	20
792	37
792	43
792	32
792	10
792	33
792	11
792	24
792	51
792	12
792	13
792	48
793	14
793	2
793	4
793	28
793	29
793	30
793	31
793	37
793	10
793	33
793	11
793	54
793	12
793	13
794	14
794	2
794	4
794	35
794	19
794	28
794	29
794	30
794	9
794	21
794	32
794	33
794	11
794	24
794	38
794	27
794	13
794	12
794	48
795	1
795	2
795	3
795	4
795	35
795	15
795	18
795	19
795	5
795	28
795	29
795	6
795	30
795	31
795	9
795	20
795	47
795	10
795	33
795	11
795	23
795	24
795	12
796	1
796	2
796	4
796	35
796	19
796	41
796	29
796	7
796	30
796	9
796	21
796	32
796	10
796	33
796	11
796	26
796	24
796	38
796	51
796	27
796	12
796	13
797	14
797	2
797	3
797	22
797	4
797	35
797	40
797	19
797	41
797	17
797	18
797	28
797	29
797	30
797	9
797	37
797	32
797	10
797	33
797	11
797	38
797	24
797	27
797	12
797	13
798	1
798	2
798	4
798	35
798	15
798	19
798	28
798	6
798	30
798	9
798	37
798	20
798	32
798	43
798	10
798	33
798	11
798	34
798	51
798	12
798	13
798	48
799	14
799	2
799	4
799	20
799	35
799	16
799	19
799	61
799	28
799	29
799	30
799	31
799	36
799	9
799	32
799	42
799	21
799	44
799	33
799	11
799	26
799	23
799	12
799	13
800	14
800	2
800	3
800	34
800	4
800	15
800	17
800	18
800	19
800	5
800	29
800	7
800	31
800	9
800	20
800	37
800	21
800	32
800	47
800	10
800	44
800	33
800	11
800	27
800	12
800	13
800	48
801	1
801	2
801	4
801	15
801	41
801	29
801	6
801	7
801	30
801	9
801	37
801	21
801	10
801	11
801	26
801	24
801	38
801	52
801	48
802	14
802	2
802	4
802	35
802	15
802	40
802	18
802	19
802	41
802	28
802	6
802	9
802	20
802	37
802	43
802	32
802	10
802	33
802	24
802	26
802	23
802	12
802	13
802	48
803	14
803	2
803	22
803	34
803	4
803	58
803	19
803	28
803	29
803	30
803	31
803	9
803	20
803	32
803	44
803	10
803	33
803	11
803	39
803	12
803	13
804	14
804	2
804	3
804	4
804	35
804	41
804	16
804	19
804	28
804	6
804	9
804	21
804	47
804	26
804	23
804	24
804	12
804	13
805	14
805	2
805	22
805	20
805	4
805	15
805	17
805	18
805	19
805	5
805	6
805	30
805	31
805	9
805	21
805	32
805	10
805	11
805	54
805	24
805	25
805	27
805	12
805	13
806	14
806	2
806	3
806	4
806	35
806	15
806	19
806	16
806	28
806	29
806	31
806	9
806	10
806	24
806	25
806	38
806	12
807	14
807	2
807	3
807	4
807	35
807	15
807	19
807	6
807	7
807	30
807	32
807	38
808	14
808	2
808	3
808	4
808	35
808	15
808	19
808	5
808	16
808	28
808	29
808	31
808	9
808	37
808	21
808	32
808	10
808	33
808	11
808	23
808	7
808	38
808	27
808	12
808	13
809	14
809	45
809	2
809	3
809	22
809	34
809	59
809	4
809	35
809	5
809	41
809	28
809	29
809	30
809	31
809	36
809	9
809	37
809	20
809	32
809	21
809	42
809	44
809	10
809	47
809	33
809	27
809	12
809	13
810	14
810	45
810	49
810	28
810	29
810	31
810	36
810	9
811	14
811	45
811	2
811	3
811	4
811	35
811	15
811	16
811	17
811	18
811	19
811	28
811	29
811	41
811	31
811	36
811	9
811	37
811	42
811	32
811	10
811	44
811	33
811	11
811	26
811	23
811	12
811	13
812	14
812	2
812	4
812	28
812	29
812	21
812	11
812	23
812	27
812	12
812	13
813	14
813	28
813	6
813	11
813	38
813	12
814	14
814	45
814	2
814	3
814	4
814	19
814	5
814	28
814	29
814	31
814	36
814	9
814	32
814	11
814	26
814	23
814	12
815	14
815	45
815	2
815	3
815	4
815	35
815	15
815	16
815	19
815	29
815	7
815	41
815	36
815	9
815	33
815	26
815	24
815	27
815	12
816	14
816	45
816	35
816	41
816	19
816	40
816	28
816	6
816	30
816	9
816	10
816	39
816	26
816	23
816	24
816	38
816	27
816	12
816	13
816	48
817	14
817	45
817	2
817	22
817	3
817	34
817	4
817	35
817	15
817	16
817	18
817	28
817	29
817	31
817	36
817	9
817	42
817	23
817	12
817	13
818	14
818	2
818	3
818	4
818	35
818	15
818	16
818	19
818	5
818	28
818	29
818	30
818	31
818	36
818	9
818	20
818	21
818	32
818	10
818	44
818	33
818	11
818	23
818	54
818	27
818	12
819	14
819	2
819	4
819	35
819	19
819	6
819	7
819	9
819	21
819	10
819	11
819	52
819	38
819	24
819	48
820	14
820	2
820	3
820	4
820	19
820	29
820	8
820	21
820	10
820	33
820	11
820	25
820	27
820	12
821	14
821	2
821	3
821	4
821	35
821	15
821	18
821	19
821	5
821	28
821	29
821	7
821	30
821	41
821	31
821	9
821	20
821	37
821	32
821	10
821	44
821	33
821	11
821	22
821	26
821	27
821	12
821	13
822	14
822	35
822	19
822	28
822	10
822	11
822	26
822	24
822	12
822	13
823	1
823	2
823	3
823	4
823	35
823	16
823	15
823	19
823	28
823	6
823	30
823	10
823	23
823	24
823	7
823	38
823	52
823	48
824	14
824	2
824	4
824	15
824	16
824	18
824	19
824	49
824	28
824	6
824	30
824	48
825	1
825	2
825	3
825	4
825	35
825	15
825	19
825	5
825	29
825	6
825	7
825	30
825	41
825	21
825	38
825	12
825	13
826	14
826	2
826	3
826	4
826	35
826	15
826	19
826	6
826	7
826	30
826	9
826	32
826	10
826	11
826	25
826	26
826	24
826	13
826	12
827	14
827	2
827	3
827	5
827	49
827	29
827	7
827	41
827	31
827	20
827	32
827	44
827	11
827	24
827	51
827	39
827	27
827	12
828	1
828	45
828	2
828	3
828	34
828	4
828	15
828	17
828	18
828	19
828	58
828	28
828	29
828	31
828	36
828	9
828	20
828	37
828	32
828	10
828	11
828	22
828	23
828	24
828	38
829	14
829	45
829	2
829	3
829	4
829	35
829	15
829	19
829	28
829	6
829	30
829	9
829	21
829	38
829	23
829	27
829	12
829	13
830	14
830	2
830	3
830	4
830	35
830	15
830	40
830	19
830	6
830	7
830	30
830	41
830	9
830	32
830	10
830	33
830	11
830	26
830	24
830	25
830	38
830	12
830	13
830	48
831	14
831	2
831	4
831	15
831	16
831	18
831	19
831	28
831	6
831	31
831	9
831	11
831	23
831	24
831	12
831	13
831	48
832	14
832	2
832	3
832	34
832	4
832	35
832	15
832	16
832	18
832	19
832	5
832	28
832	29
832	30
832	31
832	36
832	9
832	21
832	32
832	33
832	11
832	22
832	24
832	7
832	51
832	27
832	12
832	13
833	1
833	2
833	4
833	19
833	28
833	6
833	30
833	11
833	26
833	24
833	12
833	13
834	14
834	2
834	4
834	35
834	15
834	18
834	19
834	28
834	29
834	9
834	24
834	38
834	12
835	1
835	2
835	34
835	4
835	20
835	35
835	50
835	41
835	17
835	40
835	19
835	28
835	6
835	7
835	30
835	31
835	8
835	9
835	32
835	21
835	10
835	11
835	26
835	24
835	38
835	27
835	12
835	13
836	14
836	2
836	3
836	4
836	28
836	29
836	31
836	33
836	24
836	25
836	54
836	12
837	14
837	45
837	2
837	3
837	34
837	4
837	35
837	15
837	16
837	18
837	19
837	28
837	29
837	41
837	30
837	31
837	36
837	8
837	9
837	20
837	37
837	42
837	43
837	21
837	32
837	47
837	10
837	11
837	12
837	13
838	14
838	2
838	3
838	4
838	35
838	40
838	19
838	41
838	15
838	28
838	6
838	30
838	9
838	10
838	23
838	24
838	38
838	12
838	13
839	14
839	2
839	3
839	4
839	28
839	29
839	30
839	9
839	21
839	11
839	22
839	23
839	48
840	14
840	45
840	2
840	3
840	4
840	35
840	15
840	16
840	19
840	5
840	28
840	29
840	31
840	21
840	23
840	12
841	1
841	2
841	3
841	4
841	35
841	19
841	28
841	6
841	30
841	9
841	21
841	32
841	10
841	11
841	22
841	24
841	38
841	23
841	56
841	12
841	13
841	48
842	14
842	2
842	3
842	4
842	15
842	28
842	6
842	30
842	9
842	23
842	38
842	12
842	48
843	14
843	2
843	3
843	4
843	6
843	7
843	41
843	30
843	9
843	32
843	10
843	27
843	12
844	1
844	2
844	3
844	35
844	15
844	18
844	6
844	7
844	30
844	31
844	9
844	42
844	21
844	32
844	47
844	10
844	44
844	33
844	54
844	24
844	27
844	12
844	13
845	14
845	2
845	3
845	4
845	5
845	19
845	28
845	29
845	31
845	9
845	20
845	21
845	10
845	11
845	26
845	25
845	24
845	23
845	12
845	13
846	1
846	2
846	3
846	4
846	15
846	16
846	19
846	6
846	7
846	30
847	14
847	45
847	2
847	22
847	34
847	35
847	15
847	16
847	18
847	19
847	28
847	6
847	30
847	9
847	21
847	47
847	10
847	26
847	23
847	24
847	25
847	38
847	48
848	14
849	14
849	2
849	3
849	19
849	5
849	28
849	29
849	31
849	9
849	42
849	10
849	33
849	11
849	24
849	38
849	12
849	13
850	1
850	2
850	3
850	4
850	35
850	15
850	18
850	19
850	28
850	6
850	7
850	30
850	41
850	9
850	20
850	21
850	10
850	11
850	26
850	24
850	38
850	12
850	13
851	14
851	2
851	3
851	4
851	35
851	15
851	18
851	19
851	6
851	7
851	30
851	8
851	9
851	42
851	10
851	33
851	24
851	25
851	39
851	12
851	13
852	14
852	45
852	2
852	3
852	4
852	15
852	16
852	17
852	18
852	19
852	5
852	28
852	29
852	41
852	31
852	9
852	20
852	37
852	21
852	32
852	10
852	33
852	11
852	23
852	38
852	27
852	12
852	13
853	1
853	2
853	3
853	4
853	35
853	16
853	19
853	28
853	29
853	30
853	20
853	24
853	38
853	27
853	12
854	1
854	2
854	4
854	15
854	19
854	6
854	7
854	30
854	9
854	32
854	44
854	24
854	56
854	12
855	1
855	2
855	3
855	4
855	15
855	16
855	19
855	5
855	28
855	6
855	30
855	31
855	9
855	20
855	37
855	43
855	10
855	33
855	11
855	23
855	24
855	7
855	27
855	12
855	13
856	14
856	2
856	3
856	4
856	35
856	19
856	28
856	6
856	30
856	9
856	21
856	10
856	11
856	24
856	38
856	12
856	13
857	14
857	2
857	3
857	4
857	15
857	18
857	19
857	28
857	6
857	30
857	31
857	10
857	33
857	11
857	26
857	24
857	12
858	1
858	2
858	3
858	4
858	35
858	16
858	19
858	5
858	28
858	29
858	31
858	9
858	21
858	23
858	24
858	12
858	13
858	48
859	14
859	2
859	3
859	4
859	35
859	15
859	19
859	5
859	28
859	29
859	30
859	31
859	36
859	9
859	20
859	42
859	21
859	32
859	10
859	33
859	22
859	23
859	54
859	12
859	13
860	1
860	2
860	3
860	4
860	15
860	18
860	19
860	6
860	7
860	30
860	8
860	11
860	24
860	39
860	12
860	13
861	14
861	2
861	3
861	4
861	35
861	15
861	16
861	19
861	5
861	28
861	29
861	31
861	9
861	37
861	21
861	32
861	10
861	33
861	11
861	23
861	7
861	38
861	27
861	12
861	13
862	14
862	45
862	2
862	3
862	34
862	4
862	5
862	40
862	28
862	29
862	31
862	36
862	9
862	11
862	12
863	14
863	2
863	3
863	4
863	5
863	41
863	16
863	40
863	19
863	28
863	29
863	30
863	32
863	44
863	33
863	11
863	51
863	12
864	14
864	45
864	2
864	3
864	4
864	15
864	16
864	18
864	5
864	28
864	29
864	31
864	36
864	9
864	20
864	42
864	21
864	10
864	44
864	11
864	22
864	23
864	24
864	12
865	14
865	2
865	3
865	4
865	35
865	16
865	19
865	5
865	29
865	9
865	12
866	14
866	45
866	2
866	3
866	4
866	35
866	15
866	19
866	5
866	28
866	29
866	31
866	36
866	9
866	10
866	11
866	38
866	27
866	12
866	13
867	14
867	45
867	2
867	3
867	59
867	34
867	4
867	35
867	15
867	16
867	19
867	28
867	29
867	41
867	30
867	31
867	36
867	60
867	9
867	37
867	20
867	32
867	43
867	44
867	10
867	33
867	11
867	22
867	27
867	12
868	1
868	2
868	4
868	35
868	15
868	28
868	6
868	30
868	9
868	24
868	12
869	14
869	2
869	3
869	4
869	15
869	18
869	19
869	28
869	6
869	30
869	9
869	20
869	21
869	32
869	11
869	23
869	24
869	38
869	12
870	1
870	2
870	4
870	15
870	18
870	19
870	6
870	7
870	30
870	8
870	9
870	10
870	24
870	23
870	12
871	1
871	2
871	3
871	4
871	35
871	15
871	16
871	19
871	49
871	5
871	28
871	29
871	30
871	41
871	31
871	9
871	20
871	37
871	43
871	21
871	32
871	10
871	33
871	11
871	23
871	12
871	13
872	14
872	2
872	4
872	35
872	50
872	15
872	16
872	18
872	19
872	28
872	29
872	9
872	32
872	21
872	44
872	10
872	47
872	33
872	11
872	34
872	39
872	27
872	12
872	13
873	14
873	2
873	3
873	4
873	15
873	18
873	19
873	28
873	6
873	30
873	9
873	21
873	10
873	24
873	38
873	12
873	13
874	14
874	45
874	2
874	3
874	34
874	4
874	5
874	40
874	28
874	29
874	31
874	36
874	9
874	11
874	12
875	1
875	2
875	3
875	35
875	15
875	16
875	18
875	19
875	5
875	6
875	7
875	30
875	9
875	21
875	10
875	11
875	22
875	54
875	24
875	12
875	13
876	14
876	2
876	3
876	4
876	35
876	19
876	28
876	29
876	6
876	30
876	9
876	24
876	27
876	12
877	14
877	2
877	4
877	15
877	28
877	6
877	30
877	31
877	10
877	11
877	38
877	27
877	12
877	13
878	1
878	2
878	28
878	31
878	9
878	23
878	24
878	12
879	14
879	2
879	3
879	4
879	16
879	19
879	28
879	6
879	30
879	9
879	42
879	24
879	38
879	12
880	14
880	45
880	2
880	3
880	4
880	35
880	15
880	16
880	17
880	19
880	5
880	28
880	29
880	41
880	31
880	36
880	9
880	21
880	32
880	33
880	23
880	26
880	25
880	57
880	38
880	51
880	48
881	1
881	2
881	3
881	4
881	16
881	19
881	5
881	28
881	29
881	31
881	9
881	21
881	23
881	24
881	12
881	13
881	48
882	14
882	2
882	3
882	4
882	15
882	28
882	30
882	10
882	33
882	12
882	13
883	1
884	14
884	2
884	3
884	4
884	28
884	6
884	30
884	9
884	26
884	24
885	14
885	45
885	2
885	3
885	4
885	35
885	5
885	19
885	28
885	29
885	6
885	31
885	9
885	32
885	42
885	44
885	10
885	33
885	34
885	26
885	25
885	38
885	27
885	12
885	13
886	1
886	2
886	4
886	35
886	16
886	19
886	6
886	7
886	30
886	8
886	24
886	12
886	13
886	48
887	14
887	2
887	3
887	4
887	35
887	15
887	19
887	16
887	28
887	29
887	31
887	9
887	10
887	24
887	25
887	38
887	12
888	14
888	45
888	2
888	3
888	22
888	34
888	4
888	20
888	35
888	5
888	41
888	29
888	7
888	31
888	36
888	9
888	37
888	32
888	43
888	44
888	10
888	33
888	11
888	27
888	12
889	1
889	35
889	6
889	7
889	30
889	9
889	21
889	32
889	10
889	26
889	57
889	38
889	12
889	13
890	1
890	2
890	3
890	4
890	35
890	19
890	15
890	18
890	6
890	7
890	30
890	31
890	9
890	20
890	37
890	32
890	21
890	10
890	44
890	33
890	11
890	22
890	27
890	12
890	13
890	48
891	14
891	2
891	3
891	4
891	35
891	15
891	18
891	19
891	28
891	6
891	9
891	24
891	38
891	12
891	13
891	48
892	14
892	2
892	4
892	35
892	41
892	40
892	19
892	28
892	29
892	31
892	9
892	11
892	22
892	51
892	12
892	13
893	14
893	2
893	3
893	4
893	16
893	15
893	18
893	19
893	5
893	28
893	29
893	31
893	23
893	24
893	48
894	1
894	2
894	4
894	28
894	6
894	30
894	37
894	32
894	43
894	21
894	42
894	10
894	11
894	39
894	23
894	25
895	1
895	2
895	3
895	4
895	35
895	16
895	17
895	19
895	28
895	6
895	30
895	9
895	20
895	21
895	32
895	47
895	33
895	26
895	24
895	23
895	12
895	13
895	48
896	14
896	2
896	3
896	4
896	15
896	28
896	6
896	7
896	30
896	9
896	20
896	21
896	10
896	11
896	22
896	23
896	24
896	38
896	12
897	1
897	2
897	3
897	4
897	15
897	16
897	18
897	19
897	29
897	7
897	30
897	41
897	31
898	14
898	2
898	3
898	4
898	35
898	16
898	19
898	5
898	28
898	29
898	30
898	31
898	20
898	32
898	21
898	10
898	11
898	23
898	24
898	52
898	27
898	12
898	13
899	1
899	2
899	4
899	15
899	18
899	19
899	50
899	29
899	7
899	30
899	31
899	9
899	37
899	43
899	21
899	32
899	10
899	33
899	11
899	26
899	24
899	12
900	1
900	2
900	3
900	4
900	35
900	15
900	16
900	19
900	5
900	46
900	29
900	6
900	7
900	30
900	32
900	21
900	10
900	11
900	24
900	38
901	14
901	2
901	4
901	15
901	19
901	6
901	30
901	41
901	9
901	10
901	11
901	24
901	7
901	12
901	13
902	1
902	2
902	3
902	4
902	5
902	6
902	7
903	14
903	2
903	3
903	4
903	35
903	19
903	28
903	29
903	9
903	20
903	21
903	32
903	10
903	11
903	23
903	24
903	38
903	51
903	48
904	14
904	45
904	2
904	4
904	15
904	17
904	19
904	28
904	29
904	31
904	36
904	9
904	21
904	26
904	24
904	23
904	7
904	38
904	52
904	39
904	27
904	48
905	14
905	2
905	3
905	4
905	35
905	15
905	19
905	5
905	28
905	29
905	6
905	7
905	31
905	36
906	14
906	2
906	3
906	4
906	35
906	15
906	19
906	5
906	28
906	6
906	8
906	9
906	21
906	10
906	11
906	23
906	24
906	38
906	48
907	1
907	2
907	3
907	4
907	35
907	16
907	19
907	5
907	28
907	29
907	31
907	9
907	21
907	23
907	24
907	12
907	13
907	48
908	14
908	2
908	3
908	4
908	35
908	15
908	18
908	19
908	28
908	6
908	30
908	9
908	24
908	38
909	1
909	2
909	4
909	15
909	18
909	19
909	6
909	7
909	30
909	10
909	24
909	27
909	12
909	13
910	14
910	2
910	3
910	4
910	15
910	16
910	19
910	49
910	28
910	6
910	30
910	8
910	9
910	20
910	43
910	21
910	11
910	22
910	23
910	24
910	38
910	48
911	1
911	2
911	3
911	4
911	5
911	6
911	7
911	9
912	14
912	2
912	3
912	4
912	35
912	15
912	16
912	19
912	5
912	28
912	29
912	31
912	9
912	37
912	21
912	32
912	10
912	33
912	11
912	23
912	7
912	38
912	27
912	12
912	13
913	14
913	2
913	4
913	15
913	19
913	28
913	6
913	9
913	21
913	10
913	24
913	12
914	14
914	2
914	3
914	4
914	35
914	15
914	19
914	6
914	7
914	30
914	32
914	38
915	1
915	2
915	4
915	35
915	15
915	19
915	6
915	7
915	30
915	37
915	10
915	33
915	26
915	38
915	12
915	13
916	14
916	2
916	3
916	4
916	15
916	19
916	5
916	28
916	29
916	30
916	31
916	9
916	11
916	26
916	24
916	12
917	1
917	2
917	3
917	4
917	35
917	15
917	16
917	18
917	19
917	5
917	6
917	7
917	30
917	9
917	21
917	10
917	44
917	11
917	22
917	26
917	24
917	57
917	12
917	13
918	14
918	2
918	34
918	20
918	4
918	15
918	16
918	19
918	28
918	29
918	30
918	31
918	11
918	24
918	12
919	1
919	2
919	3
919	4
919	35
919	19
919	28
919	29
919	31
919	9
919	21
919	23
919	24
919	12
919	13
919	48
920	14
920	2
920	3
920	4
920	35
920	15
920	19
920	16
920	28
920	29
920	31
920	9
920	24
920	25
920	38
920	12
921	14
921	2
921	3
921	4
921	19
921	5
921	28
921	29
921	6
921	31
921	9
921	32
921	42
921	44
921	10
921	33
921	34
921	26
921	25
921	38
921	27
921	12
921	13
922	1
922	2
922	3
922	4
922	35
922	19
922	5
922	28
922	29
922	31
922	9
922	42
922	32
922	10
922	44
922	11
922	38
922	51
922	12
923	14
923	3
923	4
923	15
923	18
923	49
923	29
923	7
923	31
923	36
924	14
924	2
924	4
924	19
924	28
924	29
924	6
924	9
924	42
924	24
924	38
924	12
925	1
925	2
925	4
925	19
925	28
925	6
925	30
926	14
926	2
926	3
926	4
926	28
926	6
926	30
926	9
926	27
926	12
926	13
927	14
927	2
927	3
927	4
927	35
927	15
927	19
927	5
927	28
927	6
927	7
927	30
927	9
927	10
927	11
927	23
927	24
927	57
927	38
927	48
928	14
928	2
928	3
928	35
928	15
928	16
928	18
928	19
928	6
928	7
928	30
928	32
928	33
928	11
928	38
928	24
928	12
928	13
928	48
929	1
929	2
929	3
929	4
929	35
929	15
929	5
929	6
929	7
929	30
929	9
929	10
929	24
929	25
929	48
930	14
930	2
930	3
930	4
930	35
930	15
930	18
930	19
930	28
930	6
930	30
930	9
930	10
930	26
930	54
930	24
930	12
930	13
931	14
931	2
931	3
931	4
931	28
931	29
932	14
932	2
932	4
932	35
932	41
932	40
932	19
932	28
932	6
932	30
932	9
932	11
932	12
932	13
933	14
933	2
933	3
933	4
933	35
933	41
933	16
933	19
933	28
933	6
933	9
933	21
933	47
933	26
933	23
933	24
933	12
933	13
934	14
934	2
934	22
934	20
934	4
934	15
934	17
934	18
934	19
934	5
934	6
934	30
934	31
934	9
934	21
934	32
934	10
934	11
934	54
934	24
934	25
934	27
934	12
934	13
935	14
935	19
935	29
935	7
935	30
935	41
935	37
935	32
935	10
935	44
935	33
935	11
935	26
935	24
935	12
935	13
936	1
936	2
936	3
936	19
936	28
936	6
936	30
936	9
936	24
936	12
937	14
937	45
937	2
937	3
937	4
937	15
937	18
937	28
937	29
937	30
937	9
937	21
937	47
937	33
937	26
937	38
937	27
937	12
938	14
938	2
938	3
938	4
938	28
938	29
938	6
938	7
938	30
938	41
938	8
938	9
938	21
938	32
938	33
938	11
938	24
938	34
938	12
939	1
939	2
939	3
939	4
939	35
939	15
939	18
939	19
939	5
939	16
939	28
939	29
939	6
939	30
939	9
939	21
939	10
939	33
939	26
939	54
939	24
939	38
939	39
939	23
939	12
939	13
939	48
940	14
940	2
940	3
940	4
940	15
940	19
940	28
940	6
940	9
940	38
940	24
940	12
940	13
941	14
941	2
941	4
941	28
941	6
941	9
941	10
941	12
941	13
942	14
942	2
942	3
942	4
942	5
942	28
942	29
942	31
942	9
942	20
942	10
942	11
942	34
942	26
942	7
942	27
942	12
942	13
943	14
943	2
943	3
943	4
943	35
943	41
943	19
943	28
943	6
943	9
943	21
943	10
943	23
943	24
943	12
943	13
944	14
944	2
944	28
944	6
944	39
944	12
944	13
945	14
945	2
945	3
945	4
945	35
945	15
945	19
945	16
945	28
945	29
945	31
945	9
945	10
945	24
945	25
945	38
945	12
946	14
946	45
946	2
946	3
946	4
946	35
946	5
946	41
946	17
946	58
946	50
946	28
946	29
946	31
946	36
946	9
946	32
946	33
946	34
946	27
946	12
946	13
947	14
947	2
947	3
947	4
947	35
947	5
947	19
947	28
947	29
947	9
947	20
947	32
947	21
947	10
947	11
947	39
947	53
947	23
947	24
947	48
948	14
948	2
948	4
948	28
948	6
948	31
948	9
948	24
948	12
949	14
949	45
949	2
949	3
949	4
949	15
949	18
949	19
949	28
949	6
949	30
949	9
949	32
949	33
949	11
949	26
949	27
949	12
949	13
950	14
950	2
950	4
950	35
950	16
950	15
950	19
950	28
950	29
950	30
950	31
950	9
950	42
950	21
950	10
950	33
950	11
950	26
950	23
950	24
950	25
950	27
950	12
950	13
951	14
951	45
951	2
951	3
951	4
951	15
951	16
951	19
951	5
951	28
951	29
951	31
951	36
951	9
951	20
951	10
951	11
951	22
951	26
951	23
951	24
951	57
951	38
951	12
952	14
952	45
952	2
952	3
952	34
952	4
952	16
952	41
952	5
952	15
952	28
952	29
952	31
952	36
952	9
952	20
952	32
952	42
952	10
952	33
952	11
952	38
952	57
952	23
952	27
952	12
952	13
953	14
953	2
953	3
953	4
953	35
953	5
953	15
953	19
953	28
953	29
953	30
953	31
953	9
953	20
953	32
953	42
953	21
953	10
953	33
953	22
953	23
953	54
953	12
953	13
954	1
954	2
954	3
954	4
954	35
954	16
954	19
954	5
954	15
954	18
954	17
954	28
954	6
954	30
954	9
954	32
954	21
954	44
954	10
954	47
954	33
954	11
954	54
954	24
954	12
954	13
954	48
955	14
955	2
955	3
955	4
955	5
955	28
955	6
955	31
955	36
955	9
955	20
955	32
955	43
955	10
955	11
955	34
955	23
955	24
955	12
956	14
956	2
956	3
956	4
956	35
956	19
956	28
956	29
956	31
956	36
956	20
956	37
956	21
956	32
956	10
956	11
956	22
956	24
956	7
956	56
956	27
956	12
956	13
957	14
957	45
957	2
957	3
957	34
957	4
957	20
957	35
957	15
957	16
957	19
957	28
957	29
957	41
957	31
957	36
957	9
957	37
957	21
957	32
957	43
957	10
957	47
957	33
957	11
957	27
957	12
958	14
958	45
958	2
958	3
958	4
958	35
958	15
958	16
958	18
958	19
958	5
958	28
958	29
958	30
958	31
958	9
958	20
958	43
958	32
958	10
958	33
958	11
958	24
958	34
958	12
959	14
959	2
959	3
959	4
959	15
959	28
959	6
959	31
959	20
959	32
959	22
959	11
959	24
959	7
959	27
959	12
960	14
960	2
960	3
960	4
960	35
960	15
960	19
960	5
960	16
960	28
960	29
960	31
960	9
960	37
960	21
960	32
960	10
960	33
960	11
960	23
960	7
960	38
960	27
960	12
960	13
961	14
961	2
961	4
961	15
961	19
961	28
961	29
961	9
961	32
961	11
961	23
961	24
961	27
961	12
962	14
962	45
962	2
962	3
962	34
962	59
962	4
962	35
962	5
962	15
962	16
962	28
962	29
962	31
962	36
962	9
962	20
962	37
962	32
962	21
962	43
962	10
962	47
962	33
962	11
962	27
962	12
963	14
963	45
963	2
963	3
963	4
963	5
963	28
963	29
963	7
963	31
963	36
963	9
963	10
963	47
963	33
963	11
963	39
963	26
963	27
963	12
963	13
964	14
964	2
964	34
964	4
964	20
964	35
964	41
964	19
964	28
964	6
964	30
964	9
964	37
964	32
964	10
964	33
964	11
964	54
964	26
964	12
964	13
965	14
965	2
965	3
965	4
965	19
965	28
965	6
965	30
965	31
965	9
965	20
965	32
965	10
965	44
965	33
965	11
965	22
965	23
965	24
965	12
966	14
966	2
966	3
966	4
966	28
966	29
966	31
966	9
966	20
966	43
966	10
966	33
966	11
966	12
966	13
967	14
967	2
967	3
967	4
967	35
967	5
967	50
967	15
967	16
967	19
967	28
967	29
967	7
967	30
967	9
967	32
967	10
967	33
967	11
967	24
967	27
967	12
967	13
968	14
968	2
968	3
968	4
968	35
968	16
968	19
968	5
968	28
968	29
968	30
968	31
968	9
968	20
968	32
968	10
968	11
968	26
968	23
968	24
968	38
968	57
968	27
968	12
968	13
969	14
969	2
969	4
969	5
969	28
969	29
969	36
969	9
969	37
969	32
969	10
969	34
969	12
970	14
970	2
970	3
970	4
970	35
970	19
970	28
970	29
970	31
970	9
970	37
970	20
970	21
970	10
970	11
970	22
970	38
970	24
970	26
970	48
971	14
971	2
971	3
971	4
971	16
971	28
971	29
971	41
971	31
971	36
971	9
971	20
971	21
971	32
971	10
971	44
971	11
971	23
971	24
971	25
971	48
972	1
972	2
972	3
972	4
972	35
972	19
972	15
972	6
972	7
972	30
972	9
972	21
972	44
972	10
972	33
972	54
972	55
972	38
972	24
972	27
972	12
972	13
972	48
973	1
973	2
973	3
973	4
973	35
973	16
973	19
973	28
973	6
973	30
973	21
973	32
973	10
973	33
973	11
973	26
973	24
973	38
973	12
973	13
973	48
974	14
974	45
974	2
974	3
974	59
974	4
974	5
974	49
974	15
974	16
974	18
974	28
974	29
974	30
974	9
974	32
974	21
974	33
974	51
974	38
974	27
974	12
975	14
975	45
975	2
975	3
975	34
975	4
975	5
975	15
975	41
975	28
975	29
975	31
975	36
975	9
975	20
975	42
975	32
975	33
975	11
975	38
975	57
975	23
975	24
975	27
975	48
976	1
976	2
976	3
976	4
976	35
976	15
976	28
976	6
976	30
976	9
976	10
976	33
976	54
976	24
976	55
976	27
976	12
976	13
977	14
977	35
977	28
977	6
977	9
978	1
978	2
978	4
978	35
978	15
978	16
978	17
978	41
978	28
978	6
978	8
978	9
978	20
978	37
978	43
978	21
978	32
978	10
978	11
978	22
978	24
978	12
978	13
979	1
979	2
979	3
979	4
979	16
979	17
979	19
979	5
979	28
979	29
979	31
979	9
979	20
979	42
979	21
979	32
979	10
979	33
979	11
979	26
979	23
979	12
979	13
980	14
980	2
980	3
980	22
980	4
980	35
980	15
980	16
980	19
980	5
980	28
980	29
980	30
980	31
980	9
980	20
980	37
980	43
980	21
980	32
980	10
980	44
980	33
980	11
980	12
980	13
980	48
981	14
981	2
981	3
981	4
981	5
981	19
981	28
981	29
981	31
981	9
981	20
981	32
981	21
981	42
981	44
981	11
981	23
981	57
981	12
981	13
982	14
982	2
982	3
982	4
982	35
982	16
982	19
982	41
982	28
982	29
982	31
982	36
982	9
982	20
982	21
982	32
982	11
982	23
982	24
982	48
983	1
983	2
983	3
983	4
983	35
983	19
983	6
983	7
983	30
983	8
983	10
983	24
983	12
983	13
983	48
984	1
984	2
984	3
984	34
984	4
984	35
984	41
984	16
984	19
984	6
984	7
984	30
984	31
984	9
984	10
984	33
984	26
984	24
984	12
984	13
985	1
985	2
985	3
985	34
985	4
985	35
985	16
985	19
985	28
985	29
985	31
985	36
985	9
985	20
985	37
985	21
985	32
985	10
985	11
985	26
985	23
985	24
985	12
985	13
986	14
986	45
986	2
986	3
986	34
986	4
986	35
986	5
986	17
986	15
986	16
986	28
986	29
986	41
986	30
986	31
986	36
986	60
986	9
986	37
986	20
986	32
986	43
986	10
986	33
986	11
986	22
986	27
986	12
987	1
987	2
987	3
987	4
987	5
987	15
987	19
987	28
987	29
987	30
987	31
987	9
987	32
987	11
987	22
987	27
987	13
987	48
988	1
988	2
988	3
988	4
988	5
988	15
988	19
988	28
988	29
988	31
988	9
988	32
988	11
988	22
988	27
988	13
988	48
989	14
989	35
989	19
989	28
989	6
989	21
989	10
989	11
989	26
989	24
989	38
989	12
989	13
989	48
990	1
990	2
990	3
990	59
990	34
990	4
990	35
990	15
990	16
990	40
990	19
990	29
990	7
990	30
990	41
990	31
990	36
990	9
990	20
990	37
990	43
990	32
990	47
990	10
990	44
990	33
990	11
990	12
990	48
991	14
991	2
991	3
991	4
991	35
991	19
991	5
991	16
991	28
991	29
991	41
991	31
991	36
991	9
991	21
991	11
991	22
991	23
991	26
991	12
992	14
992	2
992	3
992	59
992	4
992	35
992	15
992	16
992	19
992	5
992	17
992	29
992	41
992	30
992	31
992	36
992	9
992	20
992	37
992	42
992	10
992	33
992	22
992	11
992	23
992	56
992	27
992	12
992	13
992	48
993	1
993	2
993	3
993	4
993	15
993	19
993	28
993	29
993	31
993	36
993	9
993	21
993	32
993	44
993	33
993	11
993	22
993	23
993	24
993	39
993	27
993	12
993	13
994	14
994	2
994	3
994	4
994	35
994	19
994	5
994	41
994	16
994	28
994	29
994	31
994	36
994	9
994	32
994	21
994	10
994	52
994	27
994	12
994	13
995	14
995	45
995	2
995	3
995	4
995	15
995	16
995	18
995	19
995	5
995	58
995	28
995	29
995	7
995	41
995	31
995	36
995	60
995	9
995	20
995	37
995	32
995	43
995	10
995	44
995	33
995	11
995	24
995	48
996	14
996	45
996	2
996	3
996	4
996	35
996	16
996	19
996	5
996	41
996	28
996	29
996	31
996	36
996	9
996	21
996	11
996	22
996	23
996	26
996	12
997	14
997	2
997	3
997	4
997	35
997	19
997	5
997	16
997	7
997	41
997	31
997	36
997	9
997	21
997	11
997	22
997	23
997	26
997	12
998	1
998	28
998	6
998	7
998	32
998	10
998	11
998	26
998	12
998	13
999	14
999	2
999	3
999	4
999	35
999	5
999	19
999	16
999	28
999	29
999	41
999	31
999	36
999	9
999	20
999	32
999	21
999	10
999	11
999	22
999	34
999	23
999	24
999	12
999	13
1000	1
1000	2
1000	3
1000	4
1000	28
1000	29
1000	9
1000	20
1000	42
1000	11
1001	14
1001	2
1001	3
1001	4
1001	35
1001	5
1001	41
1001	28
1001	29
1001	31
1001	32
1001	21
1001	10
1001	33
1001	24
1001	27
1001	12
1001	13
1002	1
1002	2
1002	3
1002	4
1002	5
1002	29
1002	7
1002	9
1002	32
1002	43
1002	10
1002	12
1003	1
1003	2
1003	3
1003	4
1003	15
1003	19
1003	29
1003	6
1003	7
1003	30
1003	9
1003	10
1003	11
1003	26
1003	24
1003	25
1003	27
1003	12
1004	14
1004	2
1004	4
1004	15
1004	41
1004	6
1004	7
1004	30
1004	9
1004	37
1004	10
1004	26
1004	24
1004	12
1005	14
1005	45
1005	2
1005	3
1005	4
1005	35
1005	15
1005	16
1005	19
1005	5
1005	28
1005	29
1005	31
1005	9
1005	43
1005	21
1005	33
1005	11
1005	22
1005	26
1005	23
1005	24
1005	52
1005	12
1006	1
1006	2
1006	4
1006	35
1006	15
1006	19
1006	6
1006	30
1006	9
1006	23
1006	24
1006	12
1006	13
1007	1
1007	2
1007	3
1007	4
1007	35
1007	19
1007	6
1007	7
1007	8
1007	9
1007	37
1007	20
1007	32
1007	42
1007	21
1007	10
1007	33
1007	11
1007	22
1007	12
1007	13
1008	1
1008	2
1008	3
1008	4
1008	35
1008	15
1008	16
1008	18
1008	19
1008	5
1008	28
1008	29
1008	30
1008	31
1008	9
1008	37
1008	20
1008	32
1008	10
1008	11
1008	22
1008	24
1008	38
1008	34
1008	12
1009	14
1009	2
1009	3
1009	34
1009	4
1009	35
1009	15
1009	16
1009	18
1009	19
1009	5
1009	6
1009	7
1009	31
1009	9
1009	37
1009	20
1009	21
1009	42
1009	10
1009	44
1009	33
1009	11
1009	26
1009	27
1009	12
1010	1
1010	2
1010	4
1010	35
1010	15
1010	19
1010	6
1010	7
1010	41
1010	30
1010	32
1010	21
1010	10
1010	33
1010	11
1010	34
1010	26
1010	24
1010	25
1010	27
1010	12
1010	13
1011	14
1011	2
1011	3
1011	4
1011	5
1011	28
1011	29
1011	41
1011	31
1011	32
1011	21
1011	42
1011	10
1011	27
1011	12
1011	13
1012	1
1012	2
1012	3
1012	4
1012	5
1012	28
1012	29
1012	9
1012	32
1012	43
1012	10
1012	12
1013	1
1013	28
1013	6
1013	30
1013	24
1013	25
1013	12
1014	14
1014	2
1014	3
1014	4
1014	35
1014	15
1014	19
1014	5
1014	29
1014	41
1014	30
1014	31
1014	36
1014	9
1014	20
1014	37
1014	10
1014	33
1014	22
1014	11
1014	23
1014	56
1014	54
1014	27
1014	12
1014	13
1014	48
1015	14
1015	2
1015	3
1015	4
1015	35
1015	15
1015	16
1015	19
1015	5
1015	28
1015	30
1015	31
1015	9
1015	21
1015	32
1015	10
1015	44
1015	11
1015	26
1015	23
1015	24
1015	39
1015	12
1015	13
1015	48
1016	1
1016	2
1016	34
1016	4
1016	20
1016	50
1016	46
1016	6
1016	7
1016	30
1016	8
1016	37
1016	32
1016	44
1016	10
1016	33
1016	11
1016	51
1016	26
1016	12
1016	13
1017	14
1017	45
1017	2
1017	3
1017	34
1017	4
1017	35
1017	15
1017	16
1017	18
1017	19
1017	29
1017	31
1017	36
1017	9
1017	37
1017	20
1017	21
1017	42
1017	10
1017	44
1017	33
1017	11
1017	26
1017	27
1017	12
1018	1
1018	2
1018	22
1018	3
1018	20
1018	4
1018	35
1018	15
1018	16
1018	17
1018	40
1018	28
1018	29
1018	30
1018	31
1018	36
1018	9
1018	37
1018	42
1018	43
1018	32
1018	10
1018	44
1018	33
1018	11
1018	12
1019	14
1019	45
1019	2
1019	3
1019	4
1019	35
1019	15
1019	16
1019	19
1019	5
1019	41
1019	28
1019	29
1019	31
1019	36
1019	9
1019	20
1019	42
1019	21
1019	32
1019	10
1019	44
1019	33
1019	11
1019	26
1020	14
1020	45
1020	2
1020	3
1020	4
1020	35
1020	15
1020	16
1020	18
1020	19
1020	5
1020	28
1020	29
1020	31
1020	36
1020	9
1020	37
1020	21
1020	10
1020	44
1020	33
1020	11
1020	26
1020	23
1020	24
1020	27
1020	12
1021	14
1021	2
1021	3
1021	20
1021	4
1021	35
1021	16
1021	17
1021	19
1021	49
1021	5
1021	28
1021	29
1021	41
1021	31
1021	36
1021	9
1021	42
1021	21
1021	11
1021	26
1021	23
1021	25
1021	38
1021	12
1022	1
1022	2
1022	3
1022	34
1022	4
1022	35
1022	5
1022	41
1022	17
1022	15
1022	16
1022	28
1022	29
1022	7
1022	31
1022	36
1022	9
1022	37
1022	20
1022	32
1022	43
1022	21
1022	44
1022	10
1022	33
1022	11
1022	27
1022	12
1022	13
1023	14
1023	45
1023	2
1023	3
1023	34
1023	4
1023	15
1023	16
1023	18
1023	5
1023	50
1023	29
1023	7
1023	41
1023	31
1023	36
1023	60
1023	9
1023	20
1023	32
1023	10
1023	44
1023	33
1023	11
1023	24
1023	25
1023	48
1024	14
1024	2
1024	4
1024	35
1024	15
1024	18
1024	41
1024	6
1024	7
1024	30
1024	9
1024	20
1024	10
1024	11
1024	38
1024	23
1024	24
1024	52
1024	12
1024	13
1025	1
1025	2
1025	3
1025	4
1025	35
1025	15
1025	16
1025	19
1025	5
1025	6
1025	30
1025	8
1025	9
1025	21
1025	32
1025	10
1025	44
1025	33
1025	11
1025	22
1025	26
1025	24
1025	12
1025	13
1026	14
1026	45
1026	2
1026	3
1026	4
1026	35
1026	15
1026	16
1026	18
1026	19
1026	5
1026	28
1026	29
1026	7
1026	41
1026	31
1026	36
1026	60
1026	9
1026	20
1026	32
1026	10
1026	44
1026	33
1026	11
1026	24
1026	25
1026	48
1027	14
1027	45
1027	2
1027	3
1027	4
1027	16
1027	19
1027	5
1027	41
1027	28
1027	29
1027	31
1027	36
1027	9
1027	20
1027	21
1027	11
1027	23
1027	27
1027	12
1028	14
1028	45
1028	2
1028	3
1028	4
1028	35
1028	15
1028	16
1028	18
1028	19
1028	5
1028	28
1028	29
1028	7
1028	41
1028	31
1028	36
1028	60
1028	9
1028	20
1028	32
1028	10
1028	44
1028	33
1028	11
1028	24
1028	25
1028	48
1029	14
1029	2
1029	3
1029	19
1029	7
1029	36
1029	20
1029	24
1029	12
1030	1
1030	2
1030	3
1030	4
1030	35
1030	5
1030	28
1030	29
1030	31
1030	36
1030	9
1030	11
1030	26
1030	23
1030	24
1030	27
1030	12
1030	13
1031	14
1031	2
1031	3
1031	4
1031	6
1031	7
1031	30
1031	9
1031	20
1031	32
1031	10
1031	33
1031	11
1031	26
1031	23
1031	24
1031	38
1031	48
1032	14
1032	2
1032	3
1032	4
1032	35
1032	15
1032	16
1032	19
1032	5
1032	28
1032	29
1032	30
1032	31
1032	9
1032	20
1032	21
1032	32
1032	10
1032	33
1032	11
1032	24
1032	38
1033	14
1033	2
1033	3
1033	34
1033	4
1033	15
1033	16
1033	18
1033	19
1033	28
1033	29
1033	31
1033	36
1033	9
1033	20
1033	43
1033	21
1033	33
1033	11
1033	22
1033	26
1033	23
1033	51
1033	12
1033	13
1033	48
1034	1
1034	2
1034	3
1034	4
1034	35
1034	19
1034	28
1034	29
1034	6
1034	7
1034	30
1034	31
1034	36
1034	8
1034	9
1034	21
1034	10
1034	33
1034	26
1034	23
1034	24
1034	38
1034	12
1034	13
1035	14
1035	45
1035	2
1035	3
1035	4
1035	35
1035	16
1035	19
1035	5
1035	28
1035	29
1035	41
1035	31
1035	36
1035	9
1035	20
1035	32
1035	21
1035	10
1035	11
1035	22
1035	34
1035	23
1035	24
1035	12
1035	13
1036	1
1036	2
1036	3
1036	35
1036	17
1036	19
1036	49
1036	5
1036	28
1036	29
1036	6
1036	30
1036	9
1036	20
1036	32
1036	21
1036	42
1036	44
1036	47
1036	10
1036	33
1036	11
1036	12
1036	13
1037	1
1037	2
1037	3
1037	4
1037	5
1037	46
1037	28
1037	29
1037	6
1037	7
1037	30
1037	31
1037	9
1037	37
1037	44
1037	10
1037	11
1037	24
1037	27
1037	12
1038	14
1038	2
1038	3
1038	4
1038	15
1038	19
1038	28
1038	29
1038	7
1038	31
1038	36
1038	9
1038	21
1038	32
1038	10
1038	11
1038	26
1038	23
1038	24
1038	38
1038	52
1038	27
1038	12
1038	13
1038	48
1039	14
1039	2
1039	3
1039	4
1039	28
1039	6
1039	30
1039	31
1039	36
1039	9
1039	10
1039	33
1039	11
1039	7
1039	12
1039	13
1040	1
1040	2
1040	4
1040	28
1040	6
1040	9
1040	24
1040	25
1040	12
1041	14
1041	2
1041	3
1041	4
1041	5
1041	28
1041	29
1041	31
1041	36
1041	9
1041	37
1041	20
1041	32
1041	43
1041	44
1041	10
1041	11
1041	22
1041	34
1041	12
1041	13
1042	14
1042	2
1042	35
1042	17
1042	19
1042	28
1042	29
1042	30
1042	31
1042	20
1042	21
1042	32
1042	10
1042	44
1042	33
1042	11
1042	26
1042	24
1042	38
1042	27
1042	12
1042	13
1043	14
1043	45
1043	2
1043	3
1043	4
1043	35
1043	15
1043	16
1043	19
1043	5
1043	41
1043	28
1043	29
1043	31
1043	36
1043	9
1043	20
1043	42
1043	21
1043	32
1043	10
1043	44
1043	33
1043	11
1043	26
1044	1
1044	2
1044	4
1044	28
1044	29
1044	30
1044	31
1044	9
1044	10
1044	33
1044	12
1045	1
1045	2
1045	3
1045	59
1045	4
1045	35
1045	5
1045	41
1045	17
1045	15
1045	16
1045	28
1045	29
1045	31
1045	36
1045	9
1045	37
1045	20
1045	32
1045	43
1045	21
1045	44
1045	10
1045	33
1045	11
1045	27
1045	12
1045	13
1046	1
1046	2
1046	3
1046	59
1046	4
1046	35
1046	16
1046	19
1046	49
1046	5
1046	15
1046	28
1046	29
1046	31
1046	36
1046	9
1046	10
1046	11
1046	26
1046	23
1046	24
1046	38
1046	12
1046	13
1047	14
1047	2
1047	3
1047	34
1047	4
1047	35
1047	5
1047	17
1047	15
1047	19
1047	28
1047	29
1047	41
1047	30
1047	31
1047	36
1047	9
1047	32
1047	21
1047	10
1047	11
1047	26
1047	57
1047	23
1047	27
1047	12
1047	13
1048	14
1048	2
1048	3
1048	19
1048	5
1048	28
1048	6
1048	7
1048	31
1048	9
1048	20
1048	37
1048	21
1048	32
1048	10
1048	33
1048	11
1048	23
1048	24
1048	27
1048	12
1049	14
1049	2
1049	3
1049	4
1049	35
1049	5
1049	19
1049	29
1049	6
1049	7
1049	30
1049	31
1049	9
1049	20
1049	21
1049	32
1049	11
1049	26
1049	24
1049	39
1049	23
1049	38
1049	27
1049	12
1050	14
1050	35
1050	19
1050	28
1050	6
1050	31
1050	9
1050	37
1050	10
1050	24
1050	48
1051	1
1051	2
1051	4
1051	5
1051	49
1051	15
1051	18
1051	28
1051	6
1051	30
1051	31
1051	9
1051	20
1051	21
1051	42
1051	10
1051	33
1051	11
1051	22
1051	24
1051	12
1051	13
1052	14
1052	2
1052	35
1052	19
1052	15
1052	6
1052	7
1052	30
1052	36
1052	9
1052	37
1052	20
1052	32
1052	10
1052	11
1052	22
1052	23
1052	24
1052	27
1052	12
1052	13
1053	1
1053	2
1053	3
1053	4
1053	19
1053	6
1053	7
1053	30
1053	8
1053	9
1053	20
1053	32
1053	10
1053	33
1053	11
1053	26
1053	23
1053	38
1053	34
1053	12
1054	14
1054	2
1054	3
1054	34
1054	4
1054	5
1054	28
1054	29
1054	30
1054	31
1054	36
1054	9
1054	37
1054	32
1054	10
1054	53
1054	26
1054	27
1054	12
1054	13
1055	14
1055	2
1055	3
1055	4
1055	49
1055	15
1055	16
1055	19
1055	18
1055	28
1055	29
1055	31
1055	9
1055	20
1055	32
1055	21
1055	10
1055	33
1055	11
1055	22
1055	34
1055	24
1055	12
1055	13
1056	14
1056	45
1056	2
1056	28
1056	29
1056	36
1056	9
1056	34
1057	14
1057	2
1057	3
1057	34
1057	4
1057	15
1057	16
1057	18
1057	19
1057	28
1057	29
1057	31
1057	36
1057	9
1057	20
1057	43
1057	21
1057	33
1057	11
1057	22
1057	26
1057	23
1057	51
1057	12
1057	13
1057	48
1058	14
1058	2
1058	4
1058	15
1058	30
1058	32
1058	10
1058	33
1058	24
1058	26
1058	7
1058	12
1059	14
1059	45
1059	2
1059	3
1059	4
1059	35
1059	15
1059	16
1059	18
1059	19
1059	5
1059	28
1059	29
1059	31
1059	36
1059	9
1059	20
1059	32
1059	21
1059	42
1059	10
1059	22
1059	23
1059	56
1059	24
1059	12
1059	13
1060	1
1060	2
1060	4
1060	35
1060	15
1060	19
1060	28
1060	29
1060	30
1060	31
1060	36
1060	9
1060	20
1060	37
1060	43
1060	21
1060	10
1060	44
1060	33
1060	11
1060	22
1060	12
1060	13
1060	48
1061	1
1061	2
1061	3
1061	4
1061	5
1061	17
1061	28
1061	29
1061	31
1061	9
1061	10
1061	11
1061	26
1061	12
1061	13
1062	14
1062	2
1062	3
1062	4
1062	16
1062	29
1062	31
1062	36
1062	9
1062	20
1062	32
1062	43
1062	21
1062	44
1062	10
1062	33
1062	22
1062	11
1062	27
1062	12
1063	14
1063	2
1063	4
1063	35
1063	15
1063	19
1063	28
1063	6
1063	30
1063	9
1063	32
1063	21
1063	10
1063	33
1063	11
1063	39
1063	26
1063	38
1063	24
1063	12
1064	14
1064	2
1064	4
1064	19
1064	41
1064	28
1064	29
1064	31
1064	36
1064	9
1064	42
1064	21
1064	10
1064	11
1064	38
1064	12
1065	14
1065	45
1065	2
1065	3
1065	4
1065	35
1065	15
1065	17
1065	19
1065	5
1065	41
1065	28
1065	29
1065	31
1065	36
1065	9
1065	20
1065	42
1065	21
1065	32
1065	10
1065	44
1065	33
1065	11
1065	26
1065	27
1065	12
1065	13
1065	48
1066	14
1066	2
1066	3
1066	4
1066	20
1066	35
1066	5
1066	49
1066	15
1066	16
1066	17
1066	28
1066	29
1066	41
1066	31
1066	36
1066	9
1066	21
1066	10
1066	11
1066	22
1066	26
1066	23
1066	25
1066	27
1066	12
1066	13
1067	1
1067	2
1067	4
1067	35
1067	5
1067	41
1067	19
1067	28
1067	29
1067	6
1067	7
1067	31
1067	36
1067	27
1067	12
1068	14
1068	2
1068	4
1068	35
1068	41
1068	58
1068	28
1068	29
1068	30
1068	31
1068	9
1068	37
1068	43
1068	10
1068	11
1068	24
1068	38
1068	48
1069	14
1069	2
1069	3
1069	4
1069	35
1069	19
1069	49
1069	5
1069	28
1069	29
1069	30
1069	31
1069	36
1069	9
1069	20
1069	21
1069	10
1069	33
1069	11
1069	23
1069	24
1069	12
1070	14
1070	45
1070	2
1070	3
1070	35
1070	15
1070	19
1070	58
1070	28
1070	29
1070	41
1070	31
1070	36
1070	9
1070	20
1070	21
1070	32
1070	10
1070	33
1070	11
1070	22
1070	38
1070	23
1070	12
1070	13
1071	1
1071	2
1071	4
1071	35
1071	19
1071	28
1071	29
1071	6
1071	7
1071	30
1071	31
1071	60
1071	9
1071	21
1071	32
1071	10
1071	33
1071	26
1071	24
1071	38
1071	25
1071	27
1071	12
1071	13
1072	14
1072	2
1072	3
1072	34
1072	4
1072	15
1072	16
1072	18
1072	19
1072	28
1072	29
1072	31
1072	36
1072	9
1072	20
1072	43
1072	21
1072	33
1072	11
1072	22
1072	26
1072	23
1072	51
1072	12
1072	13
1072	48
1073	14
1073	45
1073	2
1073	3
1073	34
1073	4
1073	35
1073	15
1073	16
1073	19
1073	5
1073	28
1073	29
1073	30
1073	31
1073	36
1073	9
1073	21
1073	32
1073	10
1073	44
1073	33
1073	22
1073	26
1073	23
1073	24
1073	27
1073	12
1073	13
1074	14
1074	45
1074	2
1074	4
1074	35
1074	16
1074	40
1074	18
1074	19
1074	41
1074	28
1074	29
1074	31
1074	36
1074	9
1074	21
1074	10
1074	11
1074	23
1074	24
1074	38
1074	52
1074	12
1075	14
1075	2
1075	3
1075	4
1075	49
1075	15
1075	16
1075	18
1075	19
1075	28
1075	29
1075	31
1075	9
1075	20
1075	32
1075	21
1075	10
1075	33
1075	11
1075	22
1075	34
1075	39
1075	12
1075	13
1076	1
1076	2
1076	3
1076	4
1076	5
1076	17
1076	28
1076	29
1076	31
1076	36
1076	9
1076	20
1076	32
1076	44
1076	10
1076	33
1076	22
1076	34
1076	53
1076	26
1076	12
1076	13
1077	14
1077	45
1077	2
1077	3
1077	22
1077	34
1077	59
1077	4
1077	20
1077	5
1077	41
1077	28
1077	29
1077	31
1077	36
1077	9
1077	21
1077	42
1077	44
1077	10
1077	11
1077	57
1077	12
1077	13
1078	1
1078	2
1078	4
1078	28
1078	6
1078	7
1078	30
1078	31
1078	9
1078	24
1078	26
1078	12
1078	13
1078	48
1079	14
1079	2
1079	3
1079	34
1079	4
1079	20
1079	5
1079	41
1079	17
1079	58
1079	46
1079	31
1079	36
1079	9
1079	44
1079	10
1079	11
1079	26
1079	24
1079	23
1079	12
1079	13
1080	14
1080	2
1080	3
1080	59
1080	4
1080	5
1080	41
1080	17
1080	61
1080	28
1080	29
1080	31
1080	36
1080	9
1080	37
1080	20
1080	43
1080	44
1080	10
1080	11
1080	22
1080	39
1080	7
1080	27
1080	12
1080	13
1081	14
1081	2
1081	3
1081	4
1081	5
1081	58
1081	15
1081	16
1081	18
1081	19
1081	28
1081	29
1081	31
1081	36
1081	9
1081	21
1081	10
1081	33
1081	11
1081	34
1081	26
1081	7
1081	23
1081	24
1081	27
1081	12
1081	13
1082	1
1082	2
1082	3
1082	4
1082	15
1082	28
1082	29
1082	6
1082	7
1082	31
1082	9
1082	20
1082	10
1082	33
1082	11
1082	22
1082	26
1082	24
1082	57
1082	12
1082	13
1083	14
1083	45
1083	2
1083	3
1083	4
1083	35
1083	5
1083	58
1083	15
1083	19
1083	28
1083	29
1083	41
1083	31
1083	36
1083	9
1083	37
1083	20
1083	32
1083	43
1083	21
1083	33
1083	11
1083	22
1083	39
1083	27
1083	13
1083	12
1084	14
1084	2
1084	3
1084	34
1084	4
1084	35
1084	5
1084	49
1084	15
1084	16
1084	17
1084	28
1084	29
1084	41
1084	31
1084	36
1084	9
1084	20
1084	21
1084	32
1084	44
1084	11
1084	22
1084	26
1084	23
1084	38
1084	12
1085	14
1085	45
1085	2
1085	3
1085	4
1085	35
1085	5
1085	58
1085	41
1085	19
1085	15
1085	28
1085	29
1085	31
1085	36
1085	9
1085	37
1085	20
1085	32
1085	43
1085	21
1085	33
1085	11
1085	22
1085	26
1085	27
1085	13
1085	12
1086	14
1086	45
1086	2
1086	3
1086	22
1086	34
1086	59
1086	4
1086	20
1086	35
1086	5
1086	28
1086	29
1086	7
1086	41
1086	31
1086	36
1086	9
1086	37
1086	32
1086	43
1086	21
1086	42
1086	44
1086	10
1086	33
1086	12
1086	13
1087	1
1087	2
1087	3
1087	4
1087	5
1087	58
1087	15
1087	19
1087	28
1087	29
1087	7
1087	30
1087	31
1087	36
1087	9
1087	32
1087	10
1087	11
1087	27
1087	12
1087	13
1088	14
1088	2
1088	3
1088	4
1088	15
1088	19
1088	5
1088	28
1088	29
1088	7
1088	30
1088	31
1088	36
1088	9
1088	20
1088	37
1088	43
1088	32
1088	10
1088	33
1088	11
1088	26
1088	23
1088	27
1088	12
1088	13
1089	14
1089	45
1089	2
1089	3
1089	4
1089	35
1089	5
1089	41
1089	15
1089	19
1089	28
1089	29
1089	31
1089	36
1089	9
1089	37
1089	20
1089	32
1089	43
1089	21
1089	33
1089	11
1089	22
1089	24
1089	27
1089	13
1089	12
1090	14
1090	2
1090	3
1090	4
1090	5
1090	41
1090	19
1090	28
1090	29
1090	31
1090	36
1090	9
1090	32
1090	21
1090	10
1090	11
1090	27
1090	12
1090	13
1091	14
1091	2
1091	3
1091	4
1091	5
1091	58
1091	15
1091	16
1091	18
1091	19
1091	28
1091	29
1091	31
1091	36
1091	9
1091	21
1091	10
1091	33
1091	11
1091	34
1091	26
1091	7
1091	23
1091	24
1091	27
1091	12
1091	13
1092	14
1092	2
1092	4
1092	35
1092	19
1092	28
1092	29
1092	31
1092	9
1092	37
1092	20
1092	32
1092	43
1092	10
1092	44
1092	11
1092	22
1092	23
1092	13
1092	12
1093	14
1093	45
1093	2
1093	3
1093	4
1093	16
1093	28
1093	29
1093	31
1093	36
1093	9
1093	20
1093	43
1093	21
1093	32
1093	10
1093	44
1093	33
1093	22
1093	23
1093	27
1093	12
1094	1
1094	2
1094	3
1094	4
1094	19
1094	6
1094	30
1094	31
1094	8
1094	9
1094	37
1094	32
1094	10
1094	33
1094	11
1094	22
1094	34
1094	26
1094	7
1094	12
1094	13
1095	14
1095	45
1095	2
1095	3
1095	34
1095	4
1095	5
1095	15
1095	19
1095	28
1095	29
1095	41
1095	31
1095	36
1095	9
1095	20
1095	21
1095	33
1095	11
1095	38
1095	27
1095	12
1095	13
1096	1
1096	2
1096	3
1096	22
1096	4
1096	20
1096	28
1096	6
1096	31
1096	36
1096	9
1096	10
1096	33
1096	11
1096	34
1096	27
1096	12
1096	13
1097	14
1097	2
1097	3
1097	4
1097	35
1097	15
1097	16
1097	18
1097	19
1097	5
1097	28
1097	29
1097	31
1097	36
1097	9
1097	21
1097	32
1097	10
1097	11
1097	26
1097	23
1097	24
1097	38
1097	52
1097	12
1098	14
1098	2
1098	3
1098	4
1098	35
1098	19
1098	6
1098	7
1098	41
1098	36
1098	8
1098	9
1098	20
1098	32
1098	43
1098	42
1098	44
1098	10
1098	11
1098	22
1098	53
1098	27
1098	12
1098	13
1099	14
1099	45
1099	2
1099	3
1099	4
1099	15
1099	19
1099	5
1099	28
1099	29
1099	36
1099	9
1099	20
1099	21
1099	11
1099	22
1099	23
1099	27
1099	12
1100	14
1100	45
1100	2
1100	3
1100	4
1100	15
1100	19
1100	5
1100	28
1100	29
1100	36
1100	9
1100	20
1100	21
1100	11
1100	22
1100	23
1100	27
1100	12
1101	1
1101	2
1101	3
1101	5
1101	29
1101	7
1101	30
1101	9
1101	22
1101	24
1101	51
1101	56
1101	12
1102	14
1102	45
1102	2
1102	3
1102	4
1102	5
1102	28
1102	29
1102	7
1102	31
1102	36
1102	9
1102	20
1102	32
1102	10
1102	11
1102	34
1102	23
1102	27
1102	13
1103	14
1103	45
1103	2
1103	3
1103	4
1103	5
1103	28
1103	29
1103	7
1103	31
1103	36
1103	9
1103	20
1103	32
1103	10
1103	11
1103	34
1103	23
1103	27
1103	13
1104	1
1104	2
1104	3
1104	4
1104	35
1104	15
1104	16
1104	18
1104	19
1104	49
1104	5
1104	6
1104	30
1104	31
1104	9
1104	20
1104	37
1104	21
1104	10
1104	33
1104	11
1104	23
1104	24
1104	25
1104	12
1105	1
1105	2
1105	3
1105	4
1105	35
1105	41
1105	50
1105	19
1105	28
1105	6
1105	30
1105	31
1105	9
1105	21
1105	32
1105	10
1105	33
1105	25
1105	38
1105	39
1105	12
1105	13
1106	14
1106	2
1106	3
1106	4
1106	5
1106	15
1106	19
1106	28
1106	29
1106	31
1106	9
1106	37
1106	10
1106	11
1106	23
1106	7
1106	13
1107	14
1107	2
1107	34
1107	20
1107	15
1107	16
1107	18
1107	5
1107	6
1107	7
1107	8
1107	10
1107	44
1107	33
1107	24
1107	51
1107	48
1108	1
1108	2
1108	3
1108	4
1108	35
1108	15
1108	16
1108	18
1108	19
1108	5
1108	28
1108	29
1108	30
1108	31
1108	37
1108	21
1108	32
1108	10
1108	11
1108	24
1108	38
1108	34
1108	39
1108	12
1109	1
1109	2
1109	3
1109	19
1109	29
1109	7
1109	31
1109	36
1109	9
1109	20
1109	11
1109	23
1109	24
1109	39
1109	38
1109	12
1109	13
1110	1
1110	2
1110	3
1110	4
1110	17
1110	28
1110	6
1110	30
1110	31
1110	9
1110	37
1110	20
1110	32
1110	43
1110	10
1110	33
1110	11
1110	34
1110	7
1110	12
1110	13
1111	1
1111	2
1111	34
1111	4
1111	35
1111	15
1111	16
1111	18
1111	19
1111	28
1111	29
1111	6
1111	30
1111	21
1111	10
1111	25
1111	38
1111	24
1111	12
1111	13
1112	14
1112	45
1112	2
1112	34
1112	15
1112	28
1112	9
1112	11
1112	22
1112	23
1112	48
1113	14
1113	2
1113	3
1113	4
1113	5
1113	58
1113	28
1113	29
1113	41
1113	30
1113	31
1113	36
1113	9
1113	37
1113	20
1113	32
1113	42
1113	44
1113	10
1113	33
1113	11
1113	22
1113	27
1113	12
1113	13
1114	1
1114	2
1114	3
1114	4
1114	35
1114	16
1114	19
1114	5
1114	29
1114	6
1114	7
1114	30
1114	41
1114	9
1114	32
1114	10
1114	33
1114	11
1114	24
1114	38
1114	57
1114	12
1115	1
1115	2
1115	4
1115	15
1115	41
1115	6
1115	7
1115	30
1115	9
1115	37
1115	10
1115	26
1115	24
1115	12
1116	1
1116	2
1116	4
1116	29
1116	7
1116	9
1116	32
1116	43
1116	10
1116	12
1117	14
1117	2
1117	3
1117	4
1117	15
1117	18
1117	19
1117	49
1117	28
1117	6
1117	30
1117	31
1117	9
1117	20
1117	11
1117	26
1117	23
1117	38
1117	12
1118	14
1118	45
1118	2
1118	3
1118	34
1118	4
1118	20
1118	5
1118	28
1118	29
1118	31
1118	36
1118	9
1118	32
1118	21
1118	47
1118	33
1118	11
1118	51
1118	27
1118	12
1118	13
1119	14
1119	2
1119	3
1119	59
1119	4
1119	35
1119	5
1119	19
1119	29
1119	7
1119	41
1119	31
1119	8
1119	36
1119	9
1119	37
1119	20
1119	32
1119	43
1119	42
1119	44
1119	10
1119	11
1119	34
1119	27
1119	12
1119	13
1120	14
1120	2
1120	3
1120	4
1120	15
1120	19
1120	5
1120	41
1120	28
1120	29
1120	31
1120	36
1120	9
1120	20
1120	21
1120	11
1120	22
1120	23
1120	24
1120	26
1120	38
1120	48
1121	14
1121	45
1121	2
1121	3
1121	4
1121	16
1121	15
1121	19
1121	5
1121	28
1121	29
1121	41
1121	31
1121	36
1121	20
1121	21
1121	32
1121	44
1121	33
1121	11
1121	22
1121	26
1121	23
1121	24
1121	12
1121	13
1121	48
1122	14
1122	45
1122	2
1122	3
1122	4
1122	35
1122	15
1122	19
1122	5
1122	16
1122	18
1122	28
1122	29
1122	31
1122	36
1122	9
1122	20
1122	37
1122	43
1122	21
1122	32
1122	10
1122	44
1122	33
1122	11
1122	27
1122	12
1123	1
1123	2
1123	3
1123	4
1123	5
1123	15
1123	18
1123	19
1123	28
1123	29
1123	30
1123	9
1123	21
1123	10
1123	11
1123	27
1123	13
1124	1
1124	45
1124	2
1124	3
1124	4
1124	15
1124	28
1124	29
1124	31
1124	36
1124	42
1124	21
1124	47
1124	33
1124	25
1124	39
1124	12
1124	13
1125	14
1125	45
1125	2
1125	59
1125	34
1125	35
1125	15
1125	16
1125	19
1125	28
1125	29
1125	31
1125	36
1125	9
1125	21
1125	32
1125	44
1125	33
1125	11
1125	22
1125	26
1125	23
1125	38
1125	12
1126	1
1126	2
1126	4
1126	19
1126	6
1126	7
1126	30
1126	41
1126	11
1126	24
1126	38
1126	26
1126	12
1126	13
1127	14
1127	2
1127	3
1127	4
1127	35
1127	5
1127	15
1127	19
1127	28
1127	29
1127	31
1127	9
1127	37
1127	10
1127	11
1127	7
1127	23
1127	13
1128	14
1128	2
1128	3
1128	4
1128	5
1128	16
1128	19
1128	15
1128	29
1128	7
1128	41
1128	31
1128	36
1128	9
1128	20
1128	32
1128	10
1128	11
1128	34
1128	23
1128	27
1128	13
1129	14
1129	45
1129	2
1129	3
1129	34
1129	59
1129	4
1129	5
1129	41
1129	17
1129	15
1129	28
1129	29
1129	31
1129	36
1129	9
1129	37
1129	20
1129	32
1129	43
1129	21
1129	42
1129	10
1129	44
1129	33
1129	27
1129	12
1129	13
1130	14
1130	2
1130	3
1130	4
1130	15
1130	18
1130	5
1130	28
1130	29
1130	30
1130	31
1130	36
1130	9
1130	21
1130	32
1130	33
1130	11
1130	26
1130	23
1130	12
1131	14
1131	2
1131	3
1131	4
1131	5
1131	28
1131	29
1131	31
1131	9
1131	32
1131	21
1131	47
1131	33
1131	11
1131	51
1131	27
1131	12
1131	13
1132	1
1132	2
1132	4
1132	35
1132	15
1132	19
1132	6
1132	7
1132	30
1132	21
1132	10
1132	11
1132	12
1132	13
1133	14
1133	2
1133	3
1133	4
1133	5
1133	16
1133	19
1133	15
1133	29
1133	7
1133	41
1133	31
1133	36
1133	9
1133	20
1133	32
1133	10
1133	11
1133	34
1133	23
1133	27
1133	13
1134	14
1134	45
1134	2
1134	3
1134	34
1134	4
1134	20
1134	5
1134	28
1134	29
1134	31
1134	36
1134	9
1134	32
1134	21
1134	47
1134	33
1134	11
1134	51
1134	27
1134	12
1134	13
1135	1
1135	2
1135	22
1135	4
1135	20
1135	35
1135	15
1135	19
1135	5
1135	16
1135	46
1135	28
1135	6
1135	7
1135	30
1135	41
1135	9
1135	37
1135	32
1135	10
1135	44
1135	33
1135	11
1135	23
1135	12
1136	1
1136	2
1136	6
1136	7
1136	30
1136	9
1136	21
1136	23
1136	12
1137	14
1137	2
1137	3
1137	4
1137	15
1137	19
1137	29
1137	7
1137	31
1137	8
1137	9
1137	21
1137	11
1137	27
1137	13
1137	48
1138	14
1138	2
1138	3
1138	4
1138	15
1138	19
1138	28
1138	29
1138	41
1138	31
1138	9
1138	21
1138	11
1138	7
1138	27
1138	13
1138	48
1139	14
1139	2
1139	3
1139	4
1139	15
1139	19
1139	29
1139	7
1139	31
1139	9
1139	21
1139	11
1139	27
1139	13
1139	48
1140	14
1140	2
1140	3
1140	4
1140	15
1140	29
1140	7
1140	31
1140	9
1140	21
1140	11
1140	27
1140	13
1140	48
1141	1
1141	45
1141	2
1141	3
1141	4
1141	5
1141	28
1141	29
1141	31
1141	36
1141	9
1141	37
1141	20
1141	32
1141	21
1141	10
1141	11
1141	22
1141	34
1141	52
1141	27
1141	48
1142	1
1142	2
1142	4
1142	5
1142	28
1142	29
1142	31
1142	36
1142	9
1142	37
1142	20
1142	32
1142	21
1142	10
1142	11
1142	22
1142	34
1142	52
1142	27
1142	48
1143	1
1143	2
1143	3
1143	4
1143	5
1143	28
1143	29
1143	31
1143	36
1143	9
1143	37
1143	20
1143	32
1143	21
1143	10
1143	11
1143	22
1143	34
1143	52
1143	27
1143	48
1144	1
1144	2
1144	35
1144	19
1144	29
1144	30
1144	9
1144	21
1144	26
1144	24
1144	7
1144	38
1144	12
1144	13
1145	1
1145	2
1145	3
1145	4
1145	35
1145	15
1145	19
1145	16
1145	28
1145	29
1145	30
1145	9
1145	37
1145	21
1145	10
1145	25
1145	38
1145	24
1145	12
1145	13
1145	48
1146	14
1146	2
1146	3
1146	4
1146	35
1146	15
1146	16
1146	17
1146	18
1146	19
1146	5
1146	29
1146	7
1146	31
1146	36
1146	9
1146	20
1146	21
1146	32
1146	44
1146	33
1146	11
1146	23
1146	24
1146	25
1146	27
1146	12
1147	1
1147	2
1147	4
1147	35
1147	15
1147	18
1147	19
1147	28
1147	6
1147	30
1147	9
1147	38
1147	24
1147	12
1147	13
1148	1
1148	45
1148	2
1148	3
1148	4
1148	35
1148	5
1148	17
1148	15
1148	16
1148	18
1148	28
1148	29
1148	41
1148	31
1148	36
1148	9
1148	37
1148	20
1148	32
1148	43
1148	21
1148	42
1148	44
1148	10
1148	47
1148	27
1148	12
1148	13
1149	1
1149	28
1149	6
1149	31
1150	1
1150	2
1150	4
1150	35
1150	15
1150	19
1150	28
1150	6
1150	9
1150	10
1150	11
1150	22
1150	24
1150	7
1150	12
1150	13
1151	1
1151	2
1151	3
1151	4
1151	15
1151	16
1151	19
1151	5
1151	6
1151	7
1151	30
1151	9
1151	21
1151	10
1151	33
1151	22
1151	24
1151	12
1151	13
1151	48
1152	1
1152	2
1152	3
1152	4
1152	6
1152	7
1152	30
1152	8
1152	9
1152	37
1152	10
1152	11
1152	12
1153	14
1153	45
1153	2
1153	3
1153	4
1153	35
1153	15
1153	16
1153	18
1153	19
1153	5
1153	28
1153	29
1153	31
1153	36
1153	9
1153	37
1153	32
1153	44
1153	10
1153	33
1153	11
1153	23
1153	24
1153	7
1153	12
1154	14
1154	3
1154	4
1154	20
1154	6
1154	7
1154	8
1154	37
1154	32
1154	10
1154	33
1154	11
1154	24
1154	12
1154	13
1155	1
1155	2
1155	3
1155	4
1155	35
1155	15
1155	16
1155	18
1155	19
1155	28
1155	29
1155	6
1155	7
1155	30
1155	31
1155	8
1155	9
1155	37
1155	21
1155	10
1155	11
1155	26
1155	24
1155	38
1155	52
1155	12
1155	13
1155	48
1156	14
1156	2
1156	3
1156	4
1156	15
1156	16
1156	6
1156	7
1156	30
1156	9
1156	47
1156	11
1156	26
1156	24
1156	25
1156	38
1156	12
1157	14
1157	2
1157	3
1157	4
1157	35
1157	5
1157	15
1157	16
1157	18
1157	19
1157	28
1157	29
1157	7
1157	31
1157	36
1157	9
1157	20
1157	32
1157	43
1157	21
1157	10
1157	33
1157	11
1157	22
1157	34
1157	27
1157	12
1157	13
1158	14
1158	2
1158	3
1158	4
1158	35
1158	19
1158	28
1158	6
1158	30
1158	9
1158	21
1158	10
1158	11
1158	23
1158	24
1158	25
1158	12
1159	1
1159	2
1159	3
1159	4
1159	35
1159	5
1159	17
1159	46
1159	15
1159	16
1159	18
1159	28
1159	29
1159	31
1159	9
1159	37
1159	20
1159	32
1159	21
1159	44
1159	10
1159	33
1159	11
1159	23
1159	12
1160	14
1160	2
1160	3
1160	4
1160	5
1160	28
1160	6
1160	30
1160	31
1160	9
1160	33
1161	14
1161	2
1161	3
1161	4
1161	5
1161	28
1161	29
1161	31
1161	36
1161	9
1161	20
1161	43
1161	44
1161	10
1161	33
1161	11
1161	34
1161	12
1162	14
1162	2
1162	3
1162	4
1162	35
1162	5
1162	15
1162	18
1162	19
1162	16
1162	29
1162	7
1162	31
1162	36
1162	9
1162	20
1162	32
1162	21
1162	10
1162	33
1162	11
1162	22
1162	53
1162	26
1162	27
1162	12
1162	13
1163	1
1163	2
1163	4
1163	35
1163	15
1163	19
1163	6
1163	7
1163	30
1163	9
1163	37
1163	10
1163	11
1163	12
1164	14
1164	45
1164	2
1164	3
1164	34
1164	4
1164	5
1164	58
1164	15
1164	16
1164	19
1164	28
1164	29
1164	36
1164	8
1164	9
1164	37
1164	32
1164	43
1164	21
1164	42
1164	44
1164	10
1164	47
1164	33
1164	27
1164	12
1164	13
1165	14
1165	2
1165	3
1165	4
1165	5
1165	6
1165	7
1165	8
1166	1
1166	2
1166	3
1166	4
1166	35
1166	5
1166	29
1166	6
1166	7
1166	30
1166	9
1166	37
1166	20
1166	21
1166	11
1166	22
1166	12
1166	13
1167	14
1167	2
1167	19
1167	28
1167	29
1167	6
1167	7
1167	32
1167	10
1167	11
1167	27
1167	12
1167	13
1168	1
1168	2
1168	3
1168	4
1168	15
1168	18
1168	19
1168	5
1168	28
1168	29
1168	7
1168	31
1168	9
1168	20
1168	42
1168	43
1168	21
1168	32
1168	10
1168	44
1168	11
1168	22
1168	12
1169	1
1169	2
1169	3
1169	22
1169	4
1169	28
1169	29
1169	30
1169	31
1169	9
1169	26
1169	12
1170	14
1170	2
1170	4
1170	7
1170	30
1170	9
1170	20
1170	32
1170	44
1170	10
1170	47
1170	11
1170	13
1171	14
1171	2
1171	3
1171	4
1171	35
1171	15
1171	19
1171	6
1171	7
1171	30
1171	9
1171	20
1171	10
1171	24
1171	38
1171	12
1172	1
1172	2
1172	3
1172	4
1172	35
1172	15
1172	16
1172	18
1172	19
1172	5
1172	28
1172	29
1172	30
1172	31
1172	36
1172	9
1172	20
1172	21
1172	32
1172	10
1172	44
1172	33
1172	11
1172	26
1172	23
1172	12
1173	1
1173	2
1173	3
1173	4
1173	35
1173	15
1173	19
1173	29
1173	7
1173	30
1173	9
1173	37
1173	32
1173	10
1173	33
1173	24
1173	38
1173	12
1173	13
1174	1
1174	2
1174	4
1174	15
1174	18
1174	19
1174	6
1174	7
1174	30
1174	12
1174	13
1175	14
1175	45
1175	2
1175	3
1175	34
1175	4
1175	35
1175	15
1175	16
1175	18
1175	17
1175	28
1175	29
1175	31
1175	36
1175	9
1175	21
1175	32
1175	33
1175	26
1175	23
1175	24
1175	38
1175	52
1175	27
1175	12
1175	48
1176	1
1176	2
1176	4
1176	6
1176	30
1176	9
1176	37
1176	20
1176	10
1176	11
1176	22
1176	7
1176	23
1176	24
1176	12
1177	1
1177	2
1177	3
1177	35
1177	17
1177	15
1177	16
1177	19
1177	6
1177	7
1177	30
1177	31
1177	8
1177	9
1177	37
1177	21
1177	10
1177	11
1177	22
1177	39
1177	54
1177	23
1177	27
1177	12
1177	13
1178	1
1178	2
1178	4
1178	35
1178	16
1178	19
1178	28
1178	6
1178	9
1178	37
1178	20
1178	32
1178	10
1178	11
1178	34
1178	24
1178	38
1178	52
1178	12
1179	1
1179	2
1179	22
1179	3
1179	34
1179	4
1179	15
1179	16
1179	18
1179	19
1179	5
1179	28
1179	29
1179	31
1179	36
1179	9
1179	20
1179	42
1179	21
1179	33
1179	11
1179	38
1179	39
1179	27
1180	14
1180	2
1180	3
1180	4
1180	35
1180	41
1180	15
1180	16
1180	18
1180	19
1180	28
1180	29
1180	31
1180	36
1180	9
1180	37
1180	20
1180	32
1180	21
1180	10
1180	33
1180	11
1180	26
1180	23
1180	12
1180	13
1181	1
1181	45
1181	2
1181	3
1181	4
1181	35
1181	15
1181	16
1181	17
1181	18
1181	19
1181	28
1181	29
1181	41
1181	31
1181	36
1181	9
1181	37
1181	20
1181	32
1181	43
1181	21
1181	42
1181	44
1181	10
1181	47
1181	27
1181	12
1181	13
1182	1
1182	45
1182	2
1182	3
1182	4
1182	35
1182	15
1182	16
1182	17
1182	18
1182	19
1182	28
1182	29
1182	41
1182	31
1182	36
1182	9
1182	37
1182	20
1182	32
1182	43
1182	21
1182	42
1182	44
1182	10
1182	47
1182	27
1182	12
1182	13
1183	1
1183	45
1183	2
1183	59
1183	4
1183	35
1183	15
1183	16
1183	18
1183	19
1183	5
1183	28
1183	29
1183	30
1183	41
1183	31
1183	36
1183	9
1183	20
1183	32
1183	44
1183	33
1183	11
1183	22
1183	26
1183	23
1183	24
1183	27
1183	12
1184	1
1184	2
1184	4
1184	19
1184	28
1184	29
1184	6
1184	30
1184	31
1184	9
1184	37
1184	32
1184	10
1184	11
1184	23
1184	24
1184	12
1185	14
1185	19
1185	28
1185	29
1185	37
1185	32
1185	21
1185	44
1185	10
1185	33
1185	11
1185	51
1185	26
1185	27
1185	12
1185	13
1186	1
1186	2
1186	3
1186	4
1186	35
1186	15
1186	16
1186	17
1186	19
1186	5
1186	49
1186	29
1186	7
1186	31
1186	36
1186	9
1186	20
1186	37
1186	21
1186	32
1186	43
1186	44
1186	10
1186	33
1186	11
1186	27
1186	12
1186	13
1187	1
1187	2
1187	3
1187	4
1187	35
1187	19
1187	5
1187	28
1187	29
1187	31
1187	36
1187	9
1187	37
1187	42
1187	21
1187	32
1187	10
1187	44
1187	33
1187	11
1187	22
1187	12
1188	1
1188	19
1188	28
1188	6
1188	8
1188	9
1188	24
1188	12
1189	1
1189	2
1189	4
1189	35
1189	19
1189	28
1189	6
1189	30
1189	9
1189	21
1189	24
1189	39
1189	38
1189	23
1189	12
1189	13
1190	14
1190	2
1190	3
1190	4
1190	35
1190	15
1190	16
1190	19
1190	28
1190	29
1190	31
1190	9
1190	37
1190	21
1190	47
1190	24
1190	38
1190	12
1191	1
1191	2
1191	3
1191	4
1191	28
1191	6
1191	30
1191	31
1191	9
1191	37
1191	20
1191	42
1191	10
1191	33
1191	11
1191	26
1192	14
1192	45
1192	2
1192	3
1192	34
1192	4
1192	20
1192	35
1192	5
1192	41
1192	17
1192	28
1192	29
1192	31
1192	36
1192	9
1192	32
1192	21
1192	42
1192	47
1192	33
1192	22
1192	39
1192	26
1192	57
1192	27
1192	12
1192	13
1193	1
1193	2
1193	3
1193	4
1193	5
1193	28
1193	29
1193	41
1193	36
1193	9
1193	20
1193	21
1193	44
1193	10
1193	11
1193	27
1193	12
1193	13
1194	14
1194	2
1194	3
1194	5
1194	28
1194	29
1194	31
1194	9
1194	37
1194	10
1194	33
1194	12
1195	14
1195	2
1195	3
1195	4
1195	35
1195	19
1195	28
1195	6
1195	30
1195	9
1195	21
1195	10
1195	11
1195	23
1195	24
1195	25
1195	12
1196	14
1196	2
1196	3
1196	4
1196	28
1196	29
1196	31
1196	9
1196	20
1196	44
1196	10
1196	33
1196	11
1196	24
1196	38
1196	12
1197	14
1197	2
1197	3
1197	59
1197	4
1197	35
1197	15
1197	16
1197	18
1197	19
1197	5
1197	6
1197	7
1197	30
1197	31
1197	9
1197	37
1197	21
1197	32
1197	10
1197	44
1197	33
1197	11
1197	22
1197	26
1197	12
1197	13
1198	14
1198	2
1198	3
1198	4
1198	5
1198	16
1198	28
1198	29
1198	41
1198	31
1198	36
1198	9
1198	20
1198	32
1198	21
1198	44
1198	10
1198	11
1198	39
1198	27
1198	12
1198	13
1199	1
1199	2
1199	3
1199	4
1199	16
1199	40
1199	19
1199	28
1199	6
1199	30
1199	9
1199	11
1199	23
1199	24
1199	12
1200	1
1200	2
1200	3
1200	22
1200	4
1200	35
1200	5
1200	50
1200	19
1200	15
1200	28
1200	29
1200	6
1200	7
1200	41
1200	30
1200	31
1200	8
1200	9
1200	37
1200	32
1200	21
1200	10
1200	44
1200	33
1200	11
1200	39
1200	27
1200	12
1200	13
1201	14
1201	45
1201	2
1201	3
1201	22
1201	4
1201	35
1201	15
1201	19
1201	5
1201	18
1201	28
1201	29
1201	31
1201	36
1201	9
1201	20
1201	42
1201	32
1201	10
1201	44
1201	33
1201	11
1201	24
1201	12
1201	13
1201	48
1202	14
1202	45
1202	2
1202	3
1202	4
1202	35
1202	16
1202	18
1202	19
1202	5
1202	15
1202	28
1202	29
1202	31
1202	36
1202	9
1202	20
1202	37
1202	42
1202	21
1202	32
1202	43
1202	10
1202	44
1202	33
1202	12
1202	13
1203	14
1203	35
1203	40
1203	19
1203	28
1203	6
1203	30
1203	31
1203	9
1203	21
1203	11
1203	26
1203	23
1203	24
1203	52
1203	12
1204	1
1204	17
1204	58
1204	28
1204	29
1204	9
1204	37
1204	20
1204	32
1204	43
1204	21
1204	42
1204	44
1204	10
1204	33
1204	27
1204	12
1204	13
1205	1
1205	2
1205	3
1205	4
1205	35
1205	15
1205	16
1205	19
1205	5
1205	49
1205	29
1205	7
1205	31
1205	36
1205	9
1205	20
1205	37
1205	21
1205	43
1205	32
1205	44
1205	10
1205	33
1205	11
1205	27
1205	12
1205	13
1206	1
1206	2
1206	4
1206	35
1206	19
1206	15
1206	28
1206	6
1206	30
1206	9
1206	21
1206	10
1206	33
1206	38
1206	24
1206	26
1206	23
1206	39
1206	13
1206	12
1207	1
1207	2
1207	3
1207	4
1207	35
1207	15
1207	19
1207	28
1207	6
1207	30
1207	9
1207	37
1207	21
1207	10
1207	38
1207	24
1207	23
1207	12
1207	13
1207	48
1208	1
1208	2
1208	3
1208	4
1208	35
1208	15
1208	19
1208	40
1208	41
1208	28
1208	6
1208	30
1208	9
1208	37
1208	21
1208	10
1208	25
1208	24
1208	12
1208	13
1209	1
1209	2
1209	3
1209	4
1209	5
1209	28
1209	29
1209	41
1209	31
1209	36
1209	9
1209	20
1209	37
1209	21
1209	42
1209	10
1209	11
1209	39
1209	26
1209	7
1209	27
1209	12
1210	1
1210	2
1210	3
1210	4
1210	35
1210	15
1210	16
1210	18
1210	19
1210	5
1210	28
1210	29
1210	31
1210	9
1210	37
1210	21
1210	32
1210	10
1210	33
1210	11
1210	26
1210	23
1210	24
1210	12
1211	1
1211	2
1211	3
1211	4
1211	5
1211	41
1211	28
1211	29
1211	31
1211	9
1211	20
1211	32
1211	10
1211	47
1211	33
1211	11
1211	12
1212	1
1212	2
1212	3
1212	4
1212	35
1212	5
1212	15
1212	18
1212	19
1212	16
1212	29
1212	6
1212	7
1212	41
1212	30
1212	31
1212	9
1212	37
1212	32
1212	10
1212	33
1212	11
1212	39
1212	38
1212	24
1212	12
1212	48
1213	14
1213	2
1213	3
1213	4
1213	35
1213	15
1213	19
1213	28
1213	6
1213	30
1213	9
1213	20
1213	32
1213	21
1213	10
1213	11
1213	7
1213	23
1213	38
1213	24
1213	12
1213	13
1214	14
1214	45
1214	2
1214	34
1214	4
1214	35
1214	15
1214	40
1214	18
1214	19
1214	58
1214	28
1214	29
1214	31
1214	9
1214	37
1214	42
1214	21
1214	32
1214	47
1214	10
1214	44
1214	33
1214	23
1214	27
1214	12
1214	48
1215	14
1215	2
1215	3
1215	4
1215	35
1215	15
1215	28
1215	6
1215	31
1215	36
1215	9
1215	37
1215	20
1215	21
1215	10
1215	11
1215	24
1215	27
1215	12
1216	1
1216	2
1216	4
1216	28
1216	6
1216	30
1216	31
1216	10
1216	26
1216	23
1216	24
1216	7
1216	12
1217	14
1217	2
1217	3
1217	4
1217	35
1217	5
1217	17
1217	15
1217	16
1217	18
1217	19
1217	28
1217	29
1217	31
1217	36
1217	9
1217	37
1217	20
1217	32
1217	21
1217	44
1217	10
1217	33
1217	11
1217	53
1217	27
1217	12
1217	13
1218	14
1218	45
1218	2
1218	3
1218	4
1218	15
1218	19
1218	28
1218	29
1218	31
1218	36
1218	9
1218	32
1218	21
1218	44
1218	10
1218	33
1218	11
1218	38
1218	24
1219	1
1219	45
1219	2
1219	3
1219	4
1219	20
1219	35
1219	5
1219	46
1219	15
1219	18
1219	29
1219	6
1219	7
1219	30
1219	8
1219	9
1219	32
1219	44
1219	10
1219	33
1219	11
1219	26
1219	23
1219	12
1219	13
1220	14
1220	2
1220	3
1220	4
1220	15
1220	19
1220	28
1220	29
1220	30
1220	31
1220	9
1220	20
1220	21
1220	11
1220	22
1220	26
1220	24
1220	38
1220	12
1221	1
1221	2
1221	3
1221	4
1221	35
1221	5
1221	17
1221	19
1221	16
1221	28
1221	29
1221	31
1221	36
1221	9
1221	20
1221	32
1221	42
1221	44
1221	10
1221	33
1221	11
1221	34
1221	26
1221	12
1222	1
1222	2
1222	4
1222	15
1222	40
1222	19
1222	28
1222	6
1222	30
1222	8
1222	9
1222	42
1222	21
1222	23
1222	38
1222	12
1223	1
1223	2
1223	4
1223	35
1223	19
1223	17
1223	28
1223	29
1223	6
1223	30
1223	31
1223	36
1223	9
1223	20
1223	21
1223	44
1223	10
1223	11
1223	38
1223	24
1223	27
1223	12
1223	13
1224	1
1224	2
1224	4
1224	28
1224	6
1224	30
1224	31
1224	9
1224	32
1224	42
1224	10
1224	33
1224	11
1224	12
1224	13
1225	1
1225	2
1225	3
1225	4
1225	16
1225	28
1225	29
1225	31
1225	36
1225	9
1225	20
1225	21
1225	11
1225	12
1226	14
1226	45
1226	2
1226	3
1226	4
1226	35
1226	15
1226	16
1226	17
1226	19
1226	5
1226	28
1226	29
1226	30
1226	41
1226	31
1226	36
1226	9
1226	20
1226	37
1226	42
1226	21
1226	32
1226	10
1226	33
1226	11
1226	22
1226	27
1226	12
1226	13
1227	1
1227	28
1228	14
1228	45
1228	2
1228	3
1228	4
1228	15
1228	19
1228	16
1228	5
1228	28
1228	29
1228	41
1228	31
1228	9
1228	20
1228	21
1228	10
1228	47
1228	44
1228	11
1228	22
1228	24
1228	38
1228	27
1228	12
1229	1
1229	2
1229	4
1229	35
1229	19
1229	28
1229	6
1229	7
1229	30
1229	31
1229	32
1229	47
1229	44
1229	11
1229	22
1229	26
1229	24
1229	38
1229	12
1230	1
1230	2
1230	3
1230	4
1230	35
1230	5
1230	17
1230	15
1230	16
1230	18
1230	19
1230	28
1230	29
1230	31
1230	9
1230	37
1230	20
1230	32
1230	21
1230	44
1230	10
1230	33
1230	11
1230	23
1230	12
1231	1
1231	2
1231	3
1231	4
1231	19
1231	29
1231	6
1231	7
1231	31
1231	9
1231	21
1231	11
1231	54
1231	24
1231	12
1231	13
1232	14
1232	2
1232	28
1232	29
1232	6
1232	31
1232	36
1232	9
1232	44
1232	11
1232	26
1232	24
1232	38
1232	52
1232	27
1232	12
1232	13
1232	48
1233	1
1233	2
1233	4
1233	35
1233	19
1233	28
1233	6
1233	7
1233	30
1233	31
1233	9
1233	21
1233	32
1233	47
1233	44
1233	10
1233	11
1233	22
1233	26
1233	24
1233	12
1233	13
1234	14
1234	2
1234	3
1234	4
1234	15
1234	16
1234	18
1234	19
1234	28
1234	29
1234	31
1234	9
1234	10
1234	11
1234	22
1234	39
1234	38
1234	24
1234	12
1235	14
1235	2
1235	4
1235	35
1235	19
1235	28
1235	6
1235	31
1235	9
1235	32
1235	21
1235	10
1235	11
1235	26
1235	7
1235	23
1235	38
1235	24
1235	12
1235	13
1236	14
1236	2
1236	22
1236	3
1236	20
1236	4
1236	35
1236	15
1236	16
1236	18
1236	19
1236	28
1236	29
1236	31
1236	36
1236	9
1236	37
1236	43
1236	10
1236	44
1236	11
1236	23
1236	24
1236	12
1236	48
1237	14
1237	45
1237	2
1237	3
1237	20
1237	4
1237	15
1237	16
1237	19
1237	5
1237	28
1237	29
1237	41
1237	31
1237	36
1237	9
1237	21
1237	44
1237	33
1237	11
1237	23
1237	26
1237	38
1237	34
1237	57
1237	12
1237	13
1238	14
1238	45
1238	2
1238	3
1238	34
1238	4
1238	35
1238	5
1238	17
1238	19
1238	15
1238	28
1238	29
1238	31
1238	36
1238	9
1238	20
1238	32
1238	43
1238	21
1238	42
1238	44
1238	10
1238	47
1238	33
1238	27
1238	12
1238	13
1238	48
1239	1
1239	2
1239	4
1239	35
1239	19
1239	6
1239	7
1239	30
1239	31
1239	9
1239	21
1239	32
1239	47
1239	44
1239	11
1239	22
1239	26
1239	24
1239	12
1239	13
1240	1
1240	2
1240	3
1240	4
1240	35
1240	5
1240	46
1240	15
1240	16
1240	18
1240	19
1240	28
1240	29
1240	31
1240	9
1240	37
1240	20
1240	32
1240	21
1240	44
1240	10
1240	33
1240	11
1240	23
1240	12
1241	1
1241	2
1241	3
1241	4
1241	35
1241	15
1241	16
1241	17
1241	19
1241	5
1241	49
1241	29
1241	7
1241	31
1241	36
1241	9
1241	20
1241	37
1241	21
1241	32
1241	43
1241	44
1241	10
1241	33
1241	11
1241	27
1241	12
1241	13
1242	14
1242	2
1242	3
1242	4
1242	5
1242	41
1242	17
1242	28
1242	29
1242	7
1242	30
1242	31
1242	9
1242	37
1242	20
1242	32
1242	21
1242	44
1242	10
1242	33
1242	11
1242	22
1242	27
1242	12
1242	13
1243	1
1243	2
1243	3
1243	4
1243	35
1243	19
1243	28
1243	29
1243	30
1243	31
1243	9
1243	37
1243	20
1243	32
1243	21
1243	44
1243	10
1243	47
1243	33
1243	11
1243	12
1243	13
1244	14
1244	45
1244	2
1244	3
1244	22
1244	34
1244	4
1244	20
1244	35
1244	5
1244	15
1244	29
1244	7
1244	31
1244	36
1244	9
1244	21
1244	32
1244	47
1244	10
1244	44
1244	33
1244	11
1244	27
1244	12
1244	13
1244	48
1245	1
1245	45
1245	2
1245	3
1245	34
1245	5
1245	41
1245	17
1245	58
1245	15
1245	16
1245	28
1245	29
1245	31
1245	36
1245	9
1245	37
1245	20
1245	32
1245	43
1245	21
1245	42
1245	44
1245	10
1245	11
1245	27
1245	12
1245	13
1246	14
1246	45
1246	2
1246	3
1246	34
1246	4
1246	35
1246	15
1246	16
1246	19
1246	28
1246	29
1246	31
1246	36
1246	9
1246	20
1246	42
1246	33
1246	11
1246	39
1246	57
1246	38
1246	23
1246	12
1246	13
1247	1
1247	2
1247	3
1247	4
1247	5
1247	28
1247	6
1247	30
1247	31
1247	9
1247	11
1247	25
1247	27
1247	12
1247	13
1248	14
1248	2
1248	34
1248	4
1248	35
1248	50
1248	15
1248	16
1248	19
1248	18
1248	28
1248	6
1248	7
1248	30
1248	9
1248	37
1248	20
1248	32
1248	43
1248	21
1248	44
1248	10
1248	33
1248	11
1248	12
1248	13
1249	1
1249	2
1249	3
1249	4
1249	35
1249	15
1249	19
1249	6
1249	7
1249	30
1249	9
1249	37
1249	21
1249	10
1249	24
1249	25
1249	38
1249	12
1249	13
1249	48
1250	14
1250	2
1250	3
1250	22
1250	34
1250	4
1250	20
1250	5
1250	17
1250	58
1250	46
1250	28
1250	29
1250	6
1250	31
1250	36
1250	9
1250	37
1250	32
1250	21
1250	42
1250	44
1250	10
1250	47
1250	33
1250	12
1250	13
1251	1
1251	2
1251	3
1251	4
1251	35
1251	16
1251	19
1251	5
1251	28
1251	29
1251	30
1251	31
1251	9
1251	20
1251	21
1251	32
1251	44
1251	33
1251	11
1251	26
1251	23
1251	24
1251	27
1251	12
1251	13
1251	48
1252	1
1252	2
1252	3
1252	4
1252	35
1252	15
1252	16
1252	19
1252	5
1252	29
1252	30
1252	31
1252	36
1252	9
1252	20
1252	21
1252	10
1252	11
1252	24
1252	38
1252	52
1252	12
1252	13
1252	48
1253	1
1253	2
1253	3
1253	4
1253	35
1253	17
1253	19
1253	15
1253	5
1253	28
1253	6
1253	7
1253	30
1253	9
1253	37
1253	10
1253	11
1253	26
1253	24
1253	39
1253	52
1253	12
1253	13
1253	48
1254	14
1254	3
1254	4
1254	35
1254	15
1254	18
1254	19
1254	50
1254	46
1254	28
1254	29
1254	30
1254	41
1254	31
1254	36
1254	9
1254	37
1254	43
1254	21
1254	32
1254	10
1254	44
1254	33
1254	11
1254	22
1254	27
1254	12
1255	1
1255	2
1255	4
1255	28
1255	29
1255	6
1255	30
1255	31
1255	9
1255	20
1255	21
1255	32
1255	10
1255	33
1255	39
1255	24
1255	7
1255	26
1255	12
1255	13
1255	48
1256	1
1256	2
1256	3
1256	15
1256	5
1256	19
1256	29
1256	31
1256	36
1256	9
1256	20
1256	37
1256	21
1256	43
1256	32
1256	47
1256	44
1256	22
1256	11
1256	27
1256	12
1257	1
1257	2
1257	3
1257	4
1257	35
1257	15
1257	16
1257	18
1257	19
1257	5
1257	6
1257	30
1257	31
1257	9
1257	20
1257	32
1257	10
1257	11
1257	24
1257	7
1257	38
1257	51
1257	34
1257	12
1258	1
1258	2
1258	3
1258	4
1258	35
1258	19
1258	5
1258	29
1258	6
1258	7
1258	31
1258	36
1258	9
1258	20
1258	42
1258	21
1258	32
1258	44
1258	11
1258	22
1258	23
1258	54
1258	27
1258	12
1258	13
1259	14
1259	2
1259	3
1259	59
1259	4
1259	5
1259	17
1259	58
1259	28
1259	29
1259	31
1259	36
1259	9
1259	20
1259	32
1259	21
1259	44
1259	10
1259	33
1259	11
1259	26
1259	27
1259	12
1259	13
1260	14
1260	45
1260	2
1260	3
1260	34
1260	4
1260	5
1260	58
1260	28
1260	29
1260	31
1260	36
1260	9
1260	37
1260	32
1260	43
1260	21
1260	42
1260	44
1260	10
1260	47
1260	11
1261	14
1261	2
1261	3
1261	4
1261	28
1261	6
1261	30
1261	39
1261	12
1261	13
1262	14
1262	41
1262	28
1262	37
1262	10
1262	44
1262	11
1262	24
1262	51
1262	27
1262	48
1263	1
1263	2
1263	3
1263	4
1263	35
1263	5
1263	16
1263	15
1263	18
1263	19
1263	28
1263	29
1263	30
1263	31
1263	36
1263	9
1263	32
1263	10
1263	11
1263	23
1263	26
1263	24
1263	7
1263	38
1263	52
1263	12
1263	48
1264	14
1264	45
1264	2
1264	3
1264	4
1264	35
1264	15
1264	16
1264	18
1264	19
1264	5
1264	28
1264	29
1264	30
1264	31
1264	36
1264	9
1264	20
1264	42
1264	21
1264	32
1264	44
1264	33
1264	11
1264	22
1264	26
1264	12
1264	48
1265	14
1265	2
1265	3
1265	4
1265	35
1265	5
1265	15
1265	16
1265	19
1265	28
1265	29
1265	31
1265	9
1265	20
1265	32
1265	21
1265	10
1265	11
1265	24
1265	52
1265	27
1265	48
1266	14
1266	2
1266	4
1266	15
1266	16
1266	19
1266	6
1266	7
1266	30
1266	9
1266	21
1266	11
1266	48
1267	14
1267	2
1267	3
1267	4
1267	35
1267	19
1267	5
1267	29
1267	6
1267	30
1267	31
1267	9
1267	10
1267	11
1267	23
1267	24
1267	52
1267	7
1267	12
1268	14
1268	2
1268	3
1268	4
1268	35
1268	15
1268	18
1268	19
1268	28
1268	29
1268	30
1268	31
1268	9
1268	42
1268	21
1268	11
1268	22
1268	26
1268	23
1268	24
1268	38
1268	39
1268	27
1268	12
1268	13
1269	1
1269	2
1269	3
1269	4
1269	35
1269	15
1269	16
1269	19
1269	28
1269	6
1269	30
1269	9
1269	32
1269	21
1269	44
1269	10
1269	11
1269	34
1269	39
1269	56
1269	24
1269	48
1270	14
1270	2
1270	3
1270	4
1270	5
1270	15
1270	18
1270	19
1270	29
1270	7
1270	31
1270	36
1270	9
1270	10
1270	11
1270	23
1270	27
1270	13
1271	1
1271	2
1271	3
1271	4
1271	15
1271	16
1271	18
1271	19
1271	5
1271	28
1271	29
1271	30
1271	31
1271	36
1271	9
1271	20
1271	21
1271	32
1271	10
1271	44
1271	33
1271	11
1271	26
1271	23
1271	12
1272	1
1272	2
1272	4
1272	35
1272	41
1272	17
1272	15
1272	16
1272	40
1272	18
1272	19
1272	28
1272	6
1272	30
1272	9
1272	42
1272	10
1272	33
1272	11
1272	39
1272	26
1272	24
1272	12
1272	13
1273	14
1273	2
1273	28
1273	6
1273	31
1273	9
1273	21
1273	10
1273	11
1273	34
1273	26
1273	12
1274	1
1274	2
1274	3
1274	4
1274	35
1274	15
1274	16
1274	19
1274	5
1274	29
1274	6
1274	7
1274	30
1274	31
1274	8
1274	9
1274	10
1274	33
1274	11
1274	22
1274	26
1274	24
1274	38
1274	34
1274	39
1274	12
1274	13
1275	1
1275	2
1275	3
1275	4
1275	15
1275	18
1275	19
1275	5
1275	29
1275	7
1275	31
1275	9
1275	20
1275	42
1275	43
1275	21
1275	32
1275	10
1275	44
1275	11
1275	22
1275	12
1276	1
1276	2
1276	4
1276	28
1276	6
1276	30
1276	9
1276	21
1276	10
1276	11
1276	22
1276	54
1276	24
1276	25
1276	38
1276	52
1277	14
1277	2
1277	3
1277	4
1277	35
1277	15
1277	16
1277	18
1277	19
1277	5
1277	28
1277	29
1277	30
1277	31
1277	36
1277	9
1277	20
1277	42
1277	21
1277	32
1277	44
1277	33
1277	11
1277	22
1277	26
1277	12
1277	48
1278	1
1278	2
1278	3
1278	4
1278	35
1278	15
1278	16
1278	18
1278	19
1278	5
1278	29
1278	6
1278	7
1278	30
1278	31
1278	36
1278	8
1278	9
1278	20
1278	21
1278	32
1278	10
1278	44
1278	11
1278	22
1278	26
1278	24
1278	27
1278	12
1278	13
1278	48
1279	1
1279	2
1279	3
1279	4
1279	35
1279	15
1279	16
1279	18
1279	19
1279	5
1279	28
1279	29
1279	30
1279	31
1279	36
1279	9
1279	37
1279	20
1279	32
1279	21
1279	44
1279	10
1279	33
1279	11
1279	23
1279	12
1279	48
1280	14
1280	2
1280	4
1280	29
1280	6
1280	30
1280	8
1280	9
1280	37
1280	32
1280	48
1281	14
1281	2
1281	3
1281	4
1281	5
1281	28
1281	29
1281	31
1281	36
1281	9
1281	10
1281	11
1281	23
1281	27
1281	13
1282	1
1282	2
1282	3
1282	4
1282	15
1282	19
1282	6
1282	7
1282	30
1282	9
1282	10
1282	11
1282	13
1283	1
1283	2
1283	3
1283	4
1283	5
1283	16
1283	15
1283	18
1283	19
1283	29
1283	7
1283	30
1283	31
1283	9
1283	37
1283	32
1283	10
1283	33
1283	11
1283	23
1283	24
1283	38
1283	12
1283	48
1284	1
1284	2
1284	3
1284	4
1284	5
1284	17
1284	15
1284	18
1284	19
1284	28
1284	29
1284	41
1284	31
1284	36
1284	9
1284	20
1284	32
1284	21
1284	44
1284	33
1284	11
1284	23
1284	38
1284	51
1284	27
1284	12
1284	13
1285	64
1285	1
1285	2
1285	3
1285	22
1285	34
1285	59
1285	4
1285	5
1285	17
1285	58
1285	28
1285	29
1285	7
1285	41
1285	31
1285	36
1285	9
1285	37
1285	20
1285	32
1285	21
1285	44
1285	10
1285	33
1285	11
1285	27
1285	12
1285	13
1286	1
1286	2
1286	3
1286	4
1286	15
1286	19
1286	6
1286	7
1286	30
1286	9
1286	10
1286	11
1286	13
1287	14
1287	2
1287	3
1287	4
1287	35
1287	5
1287	15
1287	16
1287	19
1287	29
1287	7
1287	31
1287	9
1287	20
1287	32
1287	21
1287	10
1287	11
1287	24
1287	52
1287	27
1287	48
1288	14
1288	2
1288	3
1288	4
1288	5
1288	15
1288	16
1288	29
1288	7
1288	31
1288	9
1288	20
1288	32
1288	21
1288	10
1288	11
1288	24
1288	52
1288	27
1288	48
1289	14
1289	2
1289	3
1289	4
1289	35
1289	5
1289	19
1289	18
1289	15
1289	28
1289	29
1289	31
1289	36
1289	9
1289	20
1289	32
1289	21
1289	10
1289	33
1289	11
1289	22
1289	26
1289	23
1289	27
1289	12
1289	13
1290	14
1290	45
1290	2
1290	3
1290	4
1290	15
1290	16
1290	18
1290	19
1290	5
1290	28
1290	29
1290	31
1290	36
1290	9
1290	20
1290	37
1290	42
1290	21
1290	32
1290	43
1290	10
1290	44
1290	33
1290	12
1290	13
1291	1
1291	2
1291	4
1291	15
1291	19
1291	28
1291	6
1291	30
1291	9
1291	32
1291	21
1291	10
1291	24
1291	48
1292	14
1292	2
1292	3
1292	4
1292	35
1292	5
1292	15
1292	18
1292	19
1292	28
1292	29
1292	31
1292	36
1292	9
1292	10
1292	11
1292	23
1292	27
1292	13
1293	14
1293	45
1293	2
1293	3
1293	59
1293	4
1293	15
1293	19
1293	29
1293	31
1293	36
1293	9
1293	37
1293	20
1293	42
1293	21
1293	10
1293	33
1293	11
1293	26
1293	24
1293	27
1293	12
1293	13
1293	48
1294	1
1294	2
1294	3
1294	4
1294	15
1294	19
1294	6
1294	7
1294	30
1294	9
1294	10
1294	11
1294	13
1295	14
1295	2
1295	3
1295	22
1295	4
1295	35
1295	15
1295	16
1295	19
1295	5
1295	49
1295	28
1295	29
1295	31
1295	36
1295	9
1295	37
1295	20
1295	43
1295	32
1295	10
1295	44
1295	33
1295	11
1295	26
1295	12
1295	13
1296	14
1296	2
1296	35
1296	15
1296	19
1296	28
1296	29
1296	30
1296	31
1296	9
1296	21
1296	10
1296	11
1296	7
1296	13
1297	14
1297	2
1297	3
1297	4
1297	35
1297	15
1297	16
1297	17
1297	18
1297	19
1297	5
1297	28
1297	29
1297	41
1297	31
1297	9
1297	37
1297	20
1297	32
1297	43
1297	21
1297	42
1297	44
1297	10
1297	47
1297	27
1297	12
1297	13
1298	14
1298	2
1298	3
1298	4
1298	35
1298	5
1298	15
1298	16
1298	18
1298	19
1298	28
1298	29
1298	30
1298	31
1298	36
1298	9
1298	20
1298	21
1298	44
1298	10
1298	11
1298	23
1298	24
1298	12
1298	13
1299	1
1299	2
1299	3
1299	4
1299	35
1299	5
1299	15
1299	16
1299	19
1299	18
1299	28
1299	29
1299	9
1299	20
1299	21
1299	44
1299	10
1299	11
1299	23
1299	24
1299	12
1299	13
1300	1
1300	2
1300	3
1300	4
1300	35
1300	5
1300	19
1300	50
1300	15
1300	16
1300	18
1300	29
1300	7
1300	30
1300	31
1300	36
1300	9
1300	32
1300	21
1300	10
1300	11
1300	39
1300	24
1300	48
1301	1
1301	2
1301	3
1301	4
1301	15
1301	18
1301	19
1301	29
1301	6
1301	7
1301	30
1301	9
1301	20
1301	32
1301	10
1301	11
1301	22
1301	34
1301	23
1301	38
1301	12
1302	14
1302	2
1302	3
1302	4
1302	35
1302	15
1302	16
1302	18
1302	19
1302	5
1302	28
1302	29
1302	31
1302	36
1302	9
1302	21
1302	32
1302	10
1302	11
1302	26
1302	23
1302	24
1302	38
1302	52
1302	12
1303	14
1303	2
1303	35
1303	15
1303	19
1303	6
1303	7
1303	30
1303	9
1303	32
1303	21
1303	10
1303	11
1303	54
1303	12
1303	13
1304	14
1304	2
1304	4
1304	6
1304	9
1304	10
1304	11
1304	38
1304	12
1305	14
1305	2
1305	3
1305	4
1305	35
1305	5
1305	17
1305	15
1305	16
1305	18
1305	19
1305	28
1305	29
1305	31
1305	36
1305	9
1305	37
1305	20
1305	32
1305	21
1305	44
1305	10
1305	33
1305	11
1305	53
1305	27
1305	12
1305	13
1306	1
1306	17
1306	58
1306	28
1306	29
1306	9
1306	37
1306	20
1306	32
1306	43
1306	21
1306	42
1306	44
1306	10
1306	33
1306	27
1306	12
1306	13
1307	1
1307	2
1307	3
1307	4
1307	35
1307	19
1307	28
1307	29
1307	30
1307	31
1307	9
1307	37
1307	20
1307	32
1307	21
1307	44
1307	10
1307	47
1307	33
1307	11
1307	12
1307	13
1308	14
1308	2
1308	3
1308	4
1308	15
1308	19
1308	28
1308	29
1308	30
1308	31
1308	9
1308	20
1308	21
1308	11
1308	22
1308	26
1308	24
1308	38
1308	12
1309	14
1309	45
1309	2
1309	3
1309	34
1309	4
1309	20
1309	35
1309	5
1309	41
1309	17
1309	28
1309	29
1309	31
1309	36
1309	9
1309	32
1309	21
1309	42
1309	47
1309	33
1309	22
1309	39
1309	26
1309	57
1309	27
1309	12
1309	13
1310	1
1310	2
1310	3
1310	4
1310	35
1310	5
1310	15
1310	16
1310	18
1310	19
1310	28
1310	29
1310	7
1310	41
1310	31
1310	36
1310	9
1310	32
1310	42
1310	11
1310	34
1310	23
1310	38
1311	14
1311	35
1311	40
1311	19
1311	28
1311	6
1311	30
1311	31
1311	9
1311	21
1311	11
1311	26
1311	23
1311	24
1311	52
1311	12
1312	14
1312	2
1312	3
1312	59
1312	4
1312	5
1312	17
1312	58
1312	28
1312	29
1312	31
1312	36
1312	9
1312	20
1312	32
1312	21
1312	44
1312	10
1312	33
1312	11
1312	26
1312	27
1312	12
1312	13
1313	14
1313	2
1313	3
1313	4
1313	35
1313	16
1313	19
1313	5
1313	28
1313	29
1313	31
1313	36
1313	9
1313	20
1313	42
1313	21
1313	33
1313	11
1313	23
1313	24
1313	57
1313	12
1313	13
1314	1
1314	2
1314	3
1314	4
1314	20
1314	28
1314	29
1314	36
1314	9
1314	32
1314	42
1314	44
1314	33
1314	11
1314	34
1314	12
1314	13
1315	1
1315	2
1315	3
1315	34
1315	4
1315	35
1315	5
1315	15
1315	18
1315	19
1315	28
1315	29
1315	30
1315	31
1315	36
1315	9
1315	20
1315	21
1315	10
1315	11
1315	23
1315	27
1315	12
1315	13
1316	1
1316	2
1316	3
1316	4
1316	35
1316	16
1316	19
1316	49
1316	5
1316	29
1316	6
1316	7
1316	41
1316	31
1316	36
1316	9
1316	20
1316	37
1316	42
1316	43
1316	21
1316	32
1316	47
1316	10
1316	44
1316	12
1316	13
1316	48
1317	1
1317	2
1317	3
1317	4
1317	35
1317	5
1317	41
1317	17
1317	50
1317	15
1317	16
1317	28
1317	29
1317	31
1317	36
1317	9
1317	37
1317	20
1317	32
1317	43
1317	21
1317	44
1317	10
1317	47
1317	33
1317	27
1317	12
1317	13
1318	1
1318	2
1318	3
1318	4
1318	35
1318	19
1318	28
1318	29
1318	6
1318	30
1318	31
1318	9
1318	21
1318	32
1318	10
1318	33
1318	11
1318	26
1318	24
1318	38
1318	12
1318	13
1319	14
1319	45
1319	2
1319	3
1319	22
1319	34
1319	4
1319	20
1319	35
1319	5
1319	15
1319	29
1319	7
1319	31
1319	36
1319	9
1319	21
1319	32
1319	47
1319	10
1319	44
1319	33
1319	11
1319	27
1319	12
1319	13
1319	48
1320	1
1320	2
1320	6
1320	7
1320	30
1320	9
1320	21
1320	23
1320	12
1321	1
1321	2
1321	3
1321	4
1321	35
1321	19
1321	5
1321	28
1321	29
1321	6
1321	31
1321	36
1321	9
1321	20
1321	42
1321	21
1321	32
1321	44
1321	11
1321	22
1321	23
1321	54
1321	27
1321	12
1321	13
1322	1
1322	2
1322	3
1322	4
1322	35
1322	15
1322	19
1322	5
1322	17
1322	28
1322	6
1322	30
1322	31
1322	36
1322	9
1322	20
1322	32
1322	10
1322	44
1322	23
1322	54
1322	24
1322	55
1322	38
1322	12
1322	13
1323	1
1323	2
1323	3
1323	4
1323	35
1323	5
1323	17
1323	15
1323	16
1323	18
1323	19
1323	28
1323	29
1323	31
1323	9
1323	37
1323	20
1323	32
1323	21
1323	44
1323	10
1323	33
1323	11
1323	23
1323	12
1324	14
1324	45
1324	28
1324	36
1324	9
1325	1
1325	2
1325	3
1325	4
1325	35
1325	5
1325	41
1325	49
1325	17
1325	58
1325	15
1325	28
1325	29
1325	31
1325	36
1325	9
1325	20
1325	32
1325	21
1325	44
1325	33
1325	11
1325	22
1325	34
1325	51
1325	27
1325	12
1325	13
1326	1
1326	2
1326	3
1326	4
1326	35
1326	19
1326	5
1326	29
1326	6
1326	7
1326	31
1326	36
1326	9
1326	20
1326	42
1326	21
1326	32
1326	44
1326	11
1326	22
1326	23
1326	54
1326	27
1326	12
1326	13
1327	14
1327	2
1327	3
1327	4
1327	35
1327	5
1327	15
1327	19
1327	28
1327	29
1327	8
1327	9
1327	23
1327	24
1327	12
1328	1
1328	2
1328	3
1328	34
1328	4
1328	35
1328	5
1328	19
1328	16
1328	28
1328	29
1328	31
1328	36
1328	9
1328	20
1328	32
1328	21
1328	10
1328	11
1328	24
1328	38
1328	23
1328	12
1328	13
1329	14
1329	2
1329	3
1329	4
1329	28
1329	29
1329	31
1329	9
1329	20
1329	44
1329	10
1329	33
1329	11
1329	24
1329	38
1329	12
1330	1
1330	2
1330	3
1330	4
1330	35
1330	5
1330	41
1330	49
1330	17
1330	58
1330	15
1330	29
1330	7
1330	31
1330	36
1330	9
1330	20
1330	32
1330	21
1330	44
1330	33
1330	11
1330	22
1330	34
1330	51
1330	27
1330	12
1330	13
1331	1
1331	2
1331	22
1331	3
1331	34
1331	4
1331	15
1331	16
1331	18
1331	19
1331	5
1331	28
1331	29
1331	31
1331	36
1331	9
1331	20
1331	42
1331	21
1331	33
1331	11
1331	38
1331	39
1331	27
1332	14
1332	45
1332	2
1332	3
1332	59
1332	34
1332	4
1332	35
1332	15
1332	16
1332	17
1332	28
1332	29
1332	30
1332	31
1332	36
1332	9
1332	20
1332	37
1332	42
1332	43
1332	21
1332	32
1332	10
1332	44
1332	33
1332	27
1332	12
1332	13
1333	1
1333	2
1333	3
1333	22
1333	4
1333	20
1333	35
1333	5
1333	41
1333	17
1333	50
1333	28
1333	29
1333	6
1333	31
1333	9
1333	37
1333	32
1333	43
1333	21
1333	44
1333	10
1333	11
1333	27
1333	12
1333	13
1334	14
1334	45
1334	2
1334	3
1334	59
1334	34
1334	4
1334	35
1334	15
1334	16
1334	19
1334	28
1334	29
1334	30
1334	41
1334	31
1334	36
1334	9
1334	20
1334	37
1334	43
1334	21
1334	32
1334	10
1334	44
1334	33
1334	11
1334	27
1334	12
1334	13
1335	14
1335	2
1335	3
1335	4
1335	5
1335	58
1335	28
1335	29
1335	8
1335	9
1335	37
1335	32
1335	43
1335	21
1335	42
1335	44
1335	10
1335	47
1335	33
1335	27
1335	12
1335	13
1336	1
1336	2
1336	4
1336	15
1336	19
1336	28
1336	6
1336	7
1336	30
1336	9
1336	10
1336	24
1336	25
1337	14
1337	2
1337	3
1337	4
1337	35
1337	5
1337	16
1337	19
1337	28
1337	29
1337	6
1337	31
1337	36
1337	9
1337	37
1337	20
1337	32
1337	43
1337	21
1337	10
1337	33
1337	11
1337	7
1337	27
1337	12
1337	13
1338	14
1338	2
1338	3
1338	4
1338	35
1338	5
1338	15
1338	19
1338	28
1338	29
1338	30
1338	31
1338	36
1338	9
1338	20
1338	32
1338	42
1338	21
1338	10
1338	33
1338	22
1338	26
1338	23
1338	12
1338	13
1339	1
1339	45
1339	2
1339	3
1339	4
1339	35
1339	15
1339	16
1339	17
1339	18
1339	19
1339	28
1339	29
1339	41
1339	31
1339	36
1339	9
1339	37
1339	20
1339	32
1339	43
1339	21
1339	42
1339	44
1339	10
1339	47
1339	27
1339	12
1339	13
1340	1
1340	45
1340	2
1340	3
1340	20
1340	4
1340	35
1340	16
1340	19
1340	5
1340	28
1340	29
1340	31
1340	36
1340	9
1340	37
1340	43
1340	32
1340	10
1340	33
1340	11
1340	22
1340	26
1340	27
1340	12
1340	13
1341	1
1341	45
1341	2
1341	34
1341	15
1341	16
1341	17
1341	19
1341	58
1341	5
1341	28
1341	29
1341	41
1341	31
1341	36
1341	9
1341	20
1341	37
1341	10
1341	11
1341	22
1341	23
1341	38
1341	24
1341	27
1341	12
1341	13
1342	1
1342	2
1342	3
1342	4
1342	35
1342	16
1342	15
1342	19
1342	18
1342	29
1342	6
1342	7
1342	30
1342	31
1342	9
1342	32
1342	10
1342	11
1342	26
1342	24
1342	12
1343	14
1343	2
1343	3
1343	4
1343	35
1343	15
1343	19
1343	5
1343	28
1343	29
1343	30
1343	31
1343	36
1343	9
1343	20
1343	10
1343	44
1343	33
1343	11
1343	22
1343	26
1343	24
1343	38
1343	27
1343	12
1343	13
1344	14
1344	2
1344	3
1344	4
1344	35
1344	15
1344	16
1344	18
1344	19
1344	5
1344	28
1344	29
1344	30
1344	31
1344	9
1344	37
1344	32
1344	10
1344	33
1344	11
1344	26
1344	23
1344	24
1344	25
1345	1
1345	2
1345	3
1345	4
1345	15
1345	5
1345	29
1345	6
1345	30
1345	9
1345	21
1345	11
1345	26
1345	24
1345	7
1345	12
1346	1
1346	2
1346	3
1346	4
1346	35
1346	16
1346	19
1346	5
1346	41
1346	28
1346	29
1346	31
1346	36
1346	9
1346	20
1346	21
1346	32
1346	44
1346	11
1346	26
1346	38
1346	39
1346	23
1346	27
1346	12
1347	1
1347	2
1347	3
1347	22
1347	34
1347	4
1347	35
1347	41
1347	19
1347	7
1347	9
1347	32
1347	10
1347	11
1347	12
1348	1
1348	2
1348	3
1348	4
1348	19
1348	5
1348	15
1348	6
1348	7
1348	30
1348	9
1348	26
1348	23
1348	54
1348	24
1348	12
1348	13
1349	1
1349	2
1349	3
1349	4
1349	35
1349	5
1349	46
1349	15
1349	16
1349	18
1349	19
1349	28
1349	29
1349	31
1349	9
1349	37
1349	20
1349	32
1349	21
1349	44
1349	10
1349	33
1349	11
1349	23
1349	12
1350	1
1350	2
1350	3
1350	20
1350	4
1350	35
1350	19
1350	5
1350	46
1350	61
1350	29
1350	6
1350	7
1350	30
1350	41
1350	31
1350	36
1350	9
1350	37
1350	10
1350	44
1350	33
1350	11
1350	22
1350	23
1350	24
1350	12
1350	13
1351	14
1351	2
1351	3
1351	4
1351	5
1351	58
1351	19
1351	29
1351	7
1351	31
1351	36
1351	60
1351	9
1351	42
1351	21
1351	33
1351	11
1351	23
1351	54
1351	25
1351	38
1352	1
1352	2
1352	3
1352	4
1352	20
1352	35
1352	5
1352	17
1352	58
1352	15
1352	19
1352	29
1352	7
1352	41
1352	31
1352	36
1352	9
1352	37
1352	32
1352	44
1352	10
1352	33
1352	11
1352	22
1352	34
1352	27
1352	12
1352	13
1353	1
1353	2
1353	59
1353	4
1353	15
1353	16
1353	18
1353	19
1353	28
1353	29
1353	31
1353	36
1353	9
1353	20
1353	37
1353	43
1353	32
1353	44
1353	33
1353	11
1353	22
1353	24
1353	12
1354	14
1354	45
1354	2
1354	3
1354	4
1354	35
1354	16
1354	18
1354	19
1354	5
1354	15
1354	28
1354	29
1354	31
1354	36
1354	9
1354	20
1354	37
1354	42
1354	21
1354	32
1354	43
1354	10
1354	44
1354	33
1354	12
1354	13
1355	1
1355	2
1355	3
1355	4
1355	5
1355	15
1355	18
1355	19
1355	28
1355	29
1355	30
1355	31
1355	9
1355	20
1355	10
1355	33
1355	11
1355	22
1355	12
1355	13
1356	1
1356	2
1356	4
1356	28
1356	29
1356	6
1356	30
1356	31
1356	9
1356	20
1356	21
1356	32
1356	10
1356	33
1356	39
1356	24
1356	7
1356	26
1356	12
1356	13
1356	48
1357	14
1357	45
1357	2
1357	3
1357	59
1357	4
1357	35
1357	5
1357	19
1357	16
1357	41
1357	28
1357	29
1357	31
1357	36
1357	9
1357	20
1357	32
1357	42
1357	33
1357	11
1357	38
1357	25
1357	12
1357	13
1357	48
1358	1
1358	45
1358	2
1358	3
1358	4
1358	35
1358	15
1358	16
1358	17
1358	19
1358	5
1358	29
1358	7
1358	41
1358	31
1358	36
1358	8
1358	9
1358	20
1358	42
1358	21
1358	32
1358	44
1358	33
1358	11
1358	22
1358	54
1358	27
1358	12
1358	13
1359	1
1359	2
1359	3
1359	4
1359	5
1359	17
1359	28
1359	29
1359	31
1359	9
1359	10
1359	11
1359	26
1359	12
1359	13
1360	1
1360	2
1360	3
1360	4
1360	28
1360	6
1360	9
1360	11
1360	12
1361	1
1361	2
1361	3
1361	4
1361	28
1361	6
1361	30
1361	31
1361	9
1361	37
1361	20
1361	42
1361	10
1361	33
1361	11
1361	26
1362	1
1362	2
1362	4
1362	35
1362	19
1362	28
1362	6
1362	30
1362	9
1362	21
1362	24
1362	39
1362	38
1362	23
1362	12
1362	13
1363	14
1363	45
1363	2
1363	3
1363	20
1363	4
1363	15
1363	16
1363	19
1363	5
1363	28
1363	29
1363	41
1363	31
1363	36
1363	9
1363	21
1363	44
1363	33
1363	11
1363	23
1363	26
1363	38
1363	34
1363	57
1363	12
1363	13
1364	1
1364	2
1364	3
1364	4
1364	15
1364	19
1364	28
1364	6
1364	30
1364	31
1364	9
1364	20
1364	32
1364	21
1364	44
1364	10
1364	33
1364	11
1364	22
1364	34
1364	12
1365	1
1365	2
1365	3
1365	4
1365	35
1365	17
1365	19
1365	15
1365	5
1365	28
1365	6
1365	7
1365	30
1365	9
1365	37
1365	10
1365	11
1365	26
1365	24
1365	39
1365	52
1365	12
1365	13
1365	48
1366	14
1366	2
1366	3
1366	22
1366	34
1366	4
1366	20
1366	5
1366	17
1366	58
1366	46
1366	28
1366	29
1366	6
1366	31
1366	36
1366	9
1366	37
1366	32
1366	21
1366	42
1366	44
1366	10
1366	47
1366	33
1366	12
1366	13
1367	1
1367	2
1367	4
1367	35
1367	19
1367	28
1367	6
1367	31
1367	9
1367	10
1367	11
1367	23
1367	24
1367	12
1367	13
1368	1
1368	2
1368	4
1368	35
1368	19
1368	28
1368	6
1368	7
1368	30
1368	31
1368	9
1368	21
1368	32
1368	47
1368	44
1368	10
1368	11
1368	22
1368	26
1368	24
1368	12
1368	13
1369	14
1369	2
1369	3
1369	59
1369	4
1369	35
1369	5
1369	15
1369	16
1369	18
1369	19
1369	28
1369	29
1369	31
1369	36
1369	9
1369	37
1369	20
1369	32
1369	43
1369	42
1369	10
1369	11
1369	23
1369	24
1369	12
1369	13
1369	48
1370	1
1370	2
1370	4
1370	28
1370	6
1370	30
1370	31
1370	9
1370	10
1370	11
1370	24
1370	12
1370	13
1371	1
1371	2
1371	4
1371	35
1371	19
1371	28
1371	6
1371	7
1371	30
1371	31
1371	32
1371	47
1371	44
1371	11
1371	22
1371	26
1371	24
1371	38
1371	12
1372	14
1372	2
1372	3
1372	4
1372	35
1372	41
1372	15
1372	16
1372	18
1372	19
1372	28
1372	29
1372	31
1372	36
1372	9
1372	37
1372	20
1372	32
1372	21
1372	10
1372	33
1372	11
1372	26
1372	23
1372	12
1372	13
1373	1
1373	45
1373	2
1373	3
1373	34
1373	4
1373	20
1373	35
1373	5
1373	41
1373	46
1373	28
1373	29
1373	31
1373	36
1373	9
1373	21
1373	44
1373	33
1373	11
1373	22
1373	39
1373	54
1373	27
1373	12
1373	13
1374	1
1374	2
1374	3
1374	4
1374	35
1374	19
1374	5
1374	29
1374	7
1374	41
1374	31
1374	36
1374	9
1374	20
1374	21
1374	42
1374	11
1374	23
1374	26
1374	12
1374	13
1374	48
1375	1
1375	2
1375	3
1375	4
1375	35
1375	16
1375	19
1375	49
1375	5
1375	29
1375	6
1375	7
1375	41
1375	31
1375	36
1375	9
1375	20
1375	37
1375	42
1375	43
1375	21
1375	32
1375	47
1375	10
1375	44
1375	12
1375	13
1375	48
1376	1
1376	2
1376	4
1376	35
1376	19
1376	6
1376	7
1376	30
1376	31
1376	9
1376	21
1376	32
1376	47
1376	44
1376	10
1376	11
1376	22
1376	26
1376	24
1376	12
1376	13
1377	14
1377	45
1377	2
1377	28
1377	29
1377	36
1377	9
1377	34
1378	1
1378	2
1378	3
1378	34
1378	15
1378	18
1378	19
1378	5
1378	58
1378	28
1378	31
1378	36
1378	9
1378	20
1378	37
1378	42
1378	21
1378	10
1378	44
1378	33
1378	11
1378	22
1378	27
1378	12
1379	14
1379	45
1379	2
1379	3
1379	34
1379	4
1379	5
1379	58
1379	28
1379	29
1379	31
1379	36
1379	9
1379	37
1379	32
1379	43
1379	21
1379	42
1379	44
1379	10
1379	47
1379	11
1380	14
1380	45
1380	28
1380	36
1380	9
1380	27
1381	1
1381	45
1381	2
1381	3
1381	34
1381	5
1381	41
1381	17
1381	58
1381	15
1381	16
1381	28
1381	29
1381	31
1381	36
1381	9
1381	37
1381	20
1381	32
1381	43
1381	21
1381	42
1381	44
1381	10
1381	11
1381	27
1381	12
1381	13
1382	1
1382	2
1382	3
1382	4
1382	35
1382	5
1382	41
1382	49
1382	17
1382	58
1382	15
1382	29
1382	7
1382	31
1382	36
1382	9
1382	20
1382	32
1382	21
1382	44
1382	33
1382	11
1382	22
1382	34
1382	51
1382	27
1382	12
1382	13
1383	14
1383	2
1383	3
1383	4
1383	5
1383	28
1383	29
1383	31
1383	36
1383	9
1383	20
1383	32
1383	43
1383	42
1383	10
1383	33
1383	11
1383	34
1383	12
1383	13
1384	1
1384	2
1384	3
1384	4
1384	35
1384	16
1384	19
1384	5
1384	28
1384	29
1384	31
1384	36
1384	9
1384	20
1384	37
1384	21
1384	10
1384	33
1384	11
1384	24
1384	38
1384	56
1384	12
1385	1
1385	2
1385	3
1385	22
1385	59
1385	4
1385	35
1385	5
1385	41
1385	49
1385	17
1385	28
1385	29
1385	30
1385	31
1385	36
1385	9
1385	20
1385	32
1385	42
1385	21
1385	44
1385	10
1385	33
1385	11
1385	27
1385	12
1385	13
1386	1
1386	2
1386	3
1386	4
1386	16
1386	28
1386	29
1386	31
1386	36
1386	9
1386	20
1386	21
1386	11
1386	12
1387	1
1387	2
1387	3
1387	4
1387	19
1387	29
1387	6
1387	7
1387	31
1387	9
1387	21
1387	11
1387	54
1387	24
1387	12
1387	13
1388	1
1388	2
1388	4
1388	15
1388	19
1388	28
1388	6
1388	30
1388	9
1388	10
1388	26
1388	24
1388	38
1388	12
1388	13
1389	14
1389	2
1389	3
1389	34
1389	59
1389	4
1389	20
1389	5
1389	41
1389	28
1389	29
1389	31
1389	36
1389	9
1389	37
1389	32
1389	43
1389	21
1389	42
1389	44
1389	10
1389	33
1389	12
1389	13
1390	14
1390	45
1390	2
1390	3
1390	4
1390	35
1390	15
1390	18
1390	19
1390	5
1390	16
1390	28
1390	29
1390	31
1390	36
1390	9
1390	20
1390	37
1390	42
1390	21
1390	32
1390	10
1390	44
1390	33
1390	11
1390	12
1390	13
1391	14
1391	2
1391	22
1391	3
1391	20
1391	4
1391	35
1391	15
1391	16
1391	18
1391	19
1391	28
1391	29
1391	31
1391	36
1391	9
1391	37
1391	43
1391	10
1391	44
1391	11
1391	23
1391	24
1391	12
1391	48
1392	1
1392	2
1392	3
1392	4
1392	35
1392	16
1392	19
1392	5
1392	29
1392	7
1392	41
1392	31
1392	9
1392	20
1392	37
1392	21
1392	11
1392	24
1392	38
1392	56
1392	34
1392	12
1393	14
1393	2
1393	4
1393	35
1393	15
1393	19
1393	28
1393	6
1393	30
1393	31
1393	9
1393	21
1393	32
1393	10
1393	11
1393	39
1393	24
1393	12
1393	13
1394	1
1394	2
1394	4
1394	35
1394	19
1394	17
1394	28
1394	29
1394	6
1394	30
1394	31
1394	36
1394	9
1394	20
1394	21
1394	44
1394	10
1394	11
1394	38
1394	24
1394	27
1394	12
1394	13
1395	14
1395	45
1395	2
1395	3
1395	4
1395	35
1395	15
1395	16
1395	17
1395	19
1395	5
1395	28
1395	29
1395	30
1395	41
1395	31
1395	36
1395	9
1395	20
1395	37
1395	42
1395	21
1395	32
1395	10
1395	33
1395	11
1395	22
1395	27
1395	12
1395	13
1396	1
1396	2
1396	4
1396	19
1396	28
1396	6
1396	30
1396	9
1396	20
1396	21
1396	10
1396	11
1396	26
1396	23
1396	12
1397	1
1397	28
1398	14
1398	45
1398	2
1398	3
1398	34
1398	4
1398	15
1398	18
1398	19
1398	5
1398	28
1398	29
1398	31
1398	36
1398	9
1398	20
1398	21
1398	32
1398	10
1398	33
1398	11
1398	22
1398	23
1398	24
1398	12
1398	13
1399	1
1399	2
1399	4
1399	28
1399	6
1399	30
1399	37
1399	42
1399	10
1399	12
1399	13
1400	14
1400	45
1400	2
1400	3
1400	59
1400	34
1400	4
1400	35
1400	15
1400	16
1400	19
1400	29
1400	7
1400	30
1400	41
1400	31
1400	36
1400	9
1400	20
1400	37
1400	21
1400	32
1400	10
1400	44
1400	33
1400	11
1400	22
1400	27
1400	12
1400	13
1401	1
1401	2
1401	3
1401	4
1401	35
1401	5
1401	17
1401	19
1401	16
1401	28
1401	29
1401	31
1401	36
1401	9
1401	20
1401	32
1401	42
1401	44
1401	10
1401	33
1401	11
1401	34
1401	26
1401	12
1402	14
1402	45
1402	2
1402	3
1402	59
1402	4
1402	15
1402	19
1402	29
1402	31
1402	36
1402	9
1402	37
1402	20
1402	42
1402	21
1402	10
1402	33
1402	11
1402	26
1402	24
1402	27
1402	12
1402	13
1402	48
1403	1
1403	2
1403	4
1403	28
1403	6
1403	30
1403	9
1403	12
1404	1
1404	45
1404	2
1404	3
1404	4
1404	35
1404	5
1404	17
1404	15
1404	16
1404	18
1404	28
1404	29
1404	41
1404	31
1404	36
1404	9
1404	37
1404	20
1404	32
1404	43
1404	21
1404	42
1404	44
1404	10
1404	47
1404	27
1404	12
1404	13
1405	14
1405	2
1405	3
1405	4
1405	5
1405	28
1405	29
1405	41
1405	30
1405	31
1405	36
1405	9
1405	20
1405	32
1405	10
1405	11
1405	22
1405	26
1405	12
1405	13
1406	14
1406	2
1406	3
1406	4
1406	15
1406	16
1406	18
1406	5
1406	41
1406	28
1406	29
1406	31
1406	36
1406	9
1406	10
1406	44
1406	11
1406	38
1406	27
1406	12
1407	1
1407	2
1407	3
1407	4
1407	5
1407	41
1407	28
1407	29
1407	31
1407	9
1407	20
1407	32
1407	10
1407	47
1407	33
1407	11
1407	12
1408	1
1408	2
1408	3
1408	4
1408	35
1408	15
1408	16
1408	18
1408	19
1408	5
1408	28
1408	29
1408	31
1408	9
1408	37
1408	21
1408	32
1408	10
1408	33
1408	11
1408	26
1408	23
1408	24
1408	12
1409	1
1409	2
1409	3
1409	4
1409	15
1409	17
1409	18
1409	19
1409	49
1409	28
1409	29
1409	31
1409	36
1409	9
1409	20
1409	42
1409	21
1409	32
1409	44
1409	33
1409	11
1409	22
1409	26
1409	27
1409	12
1409	48
1410	14
1410	2
1410	4
1410	35
1410	16
1410	19
1410	49
1410	28
1410	6
1410	30
1410	31
1410	9
1410	20
1410	37
1410	32
1410	21
1410	10
1410	44
1410	33
1410	23
1410	24
1410	12
1410	13
1410	48
1411	1
1411	2
1411	3
1411	4
1411	5
1411	15
1411	28
1411	29
1411	6
1411	30
1411	31
1411	36
1411	9
1411	21
1411	12
1412	1
1412	2
1412	4
1412	35
1412	18
1412	19
1412	15
1412	28
1412	29
1412	6
1412	30
1412	41
1412	31
1412	9
1412	37
1412	21
1412	10
1412	24
1412	38
1412	23
1412	12
1412	13
1412	48
1413	1
1413	2
1413	3
1413	4
1413	15
1413	19
1413	28
1413	6
1413	30
1413	9
1413	10
1413	11
1413	26
1413	24
1413	38
1413	12
1413	13
1414	1
1414	2
1414	4
1414	35
1414	19
1414	28
1414	6
1414	31
1414	9
1414	20
1414	10
1414	11
1414	24
1414	38
1414	52
1414	12
1414	13
1415	1
1415	2
1415	3
1415	4
1415	20
1415	28
1415	6
1415	30
1415	31
1415	9
1415	37
1415	42
1415	10
1415	33
1415	11
1415	26
1416	14
1416	2
1416	19
1416	28
1416	6
1416	9
1416	21
1416	11
1416	39
1416	38
1416	23
1416	12
1416	13
1417	1
1417	2
1417	3
1417	4
1417	35
1417	15
1417	16
1417	19
1417	5
1417	29
1417	7
1417	30
1417	31
1417	36
1417	9
1417	37
1417	20
1417	43
1417	10
1417	33
1417	11
1417	22
1417	34
1417	23
1417	12
1418	1
1418	2
1418	3
1418	4
1418	35
1418	5
1418	15
1418	16
1418	18
1418	19
1418	28
1418	29
1418	30
1418	31
1418	9
1418	20
1418	32
1418	42
1418	21
1418	10
1418	11
1418	22
1418	34
1418	23
1418	12
1419	1
1419	2
1419	3
1419	34
1419	4
1419	35
1419	15
1419	16
1419	19
1419	5
1419	28
1419	29
1419	31
1419	9
1419	20
1419	32
1419	44
1419	33
1419	11
1419	22
1419	26
1419	23
1419	24
1419	48
1420	1
1420	2
1420	3
1420	4
1420	35
1420	15
1420	6
1420	7
1420	8
1420	9
1420	21
1420	10
1420	11
1420	24
1420	13
1421	1
1421	2
1421	4
1421	35
1421	15
1421	19
1421	28
1421	6
1421	31
1421	9
1421	10
1421	24
1421	12
1422	1
1422	45
1422	2
1422	3
1422	35
1422	15
1422	16
1422	17
1422	5
1422	28
1422	29
1422	41
1422	31
1422	36
1422	9
1422	20
1422	44
1422	11
1422	22
1422	23
1422	57
1422	38
1422	52
1422	24
1422	12
1423	14
1423	2
1423	3
1423	4
1423	5
1423	15
1423	18
1423	19
1423	29
1423	7
1423	31
1423	36
1423	9
1423	10
1423	11
1423	23
1423	27
1423	13
1424	1
1424	2
1424	3
1424	4
1424	35
1424	15
1424	16
1424	19
1424	5
1424	29
1424	7
1424	30
1424	31
1424	8
1424	9
1424	37
1424	20
1424	43
1424	32
1424	10
1424	11
1424	22
1424	23
1424	24
1424	12
1425	14
1425	2
1425	3
1425	4
1425	5
1425	15
1425	19
1425	28
1425	29
1425	9
1425	21
1425	10
1425	11
1425	39
1425	24
1425	48
1426	1
1426	2
1426	3
1426	15
1426	5
1426	19
1426	29
1426	31
1426	36
1426	9
1426	20
1426	37
1426	21
1426	43
1426	32
1426	47
1426	44
1426	22
1426	11
1426	27
1426	12
1427	1
1427	45
1427	2
1427	3
1427	34
1427	4
1427	35
1427	15
1427	16
1427	19
1427	5
1427	28
1427	29
1427	31
1427	9
1427	20
1427	32
1427	44
1427	33
1427	11
1427	22
1427	26
1427	23
1427	24
1427	48
1428	14
1428	2
1428	34
1428	20
1428	15
1428	16
1428	18
1428	5
1428	6
1428	7
1428	8
1428	10
1428	44
1428	33
1428	24
1428	51
1428	48
1429	14
1429	45
1429	2
1429	3
1429	4
1429	15
1429	19
1429	5
1429	28
1429	29
1429	36
1429	9
1429	20
1429	21
1429	11
1429	22
1429	23
1429	27
1429	12
1430	14
1430	2
1430	15
1430	19
1430	28
1430	6
1430	30
1430	31
1430	9
1430	32
1430	21
1430	10
1430	11
1430	54
1430	12
1430	13
1431	14
1431	2
1431	3
1431	20
1431	4
1431	35
1431	15
1431	16
1431	19
1431	5
1431	28
1431	29
1431	7
1431	31
1431	36
1431	9
1431	21
1431	32
1431	33
1431	11
1431	26
1431	23
1431	24
1431	25
1431	12
1431	13
1431	48
1432	1
1432	2
1432	3
1432	15
1432	17
1432	18
1432	19
1432	28
1432	29
1432	31
1432	36
1432	9
1432	20
1432	37
1432	43
1432	32
1432	44
1432	33
1432	11
1432	22
1432	24
1432	12
1433	1
1433	2
1433	3
1433	4
1433	15
1433	18
1433	19
1433	29
1433	6
1433	7
1433	30
1433	9
1433	20
1433	32
1433	10
1433	11
1433	22
1433	34
1433	23
1433	38
1433	12
1434	14
1434	2
1434	28
1434	6
1434	31
1434	9
1434	21
1434	10
1434	11
1434	34
1434	26
1434	12
1435	1
1435	2
1435	3
1435	4
1435	5
1435	15
1435	16
1435	18
1435	19
1435	28
1435	29
1435	30
1435	31
1435	36
1436	1
1436	2
1436	3
1436	4
1436	35
1436	5
1436	16
1436	15
1436	18
1436	19
1436	28
1436	29
1436	30
1436	31
1436	36
1436	9
1436	32
1436	10
1436	11
1436	23
1436	26
1436	24
1436	7
1436	38
1436	52
1436	12
1436	48
1437	1
1437	2
1437	3
1437	4
1437	35
1437	19
1437	49
1437	15
1437	6
1437	7
1437	30
1437	9
1437	21
1437	10
1437	11
1437	24
1437	48
1438	1
1438	2
1438	3
1438	4
1438	15
1438	16
1438	18
1438	19
1438	5
1438	28
1438	29
1438	30
1438	31
1438	9
1438	20
1438	42
1438	21
1438	32
1438	11
1438	22
1438	34
1438	23
1438	12
1439	1
1439	2
1439	3
1439	4
1439	15
1439	19
1439	6
1439	7
1439	30
1439	9
1439	10
1439	11
1439	13
1440	14
1440	45
1440	2
1440	3
1440	4
1440	15
1440	16
1440	18
1440	19
1440	5
1440	28
1440	29
1440	31
1440	36
1440	9
1440	20
1440	37
1440	42
1440	21
1440	32
1440	43
1440	10
1440	44
1440	33
1440	12
1440	13
1441	1
1441	2
1441	3
1441	4
1441	5
1441	17
1441	15
1441	18
1441	19
1441	28
1441	29
1441	41
1441	31
1441	36
1441	9
1441	20
1441	32
1441	21
1441	44
1441	33
1441	11
1441	23
1441	38
1441	51
1441	27
1441	12
1441	13
1442	1
1442	2
1442	4
1442	35
1442	15
1442	19
1442	6
1442	7
1442	30
1442	21
1442	10
1442	11
1442	12
1442	13
1443	1
1443	45
1443	2
1443	3
1443	4
1443	35
1443	5
1443	15
1443	16
1443	18
1443	19
1443	28
1443	29
1443	41
1443	31
1443	36
1443	9
1443	20
1443	32
1443	44
1443	10
1443	11
1443	22
1443	34
1443	23
1443	27
1443	13
1444	14
1444	2
1444	3
1444	59
1444	4
1444	5
1444	17
1444	58
1444	28
1444	29
1444	30
1444	31
1444	36
1444	9
1444	37
1444	20
1444	43
1444	10
1444	33
1444	11
1444	22
1444	26
1444	27
1444	12
1444	13
1445	1
1445	2
1445	3
1445	4
1445	35
1445	17
1445	58
1445	19
1445	28
1445	29
1445	30
1445	8
1445	9
1445	32
1445	21
1445	42
1445	44
1445	33
1445	11
1445	34
1445	53
1445	26
1445	27
1445	12
1446	1
1446	2
1446	3
1446	4
1446	5
1446	28
1446	29
1446	41
1446	31
1446	36
1446	9
1446	37
1446	20
1446	32
1446	21
1446	42
1446	44
1446	33
1446	11
1446	22
1446	27
1446	12
1446	13
1447	14
1447	2
1447	3
1447	4
1447	5
1447	15
1447	16
1447	19
1447	28
1447	29
1447	31
1447	36
1447	9
1447	32
1447	21
1447	11
1447	7
1447	34
1447	13
1448	1
1448	2
1448	3
1448	4
1448	15
1448	19
1448	6
1448	7
1448	30
1448	9
1448	10
1448	11
1448	13
1449	1
1449	45
1449	2
1449	3
1449	34
1449	59
1449	4
1449	20
1449	35
1449	5
1449	50
1449	28
1449	29
1449	41
1449	31
1449	36
1449	9
1449	32
1449	21
1449	23
1449	27
1449	13
1449	48
1450	1
1450	2
1450	3
1450	4
1450	35
1450	15
1450	18
1450	19
1450	6
1450	7
1450	30
1450	9
1450	32
1450	21
1450	10
1450	11
1450	24
1450	13
1451	14
1451	2
1451	3
1451	4
1451	5
1451	28
1451	29
1451	31
1451	36
1451	9
1451	10
1451	11
1451	23
1451	27
1451	13
1452	1
1452	2
1452	3
1452	4
1452	15
1452	18
1452	19
1452	6
1452	7
1452	30
1452	8
1452	9
1452	13
1453	1
1453	45
1453	2
1453	3
1453	4
1453	35
1453	5
1453	15
1453	16
1453	18
1453	19
1453	29
1453	7
1453	31
1453	36
1453	9
1453	20
1453	32
1453	44
1453	10
1453	11
1453	22
1453	34
1453	23
1453	27
1453	13
1454	1
1454	2
1454	3
1454	34
1454	5
1454	49
1454	15
1454	16
1454	19
1454	28
1454	6
1454	30
1454	31
1454	9
1454	32
1454	21
1454	23
1454	27
1454	13
1454	48
1455	14
1455	2
1455	3
1455	4
1455	19
1455	28
1455	30
1455	36
1455	9
1455	20
1455	37
1455	43
1455	21
1455	10
1455	44
1455	33
1455	11
1455	22
1455	12
1455	13
1456	14
1456	2
1456	3
1456	4
1456	35
1456	5
1456	15
1456	19
1456	6
1456	7
1456	31
1456	8
1456	9
1456	21
1456	10
1456	11
1456	39
1456	24
1456	48
1457	1
1457	45
1457	2
1457	3
1457	4
1457	5
1457	15
1457	16
1457	18
1457	28
1457	29
1457	41
1457	31
1457	36
1457	9
1457	20
1457	32
1457	44
1457	10
1457	11
1457	22
1457	34
1457	23
1457	27
1457	13
1458	1
1458	45
1458	2
1458	3
1458	34
1458	4
1458	20
1458	5
1458	41
1458	15
1458	16
1458	28
1458	29
1458	31
1458	36
1458	9
1458	32
1458	21
1458	23
1458	27
1458	13
1458	48
1459	14
1459	2
1459	3
1459	4
1459	35
1459	5
1459	15
1459	18
1459	19
1459	28
1459	29
1459	31
1459	36
1459	9
1459	10
1459	11
1459	23
1459	27
1459	13
1460	14
1460	2
1460	3
1460	4
1460	35
1460	5
1460	19
1460	18
1460	15
1460	28
1460	29
1460	31
1460	36
1460	9
1460	20
1460	32
1460	21
1460	10
1460	33
1460	11
1460	22
1460	26
1460	23
1460	27
1460	12
1460	13
1461	1
1461	2
1461	3
1461	4
1461	35
1461	17
1461	58
1461	19
1461	28
1461	6
1461	30
1461	31
1461	8
1461	9
1461	32
1461	21
1461	42
1461	44
1461	33
1461	11
1461	34
1461	53
1461	26
1461	27
1461	12
1462	14
1462	2
1462	3
1462	4
1462	15
1462	29
1462	7
1462	31
1462	9
1462	21
1462	11
1462	27
1462	13
1462	48
1463	14
1463	2
1463	3
1463	4
1463	15
1463	19
1463	28
1463	29
1463	41
1463	31
1463	9
1463	21
1463	11
1463	7
1463	27
1463	13
1463	48
1464	14
1464	2
1464	3
1464	4
1464	15
1464	19
1464	29
1464	7
1464	31
1464	9
1464	21
1464	11
1464	27
1464	13
1464	48
1465	14
1465	2
1465	3
1465	4
1465	15
1465	19
1465	29
1465	7
1465	31
1465	8
1465	9
1465	21
1465	11
1465	27
1465	13
1465	48
1466	1
1466	45
1466	2
1466	3
1466	34
1466	4
1466	35
1466	5
1466	15
1466	16
1466	19
1466	28
1466	29
1466	31
1466	36
1466	9
1466	32
1466	21
1466	44
1466	10
1466	11
1466	24
1466	27
1466	13
1467	1
1467	2
1467	3
1467	4
1467	35
1467	5
1467	15
1467	16
1467	19
1467	18
1467	28
1467	29
1467	9
1467	20
1467	21
1467	44
1467	10
1467	11
1467	23
1467	24
1467	12
1467	13
1468	14
1468	2
1468	3
1468	4
1468	35
1468	5
1468	15
1468	16
1468	18
1468	19
1468	28
1468	29
1468	30
1468	31
1468	36
1468	9
1468	20
1468	21
1468	44
1468	10
1468	11
1468	23
1468	24
1468	12
1468	13
1469	1
1469	45
1469	2
1469	3
1469	4
1469	35
1469	5
1469	15
1469	16
1469	18
1469	19
1469	28
1469	29
1469	41
1469	31
1469	36
1469	9
1469	20
1469	32
1469	21
1469	44
1469	10
1469	11
1469	22
1469	34
1469	7
1469	27
1469	12
1469	13
1470	1
1470	2
1470	3
1470	4
1470	35
1470	5
1470	19
1470	50
1470	15
1470	16
1470	18
1470	29
1470	7
1470	30
1470	31
1470	36
1470	9
1470	32
1470	21
1470	10
1470	11
1470	39
1470	24
1470	48
1471	1
1471	2
1471	3
1471	4
1471	35
1471	5
1471	49
1471	15
1471	16
1471	18
1471	28
1471	29
1471	41
1471	31
1471	36
1471	9
1471	20
1471	32
1471	21
1471	44
1471	10
1471	11
1471	22
1471	34
1471	7
1471	27
1471	12
1471	13
1472	1
1472	2
1472	3
1472	4
1472	5
1472	15
1472	18
1472	19
1472	29
1472	7
1472	30
1472	31
1472	9
1472	20
1472	32
1472	11
1472	27
1472	13
1473	1
1473	45
1473	2
1473	3
1473	4
1473	35
1473	5
1473	15
1473	16
1473	18
1473	19
1473	28
1473	29
1473	41
1473	31
1473	36
1473	9
1473	20
1473	32
1473	21
1473	44
1473	10
1473	11
1473	22
1473	34
1473	7
1473	27
1473	12
1473	13
\.


--
-- TOC entry 4900 (class 0 OID 16476)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_user, nama, email, password, role) FROM stdin;
\.


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 217
-- Name: fasilitas_id_fasilitas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fasilitas_id_fasilitas_seq', 64, true);


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

SELECT pg_catalog.setval('public.gambar_kost_id_gambar_seq', 1473, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 221
-- Name: kost_id_kost_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kost_id_kost_seq', 1473, true);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_user_seq', 1, false);


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


-- Completed on 2025-04-27 22:26:46

--
-- PostgreSQL database dump complete
--

