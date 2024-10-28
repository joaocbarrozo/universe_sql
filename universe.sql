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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    galaxy_id integer,
    name character varying(100) NOT NULL,
    mass double precision,
    radius double precision,
    event_horizon double precision,
    discovery_date date,
    notes text
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50),
    galaxy_size integer,
    galaxy_distance double precision,
    galaxy_age integer,
    supermassive_blackhole boolean,
    discovery_date date
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
    planet_id integer,
    name character varying(100) NOT NULL,
    radius numeric,
    orbital_period double precision,
    distance_from_planet double precision,
    discovery_date date,
    notes text
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
    star_id integer,
    name character varying(100) NOT NULL,
    planet_type character varying(50) NOT NULL,
    mass double precision,
    radius double precision,
    orbital_period double precision,
    distance_from_star double precision
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
    galaxy_id integer,
    name character varying(100) NOT NULL,
    star_type character varying(50) NOT NULL,
    mass double precision,
    radius double precision,
    temperature double precision,
    age double precision,
    distance double precision,
    is_single boolean
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 1, 'Sagittarius A*', 4300000, 12.7, 0.12, '1974-02-13', 'Supermassive black hole at the center of the Milky Way');
INSERT INTO public.blackhole VALUES (2, 2, 'M87*', 6500000000, 26000000000, 120, '1918-04-01', 'First black hole to be directly imaged in 2019');
INSERT INTO public.blackhole VALUES (3, 3, 'Cygnus X-1', 15, 44, 0.01, '1964-12-01', 'One of the strongest X-ray sources observed from Earth');
INSERT INTO public.blackhole VALUES (4, 4, 'NGC 1277', 17000000000, 0.3, 0.2, '2012-11-28', 'Contains one of the most massive known black holes');
INSERT INTO public.blackhole VALUES (5, 5, 'NGC 1600', 17000000000, 32000000000, 150, '2016-04-06', 'Supermassive black hole in an average-sized galaxy');
INSERT INTO public.blackhole VALUES (6, 6, 'NGC 4889', 21000000000, 44000000000, 140, '2011-12-05', 'Supermassive black hole in the Coma Cluster');
INSERT INTO public.blackhole VALUES (7, 7, 'S5 0014+81', 40000000000, 130000000000, 236, '2009-06-01', 'Extremely luminous quasar with a massive black hole');
INSERT INTO public.blackhole VALUES (8, 8, 'Tonn 618', 66000000000, 600000000000, 210, '2004-06-01', 'One of the most massive black holes ever discovered');
INSERT INTO public.blackhole VALUES (9, 9, 'Holm 15A', 40000000000, 43000000000, 250, '2019-08-01', 'Brightest galaxy in the center of the galaxy cluster Abell 85');
INSERT INTO public.blackhole VALUES (10, 10, 'IC 1101', 40000000000, 40000000000, 220, '1990-01-01', 'Largest known galaxy, central black hole with extreme mass');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Spiral', 1000, 2500000, 10, true, '0964-01-01');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', 250, 0, 14, true, '0001-01-01');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 'Spiral', 100, 31000000, 10, true, '1773-01-01');
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'Lenticular', 100, 24000000, 10, true, '1781-01-01');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Spiral', 800, 31000000, 13, true, '1781-01-01');
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'Spiral', 40, 3000000, 13, false, '0964-01-01');
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'Irregular', 30, 163000, 13, false, '0964-01-01');
INSERT INTO public.galaxy VALUES (8, 'Small Magellanic Cloud', 'Irregular', 7, 200000, 13, false, '0964-01-01');
INSERT INTO public.galaxy VALUES (9, 'Pinwheel Galaxy', 'Spiral', 1000, 21000000, 10, true, '1781-01-01');
INSERT INTO public.galaxy VALUES (10, 'Centaurus A', 'Elliptical/Spiral', 100, 11000000, 13, true, '1826-01-01');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Phobos', 11.27, 0.32, 9377, '1877-08-18', 'One of Mars’ moons, very close to its surface');
INSERT INTO public.moon VALUES (2, 1, 'Deimos', 6.2, 1.26, 23460, '1877-08-12', 'The smaller of Mars’ two moons');
INSERT INTO public.moon VALUES (3, 2, 'Europa', 1560.8, 3.55, 671100, '1610-01-08', 'One of Jupiter’s Galilean moons, icy surface');
INSERT INTO public.moon VALUES (4, 2, 'Ganymede', 2634.1, 7.15, 1070400, '1610-01-08', 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (5, 2, 'Callisto', 2410.3, 16.69, 1882700, '1610-01-08', 'Third-largest moon in the Solar System');
INSERT INTO public.moon VALUES (6, 3, 'Titan', 2574.7, 15.95, 1221900, '1655-03-25', 'Largest moon of Saturn, has a dense atmosphere');
INSERT INTO public.moon VALUES (7, 3, 'Enceladus', 252.1, 1.37, 238000, '1789-08-28', 'Known for its geysers');
INSERT INTO public.moon VALUES (8, 4, 'Oberon', 761.4, 13.46, 583500, '1787-01-11', 'One of Uranus’ largest moons');
INSERT INTO public.moon VALUES (9, 4, 'Titania', 788.9, 8.71, 436300, '1787-01-11', 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (10, 5, 'Triton', 1353.4, 5.88, 354800, '1846-10-10', 'Largest moon of Neptune, retrograde orbit');
INSERT INTO public.moon VALUES (11, 5, 'Nereid', 170, 360.13, 5513800, '1949-05-01', 'Third-largest moon of Neptune');
INSERT INTO public.moon VALUES (12, 6, 'Io', 1821.6, 1.77, 421700, '1610-01-08', 'Most volcanically active body in the Solar System');
INSERT INTO public.moon VALUES (13, 6, 'Rhea', 764.3, 4.52, 527040, '1672-12-23', 'Second-largest moon of Saturn');
INSERT INTO public.moon VALUES (14, 7, 'Miranda', 235.8, 1.41, 129900, '1948-02-16', 'One of the smallest and innermost of Uranus’ moons');
INSERT INTO public.moon VALUES (15, 7, 'Ariel', 578.9, 2.52, 191020, '1851-10-24', 'One of Uranus’ larger moons');
INSERT INTO public.moon VALUES (16, 8, 'Dione', 561.4, 2.74, 377400, '1684-03-21', 'Fourth-largest moon of Saturn');
INSERT INTO public.moon VALUES (17, 8, 'Tethys', 531, 1.89, 294660, '1684-03-21', 'One of Saturn’s mid-sized moons');
INSERT INTO public.moon VALUES (18, 9, 'Iapetus', 734.5, 79.32, 3561300, '1671-10-25', 'Distinctive two-tone coloration');
INSERT INTO public.moon VALUES (19, 9, 'Mimas', 198.2, 0.94, 185520, '1789-09-17', 'One of Saturn’s smaller moons');
INSERT INTO public.moon VALUES (20, 10, 'Charon', 606, 6.39, 19591, '1978-06-22', 'Largest moon of Pluto, almost a binary system');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Proxima Centauri b', 'Terrestrial', 1.27, 1.1, 11.2, 0.0485);
INSERT INTO public.planet VALUES (2, 1, 'Alpha Centauri Bb', 'Terrestrial', 1.1, 1.1, 3.2, 0.04);
INSERT INTO public.planet VALUES (3, 2, 'Sirius A b', 'Gas Giant', 2.5, 1.1, 315, 1.75);
INSERT INTO public.planet VALUES (4, 3, 'Betelgeuse b', 'Gas Giant', 5.5, 1.2, 600, 5.2);
INSERT INTO public.planet VALUES (5, 4, 'Vega b', 'Neptune-like', 1.5, 3.9, 190, 0.5);
INSERT INTO public.planet VALUES (6, 5, 'Polaris Ab', 'Gas Giant', 4.9, 1.6, 675, 17);
INSERT INTO public.planet VALUES (7, 1, 'Alpha Centauri Cc', 'Terrestrial', 0.8, 1.2, 5.3, 0.06);
INSERT INTO public.planet VALUES (8, 2, 'Sirius Cb', 'Super-Earth', 3.2, 2.4, 290, 0.3);
INSERT INTO public.planet VALUES (9, 3, 'Betelgeuse c', 'Gas Giant', 7.2, 1.3, 820, 7.5);
INSERT INTO public.planet VALUES (10, 4, 'Vega c', 'Ice Giant', 3.6, 3.2, 400, 5.8);
INSERT INTO public.planet VALUES (11, 5, 'Antares Bb', 'Terrestrial', 0.9, 1.1, 210, 1.2);
INSERT INTO public.planet VALUES (12, 2, 'Sirius A c', 'Gas Giant', 5.3, 1.5, 800, 0.1);
INSERT INTO public.planet VALUES (13, 3, 'Betelgeuse d', 'Gas Giant', 9.1, 1.4, 1500, 6.8);
INSERT INTO public.planet VALUES (14, 4, 'Vega d', 'Terrestrial', 1.2, 1, 130, 3.1);
INSERT INTO public.planet VALUES (15, 5, 'Polaris Bc', 'Ice Giant', 1.8, 3.5, 430, 1.3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Proxima Centauri', 'Red Dwarf', 0.12, 0.14, 3042, 4.85, 4.24, false);
INSERT INTO public.star VALUES (2, 1, 'Alpha Centauri A', 'G-Type', 1.1, 1.22, 5790, 4.37, 4.37, false);
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri B', 'K-Type', 0.907, 0.86, 5260, 4.37, 4.37, false);
INSERT INTO public.star VALUES (4, 2, 'Sirius A', 'A-Type', 2.02, 1.71, 9940, 0.242, 8.6, false);
INSERT INTO public.star VALUES (5, 2, 'Sirius B', 'White Dwarf', 1.018, 0.0084, 25200, 0.242, 8.6, true);
INSERT INTO public.star VALUES (6, 3, 'Betelgeuse', 'Red Supergiant', 20, 887, 3500, 8, 642.5, true);
INSERT INTO public.star VALUES (7, 3, 'Rigel', 'Blue Supergiant', 21, 78.9, 12100, 8, 863, true);
INSERT INTO public.star VALUES (8, 4, 'Vega', 'A-Type', 2.135, 2.362, 9602, 0.455, 25.05, true);
INSERT INTO public.star VALUES (9, 5, 'Polaris', 'Yellow Supergiant', 5.4, 37.5, 6015, 0.07, 323, false);
INSERT INTO public.star VALUES (10, 5, 'Antares', 'Red Supergiant', 12, 883, 3400, 12, 550, true);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 10, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_palnet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_palnet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: blackhole blackhole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

