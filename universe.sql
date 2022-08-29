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
    name character varying(50),
    galaxy_id integer NOT NULL,
    diameter_km integer NOT NULL,
    age integer,
    mass numeric(4,1),
    has_photo boolean DEFAULT false NOT NULL,
    color text
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
    name character varying(50),
    moon_id integer NOT NULL,
    diameter_km integer NOT NULL,
    age integer,
    mass numeric(4,1),
    has_photo boolean DEFAULT false,
    color text,
    planet_id integer
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
    name character varying(50),
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    age integer,
    mass numeric(4,1),
    has_photo boolean DEFAULT false NOT NULL,
    color text,
    star_id integer
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
-- Name: speed; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.speed (
    speed_id integer NOT NULL,
    km_h integer NOT NULL,
    distance_s integer,
    name character varying(50)
);


ALTER TABLE public.speed OWNER TO freecodecamp;

--
-- Name: speed_speed_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.speed_speed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.speed_speed_id_seq OWNER TO freecodecamp;

--
-- Name: speed_speed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.speed_speed_id_seq OWNED BY public.speed.speed_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(50),
    star_id integer NOT NULL,
    diameter_km integer NOT NULL,
    age integer,
    mass numeric(4,1),
    has_photo boolean DEFAULT false NOT NULL,
    color text,
    galaxy_id integer
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: speed speed_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.speed ALTER COLUMN speed_id SET DEFAULT nextval('public.speed_speed_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('galaxy1', 1, 400, 1000, 100.5, true, 'green');
INSERT INTO public.galaxy VALUES ('galaxy2', 2, 500, 2000, 200.5, true, 'yellow');
INSERT INTO public.galaxy VALUES ('galaxy3', 3, 600, 3000, 300.5, false, 'brown');
INSERT INTO public.galaxy VALUES ('galaxy4', 4, 700, 4000, 400.5, false, 'red');
INSERT INTO public.galaxy VALUES ('galaxy5', 5, 800, 5000, 500.5, true, 'blue');
INSERT INTO public.galaxy VALUES ('galaxy6', 6, 900, 6000, 600.5, true, 'blue');
INSERT INTO public.galaxy VALUES ('galaxy7', 7, 1000, 7000, 700.5, false, 'orange');
INSERT INTO public.galaxy VALUES ('galaxy8', 8, 1100, 8000, 800.5, true, 'purple');
INSERT INTO public.galaxy VALUES ('galaxy9', 9, 1200, 9000, 900.5, false, 'brown');
INSERT INTO public.galaxy VALUES ('galaxy10', 10, 1300, 10000, 100.5, true, 'black');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('moon1', 1, 400, 1000, 100.5, true, 'green', NULL);
INSERT INTO public.moon VALUES ('moon2', 2, 500, 2000, 200.5, true, 'yellow', NULL);
INSERT INTO public.moon VALUES ('moon3', 3, 600, 3000, 300.5, false, 'brown', NULL);
INSERT INTO public.moon VALUES ('moon4', 4, 700, 4000, 400.5, false, 'red', NULL);
INSERT INTO public.moon VALUES ('moon5', 5, 800, 5000, 500.5, true, 'blue', NULL);
INSERT INTO public.moon VALUES ('moon6', 6, 900, 6000, 600.5, true, 'blue', NULL);
INSERT INTO public.moon VALUES ('moon7', 7, 1000, 7000, 700.5, false, 'orange', NULL);
INSERT INTO public.moon VALUES ('moon8', 8, 1100, 8000, 800.5, true, 'purple', NULL);
INSERT INTO public.moon VALUES ('moon9', 9, 1200, 9000, 900.5, false, 'brown', NULL);
INSERT INTO public.moon VALUES ('moon10', 10, 1300, 10000, 100.5, true, 'black', NULL);
INSERT INTO public.moon VALUES ('moon11', 11, 400, 1000, 100.5, true, 'green', NULL);
INSERT INTO public.moon VALUES ('moon12', 12, 500, 2000, 200.5, true, 'yellow', NULL);
INSERT INTO public.moon VALUES ('moon13', 13, 600, 3000, 300.5, false, 'brown', NULL);
INSERT INTO public.moon VALUES ('moon14', 14, 700, 4000, 400.5, false, 'red', NULL);
INSERT INTO public.moon VALUES ('moon15', 15, 800, 5000, 500.5, true, 'blue', NULL);
INSERT INTO public.moon VALUES ('moon16', 16, 900, 6000, 600.5, true, 'blue', NULL);
INSERT INTO public.moon VALUES ('moon17', 17, 1000, 7000, 700.5, false, 'orange', NULL);
INSERT INTO public.moon VALUES ('moon18', 18, 1100, 8000, 800.5, true, 'purple', NULL);
INSERT INTO public.moon VALUES ('moon19', 19, 1200, 9000, 900.5, false, 'brown', NULL);
INSERT INTO public.moon VALUES ('moon20', 20, 1300, 10000, 100.5, true, 'black', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('planet1', 1, 400, 1000, 100.5, true, 'green', NULL);
INSERT INTO public.planet VALUES ('planet2', 2, 500, 2000, 200.5, true, 'yellow', NULL);
INSERT INTO public.planet VALUES ('planet3', 3, 600, 3000, 300.5, false, 'brown', NULL);
INSERT INTO public.planet VALUES ('planet4', 4, 700, 4000, 400.5, false, 'red', NULL);
INSERT INTO public.planet VALUES ('planet5', 5, 800, 5000, 500.5, true, 'blue', NULL);
INSERT INTO public.planet VALUES ('planet6', 6, 900, 6000, 600.5, true, 'blue', NULL);
INSERT INTO public.planet VALUES ('planet7', 7, 1000, 7000, 700.5, false, 'orange', NULL);
INSERT INTO public.planet VALUES ('planet8', 8, 1100, 8000, 800.5, true, 'purple', NULL);
INSERT INTO public.planet VALUES ('planet9', 9, 1200, 9000, 900.5, false, 'brown', NULL);
INSERT INTO public.planet VALUES ('planet10', 10, 1300, 10000, 100.5, true, 'black', NULL);
INSERT INTO public.planet VALUES ('planet11', 11, 400, 1000, 100.5, true, 'green', NULL);
INSERT INTO public.planet VALUES ('planet12', 12, 500, 2000, 200.5, true, 'yellow', NULL);
INSERT INTO public.planet VALUES ('planet13', 13, 600, 3000, 300.5, false, 'brown', NULL);


--
-- Data for Name: speed; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.speed VALUES (1, 1000, 100, 'speed1');
INSERT INTO public.speed VALUES (2, 1500, 1000, 'speed2');
INSERT INTO public.speed VALUES (3, 2000, 1400, 'speed3');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('star1', 1, 400, 1000, 100.5, true, 'green', NULL);
INSERT INTO public.star VALUES ('star2', 2, 500, 2000, 200.5, true, 'yellow', NULL);
INSERT INTO public.star VALUES ('star3', 3, 600, 3000, 300.5, false, 'brown', NULL);
INSERT INTO public.star VALUES ('star4', 4, 700, 4000, 400.5, false, 'red', NULL);
INSERT INTO public.star VALUES ('star5', 5, 800, 5000, 500.5, true, 'blue', NULL);
INSERT INTO public.star VALUES ('star6', 6, 900, 6000, 600.5, true, 'blue', NULL);
INSERT INTO public.star VALUES ('star7', 7, 1000, 7000, 700.5, false, 'orange', NULL);
INSERT INTO public.star VALUES ('star8', 8, 1100, 8000, 800.5, true, 'purple', NULL);
INSERT INTO public.star VALUES ('star9', 9, 1200, 9000, 900.5, false, 'brown', NULL);
INSERT INTO public.star VALUES ('star10', 10, 1300, 10000, 100.5, true, 'black', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: speed_speed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.speed_speed_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


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
-- Name: speed speed_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.speed
    ADD CONSTRAINT speed_pkey PRIMARY KEY (speed_id);


--
-- Name: speed speed_speed_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.speed
    ADD CONSTRAINT speed_speed_id_key UNIQUE (speed_id);


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

