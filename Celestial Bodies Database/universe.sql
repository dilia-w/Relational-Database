psql --username=freecodecamp --dbname=postgres

CREATE DATABASE universe;

\c universe

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    galaxy_type VARCHAR(50),
    distance_from_earth INT NOT NULL,
    has_life BOOLEAN NOT NULL
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,
    star_type VARCHAR(50),
    age_in_millions_of_years INT NOT NULL,
    is_spherical BOOLEAN NOT NULL
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id) NOT NULL,
    planet_type VARCHAR(50),
    mass NUMERIC NOT NULL,
    has_life BOOLEAN NOT NULL
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id) NOT NULL,
    radius INT NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    description TEXT
);

CREATE TABLE space_mission (
    space_mission_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    moon_id INT REFERENCES moon(moon_id),
    launch_date DATE NOT NULL,
    mission_success BOOLEAN NOT NULL
);

INSERT INTO galaxy (name, description, galaxy_type, distance_from_earth, has_life)
VALUES 
('Milky Way', 'Our home galaxy', 'Spiral', 0, TRUE),
('Andromeda', 'Nearest large galaxy', 'Spiral', 2537000, FALSE),
('Sombrero', 'Unusual elliptical galaxy', 'Elliptical', 29000000, FALSE),
('Whirlpool', 'A grand-design spiral galaxy', 'Spiral', 23000000, FALSE),
('Triangulum', 'A member of the Local Group', 'Spiral', 3000000, FALSE),
('Messier 87', 'A giant elliptical galaxy', 'Elliptical', 53000000, FALSE);

INSERT INTO star (name, galaxy_id, star_type, age_in_millions_of_years, is_spherical)
VALUES 
('Sun', 1, 'G-type', 4600, TRUE),
('Proxima Centauri', 2, 'M-type', 4500, TRUE),
('Sirius', 2, 'A-type', 300, TRUE),
('Vega', 3, 'A-type', 450, TRUE),
('Betelgeuse', 4, 'M-type', 8000, FALSE),
('Rigel', 5, 'B-type', 8000, TRUE);

INSERT INTO planet (name, star_id, planet_type, mass, has_life)
VALUES 
('Earth', 1, 'Terrestrial', 5.97, TRUE),
('Mars', 1, 'Terrestrial', 0.642, FALSE),
('Jupiter', 1, 'Gas Giant', 1898, FALSE),
('Proxima b', 2, 'Terrestrial', 1.27, FALSE),
('Proxima c', 2, 'Super-Earth', 8.47, FALSE),
('Sirius b', 3, 'White Dwarf', 1.02, FALSE),
('Vega I', 4, 'Gas Giant', 318, FALSE),
('Vega II', 4, 'Terrestrial', 4.87, FALSE),
('Betelgeuse I', 5, 'Gas Giant', 5000, FALSE),
('Rigel I', 6, 'Gas Giant', 4000, FALSE),
('Rigel II', 6, 'Terrestrial', 6.42, FALSE),
('Rigel III', 6, 'Super-Earth', 9.67, FALSE);

INSERT INTO moon (name, planet_id, radius, is_spherical, description)
VALUES 
('Moon', 1, 1737, TRUE, 'Earth''s natural satellite'),
('Phobos', 2, 11, FALSE, 'One of Mars'' moons'),
('Deimos', 2, 6, FALSE, 'Another of Mars'' moons'),
('Europa', 3, 1560, TRUE, 'Jupiter''s icy moon'),
('Ganymede', 3, 2634, TRUE, 'Largest moon in the solar system'),
('Io', 3, 1821, TRUE, 'Volcanically active moon of Jupiter'),
('Callisto', 3, 2410, TRUE, 'Jupiter''s heavily cratered moon'),
('Proxima b-I', 4, 900, FALSE, 'Moon of Proxima b'),
('Sirius b-I', 6, 2000, TRUE, 'Large moon of Sirius b'),
('Vega I-A', 7, 1500, TRUE, 'Moon of Vega I'),
('Vega II-A', 8, 1200, TRUE, 'Moon of Vega II'),
('Betelgeuse I-A', 9, 2800, TRUE, 'Massive moon orbiting Betelgeuse I'),
('Rigel I-A', 10, 3500, TRUE, 'Moon orbiting Rigel I'),
('Rigel II-A', 11, 800, TRUE, 'Moon orbiting Rigel II'),
('Rigel III-A', 12, 1000, TRUE, 'Moon orbiting Rigel III'),
('Ganymede II', 3, 2634, TRUE, 'Another large moon of Jupiter'),
('Io II', 3, 1821, TRUE, 'Another volcanically active moon of Jupiter'),
('Callisto II', 3, 2410, TRUE, 'Another heavily cratered moon of Jupiter'),
('Europa II', 3, 1560, TRUE, 'Another icy moon of Jupiter'),
('Deimos II', 2, 6, FALSE, 'Another small moon of Mars');

INSERT INTO space_mission (name, planet_id, moon_id, launch_date, mission_success)
VALUES 
('Apollo 11', 1, 1, '1969-07-16', TRUE),
('Mars Odyssey', 2, NULL, '2001-04-07', TRUE),
('Galileo', 3, 5, '1989-10-18', TRUE),
('Voyager 1', 1, NULL, '1977-09-05', TRUE),
('Cassini-Huygens', 3, 6, '1997-10-15', TRUE);


