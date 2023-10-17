--Task-1: Create a Database

--CREATE DATABASE 5052_DB;
--USE 5052_DB;
--G0



--Task-2: Create Tables

--1)
CREATE TABLE Students(
	StudentID int not NULL Primary key,
	FirstName varchar(20) not NULL,
	LastName varchar(20) not Null,
	Age int,
	CourseID int
);

--2)
CREATE TABLE Courses(
	CourseID int primary key,
	CourseName varchar(30)
);

ALTER TABLE Students
ADD CONSTRAINT FK_StudentID
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID);




--Task-3: Insert Data

--1)
INSERT INTO Courses(CourseID,CourseName)
VALUES 
(1,'English'),
(2,'Political Science'),
(3,'Urdu'),
(4,'Mathematics'),
(5,'Punjabi');

SELECT *FROM Courses;

--2)
INSERT INTO Students(StudentID,FirstName,LastName,Age,CourseID)
VALUES
(1,'Aftab','Kareem',24,2),
(2,'Sajid','Rehman',16,1),
(3,'Asif','Ali',8,NULL),
(4,'Ali','Usman',25,4),
(5,'Maham','Zubair',31,4),
(6,'Fatima','Asad',16,5),
(7,'Ahmad','Ijaz',38,4),
(8,'Muhammad','Ali',18,4),
(9,'Zafar','Iqbal',7,1),
(10,'Ayesha','Afzal',14,NULL);

SELECT *FROM Students;




--Task-4: Update and Delete Records

--1)
UPDATE Students
SET Age=45
WHERE StudentID=6
SELECT *FROM Students;

--2)
DELETE FROM Students
WHERE StudentID=4
SELECT *FROM Students;



--Task-5: Queries and Filters

--1)
SELECT *FROM Students
WHERE Age>20

--2)
SELECT FirstName,LastName FROM Students 
WHERE CourseID IN (select CourseID from Courses WHERE CourseName='Mathematics');




--Task-6: Aggregation Functions

--1)
SELECT COUNT(StudentID) from Students;

--2)
SELECT AVG(Age) from Students;




--Task-7: Selection queries

--1)
SELECT FirstName,LastName FROM Students 
WHERE CourseID is NULL;

--2)
SELECT TOP 1 Courses.CourseName, COUNT(*) AS Students
FROM Courses JOIN Students ON Courses.CourseID = Students.CourseID
GROUP BY Courses.CourseName
ORDER BY Students DESC;

--3)
SELECT FirstName,LastName FROM Students 
WHERE Age>(SELECT AVG(Age) FROM Students);

--4)
SELECT Courses.CourseName, COUNT(*) As Total_noStudents, AVG(Age) As Average_Age
FROM Courses
LEFT JOIN Students ON Courses.CourseID=Students.CourseID
GROUP BY Courses.CourseName;

--5)
SELECT TOP 1 Courses.CourseName
FROM Courses LEFT JOIN Students ON Courses.CourseID = Students.CourseID
GROUP BY CourseName ORDER BY CourseName DESC;

--6)
SELECT * FROM Students
WHERE courseID=(SELECT CourseID FROM Students WHERE StudentID=5)

--7)
SELECT CourseName, MIN(Age) As youngest, MAX(Age) As Oldest
FROM Courses
JOIN Students ON Courses.CourseID=Students.CourseID
GROUP BY CourseName;



	