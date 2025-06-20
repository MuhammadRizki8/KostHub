PGDMP  +                    }            kost_db    16.4    16.4 3    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    34327    kost_db    DATABASE     ~   CREATE DATABASE kost_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE kost_db;
                postgres    false            R           1247    34329    jenis_sertifikat_enum    TYPE     F  CREATE TYPE public.jenis_sertifikat_enum AS ENUM (
    'Sertifikat Hak Milik (SHM)',
    'Sertifikat Hak Guna Bangunan (SHGB)',
    'Sertifikat Hak Guna Usaha (SHGU)',
    'Sertifikat Hak Pengelolaan (HPL)',
    'Sertifikat Hak Sewa (SHS)',
    'Sertifikat Hak Pakai (SHP)',
    'Sertifikat Hak Masyarakat Adat (SHM Adat)'
);
 (   DROP TYPE public.jenis_sertifikat_enum;
       public          postgres    false            U           1247    34344    status_properti_enum    TYPE     L   CREATE TYPE public.status_properti_enum AS ENUM (
    'Sewa',
    'Jual'
);
 '   DROP TYPE public.status_properti_enum;
       public          postgres    false            �            1259    34349 	   fasilitas    TABLE     y   CREATE TABLE public.fasilitas (
    id_fasilitas integer NOT NULL,
    nama_fasilitas character varying(255) NOT NULL
);
    DROP TABLE public.fasilitas;
       public         heap    postgres    false            �            1259    34352    fasilitas_id_fasilitas_seq    SEQUENCE     �   CREATE SEQUENCE public.fasilitas_id_fasilitas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.fasilitas_id_fasilitas_seq;
       public          postgres    false    215            �           0    0    fasilitas_id_fasilitas_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.fasilitas_id_fasilitas_seq OWNED BY public.fasilitas.id_fasilitas;
          public          postgres    false    216            �            1259    34353    favorit    TABLE     �   CREATE TABLE public.favorit (
    id_favorit integer NOT NULL,
    id_pencari integer NOT NULL,
    id_kost integer NOT NULL
);
    DROP TABLE public.favorit;
       public         heap    postgres    false            �            1259    34356    favorit_id_favorit_seq    SEQUENCE     �   CREATE SEQUENCE public.favorit_id_favorit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.favorit_id_favorit_seq;
       public          postgres    false    217            �           0    0    favorit_id_favorit_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.favorit_id_favorit_seq OWNED BY public.favorit.id_favorit;
          public          postgres    false    218            �            1259    34357    gambar_kost    TABLE     �   CREATE TABLE public.gambar_kost (
    id_gambar integer NOT NULL,
    id_kost integer NOT NULL,
    url_gambar text NOT NULL
);
    DROP TABLE public.gambar_kost;
       public         heap    postgres    false            �            1259    34362    gambar_kost_id_gambar_seq    SEQUENCE     �   CREATE SEQUENCE public.gambar_kost_id_gambar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.gambar_kost_id_gambar_seq;
       public          postgres    false    219            �           0    0    gambar_kost_id_gambar_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.gambar_kost_id_gambar_seq OWNED BY public.gambar_kost.id_gambar;
          public          postgres    false    220            �            1259    34363    kost    TABLE     �  CREATE TABLE public.kost (
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
    DROP TABLE public.kost;
       public         heap    postgres    false    853    850            �            1259    34368    kost_fasilitas    TABLE     h   CREATE TABLE public.kost_fasilitas (
    id_kost integer NOT NULL,
    id_fasilitas integer NOT NULL
);
 "   DROP TABLE public.kost_fasilitas;
       public         heap    postgres    false            �            1259    34371    kost_id_kost_seq    SEQUENCE     �   CREATE SEQUENCE public.kost_id_kost_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kost_id_kost_seq;
       public          postgres    false    221            �           0    0    kost_id_kost_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.kost_id_kost_seq OWNED BY public.kost.id_kost;
          public          postgres    false    223            �            1259    34372    users    TABLE     h  CREATE TABLE public.users (
    id_user integer NOT NULL,
    nama character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password text NOT NULL,
    role character varying(10) NOT NULL,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY (ARRAY[('pemilik'::character varying)::text, ('pencari'::character varying)::text])))
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    34378    users_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_id_user_seq;
       public          postgres    false    224            �           0    0    users_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;
          public          postgres    false    225            8           2604    34379    fasilitas id_fasilitas    DEFAULT     �   ALTER TABLE ONLY public.fasilitas ALTER COLUMN id_fasilitas SET DEFAULT nextval('public.fasilitas_id_fasilitas_seq'::regclass);
 E   ALTER TABLE public.fasilitas ALTER COLUMN id_fasilitas DROP DEFAULT;
       public          postgres    false    216    215            9           2604    34380    favorit id_favorit    DEFAULT     x   ALTER TABLE ONLY public.favorit ALTER COLUMN id_favorit SET DEFAULT nextval('public.favorit_id_favorit_seq'::regclass);
 A   ALTER TABLE public.favorit ALTER COLUMN id_favorit DROP DEFAULT;
       public          postgres    false    218    217            :           2604    34381    gambar_kost id_gambar    DEFAULT     ~   ALTER TABLE ONLY public.gambar_kost ALTER COLUMN id_gambar SET DEFAULT nextval('public.gambar_kost_id_gambar_seq'::regclass);
 D   ALTER TABLE public.gambar_kost ALTER COLUMN id_gambar DROP DEFAULT;
       public          postgres    false    220    219            ;           2604    34382    kost id_kost    DEFAULT     l   ALTER TABLE ONLY public.kost ALTER COLUMN id_kost SET DEFAULT nextval('public.kost_id_kost_seq'::regclass);
 ;   ALTER TABLE public.kost ALTER COLUMN id_kost DROP DEFAULT;
       public          postgres    false    223    221            <           2604    34383    users id_user    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    225    224            �          0    34349 	   fasilitas 
   TABLE DATA           A   COPY public.fasilitas (id_fasilitas, nama_fasilitas) FROM stdin;
    public          postgres    false    215   �<       �          0    34353    favorit 
   TABLE DATA           B   COPY public.favorit (id_favorit, id_pencari, id_kost) FROM stdin;
    public          postgres    false    217   =       �          0    34357    gambar_kost 
   TABLE DATA           E   COPY public.gambar_kost (id_gambar, id_kost, url_gambar) FROM stdin;
    public          postgres    false    219   =       �          0    34363    kost 
   TABLE DATA           �   COPY public.kost (id_kost, nama_kost, alamat, deskripsi, harga_sewa, luas, status_properti, jenis_sertifikat, luas_tanah, longitude, latitude, panjang, lebar) FROM stdin;
    public          postgres    false    221   ;=       �          0    34368    kost_fasilitas 
   TABLE DATA           ?   COPY public.kost_fasilitas (id_kost, id_fasilitas) FROM stdin;
    public          postgres    false    222   X=       �          0    34372    users 
   TABLE DATA           E   COPY public.users (id_user, nama, email, password, role) FROM stdin;
    public          postgres    false    224   u=       �           0    0    fasilitas_id_fasilitas_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.fasilitas_id_fasilitas_seq', 1, false);
          public          postgres    false    216            �           0    0    favorit_id_favorit_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.favorit_id_favorit_seq', 1, false);
          public          postgres    false    218            �           0    0    gambar_kost_id_gambar_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.gambar_kost_id_gambar_seq', 1, false);
          public          postgres    false    220            �           0    0    kost_id_kost_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kost_id_kost_seq', 1, false);
          public          postgres    false    223            �           0    0    users_id_user_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_id_user_seq', 1, false);
          public          postgres    false    225            ?           2606    34385    fasilitas fasilitas_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.fasilitas
    ADD CONSTRAINT fasilitas_pkey PRIMARY KEY (id_fasilitas);
 B   ALTER TABLE ONLY public.fasilitas DROP CONSTRAINT fasilitas_pkey;
       public            postgres    false    215            C           2606    34387    favorit favorit_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.favorit
    ADD CONSTRAINT favorit_pkey PRIMARY KEY (id_favorit);
 >   ALTER TABLE ONLY public.favorit DROP CONSTRAINT favorit_pkey;
       public            postgres    false    217            E           2606    34389    gambar_kost gambar_kost_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.gambar_kost
    ADD CONSTRAINT gambar_kost_pkey PRIMARY KEY (id_gambar);
 F   ALTER TABLE ONLY public.gambar_kost DROP CONSTRAINT gambar_kost_pkey;
       public            postgres    false    219            I           2606    34391 "   kost_fasilitas kost_fasilitas_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.kost_fasilitas
    ADD CONSTRAINT kost_fasilitas_pkey PRIMARY KEY (id_kost, id_fasilitas);
 L   ALTER TABLE ONLY public.kost_fasilitas DROP CONSTRAINT kost_fasilitas_pkey;
       public            postgres    false    222    222            G           2606    34393    kost kost_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.kost
    ADD CONSTRAINT kost_pkey PRIMARY KEY (id_kost);
 8   ALTER TABLE ONLY public.kost DROP CONSTRAINT kost_pkey;
       public            postgres    false    221            A           2606    34395    fasilitas unique_nama_fasilitas 
   CONSTRAINT     d   ALTER TABLE ONLY public.fasilitas
    ADD CONSTRAINT unique_nama_fasilitas UNIQUE (nama_fasilitas);
 I   ALTER TABLE ONLY public.fasilitas DROP CONSTRAINT unique_nama_fasilitas;
       public            postgres    false    215            K           2606    34397    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    224            M           2606    34399    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    224            N           2606    34400    favorit favorit_id_kost_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorit
    ADD CONSTRAINT favorit_id_kost_fkey FOREIGN KEY (id_kost) REFERENCES public.kost(id_kost) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.favorit DROP CONSTRAINT favorit_id_kost_fkey;
       public          postgres    false    217    221    4679            O           2606    34405    favorit favorit_id_pencari_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorit
    ADD CONSTRAINT favorit_id_pencari_fkey FOREIGN KEY (id_pencari) REFERENCES public.users(id_user) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.favorit DROP CONSTRAINT favorit_id_pencari_fkey;
       public          postgres    false    4685    217    224            P           2606    34410 $   gambar_kost gambar_kost_id_kost_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gambar_kost
    ADD CONSTRAINT gambar_kost_id_kost_fkey FOREIGN KEY (id_kost) REFERENCES public.kost(id_kost) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.gambar_kost DROP CONSTRAINT gambar_kost_id_kost_fkey;
       public          postgres    false    221    219    4679            Q           2606    34415 /   kost_fasilitas kost_fasilitas_id_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kost_fasilitas
    ADD CONSTRAINT kost_fasilitas_id_fasilitas_fkey FOREIGN KEY (id_fasilitas) REFERENCES public.fasilitas(id_fasilitas) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.kost_fasilitas DROP CONSTRAINT kost_fasilitas_id_fasilitas_fkey;
       public          postgres    false    4671    222    215            R           2606    34420 *   kost_fasilitas kost_fasilitas_id_kost_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kost_fasilitas
    ADD CONSTRAINT kost_fasilitas_id_kost_fkey FOREIGN KEY (id_kost) REFERENCES public.kost(id_kost) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.kost_fasilitas DROP CONSTRAINT kost_fasilitas_id_kost_fkey;
       public          postgres    false    222    4679    221            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     