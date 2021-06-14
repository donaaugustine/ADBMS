CREATE TABLE STUDENT_INFO(Sid  INT UNIQUE ,
Stud_name   VARCHAR(20) NOT NULL,
stude_score NUMERIC(5,2) DEFAULT 20);
describe STUDENT_INFO;

ALTER TABLE STUDENT_INFO ADD PRIMARY KEY (Sid);
DESCRIBE STUDENT_INFO;

INSERT INTO STUDENT_INFO VALUES(1,'ANU',140),
(2,'BOB',170),(3,'DEV',160),(4,'RIYA',120);
SELECT *FROM STUDENT_INFO;

UPDATE STUDENT_INFO SET Stude_score = Stude_score + 5 WHERE Stude_score > 150;
SELECT *FROM STUDENT_INFO;

CREATE TABLE worker
(Worker_ID    INT,
first_name   VARCHAR(15),
last_name    VARCHAR(15),
salary       NUMERIC(8),
joining_date DATE,
department   VARCHAR (15));

ALTER TABLE worker ADD PRIMARY KEY (Worker_ID);
describe worker;

CREATE TABLE bonus(Worker_ID INT, 
bonus_date DATE, bonus_amount NUMERIC(6));
describe bonus;
    
ALTER TABLE bonus ADD CONSTRAINT fk_cod_csd 
FOREIGN KEY(Worker_ID) REFERENCES 
worker(Worker_ID) ON DELETE CASCADE ;
describe bonus;

INSERT INTO worker VALUES (1,'Monika','Arora',100000,'2014-02-20','HR'),
(2,'Niharika','Verma',80000,'2014-06-11','Admin'),(3,'Vishal','Singhal',300000,'2014-02-20','HR'),
(4,'Amithabh','Singh',500000,'2014-02-20','Admin'),(5,'Vivek','Bhati',500000,'2014-06-11','Admin'),
(6,'Vipul','Diwan',200000,'2014-06-11','Account'),(7,'Satich','Kumar',75000,'2014-01-20','Account'),
(8,'Geetika','Chauhan',90000,'2014-04-11','Admin');
select * from worker;

INSERT INTO bonus VALUES (1,'2016-02-20',5000),(2,'2016-06-11',3000),
(3,'2016-02-20',4000),(1,'2016-02-20',4500),(2,'2016-06-11',3500);
select *from bonus;

SELECT first_name AS worker_name FROM worker;

SELECT * FROM worker ORDER BY trim(first_name) ASC;

SELECT * FROM worker WHERE first_name != 'Vipul' AND first_name != 'Satish';

select * from worker where department='Admin';

SELECT * FROM worker WHERE salary BETWEEN 100000 AND 500000;

SELECT upper(first_name) FROM worker;

SELECT distinct department FROM worker;

SELECT SUBSTR(first_name,  1, 3) AS small FROM worker;

SELECT rtrim(first_name) FROM worker;

SELECT ltrim(department) FROM worker;

SELECT distinct department, LENGTH(department) FROM worker;

SELECT REPLACE(first_name, 'a', 'A') AS fname FROM worker;

SELECT first_name,last_name,department,salary,bonus_amount  FROM worker,bonus 
WHERE worker.worker_id = bonus.worker_id AND bonus_amount  > 4000 ;

DELETE from worker WHERE worker_id=7;
SELECT * FROM worker;

ALTER TABLE bonus DROP CONSTRAINT fk_cod_csd;
ALTER TABLE bonus ADD CONSTRAINT fk_cod_na FOREIGN KEY(Worker_ID) 
REFERENCES worker(Worker_ID) ON DELETE no action ;

DELETE from worker WHERE Worker_ID=8;
SELECT * FROM worker;