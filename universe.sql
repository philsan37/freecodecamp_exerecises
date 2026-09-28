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
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_types character varying NOT NULL,
    distance_from_earth integer NOT NULL,
    estimate_diameter numeric(10,4) NOT NULL
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
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    estimate_diameter numeric NOT NULL,
    has_life boolean
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
-- Name: persons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.persons (
    persons_id integer NOT NULL,
    name character varying NOT NULL,
    hobby text
);


ALTER TABLE public.persons OWNER TO freecodecamp;

--
-- Name: persons_persons_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.persons_persons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persons_persons_id_seq OWNER TO freecodecamp;

--
-- Name: persons_persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.persons_persons_id_seq OWNED BY public.persons.persons_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer NOT NULL,
    planet_types character varying NOT NULL,
    has_life boolean,
    number_of_orbiting_moon integer
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
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying NOT NULL,
    has_orbiting_planet boolean
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
-- Name: persons persons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.persons ALTER COLUMN persons_id SET DEFAULT nextval('public.persons_persons_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 2537000, 220000.0000);
INSERT INTO public.galaxy VALUES (2, 'Sombrero', 'Lenticular', 29350000, 50000.5000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, 60000.1234);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000, 100000.9999);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'Lenticular', 17000000, 30000.0000);
INSERT INTO public.galaxy VALUES (6, 'Cigar', 'Irregular', 12000000, 15000.5555);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna Eos', 1, 3474.0000, false);
INSERT INTO public.moon VALUES (22, 'Selene Eos', 1, 1200.5500, false);
INSERT INTO public.moon VALUES (23, 'Sol Minor', 2, 500.1234, false);
INSERT INTO public.moon VALUES (24, 'Flare Helios', 2, 850.9999, false);
INSERT INTO public.moon VALUES (25, 'Aurora-Alpha', 3, 1500.0000, false);
INSERT INTO public.moon VALUES (26, 'Aurora-Beta', 3, 2200.4567, false);
INSERT INTO public.moon VALUES (27, 'Boreas', 4, 900.0000, false);
INSERT INTO public.moon VALUES (28, 'Chill', 4, 450.1111, false);
INSERT INTO public.moon VALUES (29, 'Ice-1', 5, 300.5555, false);
INSERT INTO public.moon VALUES (30, 'Ice-2', 5, 300.5556, false);
INSERT INTO public.moon VALUES (31, 'Glacier-A', 6, 1100.0000, false);
INSERT INTO public.moon VALUES (32, 'Glacier-B', 6, 1100.0001, false);
INSERT INTO public.moon VALUES (33, 'Ember', 7, 50.0000, false);
INSERT INTO public.moon VALUES (34, 'Ash', 7, 45.9999, false);
INSERT INTO public.moon VALUES (35, 'Magma', 8, 88.8888, false);
INSERT INTO public.moon VALUES (36, 'Cinder', 8, 77.7777, false);
INSERT INTO public.moon VALUES (37, 'Deep Blue', 9, 10.0000, true);
INSERT INTO public.moon VALUES (38, 'High Tide', 10, 25.5000, false);
INSERT INTO public.moon VALUES (39, 'Bloom', 11, 5.5555, true);
INSERT INTO public.moon VALUES (40, 'Leaf', 12, 1.2345, true);


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.persons VALUES (1, 'Alice Vance', 'Stargazing and Astrophotography');
INSERT INTO public.persons VALUES (2, 'Bob Henderson', 'Baking sourdough bread');
INSERT INTO public.persons VALUES (3, 'Charlie Quinn', 'Playing acoustic guitar');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Eos', 1, 'Terrestrial', true, 1);
INSERT INTO public.planet VALUES (2, 'Helios', 1, 'Gas Giant', false, 42);
INSERT INTO public.planet VALUES (3, 'Aurora', 2, 'Rocky', true, 0);
INSERT INTO public.planet VALUES (4, 'Borealis', 2, 'Ice Giant', false, 14);
INSERT INTO public.planet VALUES (5, 'Frost', 3, 'Ice World', false, 2);
INSERT INTO public.planet VALUES (6, 'Glacier', 3, 'Rocky', false, 0);
INSERT INTO public.planet VALUES (7, 'Ignis', 4, 'Lava World', false, 0);
INSERT INTO public.planet VALUES (8, 'Pyra', 4, 'Gas Giant', false, 8);
INSERT INTO public.planet VALUES (9, 'Abyss', 5, 'Ocean World', true, 3);
INSERT INTO public.planet VALUES (10, 'Tide', 5, 'Terrestrial', true, 1);
INSERT INTO public.planet VALUES (11, 'Eden', 6, 'Super-Earth', true, 2);
INSERT INTO public.planet VALUES (12, 'Gaia', 6, 'Terrestrial', true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius Prime', 1, 'Main Sequence', true);
INSERT INTO public.star VALUES (2, 'Polaris Alpha', 2, 'Yellow Supergiant', true);
INSERT INTO public.star VALUES (3, 'Procyon Beta', 3, 'White Dwarf', false);
INSERT INTO public.star VALUES (4, 'Arcturus Gamma', 4, 'Red Giant', true);
INSERT INTO public.star VALUES (5, 'Mimosa Delta', 5, 'Blue Giant', false);
INSERT INTO public.star VALUES (6, 'Kaus Epsilon', 6, 'Main Sequence', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: persons_persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.persons_persons_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: persons persons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_name_key UNIQUE (name);


--
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (persons_id);


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
-- Name: galaxy uq_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_galaxy_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

