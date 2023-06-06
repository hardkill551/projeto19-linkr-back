--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

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
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    comment character varying NOT NULL,
    "postId" integer NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: following; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.following (
    id integer NOT NULL,
    stalker integer NOT NULL,
    "followedId" integer NOT NULL
);


--
-- Name: following_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.following_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: following_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.following_id_seq OWNED BY public.following.id;


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
    repost boolean DEFAULT false NOT NULL,
    link text NOT NULL,
    message character varying,
    "userId" integer NOT NULL,
    "linkTitle" text NOT NULL,
    "linkImage" text NOT NULL,
    "linkDescription" text NOT NULL
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
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: following id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.following ALTER COLUMN id SET DEFAULT nextval('public.following_id_seq'::regclass);


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
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: following; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: hashtag; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hashtag VALUES (1, 'teste1');
INSERT INTO public.hashtag VALUES (2, 'teste2');
INSERT INTO public.hashtag VALUES (3, 'teste3');
INSERT INTO public.hashtag VALUES (4, 'teste4');
INSERT INTO public.hashtag VALUES (5, 'teste5');
INSERT INTO public.hashtag VALUES (6, 'teste6');
INSERT INTO public.hashtag VALUES (7, 'teste7');
INSERT INTO public.hashtag VALUES (8, 'teste8');


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.likes VALUES (3, 8, 2);


--
-- Data for Name: postHashtag; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."postHashtag" VALUES (1, 1, 1);
INSERT INTO public."postHashtag" VALUES (2, 2, 1);
INSERT INTO public."postHashtag" VALUES (3, 2, 2);
INSERT INTO public."postHashtag" VALUES (4, 3, 1);
INSERT INTO public."postHashtag" VALUES (5, 3, 2);
INSERT INTO public."postHashtag" VALUES (6, 3, 3);
INSERT INTO public."postHashtag" VALUES (7, 4, 1);
INSERT INTO public."postHashtag" VALUES (8, 4, 2);
INSERT INTO public."postHashtag" VALUES (9, 4, 3);
INSERT INTO public."postHashtag" VALUES (10, 4, 4);
INSERT INTO public."postHashtag" VALUES (11, 5, 1);
INSERT INTO public."postHashtag" VALUES (12, 5, 2);
INSERT INTO public."postHashtag" VALUES (13, 5, 3);
INSERT INTO public."postHashtag" VALUES (14, 5, 4);
INSERT INTO public."postHashtag" VALUES (15, 5, 5);
INSERT INTO public."postHashtag" VALUES (16, 6, 1);
INSERT INTO public."postHashtag" VALUES (17, 6, 4);
INSERT INTO public."postHashtag" VALUES (18, 6, 3);
INSERT INTO public."postHashtag" VALUES (19, 6, 5);
INSERT INTO public."postHashtag" VALUES (20, 6, 2);
INSERT INTO public."postHashtag" VALUES (21, 6, 6);
INSERT INTO public."postHashtag" VALUES (22, 7, 1);
INSERT INTO public."postHashtag" VALUES (23, 7, 2);
INSERT INTO public."postHashtag" VALUES (24, 7, 3);
INSERT INTO public."postHashtag" VALUES (25, 7, 4);
INSERT INTO public."postHashtag" VALUES (26, 7, 5);
INSERT INTO public."postHashtag" VALUES (27, 7, 6);
INSERT INTO public."postHashtag" VALUES (28, 7, 7);
INSERT INTO public."postHashtag" VALUES (29, 8, 1);
INSERT INTO public."postHashtag" VALUES (30, 8, 2);
INSERT INTO public."postHashtag" VALUES (31, 8, 3);
INSERT INTO public."postHashtag" VALUES (32, 8, 4);
INSERT INTO public."postHashtag" VALUES (33, 8, 5);
INSERT INTO public."postHashtag" VALUES (34, 8, 6);
INSERT INTO public."postHashtag" VALUES (35, 8, 7);
INSERT INTO public."postHashtag" VALUES (36, 8, 8);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (1, false, 'https://g1.globo.com/mundo/video/eua-denunciam-manobra-agressiva-de-caca-chines-11660704.ghtml', 'testando #teste1', 2, 'EUA denunciam manobra agressiva de caça chinês', 'https://s01.video.glbimg.com/x720/11660704.jpg', 'O incidente, segundo o Pentágono, faz parte de um padrão de conduta da China');
INSERT INTO public.posts VALUES (2, false, 'https://g1.globo.com/mundo/video/eua-denunciam-manobra-agressiva-de-caca-chines-11660704.ghtml', 'testando #teste1 #teste2', 2, 'EUA denunciam manobra agressiva de caça chinês', 'https://s01.video.glbimg.com/x720/11660704.jpg', 'O incidente, segundo o Pentágono, faz parte de um padrão de conduta da China');
INSERT INTO public.posts VALUES (3, false, 'https://g1.globo.com/mundo/video/eua-denunciam-manobra-agressiva-de-caca-chines-11660704.ghtml', 'testando #teste1 #teste2 #teste3', 2, 'EUA denunciam manobra agressiva de caça chinês', 'https://s01.video.glbimg.com/x720/11660704.jpg', 'O incidente, segundo o Pentágono, faz parte de um padrão de conduta da China');
INSERT INTO public.posts VALUES (4, false, 'https://g1.globo.com/mundo/video/eua-denunciam-manobra-agressiva-de-caca-chines-11660704.ghtml', 'testando #teste1 #teste2 #teste3 #teste4', 2, 'EUA denunciam manobra agressiva de caça chinês', 'https://s01.video.glbimg.com/x720/11660704.jpg', 'O incidente, segundo o Pentágono, faz parte de um padrão de conduta da China');
INSERT INTO public.posts VALUES (5, false, 'https://g1.globo.com/mundo/video/eua-denunciam-manobra-agressiva-de-caca-chines-11660704.ghtml', 'testando #teste1 #teste2 #teste3 #teste4 #teste5', 2, 'EUA denunciam manobra agressiva de caça chinês', 'https://s01.video.glbimg.com/x720/11660704.jpg', 'O incidente, segundo o Pentágono, faz parte de um padrão de conduta da China');
INSERT INTO public.posts VALUES (6, false, 'https://g1.globo.com/mundo/video/eua-denunciam-manobra-agressiva-de-caca-chines-11660704.ghtml', 'testando #teste1 #teste2 #teste3 #teste4 #teste5 #teste6', 2, 'EUA denunciam manobra agressiva de caça chinês', 'https://s01.video.glbimg.com/x720/11660704.jpg', 'O incidente, segundo o Pentágono, faz parte de um padrão de conduta da China');
INSERT INTO public.posts VALUES (7, false, 'https://g1.globo.com/mundo/video/eua-denunciam-manobra-agressiva-de-caca-chines-11660704.ghtml', 'testando #teste1 #teste2 #teste3 #teste4 #teste5 #teste6 #teste7', 2, 'EUA denunciam manobra agressiva de caça chinês', 'https://s01.video.glbimg.com/x720/11660704.jpg', 'O incidente, segundo o Pentágono, faz parte de um padrão de conduta da China');
INSERT INTO public.posts VALUES (8, false, 'https://g1.globo.com/mundo/video/eua-denunciam-manobra-agressiva-de-caca-chines-11660704.ghtml', 'testando #teste1 #teste2 #teste3 #teste4 #teste5 #teste6 #teste7 #teste8', 2, 'EUA denunciam manobra agressiva de caça chinês', 'https://s01.video.glbimg.com/x720/11660704.jpg', 'O incidente, segundo o Pentágono, faz parte de um padrão de conduta da China');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, '"1234"');
INSERT INTO public.sessions VALUES (2, 2, 'eyJhbGciOiJIUzI1NiJ9.Mg.7VV4H4jNY2w4YcopjJLX-4Cf4KvIhGum-CVXdOCrBRM');
INSERT INTO public.sessions VALUES (3, 2, 'eyJhbGciOiJIUzI1NiJ9.Mg.7VV4H4jNY2w4YcopjJLX-4Cf4KvIhGum-CVXdOCrBRM');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Larissa', 'larissa@email.com', '1234', 'data:image/jpeg;base64,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');
INSERT INTO public.users VALUES (2, 'Larissa', 'larissa@larissa.com', '$2b$10$yO/sHOYcbUixBL.oTcCV3.xLsu/vdTXli6BmRP/0cYVSCyIKo.iSC', 'data:image/jpeg;base64,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');


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: following_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.following_id_seq', 1, false);


--
-- Name: hashtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtag_id_seq', 8, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 3, true);


--
-- Name: postHashtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."postHashtag_id_seq"', 36, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 8, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: comments comments_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pk PRIMARY KEY (id);


--
-- Name: following following_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.following
    ADD CONSTRAINT following_pk PRIMARY KEY (id);


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
-- Name: posts posts_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pk PRIMARY KEY (id);


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
-- Name: comments comments_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_fk0 FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: comments comments_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_fk1 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: following following_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.following
    ADD CONSTRAINT following_fk0 FOREIGN KEY (stalker) REFERENCES public.users(id);


--
-- Name: following following_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.following
    ADD CONSTRAINT following_fk1 FOREIGN KEY ("followedId") REFERENCES public.users(id);


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

