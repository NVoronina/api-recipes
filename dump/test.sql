toc.dat                                                                                             0000600 0004000 0002000 00000024527 13216151411 0014444 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           3                u            test    10.1    10.1 )               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                    1262    16393    test    DATABASE     �   CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE test;
             postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                    0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                     3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                    0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1         �            1259    16507    images    TABLE     }   CREATE TABLE images (
    id_image integer NOT NULL,
    recipe_id integer NOT NULL,
    image character varying NOT NULL
);
    DROP TABLE public.images;
       public         postgres    false    3         �            1259    16505    images_id_image_seq    SEQUENCE     �   CREATE SEQUENCE images_id_image_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.images_id_image_seq;
       public       postgres    false    3    203                    0    0    images_id_image_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE images_id_image_seq OWNED BY images.id_image;
            public       postgres    false    202         �            1259    16448    recipes    TABLE     �   CREATE TABLE recipes (
    recipe_id integer NOT NULL,
    name character varying(255) NOT NULL,
    descriptions text,
    date_create timestamp with time zone,
    id_user integer NOT NULL
);
    DROP TABLE public.recipes;
       public         postgres    false    3         �            1259    16446    recipes_recipe_id_seq    SEQUENCE     �   CREATE SEQUENCE recipes_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.recipes_recipe_id_seq;
       public       postgres    false    3    197                    0    0    recipes_recipe_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE recipes_recipe_id_seq OWNED BY recipes.recipe_id;
            public       postgres    false    196         �            1259    16464    sessions    TABLE     �   CREATE TABLE sessions (
    id_session integer NOT NULL,
    token character(32) NOT NULL,
    session character varying NOT NULL,
    id_user integer NOT NULL
);
    DROP TABLE public.sessions;
       public         postgres    false    3         �            1259    16462    sessions_id_session_seq    SEQUENCE     �   CREATE SEQUENCE sessions_id_session_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.sessions_id_session_seq;
       public       postgres    false    3    201                    0    0    sessions_id_session_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE sessions_id_session_seq OWNED BY sessions.id_session;
            public       postgres    false    200         �            1259    16456    users    TABLE     �   CREATE TABLE users (
    id_user integer NOT NULL,
    name character varying(100),
    surname character varying(100),
    login character varying(100) NOT NULL,
    pass character(32) NOT NULL
);
    DROP TABLE public.users;
       public         postgres    false    3         �            1259    16454    users_id_user_seq    SEQUENCE     �   CREATE SEQUENCE users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_id_user_seq;
       public       postgres    false    199    3                     0    0    users_id_user_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE users_id_user_seq OWNED BY users.id_user;
            public       postgres    false    198         �
           2604    16510    images id_image    DEFAULT     d   ALTER TABLE ONLY images ALTER COLUMN id_image SET DEFAULT nextval('images_id_image_seq'::regclass);
 >   ALTER TABLE public.images ALTER COLUMN id_image DROP DEFAULT;
       public       postgres    false    202    203    203         �
           2604    16451    recipes recipe_id    DEFAULT     h   ALTER TABLE ONLY recipes ALTER COLUMN recipe_id SET DEFAULT nextval('recipes_recipe_id_seq'::regclass);
 @   ALTER TABLE public.recipes ALTER COLUMN recipe_id DROP DEFAULT;
       public       postgres    false    197    196    197         �
           2604    16467    sessions id_session    DEFAULT     l   ALTER TABLE ONLY sessions ALTER COLUMN id_session SET DEFAULT nextval('sessions_id_session_seq'::regclass);
 B   ALTER TABLE public.sessions ALTER COLUMN id_session DROP DEFAULT;
       public       postgres    false    200    201    201         �
           2604    16459    users id_user    DEFAULT     `   ALTER TABLE ONLY users ALTER COLUMN id_user SET DEFAULT nextval('users_id_user_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public       postgres    false    199    198    199                   0    16507    images 
   TABLE DATA               5   COPY images (id_image, recipe_id, image) FROM stdin;
    public       postgres    false    203       2837.dat           0    16448    recipes 
   TABLE DATA               O   COPY recipes (recipe_id, name, descriptions, date_create, id_user) FROM stdin;
    public       postgres    false    197       2831.dat           0    16464    sessions 
   TABLE DATA               @   COPY sessions (id_session, token, session, id_user) FROM stdin;
    public       postgres    false    201       2835.dat           0    16456    users 
   TABLE DATA               =   COPY users (id_user, name, surname, login, pass) FROM stdin;
    public       postgres    false    199       2833.dat !           0    0    images_id_image_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('images_id_image_seq', 5, true);
            public       postgres    false    202         "           0    0    recipes_recipe_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('recipes_recipe_id_seq', 21, true);
            public       postgres    false    196         #           0    0    sessions_id_session_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('sessions_id_session_seq', 11, true);
            public       postgres    false    200         $           0    0    users_id_user_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('users_id_user_seq', 2, true);
            public       postgres    false    198         �
           2606    16515    images images_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id_image);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public         postgres    false    203         �
           2606    16453    recipes recipes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (recipe_id);
 >   ALTER TABLE ONLY public.recipes DROP CONSTRAINT recipes_pkey;
       public         postgres    false    197         �
           2606    16469    sessions sessions_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id_session);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public         postgres    false    201         �
           2606    16461    users users_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    199         �
           1259    16526    fki_recipe-images    INDEX     D   CREATE INDEX "fki_recipe-images" ON images USING btree (recipe_id);
 '   DROP INDEX public."fki_recipe-images";
       public         postgres    false    203         �
           1259    16532    fki_recipe-user    INDEX     A   CREATE INDEX "fki_recipe-user" ON recipes USING btree (id_user);
 %   DROP INDEX public."fki_recipe-user";
       public         postgres    false    197         �
           1259    16475    fki_user-session    INDEX     C   CREATE INDEX "fki_user-session" ON sessions USING btree (id_user);
 &   DROP INDEX public."fki_user-session";
       public         postgres    false    201         �
           2606    16521    images recipe-images    FK CONSTRAINT     r   ALTER TABLE ONLY images
    ADD CONSTRAINT "recipe-images" FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);
 @   ALTER TABLE ONLY public.images DROP CONSTRAINT "recipe-images";
       public       postgres    false    203    197    2697         �
           2606    16527    recipes recipe-user    FK CONSTRAINT     k   ALTER TABLE ONLY recipes
    ADD CONSTRAINT "recipe-user" FOREIGN KEY (id_user) REFERENCES users(id_user);
 ?   ALTER TABLE ONLY public.recipes DROP CONSTRAINT "recipe-user";
       public       postgres    false    197    199    2699         �
           2606    16470    sessions user-session    FK CONSTRAINT     �   ALTER TABLE ONLY sessions
    ADD CONSTRAINT "user-session" FOREIGN KEY (id_user) REFERENCES users(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.sessions DROP CONSTRAINT "user-session";
       public       postgres    false    199    2699    201                                                                                                                                                                                 2837.dat                                                                                            0000600 0004000 0002000 00000000005 13216151411 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2831.dat                                                                                            0000600 0004000 0002000 00000000064 13216151411 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        21	Hello	world	2017-12-19 08:35:45.948938+00	2
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                            2835.dat                                                                                            0000600 0004000 0002000 00000000106 13216151411 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        11	eljhz6f3ohl6pc0ar35i2lyhe6x9wo1g	niqdfhamheu2q564k4n06a0rc6	2
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                          2833.dat                                                                                            0000600 0004000 0002000 00000000114 13216151411 0014240 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Наталья	Воронина	nat	48474f975022f960bc2afbe49be581e8
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                    restore.sql                                                                                         0000600 0004000 0002000 00000022033 13216151411 0015357 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.sessions DROP CONSTRAINT "user-session";
ALTER TABLE ONLY public.recipes DROP CONSTRAINT "recipe-user";
ALTER TABLE ONLY public.images DROP CONSTRAINT "recipe-images";
DROP INDEX public."fki_user-session";
DROP INDEX public."fki_recipe-user";
DROP INDEX public."fki_recipe-images";
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
ALTER TABLE ONLY public.recipes DROP CONSTRAINT recipes_pkey;
ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
ALTER TABLE public.sessions ALTER COLUMN id_session DROP DEFAULT;
ALTER TABLE public.recipes ALTER COLUMN recipe_id DROP DEFAULT;
ALTER TABLE public.images ALTER COLUMN id_image DROP DEFAULT;
DROP SEQUENCE public.users_id_user_seq;
DROP TABLE public.users;
DROP SEQUENCE public.sessions_id_session_seq;
DROP TABLE public.sessions;
DROP SEQUENCE public.recipes_recipe_id_seq;
DROP TABLE public.recipes;
DROP SEQUENCE public.images_id_image_seq;
DROP TABLE public.images;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE images (
    id_image integer NOT NULL,
    recipe_id integer NOT NULL,
    image character varying NOT NULL
);


ALTER TABLE images OWNER TO postgres;

--
-- Name: images_id_image_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE images_id_image_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE images_id_image_seq OWNER TO postgres;

--
-- Name: images_id_image_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE images_id_image_seq OWNED BY images.id_image;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE recipes (
    recipe_id integer NOT NULL,
    name character varying(255) NOT NULL,
    descriptions text,
    date_create timestamp with time zone,
    id_user integer NOT NULL
);


ALTER TABLE recipes OWNER TO postgres;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recipes_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipes_recipe_id_seq OWNER TO postgres;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recipes_recipe_id_seq OWNED BY recipes.recipe_id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sessions (
    id_session integer NOT NULL,
    token character(32) NOT NULL,
    session character varying NOT NULL,
    id_user integer NOT NULL
);


ALTER TABLE sessions OWNER TO postgres;

--
-- Name: sessions_id_session_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sessions_id_session_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sessions_id_session_seq OWNER TO postgres;

--
-- Name: sessions_id_session_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sessions_id_session_seq OWNED BY sessions.id_session;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id_user integer NOT NULL,
    name character varying(100),
    surname character varying(100),
    login character varying(100) NOT NULL,
    pass character(32) NOT NULL
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_user_seq OWNER TO postgres;

--
-- Name: users_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_user_seq OWNED BY users.id_user;


--
-- Name: images id_image; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY images ALTER COLUMN id_image SET DEFAULT nextval('images_id_image_seq'::regclass);


--
-- Name: recipes recipe_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recipes ALTER COLUMN recipe_id SET DEFAULT nextval('recipes_recipe_id_seq'::regclass);


--
-- Name: sessions id_session; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions ALTER COLUMN id_session SET DEFAULT nextval('sessions_id_session_seq'::regclass);


--
-- Name: users id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id_user SET DEFAULT nextval('users_id_user_seq'::regclass);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY images (id_image, recipe_id, image) FROM stdin;
\.
COPY images (id_image, recipe_id, image) FROM '$$PATH$$/2837.dat';

--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recipes (recipe_id, name, descriptions, date_create, id_user) FROM stdin;
\.
COPY recipes (recipe_id, name, descriptions, date_create, id_user) FROM '$$PATH$$/2831.dat';

--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sessions (id_session, token, session, id_user) FROM stdin;
\.
COPY sessions (id_session, token, session, id_user) FROM '$$PATH$$/2835.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id_user, name, surname, login, pass) FROM stdin;
\.
COPY users (id_user, name, surname, login, pass) FROM '$$PATH$$/2833.dat';

--
-- Name: images_id_image_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('images_id_image_seq', 5, true);


--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recipes_recipe_id_seq', 21, true);


--
-- Name: sessions_id_session_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sessions_id_session_seq', 11, true);


--
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_user_seq', 2, true);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id_image);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (recipe_id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id_session);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- Name: fki_recipe-images; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_recipe-images" ON images USING btree (recipe_id);


--
-- Name: fki_recipe-user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_recipe-user" ON recipes USING btree (id_user);


--
-- Name: fki_user-session; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_user-session" ON sessions USING btree (id_user);


--
-- Name: images recipe-images; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY images
    ADD CONSTRAINT "recipe-images" FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);


--
-- Name: recipes recipe-user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT "recipe-user" FOREIGN KEY (id_user) REFERENCES users(id_user);


--
-- Name: sessions user-session; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT "user-session" FOREIGN KEY (id_user) REFERENCES users(id_user) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     