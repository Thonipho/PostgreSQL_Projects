CREATE TABLE employees (
	emp_id bigserial,
	first_name varchar,
	surname varchar,
	gender varchar,
	address varchar,
	email varchar,
	depart_id int REFERENCES department(depart_id),
	role_id int REFERENCES roles(role_id) ,
	salary_id int REFERENCES salaries(salary_id),
	overtime_id int REFERENCES overtime(overtime_id),	
	CONSTRAINT emp_key PRIMARY KEY (emp_id)
);

CREATE TABLE department(
	depart_id bigserial,
	depart_name varchar,
	depart_city varchar,
	CONSTRAINT dept_key PRIMARY KEY (depart_id)
);

CREATE TABLE roles(
	role_id bigserial,
	emprole varchar,
	CONSTRAINT rl_key PRIMARY KEY (role_id)
);

CREATE TABLE salaries(
	salary_id bigserial,
	salary numeric,
	CONSTRAINT sal_key PRIMARY KEY (salary_id)
);

CREATE TABLE overtime(
	overtime_id bigserial,
	overtime_hours time,
	bonus numeric,
	CONSTRAINT ov_key PRIMARY KEY (overtime_id)
);

INSERT INTO department (depart_name, depart_city)
VALUES ('IT','Midrand'),
('Accounting', 'Cape Town'),
('Admin', 'Durban'),
('Cafeteria', 'Kimberly');

INSERT INTO roles(emprole)
VALUES ('Manager'),
('Assistant'),
('Supervisor'),
('Intern'); 

INSERT INTO salaries(salary)
VALUES (60000),
(20000),
(40000),
(10000);

INSERT INTO overtime(overtime_hours,bonus)
VALUES ('01:00',5000),('02:00',7000),('03:00',10000);

SELECT * FROM employees

INSERT INTO employees(first_name,surname,gender,address,email,depart_id,role_id,salary_id,overtime_id)
VALUES ('Thoni', 'Mav', 'Male', 'Midrand,Gauteng', 'thoni@gmail.com', 1, 1, 1, 2 ),
('Piwe', 'Tshazi', 'Male', 'Dime, Kimberly', 'tshazi@hotmail.com', 4, 1, 3, 1 ),
('Keitu', 'Metsi', 'Male', 'Wasa, Western Cape', 'keitu@hotmail.com', 2, 4, 4, 1 ),
('Nomvee', 'Kicha', 'Female', 'Bama, Durban', 'nomvee@hotmail.com', 3, 1, 1, 1 ),
('Ora', 'Tilwe', 'Male', 'Zika, Kimberly', 'ora@hotmail.com', 4, 3, 2, 1 ),
('Greg', 'Floyd', 'Male', 'Victoria, Western Cape', 'gred@hotmail.com', 2, 1, 1, 1 ),
('Lesedi', 'Libe', 'Female', 'Phuma, Durban', 'libe@hotmail.com', 3, 2, 2, 1 ),
('Champ', 'Jonga', 'Male', 'Oliven, Gauteng', 'champ@gmail.com', 1, 3, 3, 3 ),
('Pretty', 'Ontha', 'Female', 'Malibu, Kimberly', 'ontha@hotmail.com', 4, 2, 1, 2 ),
('Fred', 'Kal', 'Male', 'Midland, Western Cape', 'fred@hotmail.com', 2, 2, 2, 1 ),
('Del', 'Piero', 'Male', 'Joburg, Gauteng', 'del@hotmail.com', 1, 4, 4, 2 ),
('Mnqobi', 'Buze', 'Male', 'Pineville, Durban', 'buze@hotmail.com', 3, 3, 3, 1 ),
('Parresen', 'Milner', 'Male', 'Lansa, Western Cape', 'milner@gmail.com', 2, 3, 3, 2 ),
('Ofentse', 'Mad', 'Female', 'Sandton, Gauteng', 'ofentse@icloud.com', 1, 2, 2, 3 ),
('Jabu', 'Mahlangu', 'Male', 'Kiyela, Durban', 'jabu@hotmail.com', 3, 4, 4, 2);

select emp_id,first_name,surname,gender,address,email,
depart_name,depart_city,emprole,salary,overtime_hours,bonus
from employees as em left join department as dm on em.depart_id = dm.depart_id
left join roles as rl on em.role_id = rl.role_id
left join salaries as sl on em.salary_id = sl.salary_id
left join overtime as ot on em.overtime_id = ot.overtime_id

