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
-- Name: astreoid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astreoid (
    astreoid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_hazardous boolean NOT NULL,
    is_far boolean NOT NULL,
    discovery_year integer,
    diameter_km integer
);


ALTER TABLE public.astreoid OWNER TO freecodecamp;

--
-- Name: astreoid_astreoid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astreoid_astreoid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astreoid_astreoid_id_seq OWNER TO freecodecamp;

--
-- Name: astreoid_astreoid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astreoid_astreoid_id_seq OWNED BY public.astreoid.astreoid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean NOT NULL,
    type text,
    distance_from_earth numeric(15,2),
    is_big boolean,
    mass integer
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
    age_in_millions_of_years integer,
    mass_trillion integer,
    has_atmosphere boolean NOT NULL,
    has_life boolean NOT NULL,
    planet_id integer NOT NULL
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
    age_in_millions_of_years integer,
    number_of_layers integer,
    has_water boolean NOT NULL,
    is_life boolean,
    star_id integer NOT NULL
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
    age_in_millions_of_years integer,
    temperature_kelvin integer,
    is_spherical boolean,
    is_bright boolean,
    galaxy_id integer NOT NULL
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
-- Name: astreoid astreoid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astreoid ALTER COLUMN astreoid_id SET DEFAULT nextval('public.astreoid_astreoid_id_seq'::regclass);


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
-- Data for Name: astreoid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astreoid VALUES (1, 'Ceres', false, false, 1801, 939);
INSERT INTO public.astreoid VALUES (2, 'Vesta', false, false, 1807, 525);
INSERT INTO public.astreoid VALUES (3, 'Pallas', false, false, 1802, 512);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 10000, false, 'Spiral', 2537000.00, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 13500, false, 'Spiral', 100000.00, true, 1000000000);
INSERT INTO public.galaxy VALUES (3, 'M87', 6500, false, 'Elliptical', 53500000.00, true, 620000000);
INSERT INTO public.galaxy VALUES (4, 'NGC 1300', 100000, false, 'Barred Spiral', 69000000.00, false, 100000000);
INSERT INTO public.galaxy VALUES (5, 'IC 1101', 600000, false, 'Lenticular', 3000000.00, false, 600000000);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 10000, false, 'Spiral', 3000000.00, false, 600000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mercury1', 4, 7000, false, false, 1);
INSERT INTO public.moon VALUES (2, 'Mercury2', 3, 6000, false, false, 1);
INSERT INTO public.moon VALUES (3, 'Mercury3', 5, 5000, false, false, 1);
INSERT INTO public.moon VALUES (4, 'Venus1', 4, 7000, false, false, 2);
INSERT INTO public.moon VALUES (5, 'Venus2', 3, 6000, false, false, 2);
INSERT INTO public.moon VALUES (6, 'Venus3', 5, 15000, false, false, 2);
INSERT INTO public.moon VALUES (7, 'Luna', 5, 7342, true, false, 3);
INSERT INTO public.moon VALUES (8, 'Mars1', 4, 7000, false, false, 4);
INSERT INTO public.moon VALUES (9, 'Mars2', 3, 6000, false, false, 4);
INSERT INTO public.moon VALUES (10, 'Phobos', 4, 1072, false, false, 4);
INSERT INTO public.moon VALUES (11, 'Jupiter1', 4, 7000, false, false, 5);
INSERT INTO public.moon VALUES (12, 'Io', 5, 8940, true, false, 5);
INSERT INTO public.moon VALUES (13, 'Europa', 4, 4799, true, false, 5);
INSERT INTO public.moon VALUES (14, 'Saturn1', 4, 6000, false, false, 6);
INSERT INTO public.moon VALUES (15, 'Saturn2', 5, 8940, true, false, 6);
INSERT INTO public.moon VALUES (16, 'Titan', 4, 1345, true, false, 6);
INSERT INTO public.moon VALUES (17, 'Uranus1', 4, 1000, false, false, 7);
INSERT INTO public.moon VALUES (18, 'Uranus2', 5, 6500, false, false, 7);
INSERT INTO public.moon VALUES (19, 'Ariel', 4, 1353, true, false, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 6, 20, false, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4000, 3, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4000, 2, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4000, 3, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4000, 2, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4000, NULL, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4000, NULL, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4000, NULL, false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4000, NULL, false, false, 1);
INSERT INTO public.planet VALUES (9, 'SiriusA', 4000, NULL, false, false, 2);
INSERT INTO public.planet VALUES (10, 'SiriusB', 5000, 4, false, false, 2);
INSERT INTO public.planet VALUES (11, 'Betelgeuse1', 4000, NULL, false, false, 3);
INSERT INTO public.planet VALUES (12, 'Betelgeuse2', 3000, NULL, false, false, 3);
INSERT INTO public.planet VALUES (13, 'Betelgeuse3', 1000, NULL, false, false, 3);
INSERT INTO public.planet VALUES (14, 'AndromedaA', 5000, 4, false, false, 4);
INSERT INTO public.planet VALUES (15, 'AndromedaB', 6000, 1, false, false, 4);
INSERT INTO public.planet VALUES (16, 'Triang', 4000, 4, false, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4500, 5778, true, true, 2);
INSERT INTO public.star VALUES (2, 'Sirius', 250, 9940, false, true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8000, 3600, false, true, 2);
INSERT INTO public.star VALUES (4, 'Andromeda1', 5000, 6000, true, true, 1);
INSERT INTO public.star VALUES (5, 'Andromeda2', 7000, 8000, false, true, 1);
INSERT INTO public.star VALUES (6, 'Triangulum1', 8000, 9000, false, true, 6);


--
-- Name: astreoid_astreoid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astreoid_astreoid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astreoid astreoid_astreoid_id_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astreoid
    ADD CONSTRAINT astreoid_astreoid_id_name_key UNIQUE (astreoid_id, name);


--
-- Name: astreoid astreoid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astreoid
    ADD CONSTRAINT astreoid_pkey PRIMARY KEY (astreoid_id);


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
-- Name: moon moon_name_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_planet_id_key UNIQUE (name, planet_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_star_id_key UNIQUE (name, star_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_galaxy_id_key UNIQUE (name, galaxy_id);


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

