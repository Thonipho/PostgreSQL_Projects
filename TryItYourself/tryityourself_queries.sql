--tryityourself page 45

CREATE TABLE animal_kind (
kind varchar,
weight numeric);

CREATE TABLE animal_species(
habitat varchar,
food varchar)

INSERT INTO animal_kind (kind, weight)
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

SELECT first_name
FROM teachers
u WHERE first_name LIKE 'sam%';

SELECT first_name
FROM teachers
u WHERE first_name LIKE 'sam%';

SELECT first_name
FROM teachers
u WHERE first_name LIKE 'sam%';



