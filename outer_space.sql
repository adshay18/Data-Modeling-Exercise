-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space


CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  mass FLOAT
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  size_light_years INTEGER
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  diameter_km FLOAT,
  mass FLOAT,
  primary_material TEXT
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_star_id INTEGER NOT NULL REFERENCES stars ON DELETE SET NULL,
  galaxy_id INTEGER NOT NULL REFERENCES galaxies ON DELETE SET NULL,
  has_moons BOOLEAN DEFAULT true
);

CREATE TABLE planets_moons
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER NOT NULL REFERENCES planets ON DELETE CASCADE,
  moon_id INTEGER NOT NULL REFERENCES moons ON DELETE CASCADE
);


INSERT INTO stars
(name)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');

INSERT INTO moons
(name)
VALUES
('The Moon'),
('Phobos'), ('Deimos'),
('Naiad'),
('Thalassa'), ('Despina'), ('Galatea'), ('Larissa'), ('S/2004 N 1'), ('Proteus'), ('Triton'), ('Nereid'), ('Halimede'), ('Sao'), ('Laomedeia'), ('Psamathe'), ('Neso');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_star_id, galaxy_id, has_moons)
VALUES
  ('Earth', 1.00, 1, 1, true),
  ('Mars', 1.88, 1, 1, true),
  ('Venus', 0.62, 1, 1, false),
  ('Neptune', 164.8, 1, 1, true),
  ('Proxima Centauri b', 0.03, 2, 1, false),
  ('Gliese 876 b', 0.23, 3, 1, false);

INSERT INTO planets_moons
(planet_id, moon_id)
VALUES
(1, 1),
(2, 2),
(2, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17);
