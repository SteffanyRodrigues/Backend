--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-06-12 14:34:13

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
-- TOC entry 216 (class 1259 OID 24658)
-- Name: skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skill_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 24668)
-- Name: Skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Skill" (
    id bigint DEFAULT nextval('public.skill_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public."Skill" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24657)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24660)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id bigint DEFAULT nextval('public.user_id_seq'::regclass) NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24659)
-- Name: user_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_skill_id_seq OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24676)
-- Name: UserSkill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserSkill" (
    id bigint DEFAULT nextval('public.user_skill_id_seq'::regclass) NOT NULL,
    user_id bigint NOT NULL,
    skill_id bigint NOT NULL,
    level integer NOT NULL
);


ALTER TABLE public."UserSkill" OWNER TO postgres;

--
-- TOC entry 4806 (class 0 OID 24668)
-- Dependencies: 219
-- Data for Name: Skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Skill" (id, name) FROM stdin;
1	Java
2	Spring Boot
3	React
\.


--
-- TOC entry 4805 (class 0 OID 24660)
-- Dependencies: 218
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, username, password) FROM stdin;
1	user1	password1
\.


--
-- TOC entry 4807 (class 0 OID 24676)
-- Dependencies: 220
-- Data for Name: UserSkill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserSkill" (id, user_id, skill_id, level) FROM stdin;
\.


--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 216
-- Name: skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skill_id_seq', 3, true);


--
-- TOC entry 4814 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_skill_id_seq', 1, false);


--
-- TOC entry 4652 (class 2606 OID 24675)
-- Name: Skill Skill_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Skill"
    ADD CONSTRAINT "Skill_name_key" UNIQUE (name);


--
-- TOC entry 4654 (class 2606 OID 24673)
-- Name: Skill Skill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Skill"
    ADD CONSTRAINT "Skill_pkey" PRIMARY KEY (id);


--
-- TOC entry 4656 (class 2606 OID 24681)
-- Name: UserSkill UserSkill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserSkill"
    ADD CONSTRAINT "UserSkill_pkey" PRIMARY KEY (id);


--
-- TOC entry 4648 (class 2606 OID 24665)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- TOC entry 4650 (class 2606 OID 24667)
-- Name: User User_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_username_key" UNIQUE (username);


--
-- TOC entry 4657 (class 2606 OID 24687)
-- Name: UserSkill fk_skill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserSkill"
    ADD CONSTRAINT fk_skill FOREIGN KEY (skill_id) REFERENCES public."Skill"(id) ON DELETE CASCADE;


--
-- TOC entry 4658 (class 2606 OID 24682)
-- Name: UserSkill fk_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserSkill"
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public."User"(id) ON DELETE CASCADE;


-- Completed on 2024-06-12 14:34:13

--
-- PostgreSQL database dump complete
--

