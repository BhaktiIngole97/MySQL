SHOW DATABASES;
CREATE DATABASE Ejet;
DROP DATABASE Ejet;
USE Ejet;
CREATE TABLE Students (
StudentID int,
Engineername varchar(255),
MobileNo VARCHAR(10),
Qualification varchar(255),
Experience varchar(255),
PRIMARY KEY (StudentID)
);
INSERT INTO Students (StudentID,Engineername,MobileNo,Qualification,Experience)
VALUES(1,'bhakti',1234567891,'BE',2),
(2,'rohini',3456789234,'MBA',4),
(6,'nikita',2335672346,'MTECH',1),
(8,'pooja',4567234679,'BSC',3);
SELECT * FROM Students;

# CLAUSE
UPDATE Students set Qualification='MSC' where StudentID=8;
DELETE FROM Students where StudentID=3;

SELECT COUNT(StudentID) FROM Students;

SELECT COUNT(StudentID), EngineerName
FROM Students
GROUP BY EngineerName;

SELECT * FROM Students
ORDER BY EngineerName;

#STORED PROCEDURES
CALL SelectAllStudents;

# IN
CALL SelectStudents(2);

# OUT
CALL SelectMaxExp(@MaxExp);
Select @MaxExp;

#INOUT



DROP TABLE Company;
CREATE TABLE Company(
ID int AUTO_INCREMENT,
CompanyName varchar(255),
EmpName varchar (255),
Salary int,
StudentID int,
PRIMARY KEY (ID),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO Company (ID,CompanyName,EmpName,Salary,StudentID)
VALUES(1,'HCL','Supriya',35000,1),
(2,'Infosys','Priti',25000,2),
(3,'TechMahindra','Sanjana',30000,6),
(4,'Wipro','Ruchika',20000,8);

SELECT * FROM Company;
#CLAUSE
UPDATE Company set EmpName='Pooja' where ID=3;
DELETE FROM Company where ID=3;

#Functions
SELECT MIN(Salary) FROM Company;
SELECT MAX(SALARY) FROM Company;
SELECT COUNT(ID) FROM Company;
SELECT AVG(Salary) FROM Company;

SELECT COUNT(ID), EmpName
FROM Company
GROUP BY EmpName;

SELECT * FROM Company
ORDER BY EmpName;

#JOINS
SELECT EngineerName FROM Students LEFT JOIN Company on Students.StudentID=Company.ID;
Select * FROM Students RIGHT JOIN Company on Students.StudentID=Company.ID;
SELECT * FROM Students Inner JOIN Company on Students.StudentID=Company.ID;

# SUBQUERIES
SELECT CompanyName,EmpName,Salary FROM Company where StudentID =(SELECT StudentID FROM Students where EngineerName="nikita");
SELECT CompanyName,EmpName,Salary FROM Company where StudentID =6;









