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


INSERT INTO stars (star, temp_in_kelvin) VALUES
    ('The Sun', 5800),
    ('Proxima Centauri', 3042),
    ('Gliese 876', 3192);


INSERT INTO planets (planet, orbital_period_in_yrs, star_id) VALUES
    ('Earth', 1.00, 'The Sun'),
    ('Mars', 1.882, 'The Sun'),
    ('Venus', 0.62, 'The Sun'),
    ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
    ('Gliese 876 b', 0.236, 'Gliese 876');


INSERT INTO moons (moon, planet_id) VALUES
    ('The Moon', 'Earth'),
    ('Phobos', 'Mars'),
    ('Deimos', 'Mars');


SELECT planet, star_id AS star, COUNT(moon) AS moon_count
    FROM planets
        LEFT OUTER JOIN moons
            ON moons.planet_id = planets.planet
    GROUP BY planet
    ORDER BY planet;

