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
    "repostBy" integer,
    "originalId" integer,
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

INSERT INTO public.following VALUES (1, 1, 2);


--
-- Data for Name: hashtag; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hashtag VALUES (1, 'as');
INSERT INTO public.hashtag VALUES (2, 'p');


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.likes VALUES (13, 1, 1);


--
-- Data for Name: postHashtag; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."postHashtag" VALUES (1, 1, 1);
INSERT INTO public."postHashtag" VALUES (2, 4, 1);
INSERT INTO public."postHashtag" VALUES (3, 5, 1);
INSERT INTO public."postHashtag" VALUES (4, 6, 1);
INSERT INTO public."postHashtag" VALUES (5, 7, 1);
INSERT INTO public."postHashtag" VALUES (6, 8, 1);
INSERT INTO public."postHashtag" VALUES (7, 9, 2);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (1, NULL, NULL, false, 'https://github.com/hardkill551/projeto19-linkr-front/pulls', '#as', 1, 'Pull requests · hardkill551/projeto19-linkr-front', 'https://opengraph.githubassets.com/528b5424f0fd548f815c249f9ad8ca6dc53c7274600a2f92a19fe9d76f893deb/hardkill551/projeto19-linkr-front', 'Contribute to hardkill551/projeto19-linkr-front development by creating an account on GitHub.');
INSERT INTO public.posts VALUES (2, 1, 1, true, 'https://github.com/hardkill551/projeto19-linkr-front/pulls', '#as', 1, 'Pull requests · hardkill551/projeto19-linkr-front', 'https://opengraph.githubassets.com/528b5424f0fd548f815c249f9ad8ca6dc53c7274600a2f92a19fe9d76f893deb/hardkill551/projeto19-linkr-front', 'Contribute to hardkill551/projeto19-linkr-front development by creating an account on GitHub.');
INSERT INTO public.posts VALUES (3, 1, 1, true, 'https://github.com/hardkill551/projeto19-linkr-front/pulls', '#as', 1, 'Pull requests · hardkill551/projeto19-linkr-front', 'https://opengraph.githubassets.com/528b5424f0fd548f815c249f9ad8ca6dc53c7274600a2f92a19fe9d76f893deb/hardkill551/projeto19-linkr-front', 'Contribute to hardkill551/projeto19-linkr-front development by creating an account on GitHub.');
INSERT INTO public.posts VALUES (4, 1, 1, true, 'https://github.com/hardkill551/projeto19-linkr-front/pulls', '#as', 1, 'Pull requests · hardkill551/projeto19-linkr-front', 'https://opengraph.githubassets.com/528b5424f0fd548f815c249f9ad8ca6dc53c7274600a2f92a19fe9d76f893deb/hardkill551/projeto19-linkr-front', 'Contribute to hardkill551/projeto19-linkr-front development by creating an account on GitHub.');
INSERT INTO public.posts VALUES (5, 2, 1, true, 'https://github.com/hardkill551/projeto19-linkr-front/pulls', '#as', 1, 'Pull requests · hardkill551/projeto19-linkr-front', 'https://opengraph.githubassets.com/528b5424f0fd548f815c249f9ad8ca6dc53c7274600a2f92a19fe9d76f893deb/hardkill551/projeto19-linkr-front', 'Contribute to hardkill551/projeto19-linkr-front development by creating an account on GitHub.');
INSERT INTO public.posts VALUES (6, 1, 1, true, 'https://github.com/hardkill551/projeto19-linkr-front/pulls', '#as', 2, 'Pull requests · hardkill551/projeto19-linkr-front', 'https://opengraph.githubassets.com/528b5424f0fd548f815c249f9ad8ca6dc53c7274600a2f92a19fe9d76f893deb/hardkill551/projeto19-linkr-front', 'Contribute to hardkill551/projeto19-linkr-front development by creating an account on GitHub.');
INSERT INTO public.posts VALUES (7, 1, 6, true, 'https://github.com/hardkill551/projeto19-linkr-front/pulls', '#as', 2, 'Pull requests · hardkill551/projeto19-linkr-front', 'https://opengraph.githubassets.com/528b5424f0fd548f815c249f9ad8ca6dc53c7274600a2f92a19fe9d76f893deb/hardkill551/projeto19-linkr-front', 'Contribute to hardkill551/projeto19-linkr-front development by creating an account on GitHub.');
INSERT INTO public.posts VALUES (8, 1, 4, true, 'https://github.com/hardkill551/projeto19-linkr-front/pulls', '#as', 1, 'Pull requests · hardkill551/projeto19-linkr-front', 'https://opengraph.githubassets.com/528b5424f0fd548f815c249f9ad8ca6dc53c7274600a2f92a19fe9d76f893deb/hardkill551/projeto19-linkr-front', 'Contribute to hardkill551/projeto19-linkr-front development by creating an account on GitHub.');
INSERT INTO public.posts VALUES (9, NULL, NULL, false, 'https://github.com/hardkill551/projeto19-linkr-back/pull/42', 'oi eu #P', 1, 'feat/infiniteScroll by hardkill551 · Pull Request #42 · hardkill551/projeto19-linkr-back', 'https://opengraph.githubassets.com/4c89f937019ddf2d370a043bab1d131cdb14620efd9da5f762eaebe7a4f4c8fc/hardkill551/projeto19-linkr-back/pull/42', 'Contribute to hardkill551/projeto19-linkr-back development by creating an account on GitHub.');
INSERT INTO public.posts VALUES (10, NULL, NULL, false, 'https://github.com/hardkill551/projeto19-linkr-back/pull/42', 'safsdafasd', 1, 'feat/infiniteScroll by hardkill551 · Pull Request #42 · hardkill551/projeto19-linkr-back', 'https://opengraph.githubassets.com/8d8cf80b4b9e136f0401d48e24309061be09b768fd39c8119aab199410362fa6/hardkill551/projeto19-linkr-back/pull/42', 'Contribute to hardkill551/projeto19-linkr-back development by creating an account on GitHub.');
INSERT INTO public.posts VALUES (11, NULL, NULL, false, 'https://github.com/hardkill551/projeto19-linkr-back/pull/42', 'safsafasf', 1, 'feat/infiniteScroll by hardkill551 · Pull Request #42 · hardkill551/projeto19-linkr-back', 'https://opengraph.githubassets.com/8d8cf80b4b9e136f0401d48e24309061be09b768fd39c8119aab199410362fa6/hardkill551/projeto19-linkr-back/pull/42', 'Contribute to hardkill551/projeto19-linkr-back development by creating an account on GitHub.');
INSERT INTO public.posts VALUES (12, NULL, NULL, false, 'https://github.com/hardkill551/projeto19-linkr-back/pull/42', 'safsafs', 1, 'feat/infiniteScroll by hardkill551 · Pull Request #42 · hardkill551/projeto19-linkr-back', 'https://opengraph.githubassets.com/8d8cf80b4b9e136f0401d48e24309061be09b768fd39c8119aab199410362fa6/hardkill551/projeto19-linkr-back/pull/42', 'Contribute to hardkill551/projeto19-linkr-back development by creating an account on GitHub.');
INSERT INTO public.posts VALUES (13, NULL, NULL, false, 'https://github.com/hardkill551/projeto19-linkr-back/pull/42', 'sfsafas', 1, 'feat/infiniteScroll by hardkill551 · Pull Request #42 · hardkill551/projeto19-linkr-back', 'https://opengraph.githubassets.com/8d8cf80b4b9e136f0401d48e24309061be09b768fd39c8119aab199410362fa6/hardkill551/projeto19-linkr-back/pull/42', 'Contribute to hardkill551/projeto19-linkr-back development by creating an account on GitHub.');
INSERT INTO public.posts VALUES (14, NULL, NULL, false, 'https://github.com/hardkill551/projeto19-linkr-back/pull/42', 'sfasfasdf', 1, 'feat/infiniteScroll by hardkill551 · Pull Request #42 · hardkill551/projeto19-linkr-back', 'https://opengraph.githubassets.com/8d8cf80b4b9e136f0401d48e24309061be09b768fd39c8119aab199410362fa6/hardkill551/projeto19-linkr-back/pull/42', 'Contribute to hardkill551/projeto19-linkr-back development by creating an account on GitHub.');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (2, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (3, 1, 'eyJhbGciOiJIUzI1NiJ9.MQ.fOKNCkrocbiKInqrPCqjekAn7O9oZ61tMMzKE8RftBk');
INSERT INTO public.sessions VALUES (4, 2, 'eyJhbGciOiJIUzI1NiJ9.Mg.7VV4H4jNY2w4YcopjJLX-4Cf4KvIhGum-CVXdOCrBRM');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Hugo', 'hard@hard.com', '$2b$10$h190yNt7gh6kPzRx.paJ8e9JvtOZG4wPyoWcBR5W9Y6wd8z9SCtHO', 'https://github.com/hardkill551/projeto19-linkr-front/pulls');
INSERT INTO public.users VALUES (2, 'Hugão', 'hard@gmail.com', '$2b$10$8mO5Q9cgLxWYQ0zPYXWMqedOcwxSIcsv21WQLwKiU5uKiyVHglQge', 'https://github.com/hardkill551/projeto19-linkr-back/pulls');


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: following_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.following_id_seq', 1, true);


--
-- Name: hashtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtag_id_seq', 2, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 13, true);


--
-- Name: postHashtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."postHashtag_id_seq"', 7, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 14, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


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
    ADD CONSTRAINT posts_fk0 FOREIGN KEY ("repostBy") REFERENCES public.users(id);


--
-- Name: posts posts_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_fk1 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

