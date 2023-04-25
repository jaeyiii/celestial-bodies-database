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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    area_square_degrees integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    distance numeric(10,2) NOT NULL,
    is_visible boolean DEFAULT false NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    distance_from_planet_km integer NOT NULL,
    orbit_around_planet_in_earthdays double precision NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    distance_in_mi numeric(15,2) NOT NULL,
    planet_type character varying(30) NOT NULL,
    is_habitable boolean DEFAULT false NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    distance_in_lightyear double precision NOT NULL,
    luminosity character varying(30) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'Andromeda constellation is located in the northern sky, between Cassiopeia’s W asterism and the Great Square of Pegasus', 722);
INSERT INTO public.constellation VALUES (2, 'Aquarius', 'Aquarius constellation is located in the southern hemisphere. It is one of the 12 zodiac constellations', 980);
INSERT INTO public.constellation VALUES (3, 'Centaurus', 'Centaurus constellation is located in the southern hemisphere. It is one of the Greek constellations, catalogued by the Greek astronomer Ptolemy in the 2nd century, but it was mentioned in earlier Greek texts by the astronomer Eudoxus and the poet Aratus.', 1060);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'Sagitarius', 'Spiral', 0.03, false);
INSERT INTO public.galaxy VALUES (3, 'Black eye Glaxy', 'Coma Berenices', 'Spiral', 17.30, false);
INSERT INTO public.galaxy VALUES (4, 'Antennae Galaxies', 'Corvus', 'galaxy pair galaxy', 45.00, false);
INSERT INTO public.galaxy VALUES (5, 'Aquarius Dwarf', 'Aquarius', 'Irregular dwarf galaxy', 14.00, false);
INSERT INTO public.galaxy VALUES (6, 'Backward Galaxy', 'Centaurus', 'Unbarred spiral', 200.00, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda', 'Barred Spiral', 2.50, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3, 384400, 27.32);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, 23458, 1.25);
INSERT INTO public.moon VALUES (3, 'Phobos', 4, 9378, 0.32);
INSERT INTO public.moon VALUES (4, 'Amalthea', 5, 181000, 0.498);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 1883000, 0);
INSERT INTO public.moon VALUES (6, 'Io', 5, 422000, 1.769);
INSERT INTO public.moon VALUES (7, 'Hyperion', 6, 1481100, 21.3);
INSERT INTO public.moon VALUES (8, 'Iapetus', 6, 3561300, 79.3);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 527040, 4.52);
INSERT INTO public.moon VALUES (10, 'Titan', 6, 1221850, 15.94);
INSERT INTO public.moon VALUES (11, 'Miranda', 7, 129900, 1.413);
INSERT INTO public.moon VALUES (12, 'Ariel', 7, 190900, 2.52);
INSERT INTO public.moon VALUES (13, 'Umbriel', 7, 26600, 4.144);
INSERT INTO public.moon VALUES (14, 'Titania', 7, 436300, 8.706);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 583500, 13.46);
INSERT INTO public.moon VALUES (16, 'Hippocamp', 8, 105284, 0.95);
INSERT INTO public.moon VALUES (17, 'Nereid', 8, 5513818, 360.13);
INSERT INTO public.moon VALUES (18, 'Sao', 8, 22619000, 2919.16);
INSERT INTO public.moon VALUES (19, 'Laomeddeia', 8, 23613000, 3175.62);
INSERT INTO public.moon VALUES (20, 'Charon', 10, 17536, 6.3387);
INSERT INTO public.moon VALUES (21, 'Styx', 10, 42000, 20.2);
INSERT INTO public.moon VALUES (22, 'Nix', 10, 48708, 25.86);
INSERT INTO public.moon VALUES (23, 'Kerberos', 10, 59000, 32.1);
INSERT INTO public.moon VALUES (24, 'Hydra', 10, 64749, 38.2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 38672000.00, 'Terrestrial', false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 66794047.00, 'Terrestrial', false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 154277865.00, 'Terrestrial', false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 460468575.00, 'Terrestrial', false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 911543134.00, 'Gas Giant', false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 1917708015.00, 'Ice Giant', false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 2780296037.00, 'Ice Giant', false);
INSERT INTO public.planet VALUES (9, 'Ceres', 1, 240097135.00, 'Dwarf Planet', false);
INSERT INTO public.planet VALUES (10, 'Pluto', 1, 3230610640.00, 'Dwarf Planet', false);
INSERT INTO public.planet VALUES (11, 'Makemake', 1, 4253000000.00, 'Dwarf Planet', false);
INSERT INTO public.planet VALUES (12, 'Haumea', 1, 4010000000.00, 'Dwarf Planet', false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 93498791.00, 'Terrestrial', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.5906e-05, 'red giant');
INSERT INTO public.star VALUES (2, 'VY Canis Majoris', 1, 3900, 'red hypergiant');
INSERT INTO public.star VALUES (3, 'PZ Cassiopeiae', 1, 7800, 'red supergiant');
INSERT INTO public.star VALUES (4, 'KW Sagittarii', 1, 6200, 'red supergiant');
INSERT INTO public.star VALUES (5, 'BI Cygni', 1, 8500, 'red supergiant');
INSERT INTO public.star VALUES (6, 'Antares', 1, 550, 'red supergiant');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 24, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 43, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: constellation constellation_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star pk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT pk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

