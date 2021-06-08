CREATE TABLE STUDENT(
sid INT,
name VARCHAR(50),
dob DATE,
physics INT,
chemistry INT,
maths INT);
DESCRIBE STUDENT;

INSERT INTO STUDENT VALUES(1,'Anu','1998-12-20',88,61,70),(2,'Sara','2000-05-13',68,74,38),
(3,'Jack','1998-03-11',71,79,90),(4,'Della','1999-10-23',50,75,92),(5,'Aby','1999-09-09',90,60,70);
SELECT * FROM STUDENT;

SELECT sid,name FROM STUDENT WHERE dob=(SELECT MAX(dob)FROM STUDENT);

select * from STUDENT where maths >=40 and (physics >=40 or chemistry >=40);

alter table STUDENT add total int;
alter table STUDENT add average float(10,3);
describe STUDENT;

select name from STUDENT where maths=(select max(maths) from STUDENT);

select name from STUDENT where chemistry=(select min(chemistry) from STUDENT);

update STUDENT set total=physics+chemistry+maths;
select * from STUDENT;

UPDATE STUDENT SET average=total/3;

SELECT * FROM STUDENT ORDER BY total DESC;

ALTER TABLE STUDENT RENAME COLUMN average TO avg_mark;
SELECT * FROM STUDENT;

SELECT AVG(avg_mark) AS overall_average FROM STUDENT;

SELECT * FROM STUDENT WHERE avg_mark > (SELECT AVG(avg_mark) AS overall_average FROM STUDENT);

SELECT COUNT(*)FROM STUDENT WHERE avg_mark > (SELECT AVG(avg_mark) AS overall_average FROM STUDENT);