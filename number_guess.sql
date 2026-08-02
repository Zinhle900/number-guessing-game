--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('test1', 1, 12);
INSERT INTO public.players VALUES ('user_1785659661685', 2, 234);
INSERT INTO public.players VALUES ('user_1785660451851', 2, 92);
INSERT INTO public.players VALUES ('user_1785659661686', 5, 90);
INSERT INTO public.players VALUES ('user_1785660451852', 5, 124);
INSERT INTO public.players VALUES ('user_1785659741563', 2, 45);
INSERT INTO public.players VALUES ('user_1785659741564', 5, 106);
INSERT INTO public.players VALUES ('user_1785659755929', 2, 539);
INSERT INTO public.players VALUES ('user_1785659755930', 5, 47);
INSERT INTO public.players VALUES ('user_1785659765174', 2, 156);
INSERT INTO public.players VALUES ('user_1785659765175', 5, 28);
INSERT INTO public.players VALUES ('user_1785659943736', 2, 469);
INSERT INTO public.players VALUES ('user_1785659943737', 5, 86);
INSERT INTO public.players VALUES ('user_1785659953083', 2, 254);
INSERT INTO public.players VALUES ('user_1785659953084', 5, 167);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

