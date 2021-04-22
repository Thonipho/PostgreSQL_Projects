--tryityourself page 45

1. CREATE TABLE animal_kind (
   kind varchar,
   weight numeric);

   CREATE TABLE animal_species(
   habitat varchar,
   food varchar)

2. INSERT INTO animal_kind (kind, weight)
   VALUES ('dog', 111),
   ('lion', 232),
   ('elephant', 432);

   INSERT INTO animal_species(habitat, food)
   VALUES ('domestic', 'omnivore'),
   ('safari', 'carnivore'),
   ('safari', 'herbivore');

SELECT * FROM animal_kind

SELECT * FROM animal_species

--tryityourself page 57

1. SELECT last_name, school
   FROM teachers
   ORDER BY last_name;

2. SELECT first_name, last_name
   FROM teachers
   WHERE first_name LIKE 's%' AND salary>40000;

3. SELECT first_name, last_name
   FROM teachers
   WHERE hire_date>'2010-01-01'
   ORDER BY salary DESC;

--tryityourself page 72

--1. I would use numeric or decimal because miles have decimal points 
--2. Varchar would be the correct data type to use. Seperating first name and last name makes the data more accurate and it saves storage.
--3. You will get an error

--tryityourself page 89

1. CREATE TABLE movies (id integer,
   movie varchar, actor varchar);
   
   COPY movies 
   FROM 'C:\Users\User\Desktop\Code College\PostgreSQL/Analysis/movies.csv'
   WITH (FORMAT CSV, HEADER)

2.COPY (
  SELECT geo_name, housing_unit_count_100_percent, geo_name
  FROM us_counties_2010
  LIMIT 20
  )
  TO 'C:\Users\User\Desktop\Code College\PostgreSQL/Analysis\housing_units.txt'
  WITH (FORMAT CSV, HEADER, DELIMITER '|');
  
3. It will operate

--tryityourself page 106
1. SELECT PI()*5^2 AS "Circle area"

2. SELECT geo_name,(CAST (p0010004 AS numeric(8,1)) / p0010001) * 100 AS "American
   Indian/Alaska Native Alone"
	FROM us_counties_2010
	ORDER BY "American
   Indian/Alaska Native Alone" DESC;
	
3. --yes

EXPLAIN ANALYZE SELECT * FROM animal_kind
WHERE kind = 'lion';

--tryityourself page 126
1. SELECT c2010.geo_name,
       c2000.geo_name,
       c2000.state_us_abbreviation
FROM us_counties_2010 c2010 RIGHT JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips
WHERE c2010.geo_name IS NULL;

2. 
SELECT median(round( (CAST(c2010.p0010001 AS numeric(8,1)) - c2000.p0010001)
           / c2000.p0010001 * 100, 1 )) AS median_pct_change
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips;
   
3.
SELECT c2010.geo_name,
       c2010.state_us_abbreviation,
       c2010.p0010001 AS pop_2010,
       c2000.p0010001 AS pop_2000,
       c2010.p0010001 - c2000.p0010001 AS raw_change,
       round( (CAST(c2010.p0010001 AS DECIMAL(8,1)) - c2000.p0010001)
           / c2000.p0010001 * 100, 1 ) AS pct_change
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips
ORDER BY pct_change ASC;

--tryityourself page 147
1. CREATE TABLE albums (
album_id bigserial,
album_catalog_code varchar(100),
album_title text,
album_artist text,
album_release_date date,
album_genre varchar(40),
album_description text
CONSTRAINTS elb_key PRIMARY KEY(album_id)
);

CREATE TABLE songs (
song_id bigserial,
song_title text,
song_artist text,
CONSTRAINTS sng_key PRIMARY KEY(song_id)
album_id bigint REFERENCES albums(album_id)
);
 
2. --Album description because every album will have its own unique description

3.--album_id and song_id

--tryityourself page 153

ALTER TABLE meat_poultry_egg_inspect ADD COLUMN meat_processing boolean;
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN poultry_processing boolean;

SELECT * FROM meat_poultry_egg_inspect; -- view table with new empty columns

UPDATE meat_poultry_egg_inspect
SET meat_processing = TRUE
WHERE activities ILIKE '%meat processing%'; -- case-insensitive match with wildcards

UPDATE meat_poultry_egg_inspect
SET poultry_processing = TRUE
WHERE activities ILIKE '%poultry processing%'; -- case-insensitive match with wildcards

SELECT count(meat_processing), count(poultry_processing)
FROM meat_poultry_egg_inspect;

SELECT count(*)
FROM meat_poultry_egg_inspect
WHERE meat_processing = TRUE AND
      poultry_processing = TRUE;

--tryityourself page 163
1. SELECT pls14.stabr,
       sum(pls14.gpterms) AS internet_computers_2014,
       sum(pls09.gpterms) AS internet_computers_2009,
       round( (CAST(sum(pls14.gpterms) AS decimal(10,1)) - sum(pls09.gpterms)) /
                    sum(pls09.gpterms) * 100, 2 ) AS pct_change_computers,
       sum(pls14.pitusr) AS internet_users_2014,
       sum(pls09.pitusr) AS internet_users_2009,
       round( (CAST(sum(pls14.pitusr) AS decimal(10,1)) - sum(pls09.pitusr)) /
                    sum(pls09.pitusr) * 100, 2 ) AS pct_change_users
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.gpterms >= 0 AND pls09.gpterms >= 0
GROUP BY pls14.stabr
ORDER BY pct_change_computers DESC;

2.CREATE TABLE obereg_codes (
    obereg varchar(2) CONSTRAINT obereg_key PRIMARY KEY,
    region varchar(50)
);

INSERT INTO obereg_codes
VALUES ('01', 'New England (CT ME MA NH RI VT)'),
       ('02', 'Mid East (DE DC MD NJ NY PA)'),
       ('03', 'Great Lakes (IL IN MI OH WI)'),
       ('04', 'Plains (IA KS MN MO NE ND SD)'),
       ('05', 'Southeast (AL AR FL GA KY LA MS NC SC TN VA WV)'),
       ('06', 'Soutwest (AZ NM OK TX)'),
       ('07', 'Rocky Mountains (CO ID MT UT WY)'),
       ('08', 'Far West (AK CA HI NV OR WA)'),
       ('09', 'Outlying Areas (AS GU MP PR VI)');

SELECT obereg_codes.region,
       sum(pls14.visits) AS visits_2014,
       sum(pls09.visits) AS visits_2009,
       round( (CAST(sum(pls14.visits) AS decimal(10,1)) - sum(pls09.visits)) /
                    sum(pls09.visits) * 100, 2 ) AS pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
   ON pls14.fscskey = pls09.fscskey
JOIN obereg_codes
   ON pls14.obereg = obereg_codes.obereg
WHERE pls14.visits >= 0 AND pls09.visits >= 0
GROUP BY obereg_codes.region
ORDER BY pct_change DESC;

3. -- outer join