--Task 7: Stored Procedures

--1.Create a stored procedure to add a new student.
CREATE PROCEDURE AddStudent
    @StudentID INT,
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
    @Age INT,
    @CourseID INT
AS
BEGIN
    INSERT INTO Students(StudentID, FirstName, LastName ,Age, CourseID)
    VALUES (@StudentID, @FirstName,@LastName , @Age, @CourseID);
END;
GO

EXEC AddStudent 11,'Hafsa','Ali',37,5
SELECT *FROM Students


--2.Create a stored procedure to update a student's age.
CREATE PROCEDURE UpdateStudenteAge
    @ID INT,
    @NewAge INT
AS
BEGIN
    UPDATE Students
    SET Age = @NewAge
    WHERE StudentID = @ID;
END;
GO

EXEC UpdateStudenteAge 5,45
SELECT *FROM Students


--3.Create a stored procedure to delete a student.
CREATE PROCEDURE DeleteStudent
	@ID INT
AS
BEGIN
	DELETE FROM Students
	WHERE StudentID=@ID;
END;
GO

EXEC DeleteStudent 2
SELECT *FROM Students



--4.Create a stored procedure to list all students.
CREATE PROCEDURE ListALLStudents
AS
BEGIN
	SELECT *FROM Students
	
END;
GO



-------------------------------------------Task 9: Advanced Reports in Console Application--------------------------------------------------------------------------

--1.List the names of students who are not enrolled in any course.

CREATE PROCEDURE notEnrolled
AS
BEGIN
	SELECT *FROM Students 
	WHERE CourseID is NULL;
END;
GO


--2.Find the most popular course (the course with the most students enrolled).
CREATE PROCEDURE mostPopular
AS
BEGIN
	SELECT TOP 1 Courses.CourseName, COUNT(*) AS Students
	FROM Courses JOIN Students ON Courses.CourseID = Students.CourseID
	GROUP BY Courses.CourseName
	ORDER BY Students DESC;
END;
GO


--3.List the students who are older than the average age of students.
CREATE PROCEDURE olderthanAverage_Age
AS
BEGIN
	SELECT FirstName,LastName FROM Students 
	WHERE Age>(SELECT AVG(Age) FROM Students);
END;
GO


--4.Find the total number of students and average age for each course.
CREATE PROCEDURE studentAndAverageageOfcourse
AS
BEGIN
	SELECT Courses.CourseName, COUNT(*) As Total_noStudents, AVG(Age) As Average_Age
	FROM Courses
	JOIN Students ON Courses.CourseID=Students.CourseID
	GROUP BY Courses.CourseName;
END;
GO


--5.List the courses that have no students enrolled in them.
CREATE PROCEDURE noStudentEnrolled
AS
BEGIN
	SELECT TOP 1 Courses.CourseName
	FROM Courses LEFT JOIN Students ON Courses.CourseID = Students.CourseID
	GROUP BY CourseName ORDER BY CourseName DESC;
END;
GO

--6.List students who share courses with a specific student (choose one from your records).
CREATE PROCEDURE shareCourse
AS
BEGIN
	SELECT * FROM Students
	WHERE courseID=(SELECT CourseID FROM Students WHERE StudentID=5)
END;
GO



--7.For each course, list the youngest and oldest student.
CREATE PROCEDURE youngestOldest_student
AS
BEGIN
	SELECT CourseName, MIN(Age) As youngest, MAX(Age) As Oldest
	FROM Courses
	JOIN Students ON Courses.CourseID=Students.CourseID
	GROUP BY CourseName;
END;
GO