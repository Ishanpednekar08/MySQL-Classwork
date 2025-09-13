-- single line comments

/*
Multi 
Line 
Comment
*/

-- ---------------------------------------------------------------- Part A -----------------------------------------------------------------------------
/*
1. Your company wants to store employee data. 
Write an SQL statement to create a table Employees with columns: EmpID (Primary Key), Name, Department, and Salary.
*/

-- create database Company
create database company;

-- to work on database company
use company;

-- to create table employees
CREATE TABLE employees (
    EmpID VARCHAR(100) PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(100),
    Salary INT
);

-- inserting records
INSERT INTO employees (EmpID, Name, Department, Salary)
VALUES 
('AOI101', 'Ishan Pednekar', 'Finance', 100000),
('AOI102', 'Anika Paradkar', 'Management', 230000),
('AOI103', 'Shivani Chaudhari', 'Finance', 156000),
('AOI104', 'Yashashree Rao', 'Management', 890000),
('AOI105', 'Riya Keswani', 'Operations', 178000),
('AOI106', 'Shriya Shinde', 'HR', 7800000),
('AOI107', 'Fiona Dsouza', 'Finance', 100000),
('AOI108', 'Dia Raju', 'HR', 100000),
('AOI109', 'Sanika Pednekar', 'Marketing', 100000),
('AOI110', 'Tanya Shetty', 'Sales', 100000);

-- to display records from table
select * from employees;

-- to remove records from table
truncate table employees;

-- to remove table from database
drop table employees;


-- 2. The HR team found one employee’s salary was entered incorrectly. Write an SQL query to update the salary of employee with EmpID = 105.

-- to update records of particular records
update employees
set Salary = 200000   
where EmpID = 'AOI105';

-- 3. A manager wants to remove employees who resigned. Write an SQL statement to delete employees from the Employees table where Department = 'HR'.

set SQL_safe_updates = 0;
set SQL_safe_updates = 1;

delete from employees 
where department = 'HR';

-- 4. Write a query to display all employees working in the "Finance" department.
select * from employees
where department = 'Finance';

-- ------------------------------------------------------------ Part B ----------------------------------------------------------------------------------------

-- 5. Display the top 3 highest-paid employees using the ORDER BY and LIMIT clauses.
Select * from employees
order by salary DESC limit 3;

-- 6. Find the total salary paid by each department using the GROUP BY clause.
Select department, sum(salary) as total_salary 
from employees group by department;

-- 7. Retrieve all employees who earn more than 50,000 but less than 80,000 using the WHERE clause.
select * from employees
where salary > 50000 and salary < 80000;

-- 8. Show employees whose names start with "A" using the LIKE clause.
select * from employees
where name like 'A%';

-- ------------------------------------------------------------- Part C ---------------------------------------------------------------------------------------

-- 9. When creating the Students table, ensure that RollNo is unique and Marks cannot be negative. Write the SQL statement.
-- to create table students
CREATE TABLE students (
    roll_no int PRIMARY KEY unique,
    Name VARCHAR(100),
    marks int check( Marks >= 0),
    email_id VARCHAR(100)
);

-- 10. Add a NOT NULL constraint on the Email column in the Employees table.
alter table employees
add column email varchar(100) not null;

-- 11. Create a table Orders where OrderID is the Primary Key and CustomerID is a Foreign Key referencing the Customers table.
CREATE TABLE customers (
    customerID varchar(100) PRIMARY KEY unique,
    Name VARCHAR(100),
    address varchar(100),
    email_id VARCHAR(100)
);

-- inserting records
INSERT INTO Customers (customerID , Name, address, email_id)
VALUES 
('CU101' , 'Udesh Singh', 'Mulund East', 'udeshsingh@gmail.com'),
('CU102' , 'Nitesh Yadav', 'Nahur East', 'nitishyadav@gmail.com'),
('CU103' , 'Shriya Singh', 'dahisar East', 'shreyasingh@gmail.com'),
('CU104' , '	Harsh Jain', 'Mulund East', 'harshjain@gmail.com'),
('CU105' , 'Raj shivkar', 'malad East', 'rajshivkar@gmail.com'),
('CU106' , 'Nagpal Yad', 'dadar East', 'nagpal@gmail.com');

-- to create table Orders 
CREATE TABLE Orders (
    OrderID int PRIMARY KEY unique,
    CustomerID varchar(100),
    address varchar(100),
    date date,
	Foreign key (CustomerID) references customers (customerID)
);

-- inserting records
INSERT INTO Orders (OrderID , CustomerID, address, date)
VALUES 
(1, 'CU101','Mulund East','2023-06-04'),
(2, 'CU103','Nahur East' , '2023-04-02'),
(3, 'CU103','dahisar East', '2023-05-01'),
(4, 'CU104','Mulund East', '2023-06-03'),
(5, 'CU105','malad East', '2023-08-16'),
(6, 'CU106','dadar East', '2023-11-04');

-- to display records
select * from orders;

-- --------------------------------------------------------------------- Part D ----------------------------------------------------------------------------
-- 12. Write a query to fetch all customer names along with their order details using an INNER JOIN.
select c.customerID, c.name, o.orderID, o.address 
from customers as c
inner join Orders as o on o.customerID = c.customerID; 

-- 13.Display all employees and their assigned projects. If an employee has no project, still show their name using a LEFT JOIN.
CREATE TABLE projects (
    EmpID varchar(100) PRIMARY KEY,
    projectname varchar(100),
    department varchar(100),
    date date,
	Foreign key (EmpID) references employees(EmpID)
);

INSERT INTO projects (EmpID , projectname, department, date)
VALUES
('AOI101', 'skyproject', 'Finance', '2024-04-02'),
('AOI102','deppakproject','Sales','2024-06-23'),
('AOI103','hriyday','Hr','2024-04-10'),
('AOI104','ICHHA','Management','2024-07-12'),
('AOI105','Fikar','Finance','2024-08-13'),
('AOI106','Kiran','Sales','2024-01-20'),
('AOI107','Dhamal','HR','2024-09-01'),
('AOI108','Rekha','Operations','2024-10-15'),
('AOI109','esha','IT','2024-08-21'),
('AOI110','UNAATI','ceo-office','2024-12-30');

select e.empID, e.department, p.projectname, p.date 
from employees as e
left join projects as p on e.empID = p.empID; 

-- 14. List all departments and employees using a RIGHT JOIN. Ensure departments with no employees are also shown.
select p.department, e.name 
from projects as p
left join employees as e on p.empID = e.empID;

-- 15. Retrieve employees who have not been assigned to any project using a join.
select e.name, e.EmpID, e.Name, e.Department, e.Salary 
from employees as e
left join projects as p on e.empID = p.empID
where p.empID is null;

-- 16. Combine two tables Branch_A_Employees and Branch_B_Employees to get a full list of employees using a UNION.
select 


-- -------------------------------------------------------------- Part E -------------------------------------------------------------------------------------

-- 17. Find the second highest salary from the Employees table using a subquery.

-- Showing second highest salary
select max(salary) as second_highest_salary
from employees
where salary < (select max(salary) from employees); 

-- 18. Retrieve names of employees whose salary is greater than the average salary using a subquery.
select Name, Salary
from employees
where Salary > (select avg(Salary) from employees);

-- 19. Display employees who work in the same department as the employee named "Rohit".
select * from employees
where Department = (
    select Department
    from employees
    where Name = 'Rohit'
);

-- 20. Fetch all customers who placed orders worth more than the average order amount.



-- ----------------------------------------------------------- Part F ----------------------------------------------------------------------------------------
-- 21. Use a built-in function to display the current date and time.
select now() as current_datetime;

-- 22. Write a query to show the length of each employee’s name using the LENGTH() function.
select name, length(Name) AS name_length
from employees;

-- 24. Retrieve the total number of employees in the company using a built-in function.
select count(*) AS Total_Employees
from employees;




