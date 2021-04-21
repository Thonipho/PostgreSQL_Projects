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
   ('elephant', 433);

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
   



