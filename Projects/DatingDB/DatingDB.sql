CREATE TABLE profession(
prof_id serial,
profession varchar,
CONSTRAINT prf_key PRIMARY KEY (prof_id),
CONSTRAINT prof_con_unique UNIQUE(profession)
);

CREATE TABLE zip_code(
zip_code int,
city varchar,
province varchar,
CONSTRAINT zip_key PRIMARY KEY (zip_code),
CONSTRAINT check_zip_code CHECK (zip_code<10000)
);

CREATE TABLE status(
status_id serial,
status varchar,
CONSTRAINT sts_key PRIMARY KEY (status_id)
);

CREATE TABLE interests(
interest_id serial,
interest varchar,
CONSTRAINT int_key PRIMARY KEY (interest_id)
);

CREATE TABLE interests2(
interest2_id serial,
interest2 varchar,
CONSTRAINT int2_key PRIMARY KEY (interest2_id)
);

CREATE TABLE seeking(
seeking_id serial,
seeking varchar,
CONSTRAINT sek_key PRIMARY KEY (seeking_id)
);

CREATE TABLE my_contacts(
contact_id serial,
surname varchar,
first_name varchar,
phone bigint,
email varchar,
gender varchar,
birthday date,
prof_id int REFERENCES profession(prof_id),
zip_code int REFERENCES zip_code(zip_code),
status_id int REFERENCES status(status_id),
CONSTRAINT cnt_key PRIMARY KEY (contact_id)
);

CREATE TABLE contact_seeking(
contact_id int REFERENCES my_contacts(contact_id),
seeking_id int REFERENCES seeking(seeking_id)
);

CREATE TABLE contact_interest(
contact_id int REFERENCES my_contacts(contact_id),
interest_id int REFERENCES interests(interest_id),
interest2_id int REFERENCES interests2(interest2_id)
);

INSERT INTO profession(profession)
VALUES ('Truck Driver'),
('Salesperson'),
('Marketing Manager'),
('Software Developer'),
('Soccer Player'),
('Web Developer'),
('Industrial Engineer'),
('Mechanic');

INSERT INTO zip_code(zip_code,city,province)
VALUES (1234,'Midrand','Gauteng'),
(5678,'Cape Town','Western Cape'),
(9101,'Tsena','Free State'),
(1213,'Durban','Kwazulu Natal'),
(1415,'Maftown','North West'),
(1617,'Venda','Limpopo'),
(1819,'Witbank', 'Mpumalanga'),
(2021,'Bakadi','Northern Cape'),
(2223,'Bisho','Eastern Cape'),
(2425,'Mandela Bay','Eastern Cape'),
(2627,'Bloemfontein','Free State'),
(2829,'Joburg','Gauteng'),
(3031,'Pietermaritzburg','Kwazulu Natal'),
(3233,'Polokwane','Limpopo'),
(3435,'Mbombela','Mpumalanga'),
(3637,'Kimberly','Northen Cape'),
(3839,'StellenBosch','Western Cape'),
(4041,'Mayena','North West');

INSERT INTO status(status)
VALUES ('single'),
('complicated'),
('searching'),
('open relationship'),
('married');

INSERT INTO interests(interest)
VALUES ('sports'),
('partying'),
('travelling'),
('netflix & chill'),
('cooking'),
('Writing'),
('Blogging'),
('Podcasting'),
('Marketing'),
('Learning Languages'),
('Photography'),
('Travelling'),
('Yoga'),
('Dancing'),
('Art');

INSERT INTO interests2(interest2)
VALUES ('Reading'),
('Teaching'),
('Camping'),
('Range Driving'),
('Pet Caring'),
('Horse Riding'),
('Reading'),
('Gaming'),
('Charity Involvment'),
('Gardening'),
('Journaling'),
('Archery'),
('Pragramming'),
('Meditating'),
('Movies');

INSERT INTO seeking(seeking)
VALUES ('female'),
('male'),
('other');

INSERT INTO contact_seeking(contact_id,seeking_id)
VALUES
(1,1),
(2,1),
(3,3),
(4,3),
(5,1),
(6,1),
(7,3),
(8,2),
(9,1),
(10,1),
(11,3),
(12,1),
(13,1),
(14,3),
(15,1),
(16,3),
(17,1),
(18,3),
(19,2),
(20,1);

INSERT INTO contact_interest(contact_id,interest_id,interest2_id)
VALUES(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10),
(11,11,11),
(12,12,12),
(13,13,13),
(14,14,14),
(15,15,15),
(16,2,1),
(17,4,3),
(18,5,6),
(19,7,9),
(20,15,1);

INSERT INTO my_contacts(surname,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id)
VALUES ('Mav','Thoni','277237372839','thoni@gmail.com', 'male', '2001-06-12',1,1234,1),
('Champ','Mak','278233483856','champ@gmail.com', 'male', '2000-12-02',2,5678,2),
('Fentse','Mad','273742374839','fentse@icloud.com', 'female', '1987-11-16',3,9101,3),
('Nomvee','Mus','272393439203','nomvee@hotmail.com', 'female', '1991-02-22',4,1213,4),
('Greg','Kal','274823392304','greg@gmail.com', 'male', '1990-06-12',5,1415,5),
('Fred','Lak','274348394394','fred@gmail.com', 'male', '2000-01-31',1,1617,6),
('Bot','Hali','273842380430','hali@hotmail.com', 'female', '1992-02-11',2,1819,7),
('Dee','Tebogo','272393439203','dee@hotmail.com', 'female', '1995-03-03',3,2021,1),
('Kei','Tum','278348399483','keitu@icloud.com', 'male', '1991-06-06',4,2223,2),
('Nhlizi','Koza','274293320329','nhlizi@gmail.com', 'male', '2000-03-20',5,2425,3),
('Allo','Pab','273842380430','pab@hotmail.com', 'female', '1982-04-21',1,2627,4),
('Tile','Ora','277348438374','ora@hotmail.com', 'female', '1995-11-01',2,2829,5),
('Moer','Lawn','278340348392','lawn@gmail.com', 'male', '1998-02-02',3,3031,6),
('Tshazi','Phiwe','278423483943','tshazi@gmail.com', 'male', '1996-11-08',4,3233,7),
('B','Cardi','279432032023','cardi@hotmail.com', 'female', '1996-07-11',5,3435,1),
('Minaj','Niki','278343040384','niki@hotmail.com', 'female', '1999-02-23',1,3637,2),
('Wow','Bow','278230382932','bow@icloud.com', 'male', '1991-02-12',2,3839,3),
('Sean','Big','274293320329','sean@gmail.com', 'male', '2001-04-20',3,4041,4),
('Williams','Serena','278233948394','serena@hotmail.com', 'female', '1992-03-22',4,1234,5),
('Jordan','Baker','28349349382','baker@hotmail', 'female', '1990-07-23',5,5678,6);

SELECT myc.contact_id,surname,first_name,profession, phone, email,gender,seeking,birthday,zip.zip_code,
       city,province,status,ints.interest,ints2.interest2
FROM my_contacts as myc   
LEFT JOIN profession as prf on myc.prof_id=prf.prof_id
LEFT JOIN zip_code as zip on myc.zip_code=zip.zip_code
LEFT JOIN status as sts on myc.status_id=sts.status_id
LEFT JOIN contact_interest as cin on cin.contact_id =myc.contact_id
LEFT JOIN interests as ints on cin.interest_id =ints.interest_id 
LEFT JOIN interests2 as ints2 on cin.interest2_id =ints2.interest2_id 
LEFT JOIN contact_seeking as cos on cos.contact_id =myc.contact_id
LEFT JOIN seeking as sek on cos.seeking_id =sek.seeking_id 


