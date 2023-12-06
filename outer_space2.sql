--
-- PostgreSQL database dump
--

--“for each planet: its name, the star it revolves around,
--and the numbers of moons (if any) it has”





CREATE TABLE stars (
star VARCHAR(20) PRIMARY KEY,
temp_in_kelvin NUMERIC(10, 0) NOT NULL
);


CREATE TABLE planets (
planet VARCHAR(20) PRIMARY KEY,
orbital_period_in_yrs FLOAT NOT NULL,
star_id VARCHAR(20) NOT NULL REFERENCES stars
);


CREATE TABLE moons (
moon VARCHAR(20) PRIMARY KEY,
planet_id VARCHAR(20) NOT NULL REFERENCES planets
);


SELECT planet, star_id AS star, COUNT(moon) AS moon_count
    FROM planets
        LEFT OUTER JOIN moons
            ON moons.planet_id = planets.planet
    GROUP BY planet
    ORDER BY planet;




-- Dumped from database version 15.4 (Homebrew)
-- Dumped by pg_dump version 15.4 (Homebrew)

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

ALTER TABLE ONLY public.planets DROP CONSTRAINT planets_star_id_fkey;
ALTER TABLE ONLY public.moons DROP CONSTRAINT moons_planet_id_fkey;
ALTER TABLE ONLY public.stars DROP CONSTRAINT stars_pkey;
ALTER TABLE ONLY public.planets DROP CONSTRAINT planets_pkey;
ALTER TABLE ONLY public.moons DROP CONSTRAINT moons_pkey;
DROP TABLE public.stars;
DROP TABLE public.planets;
DROP TABLE public.moons;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: moons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moons (
    moon character varying(20) NOT NULL,
    planet_id character varying(20) NOT NULL
);


--
-- Name: planets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planets (
    planet character varying(20) NOT NULL,
    orbital_period_in_yrs double precision NOT NULL,
    star_id character varying(20) NOT NULL
);


--
-- Name: stars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stars (
    star character varying(20) NOT NULL,
    temp_in_kelvin numeric(10,0) NOT NULL
);


--
-- Data for Name: moons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.moons (moon, planet_id) FROM stdin;
\.


--
-- Data for Name: planets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.planets (planet, orbital_period_in_yrs, star_id) FROM stdin;
\.


--
-- Data for Name: stars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stars (star, temp_in_kelvin) FROM stdin;
\.


--
-- Name: moons moons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moons
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon);


--
-- Name: planets planets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet);


--
-- Name: stars stars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stars
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star);


--
-- Name: moons moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moons
    ADD CONSTRAINT moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planets(planet);


--
-- Name: planets planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.stars(star);


--
-- PostgreSQL database dump complete
--

