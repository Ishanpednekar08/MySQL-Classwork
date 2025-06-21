-- Single line Comment 

/* 
Multi 
Line 
Comment 
*/

-- ---------------------------------------------------- DataBase Queries ----------------------------------------------------------------------------------
/*
-- to create a database 
create database Company;

-- to work with database we need to use it first 
use Company;
*/
-- ----------------------------------------------------- DataBase Analysis ----------------------------------------------------------------------------------

/*
Table 1: Employees- Employee_id (pk), name, age, gender, email, contact, address, position,joining_date, years_of_experience, 
Table 2: Departments- department_id (pk), department, department_email, room_no, department_head, Employee_id (fk), no_of_employees, bugdet, 
		 establishment_date, department_type, 
Table 3: Projects- client_name, project_id (pk), project_name, decription, start_date, end_date, project_head, no_of_employees, budget, status 
Table 4: Salaries- Employee_id (fk), name, postion, department_id (fk), salary, month, year, tax_deduction, 
Table 5: Clients- client_id , name, email, contact, location, project_id (fk), Employee_id (pk),department_id (pk),start_date, end_date
*/

-- ------------------------------------------------------ Table Queries ----------------------------------------------------------------------------------
-- Table 1: Employees
create table Employees(
Employee_id int primary key, 
name varchar (100), 
age int, 
gender enum('F','M'),
email varchar (100), 
contact varchar (100), 
address varchar (100), 
position varchar (100),
joining_date DATE, 
years_of_experience INT
); 

-- to insert records in table 
insert into Employees
values
(1, 'Ishan Pednekar', 21, 'M', '22ishanpednkar@gmail.com', '12345678', 'Mulund East', 'Managing Director', '2023-08-05',3),
(2, 'Riya Madvan', 22,'F', 'riyamadvan@gmail.com', '12345667', 'Thane West', 'Assistant Manager','2024-05-02',1),
(3, 'Vivek Oberoi', 23, 'M', 'vivekoberoi@gmail.com', '87654433', 'Mulund West', 'Data Analyst', '2020-04-02',5),
(4, 'Biyan Joyan', 24, 'M', 'biyanj@gmail.com', '324252346', 'Bhandup East', 'Data Engineer', '2019-03-03',6),
(5, 'Meera Jadhav', 20, 'F', 'meerajadhav@gmail.com', '46364646', 'Malad West', 'Intern', '2025-01-01',1),  
(6, 'Kiran Kotak', 29, 'M', 'kirankotak@gmail.com', '24353567', 'Goregoan East', 'Data Scientist','2023-03-01',2),
(7, 'Jimmy Sunny', 30, 'M', 'jimmy@gmail.com', '253323535', 'Dombivali East', 'Accountant', '2020-05-20',5),
(8, 'Shriya Shinde', 25, 'F', 'shriyashinde@gmail.com', '23235325', 'Mulund East', 'HR', '2024-03-04', 1),
(9, 'Anika Paradkar', 25, 'F', 'anikaparadkar@gmail.com', '234535234', 'Mulund East', 'Finance Manager', '2025-02-01',1),
(10, 'Rajas Randive', 21, 'F', 'rajasrandive@gmail.com', '214353235', 'Mulund West', 'Lawyer', '2023-02-12',2);

-- to display from following table 
select * from Employees;

-- to remove all records from attributes 
truncate table Employees;

-- to remove table 
drop table Employees;

-- select queries 
-- 1. Select All columnms from the Employees Table
Select * From employees;

-- 2. Select Specific Columns 
Select name, Employee_id from employees;

-- 3. Select a Employee by Name
select * From employees Where name = 'Ishan Pednekar';

-- 4. Select Employees with a specific address
Select * From employees where address = 'Goregaon';

-- 5 Count the Number of Employees 
Select Count(*) as total_Employees from employees;

-- 6 Select Employees with a position Containing a specfic Word
Select * from employees where position LIKE '%data%';

-- 7 Select Employees ordered by name 
Select * From employees order by name;

-- 8 Select employees with a address starting with 'M'
Select * from employees where address LIKE 'M%';

-- 9 Select Employess with more than 3 characters in position 
Select * from employees where char_length(position) > 3;

-- 10. Select the First 5 Employees
Select * from employees LIMIT 5;

-- 11. Select employees with a name longer than 1 Characters
Select * from employees where char_length(name) > 1;

-- 12 Select employees with a postion that does not contain 'data'
Select * from employees where position not like '%data%';

-- 13. Select Specific Columns 
Select address, Employee_id from employees;

-- 14. Select a Employee by address
select * From employees Where address = 'Malad West';

-- 15. Select Employees with a specific joining_date
Select * From employees where joining_date = '2019-03-03';

-- 16 Select Employees with a email Containing a specfic Word
Select * from employees where email LIKE '%anikaparadkar@gmail.com%';

-- 17 Select Employees ordered by email
Select * From employees order by email;

-- 18 Select employees with a name starting with 'I'
Select * from employees where name LIKE 'I%';

-- 19 Select Employess with more than 1 characters in email
Select * from employees where char_length(email) > 1;

-- 20. Select the 2 Employee
Select * from employees LIMIT 2;

-- Table 2: Departments
create table Department (
department_id int primary key, 
department varchar (100), 
department_email varchar (100), 
room_no int, 
department_head varchar(100), 
Employee_id int,
no_of_employees int, 
bugdet varchar (100), 
establishment_date DATE, 
department_type varchar (200),
foreign key (Employee_id) references Employees (Employee_id) 
);
 
-- to insert records in table 
insert into Department
values
(1, 'Management', 'management@gmail.com', 101, 'Ishan Pednekar', 1, 12, '120000', '2020-04-03', 'Management'),
(2, 'Operations', 'operations@gmail.com', 102, 'Kotak Raheja', 2, 13, '349900', '2021-03-21', 'Operations'),
(3, 'Finance', 'finance@gmail.com', 103, 'Fijan shaik', 3, 13, '3523523', '2023-12-21','Finance'),
(4, 'HR', 'hr@gmail.com', 104, 'Harsha Beniwal', 4, 11, '214241234', '2024-03-12','HR'),
(5, 'Sustanability', 'sustanable@gmail.com', 105,'Kiran Roa', 5, 10, '124214412', '2024-02-12','sustanability'),
(6, 'Analysis', 'analysis@gmail.com', 106,'Janvi', 6, 12, '42141242', '2025-02-02', 'Ananlsis'),
(7, 'Technical','technicalteam@gmail.com', 107,'Raj',7,14,'4134342', '2020-02-01','Technical'),
(8, 'Customercare', 'customercare@gmail.com', 108, 'Kishan raj', 8,24,'5325253', '2019-03-01','Helpline'),
(9, 'Sales', 'sales@gmail.com', 109, 'Jay Shah',9,21,'12424124','2020-02-02','Sales'),
(10, 'Accounts', 'accounts@gmail.com', 110, 'Rahul KL', 10, 22, '2141242', '2021-02-21','Accounts');

-- to display from following table 
select * from Department;

-- to remove all records from attributes 
truncate table Department;

-- to remove table 
drop table Department;

-- select queries 
-- 1. Select All columnms from the Department Table
Select * From Department;

-- 2. Select Specific Columns 
Select department_id, department from Department;

-- 3. Select a department by department
select * From department Where department = 'Sustanability';

-- 4. Select department with a specific department_head 
Select * From department where department_head  = 'Raj';

-- 5 Count the Number of department 
Select Count(*) as total_department from department;

-- 6 Select Department with a department_type Containing a specfic Word
Select * from Department where department_type LIKE '%Operations%';

-- 7 Select department ordered by name 
Select * From department order by department;

-- 8 Select department with a establishment_date starting with '2025-02-02'
Select * from department where establishment_date LIKE '2025-02-02%';

-- 9 Select department with more than 1 characters in department_type 
Select * from department where char_length(department_type) > 1;

-- 10. Select the First 5 department
Select * from department LIMIT 5;

-- 11. Select department with a department longer than 1 Characters
Select * from department where char_length(department) > 1;

-- 12 Select department with a postion that does not contain 'Management'
Select * from department where department not like '%Management%';

-- 13. Select Specific Columns 
Select department, department_email from department;

-- 14. Select a department by department_type
select * From department Where department_type = 'Operations';

-- 15. Select department with a specific establishment_date
Select * From department where establishment_date = '2019-03-03';

-- 16 Select department with a department_email Containing a specfic Word
Select * from department where department_email LIKE '%customercare@gmail.com%';

-- 17 Select department ordered by department_id
Select * From department order by department_id;

-- 18 Select department with a department_head starting with 'K'
Select * from department  where department_head LIKE 'K%';

-- 19 Select department with more than 1 characters in department_type
Select * from department where char_length(department_type) > 1;

-- 20. Select the 7 department
Select * from department LIMIT 7;

-- Table 3: Projects- 
create table Projects (
project_id int primary key, 
client_name varchar (100), 
project_name varchar (100), 
department_id int, 
start_date DATE, 
end_date DATE, 
project_head varchar (100), 
no_of_employees int, 
budget varchar (100), 
project_status enum ('Completed' , 'Completing'),
foreign key (department_id) references department (department_id)
);

-- to insert records in table 
insert into Projects
values
( 1, 'Unnati', 'Vikas', 1, '2023-03-02', '2024-03-02', 'Ishhan', 11, '20000', 'Completed'),
( 2, 'Shreya', 'Kiran', 2, '2022-03-04', '2023-03-02', 'Lakshya', 12, '12222','Completed'),
( 3, 'Hiyesh', 'Lagan', 3, '2024-03-22', '2026-03-21', 'Kiran', 14, '10000', 'Completing'),
( 4, 'Kavel', 'Iltija', 4, '2024-04-12', '2025-03-02', 'Hiuash', 23, '10000', 'Completed'),
( 5, 'Mahek', 'Udaan', 5, '2024-04-12', '2025-03-02', 'Lakesh', 20, '12100', 'Completed'),
( 6, 'Liyan', 'Banik', 6, '2023-03-02', '2024-03-02', 'Unaati', 23, '10000', 'Completed'),
( 7, 'Vasundhara', 'Sapna', 7, '2024-03-22', '2026-03-21', 'Rakesh', 23, '800000', 'Completing'),
( 8, 'Shriya', 'Manjil', 8, '2024-04-12', '2025-03-02', 'Ovi', 22, '124142412', 'Completed'),
( 9, 'Shreya', 'Kiran 4', 9, '2022-06-04', '2023-07-02', 'Lakshya', 12, '12222','Completed'),
( 10, 'Hiyesh', 'Lagan 3', 10, '2024-05-22', '2026-03-21', 'Kiran', 14, '10000', 'Completing'); 

-- to display from following table 
select * from Projects;

-- to remove all records from attributes 
truncate table Projects;

-- to remove table 
drop table Projects;

-- select queries 
-- 1. Select All columnms from the Projects Table
Select * From Projects;

-- 2. Select Specific Columns 
Select project_id, project_name from Projects;

-- 3. Select a projects by end_date
select * From  projects  Where end_date = '2024-03-02';

-- 4. Select  projects  with a specific project_name 
Select * From  projects  where project_name   = 'Manjil';

-- 5 Count the Number of  projects 
Select Count(*) as total_projects  from  projects ;

-- 6 Select projects with a project_head_type Containing a specfic Word
Select * from projects where project_head LIKE '%Ishhan%';

-- 7 Select projects ordered by project_name
Select * From projects order by project_name;

-- 8 Select projects with a start_date starting with '2025-02-02'
Select * from projects where start_date LIKE '2025-02-02%';

-- 9 Select projects with more than 1 characters in projects
Select * from projects where char_length(project_head) > 1;

-- 10. Select the First 5 projects
Select * from projects LIMIT 5;

-- 11. Select projects with a project_name longer than 1 Characters
Select * from  projects where char_length(project_name) > 1;

-- 12 Select projects with a project_name that does not contain 'Sapna'
Select * from department where projects not like '%Sapna%';

-- 13. Select Specific Columns 
Select start_date, end_date from projects;

-- 14. Select a projects by project_id
select * From projects Where project_id = '1';

-- 15. Select projects with a specific project_status
Select * From projects where project_status = 'Completing';

-- 16 Select projects with a budget Containing a specfic Word
Select * from projects where budget LIKE '%1000%';

-- 17 Select projects ordered by project_id
Select * From projects order by project_id;

-- 18 Select projects with a projects_head starting with 'K'
Select * from projects  where project_head LIKE 'K%';

-- 19 Select projects with more than 1 characters in project_name
Select * from projects where char_length(project_name) > 1;

-- 20. Select the 2 projects
Select * from projects LIMIT 2;

-- Table 4: Salaries
CREATE TABLE Salaries (
Employee_id int,
salary_id int primary key,
employee_name varchar(100),
position varchar (100),
department_id int,
salary varchar (100),
salary_month varchar (100),
salary_year varchar (100),
bonus int ,
tax_deduction int,
foreign key (Employee_id) references Employees (Employee_id),
foreign key (department_id) references Department(department_id)
);

-- to insert records in table 
insert into Salaries
values
( 1, 1, 'Raj', 'HOD', 1,'10000','February', '2024', 2000, 1000),  
( 2, 2, 'Ram', 'assistance', 2,'11000','February', '2024', 2000, 1000),
( 3, 3, 'Rajesh', 'data analyst', 3,'10030','February', '2024', 2000, 1000),
( 4, 4, 'Rakes', 'data science', 4,'1004-0','February', '2024', 2000, 1000),
( 5, 5, 'Raju', 'accountant', 5,'10050','February', '2024', 2000, 1000),
( 6, 6, 'Ravi', 'HR', 6,'10060','February', '2024', 2000, 1000),
( 7, 7, 'Mahesh', 'Clerk', 7,'10060','February', '2024', 2000, 1000),
( 8, 8, 'Rajiv', 'CEO', 8,'10060','February', '2024', 2000, 1000),
( 9, 9, 'Rajvi', 'HR', 9,'10060','February', '2024', 2000, 1000),
( 10, 10, 'sarvesh', 'Data Engineer', 10,'10060','February', '2024', 2000, 1000);

-- to display from following table 
select * from Salaries;

-- to remove all records from attributes 
truncate table Salaries;

-- to remove table 
drop table Salaries;

-- select queries 
-- 1. Select All columnms from the Projects Table
Select * From Salaries;

-- 2. Select Specific Columns 
Select Salary_id, position from Salaries;

-- 3. Select a Salaries by position
select * From  Salaries  Where position = 'Data Analyst';

-- 4. Select  Salaries  with a specific salary_month
Select * From  Salaries  where salary_month  = 'February';

-- 5 Count the Number of  Salaries 
Select Count(*) as total_Salaries  from  Salaries ;

-- 6 Select Salaries with a employee_name Containing a specfic Word
Select * from Salaries where employee_name LIKE '%Raju%';

-- 7 Select Salaries ordered by position
Select * From Salaries order by position;

-- 8 Select Salaries with a position starting with 'Data'
Select * from Salaries where position LIKE 'Data%';

-- 9 Select Salaries with more than 1 characters in postions
Select * from Salaries where char_length(position) > 1;

-- 10. Select the First 5 Salaries
Select * from Salaries LIMIT 5;

-- 11. Select Salaries with a salary_month longer than 1 Characters
Select * from  Salaries where char_length(salary_month) > 1;

-- 12 Select Salaries with a postion that does not contain 'accountant'
Select * from  Salaries where position not like '%accountant%';

-- 13. Select Specific Columns 
Select salary, position from Salaries;

-- 14. Select a Salaries by salary
select * From Salaries Where Salary = '10000';

-- 15. Select Salaries with a specific Salary
Select * From Salaries where Salary = '90000';

-- 16 Select Salaries with a positon Containing a specfic Word
Select * from Salaries where position LIKE '%HR%';

-- 17 Select Salaries ordered by position
Select * From Salaries order by position;

-- 18 Select Salaries with a postion starting with 'c'
Select * from Salaries where position LIKE 'C%';

-- 19 Select Salaries with more than 1 characters in project_name
Select * from Salaries where char_length(position) > 1;

-- 20. Select the 8 Salaries
Select * from Salaries LIMIT 8;

-- Table 5: Clients
create table Clients (
client_id int, 
name varchar (100), 
email varchar (100), 
contact varchar (100), 
location varchar (100), 
project_id int, 
Employee_id int,
department_id int,
start_date DATE, 
end_date DATE,
foreign key (project_id) references projects (project_id),
foreign key (Employee_id) references employees (Employee_id),
foreign key (department_id) references department (department_id)
);

-- to insert records in table 
insert into Clients
values
( 1, 'Unnati', 'unnati@gmail.com', '2121434215', 'Mumbai', 1, 1, 1, '2024-03-30', '2024-05-29'),
( 2, 'Kapil', 'kapil@gmail.com', '21234342135', 'Pune', 2, 2, 2, '2024-04-30', '2024-05-29'),
( 3, 'Ram jah', 'ramjah@gmail.com', '21214342135', 'Rajpur', 3, 3, 3, '2024-03-30', '2024-05-29'),
( 4, 'Ramesh', 'ramesh@gmail.com', '212166642135', 'Mumbai', 4, 4, 4, '2024-06-30', '2024-07-29'),
( 5, 'Nilam', 'Nilam@gmail.com', '21214342135', 'Manjipur', 5, 5, 5, '2024-06-30', '2024-08-29'),
( 6, 'Yash', 'yash@gmail.com', '21214442135', 'Banglore', 6, 6, 6, '2024-05-30', '2024-08-29'),
( 7, 'Edwin', 'edwim@gmail.com', '212143425655', 'Delhi', 7, 7, 7, '2024-05-30', '2024-09-29'),
( 8, 'Sita', 'sita@gmail.com', '20014342135', 'Calcutta', 8, 8, 8, '2024-01-30', '2024-09-29'),
( 9, 'Shital', 'Shital@gmail.com', '2121430035', 'Chennai', 9, 9, 9, '2024-02-12', '2024-08-29'),
( 10, 'vivek', 'vivek@gmail.com', '21299342135', 'Jaipur', 10, 10, 10, '2024-11-30', '2024-10-29');

-- to display from following table 
select * from Clients;

-- to remove all records from attributes 
truncate table Clients;

-- to remove table 
drop table Clients;

-- select queries 
-- 1. Select All columnms from the Projects Table
Select * From Clients;

-- 2. Select Specific Columns 
Select Client_id, name from Clients;

-- 3. Select a Clients by name
select * From Clients  Where name = 'Unnati'

-- 4. Select  Clients with a specific Employee_id
Select * From  Clients  where Employee_id  = '7';

-- 5 Count the Number of Clients 
Select Count(*) as total_Clients  from  Clients ;

-- 6 Select Clients with a project_id Containing a specfic Word
Select * from Clients where project_id LIKE '%6%';

-- 7 Select Clients  ordered by NAME
Select * From Clients  order by NAME;

-- 8 Select Clients with a NAME starting with 'i'
Select * from Clients  where NAME LIKE 'i%';

-- 9 Select Clients with more than 1 characters in postions
Select * from Clients  where char_length(NAME) > 1;

-- 10. Select the First 5 Clients 
Select * from Clients  LIMIT 5;

-- 11. Select Clients  with a location longer than 1 Characters
Select * from  Clients  where char_length(location) > 1;

-- 12 Select Clients with a LOCATION that does not contain 'DELHI'
Select * from Clients where LOCATION not like '%DELHI%';

-- 13. Select Specific Columns 
Select Client_ID, LOCATION from Salaries;

-- 14. Select a Clients by Location
select * From Clients Where location = 'Mumbai';

-- 15. Select Clients with a specific department_id
Select * From Clients where Salary = '5';

-- 16 Select Clients with a location Containing a specfic Word
Select * from Clients where location LIKE '%New york%';

-- 17 Select Clients ordered by name
Select * From Clients order by name;

-- 18 Select Clients with a name starting with 'S'
Select * from Clients where name LIKE 'S%';

-- 19 Select Clients with more than 1 characters in location
Select * from Clients where char_length(location) > 1;

-- 20. Select the 8 Clients
Select * from Clients LIMIT 8;