-- ---------------------------------------------- Database Queries -----------------------------------------------
-- create a database
CREATE DATABASE E_Learning_Platform;

-- to work on it, you need to use it first
USE E_Learning_Platform;

-- delete database
-- DROP DATABASE E_Learning_Platform;

-- ---------------------------------------- Database Analysis ----------------------------------------
/*
T1 : Students(StudentID, FirstName, LastName, Email, Phone, DateOfBirth, Address, EnrollmentDate, Status, ClassID)

T2 : Teachers(TeacherID, FirstName, LastName, Email, Phone, Specialization, HireDate, Salary, Experience, Status)

T3 : Courses(CourseID, CourseName, Description, Credits, Category, DurationWeeks, TeacherID, Level, Language, Status)

T4 : Enrollments(EnrollmentID, StudentID, CourseID, EnrollmentDate, Progress, CompletionDate, Grade, Feedback, Status, PaymentStatus)

T5 : Classes(ClassID, ClassName, Schedule, RoomNumber, Capacity, CourseID, TeacherID, Semester, StartDate, EndDate)

T6 : Assignments(AssignmentID, Title, Description, DueDate, CourseID, ClassID, MaxMarks, AssignedDate, Status, AttachmentLink)

T7 : Submissions(SubmissionID, AssignmentID, StudentID, SubmissionDate, MarksObtained, Feedback, Status, FileLink, PlagiarismScore, LateSubmission)

T8 : Exams(ExamID, ExamName, Date, DurationMinutes, TotalMarks, CourseID, ClassID, Type, Status, ResultPublished)

T9 : Payments(PaymentID, StudentID, Amount, PaymentDate, PaymentMethod, Status, TransactionID, PaymentFor, ReceiptLink, Comments)

T10: DiscussionForum(PostID, StudentID, CourseID, Title, Content, PostDate, ReplyCount, LastReplyDate, Status, AttachmentLink)

*/

-- --------------------------------------- Table Related Queries ---------------------------------

-- Table 1: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    DateOfBirth DATE,
    Address VARCHAR(255),
    EnrollmentDate DATE,
    Status VARCHAR(20),
    ClassID INT
);

-- Insert 10 records into Students table
INSERT INTO Students (StudentID, FirstName, LastName, Email, Phone, DateOfBirth, Address, EnrollmentDate, Status, ClassID) VALUES
(1, 'Aarav', 'Sharma', 'aarav.sharma@example.com', '9876543210', '2005-05-10', 'Delhi, India', '2023-06-01', 'Active', 101),
(2, 'Saanvi', 'Verma', 'saanvi.verma@example.com', '9876543211', '2004-11-23', 'Mumbai, India', '2023-06-02', 'Active', 101),
(3, 'Vivaan', 'Patel', 'vivaan.patel@example.com', '9876543212', '2006-01-15', 'Ahmedabad, India', '2023-06-03', 'Active', 102),
(4, 'Ananya', 'Singh', 'ananya.singh@example.com', '9876543213', '2005-08-30', 'Lucknow, India', '2023-06-04', 'Active', 102),
(5, 'Arjun', 'Rao', 'arjun.rao@example.com', '9876543214', '2005-03-18', 'Hyderabad, India', '2023-06-05', 'Active', 103),
(6, 'Ishaan', 'Nair', 'ishaan.nair@example.com', '9876543215', '2006-12-11', 'Kochi, India', '2023-06-06', 'Active', 103),
(7, 'Diya', 'Mishra', 'diya.mishra@example.com', '9876543216', '2004-07-09', 'Pune, India', '2023-06-07', 'Active', 104),
(8, 'Kabir', 'Joshi', 'kabir.joshi@example.com', '9876543217', '2005-02-20', 'Bengaluru, India', '2023-06-08', 'Active', 104),
(9, 'Myra', 'Kaur', 'myra.kaur@example.com', '9876543218', '2006-04-14', 'Chandigarh, India', '2023-06-09', 'Active', 105),
(10, 'Ayaan', 'Yadav', 'ayaan.yadav@example.com', '9876543219', '2005-09-25', 'Jaipur, India', '2023-06-10', 'Active', 105);

-- to display/retrieve table data
SELECT * FROM Student;

-- to delete records from columns
truncate table students;

-- to delete whole table with its records
drop table students;

SET SQL_SAFE_UPDATES=0;

-- select queries 

-- 1. select specifc columns 
select FirstName , LastName from students;

-- 2. select particular address 
select * from students where address = 'Hyderabad, India';

-- 3. select particular EnrollmentDate
select * from students where  EnrollmentDate = '2023-06-04';

-- 4. select students between one particular date
select * from students where EnrollmentDate between '2023-06-01' to '2023-06-07';

-- 5. select students with names in particular order 
select * from students order by LastName DESC;

-- alter queries
select * from students;

-- 6. Add a new column
Alter Table Students
Add column roll_no int;
 
-- 7. Modify (Change) an existing column 
Alter Table students 
Modify Column email varchar (100) unique;

-- 8. Drop a column
Alter Table students 
Drop column roll_no;

-- 9. Rename a Column
Alter Table students
Change Column EnrollmentDate joiningdate varchar (100);

-- 3. Delete Queries 
select * from students;

-- 10. Delete a specific record
Delete From students
where firstname = 'Ishaan';

-- 11. Delete records on a condition
Delete From students
where Dateofbirth = '2004-07-09';

-- 12. Delete students born before a certain date 
Delete from students
where dateofbirth = '1999-01-01';

-- 13. Delete records with a specific lastname
Delete from students
where lastname = 'Verma';

-- 14. Delete all records (use with caution)
delete from students;

-- 15. Delete records with a specific Address
Delete from students 
where Address Like 'H%';

-- 4. Rename queries
-- 16. Rename the Students Table
Alter table students rename to Student;

-- 17. Rename the company_id column
Alter table Student rename column firstname to initialname;

-- 18. Rename Multiple Columns 
Alter table Student
rename column Email to email_id,
rename column Address to city;

-- 5. update queries 
select * from student;
-- 19. update a specific records
update Student
Set dateofbirth = '2025-06-04', status = 'Deactivate';

-- 20. Update names
Update Student
set initialname = 'abc'
where lastname = 'xyz-';

-- Table 2: Teachers
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Specialization VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2),
    Experience INT,
    Status VARCHAR(20)
);

INSERT INTO Teachers (TeacherID, FirstName, LastName, Email, Phone, Specialization, HireDate, Salary, Experience, Status) VALUES
(1, 'Rajesh', 'Kumar', 'rajesh.kumar@example.com', '9998887770', 'Mathematics', '2015-01-15', 75000.00, 10, 'Active'),
(2, 'Anita', 'Desai', 'anita.desai@example.com', '9998887771', 'Science', '2016-02-20', 70000.00, 9, 'Active'),
(3, 'Sanjay', 'Gupta', 'sanjay.gupta@example.com', '9998887772', 'English', '2014-03-25', 80000.00, 11, 'Active'),
(4, 'Priya', 'Sharma', 'priya.sharma@example.com', '9998887773', 'History', '2017-04-30', 68000.00, 8, 'Active'),
(5, 'Rakesh', 'Mehta', 'rakesh.mehta@example.com', '9998887774', 'Geography', '2013-05-10', 85000.00, 12, 'Active'),
(6, 'Kavita', 'Singh', 'kavita.singh@example.com', '9998887775', 'Computer Science', '2018-06-15', 72000.00, 6, 'Active'),
(7, 'Ajay', 'Patel', 'ajay.patel@example.com', '9998887776', 'Physics', '2012-07-20', 90000.00, 13, 'Active'),
(8, 'Sunita', 'Nair', 'sunita.nair@example.com', '9998887777', 'Chemistry', '2019-08-25', 71000.00, 5, 'Active'),
(9, 'Vikram', 'Rao', 'vikram.rao@example.com', '9998887778', 'Economics', '2011-09-30', 95000.00, 14, 'Active'),
(10, 'Meena', 'Joshi', 'meena.joshi@example.com', '9998887779', 'Biology', '2020-10-05', 68000.00, 4, 'Active');

-- to display/retrieve table data
SELECT * FROM Teachers;

-- to delete records from columns
truncate table Teachers;

-- to delete whole table with its records
drop table Teachers;

SET SQL_SAFE_UPDATES=0;

-- select queries 

-- 1. select specifc columns 
select FirstName , LastName from Teachers;

-- 2. select particular  Specialization
select * from Teachers where  Specialization = 'Computer Science';

-- 3. select particular Phone
select * from Teachers where  Phone = '9998887774';

-- 4. select Teachers between one particular date
Select * from Teachers where HireDate between '2017-04-30' And '2023-06-01';

-- 5. select Teachers with names in particular order 
select * from Teachers order by LastName DESC;

-- alter queries
select * from Teachers;

-- 6. Add a new column
Alter Table Teachers
Add column postion varchar (100);
 
-- 7. Modify (Change) an existing column 
Alter Table Teachers 
Modify Column email varchar (100) unique;

-- 8. Drop a column
Alter Table Teachers 
Drop column postion;

-- 9. Rename a Column
Alter Table Teachers
Change Column Email emailid varchar (100);

-- 3. Delete Queries 
select * from Teacher;

-- 10. Delete a specific record
Delete From Teachers
where firstname = 'Meena';

-- 11. Delete records on a condition
Delete From Teachers
where HireDate = '2017-04-30';

-- 12. Delete teachers hired before a certain date 
Delete from teachers
where HireDate = '2016-02-20';

-- 13. Delete records with a specific lastname
Delete from Teachers
where lastname = 'Singh';

-- 14. Delete all records 
delete from Teachers;

-- 15. Delete records with a specific Specialization
Delete from Teachers
where Specialization Like 'G%';

-- 4. Rename queries
-- 16. Rename the Students Table
Alter table Teachers rename to Teacher;

-- 17. Rename the company_id column
Alter table Teacher rename column firstname to initialname;

-- 18. Rename Multiple Columns 
Alter table Teacher
rename column Emailid to email_id,
rename column Specialization to subjects;

-- 5. update queries 
select * from teacher;
-- 19. update a specific records
update Teacher
Set hiredate = '2025-06-04', status = 'Deactivate';

-- 20. Update names
Update Teacher
set initialname = 'jiya'
where lastname = 'gohil';

-- Table 3: Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Description TEXT,
    Credits INT,
    Category VARCHAR(50),
    DurationWeeks INT,
    TeacherID INT,
    Level VARCHAR(20),
    Language VARCHAR(30),
    Status VARCHAR(20),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

drop taBLE COURSES;
INSERT INTO Courses
 VALUES
(1, 'Mathematics 101', 'Introductory math course', 4, 'STEM', 12, 1, 'Beginner', 'English', 'Active'),
(2, 'Science Basics', 'Foundation in science', 3, 'STEM', 10, 2, 'Beginner', 'English', 'Active'),
(3, 'English Grammar', 'Grammar essentials', 2, 'Languages', 8, 3, 'Intermediate', 'English', 'Active'),
(4, 'World History', 'Global historical events', 3, 'Social Studies', 10, 4, 'Intermediate', 'English', 'Active'),
(5, 'Physical Geography', 'Earth’s features', 3, 'Social Studies', 10, 5, 'Intermediate', 'English', 'Active'),
(6, 'Python Programming', 'Basics of Python', 4, 'Computer Science', 12, 6, 'Beginner', 'English', 'Active'),
(7, 'Physics Concepts', 'Mechanics and waves', 4, 'STEM', 12, 7, 'Intermediate', 'English', 'Active'),
(8, 'Organic Chemistry', 'Carbon compounds', 4, 'STEM', 12, 8, 'Advanced', 'English', 'Active'),
(9, 'Macroeconomics', 'National economy', 3, 'Commerce', 10, 9, 'Advanced', 'English', 'Active'),
(10, 'Botany Basics', 'Plant biology', 3, 'Science', 10, 10, 'Beginner', 'English', 'Active');

-- to display/retrieve table data
SELECT * FROM Courses;

-- to delete records from columns
truncate table Course;

-- to delete whole table with its records
drop table Courses;

SET SQL_SAFE_UPDATES=0;

-- select queries 

-- 1. select specifc columns 
select CourseID , CourseNAME from Courses;

-- 2. select particular CourseNAME
select * from Courses where  CourseNAME = 'English Grammar';

-- 3. select particular Description
select * from Courses where Description = 'Global historical events';

-- 4. select Courses between PARTICULTAR RANGE
Select * from Courses where COURSENAME between 'a%' And 'T%';

-- 5. select Courses with names in particular order 
select * from Courses order by CourseNAME DESC;

-- alter queries
select * from Course;

-- 6. Add a new column
Alter Table Courses
Add column STUDENT varchar (100);
 
-- 7. Modify (Change) an existing column 
Alter Table Courses 
Modify Column Coursename varchar (100) unique;

-- 8. Drop a column
Alter Table Courses 
Drop column Student;

-- 9. Rename a Column
Alter Table Courses
Change Column Coursename Courses varchar (100);

-- 3. Delete Queries 
select * from Course;

-- 10. Delete a specific record
Delete From Courses
where Courses = 'M%';

-- 11. Delete records on a condition
Delete From Courses
where Courses = 'H%';

-- 12. Delete Courses with certain description
Delete from Courses
where description = 'Carbon compounds';

-- 13. Delete records with a specific description
Delete from Courses
where description = 'maths';

-- 14. Delete all records 
delete from Course;

-- 15. Delete records with a specific Specialization
Delete from Courses
where Courses Like 'G%';

-- 4. Rename queries
-- 16. Rename the Courses Table
Alter table Courses rename to Course;

-- 17. Rename the column
Alter table Course rename column Courses to Coursename;

-- 18. Rename Multiple Columns 
Alter table Course
rename column description to descriptions,
rename column Category to categories;

-- 5. update queries 
select * from Course;
-- 19. update a specific records
update Course
Set Categories = 'Simple', durationweeks = 'week1';

-- 20. Update names
Update course
set coursename = 'basic course'
where descriptions = 'covers basic concepts';

-- Table 4: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Progress INT,
    CompletionDate DATE,
    Grade VARCHAR(5),
    Feedback TEXT,
    Status VARCHAR(20),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments 
VALUES
(1, 1, 1, '2023-06-01', 50, NULL, NULL, 'Doing well', 'In Progress', 'Paid'),
(2, 2, 1, '2023-06-02', 60, NULL, NULL, 'Excellent', 'In Progress', 'Paid'),
(3, 3, 2, '2023-06-03', 45, NULL, NULL, 'Needs improvement', 'In Progress', 'Pending'),
(4, 4, 3, '2023-06-04', 70, NULL, NULL, 'Great participation', 'In Progress', 'Paid'),
(5, 5, 4, '2023-06-05', 40, NULL, NULL, 'Struggling', 'In Progress', 'Paid'),
(6, 6, 5, '2023-06-06', 55, NULL, NULL, 'Average', 'In Progress', 'Paid'),
(7, 7, 6, '2023-06-07', 65, NULL, NULL, 'Above average', 'In Progress', 'Paid'),
(8, 8, 7, '2023-06-08', 35, NULL, NULL, 'Needs assistance', 'In Progress', 'Pending'),
(9, 9, 8, '2023-06-09', 80, NULL, NULL, 'Outstanding', 'In Progress', 'Paid'),
(10, 10, 9, '2023-06-10', 50, NULL, NULL, 'Good effort', 'In Progress', 'Paid');

-- to display/retrieve table data
SELECT * FROM Enrollments;

-- to delete records from columns
truncate table Enrollments;

-- to delete whole table with its records
drop table Enrollments;

SET SQL_SAFE_UPDATES=0;

-- select queries 

-- 1. select specifc columns 
select CourseID , StudentID from Enrollments;

-- 2. select particular CourseNAME
select * from Enrollments where  EnrollmentDate = '2023-06-05';

-- 3. select particular Description
select * from Enrollments where Feedback = 'Global historical events';

-- 4. select Enrollments with Progress in particular order 
select * from Enrollments order by Progress DESC;

-- alter queries
select * from Enrollment;

-- 6. Add a new column
Alter Table Enrollments
Add column STUDENT varchar (100);
 
-- 7. Modify (Change) an existing column 
Alter Table Enrollments 
Modify Column Grade varchar (100) unique;

-- 8. Drop a column
Alter Table Enrollments 
Drop column Student;

-- 9. Rename a Column
Alter Table Enrollments 
Change Column CompletionDate completion varchar (100);

-- 3. Delete Queries 
select * from Enrollments ;

-- 10. Delete a specific record
Delete From Enrollments 
where  EnrollmentDate  = '2020-06-04';

-- 11. Delete records on a condition
Delete From Enrollments
where Feedback = 'H%';

-- 12. Delete Courses with certain description
Delete from Enrollments
where PaymentStatus = 'C%';

-- 4. Rename queries
-- 13. Rename the Courses Table
Alter table Enrollments rename to Enrollment;

-- 14. Rename the column
Alter table Enrollment rename column studentID to studentno;

-- 5. update queries 
select * from Course;
-- 15. update a specific records
update Enrollment
Set feedback = 'Good', PaymentStatus = 'Paid';
