--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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

SET default_table_access_method = heap;

--
-- Name: hashtag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtag (
    id integer NOT NULL,
    hashtag text NOT NULL
);


--
-- Name: hashtag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hashtag_id_seq OWNED BY public.hashtag.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: postHashtag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."postHashtag" (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "hashtagId" integer NOT NULL
);


--
-- Name: postHashtag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."postHashtag_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: postHashtag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."postHashtag_id_seq" OWNED BY public."postHashtag".id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    link text NOT NULL,
    message character varying(120),
    "userId" integer NOT NULL,
    "linkTitle" text,
    "linkImage" text,
    "linkDescription" text
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password text NOT NULL,
    picture text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hashtag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtag ALTER COLUMN id SET DEFAULT nextval('public.hashtag_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: postHashtag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."postHashtag" ALTER COLUMN id SET DEFAULT nextval('public."postHashtag_id_seq"'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hashtag; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: postHashtag; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (2, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (3, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (4, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (5, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (6, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (7, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (8, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (9, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (10, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (11, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (12, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (13, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (14, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (15, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (16, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (17, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'hardkill551', 'hardkill194@gmail.com', '$2b$10$khayyP507yE3HWbcCzKLxueOh7tNN.TirtM65.sRid1hQuaHHJoWu', 'https://img.elo7.com.br/product/original/3254FDB/bob-esponja-e-patrick-em-camadas-arquivo-de-corte-personalizados-bob-esponja-e-patrick.jpg');


--
-- Name: hashtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtag_id_seq', 1, false);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- Name: postHashtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."postHashtag_id_seq"', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 17, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: posts Posts_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "Posts_pk" PRIMARY KEY (id);


--
-- Name: hashtag hashtag_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtag
    ADD CONSTRAINT hashtag_pk PRIMARY KEY (id);


--
-- Name: likes likes_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pk PRIMARY KEY (id);


--
-- Name: postHashtag postHashtag_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."postHashtag"
    ADD CONSTRAINT "postHashtag_pk" PRIMARY KEY (id);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: likes likes_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_fk0 FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_fk1 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: postHashtag postHashtag_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."postHashtag"
    ADD CONSTRAINT "postHashtag_fk0" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: postHashtag postHashtag_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."postHashtag"
    ADD CONSTRAINT "postHashtag_fk1" FOREIGN KEY ("hashtagId") REFERENCES public.hashtag(id);


--
-- Name: posts posts_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

