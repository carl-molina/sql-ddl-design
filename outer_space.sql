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


SELECT planet, star_id AS star, COUNT(moon) AS moon_count
    FROM planets
        LEFT OUTER JOIN moons
            ON moons.planet_id = planets.planet
    GROUP BY planet
    ORDER BY planet;

