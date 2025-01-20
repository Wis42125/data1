--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size_km numeric NOT NULL,
    is_dangerous boolean NOT NULL,
    discovered_year integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean NOT NULL,
    galaxy_type character varying(255)
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
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    size numeric,
    has_atmosphere boolean
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    has_life boolean,
    distance_from_star integer,
    planet_type character varying(255),
    description text
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
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer,
    is_spherical boolean,
    star_type character varying(255),
    description text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Apophis', 0.37, true, 2004);
INSERT INTO public.asteroid VALUES (2, 'Bennu', 0.49, false, 1999);
INSERT INTO public.asteroid VALUES (3, 'Eros', 34.4, false, 1898);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, true, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2500000, false, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, false, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 30000000, false, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 28000000, false, 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 22000000, false, 'Spiral');
INSERT INTO public.galaxy VALUES (7, 'Milky Way 2', 10000000, true, 'Spiral');
INSERT INTO public.galaxy VALUES (8, 'Galaxy 7', 15000000, false, 'Spiral');
INSERT INTO public.galaxy VALUES (9, 'NGC 123', 20000000, false, 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.4, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.4, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643.2, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3121.6, true);
INSERT INTO public.moon VALUES (6, 'Titan', 6, 5150.8, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4821.6, false);
INSERT INTO public.moon VALUES (8, 'Ganymede', 3, 5262.4, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 504.2, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 4, 396.2, false);
INSERT INTO public.moon VALUES (11, 'Triton', 5, 2706.2, true);
INSERT INTO public.moon VALUES (12, 'Charon', 6, 1212.4, true);
INSERT INTO public.moon VALUES (13, 'Umbriel', 7, 1171.6, false);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 1156.8, false);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 471.6, false);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 1577.6, false);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 1522.4, false);
INSERT INTO public.moon VALUES (18, 'Ceres', 8, 940, false);
INSERT INTO public.moon VALUES (19, 'Haumea', 9, 816, false);
INSERT INTO public.moon VALUES (21, 'New Moon', 8, 3000, false);
INSERT INTO public.moon VALUES (22, 'Makemake Moon', 10, 1500, false);
INSERT INTO public.moon VALUES (23, 'New Moon 2', 3, 2500, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Pluto', 6, false, 5906, 'Dwarf Planet', NULL);
INSERT INTO public.planet VALUES (10, 'Titan', 4, false, 1471, 'Moon', NULL);
INSERT INTO public.planet VALUES (11, 'Earth 2', 2, true, 100, 'Terrestrial', NULL);
INSERT INTO public.planet VALUES (12, 'Mars 2', 1, false, 227, 'Terrestrial', NULL);
INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 150, 'Terrestrial', 'The third planet from the Sun, known for supporting life.');
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 227, 'Terrestrial', 'A barren planet, the fourth from the Sun, known for its reddish appearance.');
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 108, 'Terrestrial', 'Venus is the second planet from the Sun, characterized by its thick, toxic atmosphere.');
INSERT INTO public.planet VALUES (4, 'Jupiter', 2, false, 778, 'Gas Giant', 'The largest planet in the Solar System, known for its gas giant structure.');
INSERT INTO public.planet VALUES (5, 'Saturn', 3, false, 1427, 'Gas Giant', 'Saturn is known for its stunning ring system, composed of ice, rock, and dust.');
INSERT INTO public.planet VALUES (6, 'Neptune', 4, false, 4497, 'Ice Giant', 'A gas giant with a distinctive blue color, Uranus has a unique sideways rotation.');
INSERT INTO public.planet VALUES (7, 'Mercury', 1, false, 58, 'Terrestrial', 'Neptune, the eighth planet from the Sun, is known for its deep blue color and strong winds.');
INSERT INTO public.planet VALUES (8, 'Uranus', 5, false, 2871, 'Ice Giant', 'The dwarf planet Pluto is located in the Kuiper Belt and has an eccentric orbit.');
INSERT INTO public.planet VALUES (13, 'Earth 3', 1, true, 120, 'Terrestrial', NULL);
INSERT INTO public.planet VALUES (14, 'Mars 3', 1, false, 240, 'Terrestrial', NULL);
INSERT INTO public.planet VALUES (15, 'Earth 4', 1, true, 140, 'Terrestrial', NULL);
INSERT INTO public.planet VALUES (16, 'Planet X', 1, false, 500, 'Gas Giant', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4500, true, 'G-type', NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 2, 6000, true, 'G-type', NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 3, 10000, true, 'M-type', NULL);
INSERT INTO public.star VALUES (4, 'Sirius', 4, 200, true, 'A-type', NULL);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 5, 4500, true, 'M-type', NULL);
INSERT INTO public.star VALUES (6, 'Rigel', 6, 200000, true, 'B-type', NULL);
INSERT INTO public.star VALUES (7, 'Alpha Centauri B', 2, 5800, true, 'G-type', NULL);
INSERT INTO public.star VALUES (8, 'Alpha Centauri C', 2, 5700, true, 'K-type', NULL);
INSERT INTO public.star VALUES (9, 'Betelgeuse 2', 1, 1000000, true, 'M-type', NULL);
INSERT INTO public.star VALUES (10, 'Rigel 2', 1, 500000, true, 'B-type', NULL);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

