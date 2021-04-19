SELECT DISTINCT school, salary
FROM teachers;

SELECT first_name, last_name, salary
FROM teachers
ORDER BY salary DESC;

SELECT last_name, school, hire_date
FROM teachers
ORDER BY school ASC, hire_date DESC;

SELECT first_name, last_name, school, salary
FROM teachers
WHERE salary BETWEEN 40000 AND 70000;

SELECT last_name
FROM teachers
WHERE last_name ILIKE '%le';

SELECT last_name 
FROM teachers
ORDER BY last_name ASC

SELECT first_name
FROM teachers
WHERE first_name ILIKE 's%' AND salary > 40000

SELECT first_name, hire_date, salary
FROM teachers
WHERE hire_date>'2010-01-01'
ORDER BY salary DESC

CREATE TABLE char_data_types (
 varchar_column varchar(10),
 char_column char(10),
 text_column text
);

INSERT INTO char_data_types
VALUES
 ('abc', 'abc', 'abc'),
 ('defghi', 'defghi', 'defghi');
 
COPY char_data_types TO 'C:\Users\User\Desktop\Code College\PostgreSQL\typetest.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

COPY teachers TO 'C:\Users\User\Desktop\Code College\PostgreSQL\teachers.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');