--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(40) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    age_in_billions numeric(5,3),
    size_in_parsecs integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(40) NOT NULL,
    description text,
    moon_id integer NOT NULL,
    age_in_billions numeric(4,3),
    galaxy_id integer,
    planet_id integer,
    in_milkyway boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: other_things; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other_things (
    other_things_id integer NOT NULL,
    age integer,
    galaxy_id integer,
    description text,
    name character varying(40) NOT NULL,
    in_milkyway boolean NOT NULL
);


ALTER TABLE public.other_things OWNER TO freecodecamp;

--
-- Name: other_things_other_things_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_things_other_things_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_things_other_things_id_seq OWNER TO freecodecamp;

--
-- Name: other_things_other_things_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_things_other_things_id_seq OWNED BY public.other_things.other_things_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(40) NOT NULL,
    description text,
    galaxy_id integer,
    age_in_billions numeric(4,3),
    star_id integer,
    in_milkyway boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(40) NOT NULL,
    description text,
    age_in_billions numeric(4,3),
    galaxy_id integer,
    in_milkyway boolean NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: other_things other_things_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_things ALTER COLUMN other_things_id SET DEFAULT nextval('public.other_things_other_things_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'The galaxy that includes our solar system', 1, 13.610, 27);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 'The nearest large galaxy to the Solar System', 2, 10.010, 47);
INSERT INTO public.galaxy VALUES ('Backwards Galaxy', 'Rare galaxy that rotates backwards', 3, NULL, 34000000);
INSERT INTO public.galaxy VALUES ('Black Eye Galaxy', 'Also known as the evil eye galaxy', 4, NULL, 5);
INSERT INTO public.galaxy VALUES ('Bodes Galaxy', 'Named after Johann Elert Bode', 6, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Cigar Galaxy', 'Similar in shape to a cigar', 7, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 'Earths Moon', 1, 4.530, 1, 1, true);
INSERT INTO public.moon VALUES ('Deimos', 'One of Mars moons', 2, 4.503, 1, 40, true);
INSERT INTO public.moon VALUES ('Phobos', 'The other moon of Mars', 3, 4.503, 1, 40, true);
INSERT INTO public.moon VALUES ('Adrastea', 'One of Jupiters moons', 4, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Aitne', 'One of Jupiters moons', 5, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Amalthea', 'One of Jupiters moons', 6, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Ananke', 'One of Jupiters moons', 7, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Aoede', 'One of Jupiters moons', 8, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Arche', 'One of Jupiters moons', 9, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Autonoe', 'One of Jupiters moons', 10, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Callirrhoe', 'One of Jupiters moons', 11, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Callisto', 'One of Jupiters moons', 12, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Carne', 'One of Jupiters moons', 13, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Carpo', 'One of Jupiters moons', 14, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Chaldene', 'One of Jupiters moons', 15, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Cyllene', 'One of Jupiters moons', 16, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Dia', 'One of Jupiters moons', 17, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Eirene', 'One of Jupiters moons', 18, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Elara', 'One of Jupiters moons', 19, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Erinome', 'One of Jupiters moons', 20, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Ersa', 'One of Jupiters moons', 21, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Europa', 'One of Jupiters moons', 22, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Ganymede', 'One of Jupiters moons', 23, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Lo', 'One of Jupiters moons', 24, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Kale', 'One of Jupiters moons', 25, 4.503, 1, 6, true);
INSERT INTO public.moon VALUES ('Kore', 'One of Jupiters moons', 26, 4.503, 1, 6, true);


--
-- Data for Name: other_things; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other_things VALUES (1, 0, 1, 'near-Earth and potentially hazardous asteroid', '99942 Apophis', true);
INSERT INTO public.other_things VALUES (2, 12000000, 1, 'Cosmic Cliffs, in the Carina Nebula', 'NGC 3324', true);
INSERT INTO public.other_things VALUES (3, 24, 1, 'Largest space station in low Earth orbit', 'International Space Station', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 'Planet with known living life', 1, 4.543, 1, true, 1);
INSERT INTO public.planet VALUES ('Venus', 'Second planet from the Sun', 1, 4.503, 1, true, 2);
INSERT INTO public.planet VALUES ('Uranus', 'Seventh planet from the Sun', 1, 4.503, 1, true, 3);
INSERT INTO public.planet VALUES ('Mercury', 'Smallest planet in the Solar System', 1, 4.503, 1, true, 4);
INSERT INTO public.planet VALUES ('Saturn', 'Sixth planet from the Sun', 1, 4.503, 1, true, 5);
INSERT INTO public.planet VALUES ('Jupiter', 'Largest planet in the Solar System', 1, 4.603, 1, true, 6);
INSERT INTO public.planet VALUES ('Neptune', 'Eighth planet from the Sun', 1, 4.503, 1, true, 39);
INSERT INTO public.planet VALUES ('Mars', 'The red planet', 1, 4.603, 1, true, 40);
INSERT INTO public.planet VALUES ('PA-99-N2', 'A very strong candidate for being a planet', 2, NULL, NULL, false, 41);
INSERT INTO public.planet VALUES ('ZN-187', 'Planet made up for the sake of this database', 3, 4.703, 5, false, 42);
INSERT INTO public.planet VALUES ('TN-106', 'Planet made up for the sake of this database', 4, 6.703, 4, false, 43);
INSERT INTO public.planet VALUES ('AL-104', 'Fake planet', 3, 9.102, 5, false, 44);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 'The star at the center of the Solar System', 4.603, 1, true, 1);
INSERT INTO public.star VALUES ('Betelgeuse', 'One of the largest stars visible to the naked eye', 0.101, 1, true, 2);
INSERT INTO public.star VALUES ('Antares', 'Brightest star in the constellation of Scorpius', 0.111, 1, true, 3);
INSERT INTO public.star VALUES ('Deneb', 'A first magnitude star in the constellation of Cygnus', 0.100, 1, true, 4);
INSERT INTO public.star VALUES ('Aldebaran', 'The red eye of Taurus', 6.605, 1, true, 5);
INSERT INTO public.star VALUES ('Alnilam', 'The central star of Orions belt', 0.057, 1, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: other_things_other_things_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_things_other_things_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 44, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other_things other_things_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_things
    ADD CONSTRAINT other_things_name_key UNIQUE (name);


--
-- Name: other_things other_things_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_things
    ADD CONSTRAINT other_things_pkey PRIMARY KEY (other_things_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: other_things other_things_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_things
    ADD CONSTRAINT other_things_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

