CREATE TABLE EMPLOYEE
(SSN INT,
ENAME VARCHAR(40) NOT NULL,
DESIG VARCHAR(20),
DNO INT,
DOJ DATE,
SALARY INT CHECK(SALARY BETWEEN 30000 AND 75000),
PRIMARY KEY (SSN));
DESCRIBE EMPLOYEE;

CREATE TABLE DEPARTMENT
(DNUMBER INT PRIMARY KEY,
DNAME VARCHAR(20) NOT NULL,
LOC VARCHAR(40),
MGRSSN INT,
FOREIGN KEY (MGRSSN) REFERENCES EMPLOYEE(SSN));
DESCRIBE DEPARTMENT;

CREATE TABLE PROJECT
(PNUMBER INT PRIMARY KEY,
PNAME VARCHAR(15) NOT NULL,
DNUM INT,
FOREIGN KEY (DNUM) REFERENCES DEPARTMENT(DNUMBER));
DESCRIBE PROJECT;

CREATE TABLE WORKS_IN
(ESSN INT,
PNO INT,
HOURS INT,
FOREIGN KEY (ESSN) REFERENCES EMPLOYEE(SSN),
FOREIGN KEY (PNO) REFERENCES PROJECT(PNUMBER),
FOREIGN KEY (HOURS) REFERENCES DEPARTMENT(DNUMBER));
DESCRIBE WORKS_IN;

INSERT INTO DEPARTMENT(DNUMBER,DNAME,LOC) VALUES(1,'Admin','Chennai'),
(2,'HR','Banglore'),(3,'Sales','Kochi'),
(4,'Finance','Delhi'),(5,'Production','Thiruvananthapuram');
SELECT * FROM DEPARTMENT;

INSERT INTO EMPLOYEE VALUES(1,'Abhi','HR',2,'09-04-12',70000),
(2,'Bhama','Admin',1,'08-03-10',75000),(3,'Chriz','Sales',3,'11-06-23',35000),
(4,'Diya','Production',5,'15-08-21',32000),(5,'Govind','Production',5,'11-10-12',35000),
(6,'Hima','Finance',4,'13-01-19',51000),(7,'Ira','HR',2,'10-03-15',45000),
(8,'Sandeep','Finance',4,'10-07-26',49000);
SELECT * FROM EMPLOYEE;

UPDATE DEPARTMENT SET MGRSSN = 2 WHERE DNUMBER = 1;
UPDATE DEPARTMENT SET MGRSSN = 7 WHERE DNUMBER = 2; 
UPDATE DEPARTMENT SET MGRSSN = 3 WHERE DNUMBER = 3; 
UPDATE DEPARTMENT SET MGRSSN = 6 WHERE DNUMBER = 4; 
UPDATE DEPARTMENT SET MGRSSN = 5 WHERE DNUMBER = 5; 
SELECT * FROM DEPARTMENT; 

INSERT INTO PROJECT VALUES(11,'Bancs Trsry',3),
(12,'Nielesan',5),(13,'World Bnk',1),
(14,'Airlines',2),(15,'Amex',4);
SELECT * FROM PROJECT;

INSERT INTO WORKS_IN VALUES(1,14,1),(4,13,3),
(8,12,2),(6,15,2),(2,11,4),(3,13,3);
SELECT * FROM WORKS_IN;

SELECT E.ENAME FROM EMPLOYEE E LEFT OUTER JOIN DEPARTMENT D ON D.DNUMBER=E.DNO 
WHERE E.SALARY BETWEEN 30000 AND 40000 AND D.DNUMBER=5;

SELECT e.ENAME,d.DNAME FROM EMPLOYEE e LEFT OUTER JOIN DEPARTMENT d on e.DNO=d.DNUMBER
ORDER BY d.DNAME ASC,e.ENAME ASC;

SELECT p.pnumber,p.pname,count(e.ssn) FROM WORKS_IN w LEFT OUTER JOIN PROJECT p on w.pno=p.pnumber 
LEFT OUTER JOIN EMPLOYEE e on w.essn=e.ssn GROUP BY p.pname,p.pnumber;

SELECT p.pnumber,p.pname,count(e.ssn) FROM WORKS_IN w LEFT OUTER JOIN PROJECT p on w.pno=p.pnumber LEFT OUTER JOIN 
EMPLOYEE e on w.essn=e.ssn GROUP BY p.pname,p.pnumber HAVING count(e.ssn) > 2;

SELECT p.pnumber,p.pname,d.dnumber,count(e.ssn) FROM PROJECT p LEFT OUTER JOIN 
DEPARTMENT d on d.dnumber=p.dnum LEFT OUTER JOIN EMPLOYEE e on e.dno=p.dnum  GROUP BY
p.pname,p.pnumber,d.dnumber HAVING d.dnumber=5;

 SELECT d.dname,d.dnumber,e.ssn,e.ename,e.desig,e.doj,e.salary FROM DEPARTMENT d,EMPLOYEE e 
 WHERE  (SELECT COUNT(*) FROM EMPLOYEE e WHERE e.dno = d.dnumber AND e.salary> 40000) > 4 AND 
e.dno=d.dnumber GROUP BY d.dname,d.dnumber,e.ssn,e.ename,e.desig,e.doj,e.salary;

create VIEW emp_dept_view as select  * from EMPLOYEE NATURAL JOIN DEPARTMENT;

CREATE ANY SYNONYM emp_dept for employe_dept_view;

select * from emp_dept;

Select * From EMPLOYEE e,DEPARTMENT d WHERE e.dno=d.dnumber;
SELECT * FROM EMPLOYEE e,DEPARTMENT d WHERE NOT(e.dno=d.dnumber);
SELECT * FROM EMPLOYEE e LEFT OUTER JOIN DEPARTMENT d ON e.dno=d.dnumber; 
SELECT * FROM EMPLOYEE e RIGHT OUTER JOIN DEPARTMENT d ON e.dno=d.dnumber; 
SELECT * FROM EMPLOYEE e INNER JOIN DEPARTMENT d ON e.dno=d.dnumber;



