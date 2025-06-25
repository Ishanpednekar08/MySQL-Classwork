-- Single Line Comment

/* 
Multi 
Line
Comment
*/

-- --------------------------------------------------- DATABASE QUERIES --------------------------------------------------------------------------------
-- to create database MNC (Multi National Company)
create database MNC;

-- Switch to the MNC Database 
use MNC;

-- ------------------------------------------------------- Table Queries ----------------------------------------------------------------------------------
-- Table 1:
-- to create companies table 
-- create companies table with additional attributes and constraints
create table companies (
company_id int auto_increment primary key,
company_name varchar (100) Not Null,
headquaters_location varchar (100),
established_date DATE,
industry varchar (50),
revenue decimal (15,2) check (revenue>=0), -- revenue must be non-negative 2323232323234.34
employee_count int default 0 check (employee_count >=0), -- Employee count must be non-negative
website varchar (200) unique, -- unique website URL for the company
created_at Timestamp default current_timestamp, -- Timestamp for record creation
updated_at Timestamp default current_timestamp on update current_timestamp, -- Timestamp for record updates
UNIQUE (company_name)
);

drop table Companies;

-- to insert 10 records
INSERT INTO Companies (company_name, headquaters_location, established_date, industry, revenue, employee_count, website)
VALUES
('Tata Consulting Services', 'Mumbai, Maharashtra', '1968-04-01', 'Information Technology', 2000000000, 500000, 'https://www.tcs.com'),
('Reliance Industries Limited', 'Mumbai, Maharashtra', '1960-05-08', 'Conglomerate', 8000000000.00, 200000, 'https://www.ril.com'),
('Infosys', 'Bengaluru, Karnataka', '1981-07-02', 'Information Technology', 13000000000.00, 250000, 'https://www.infosys.com'),
('Wipro', 'Bengaluru, Karnataka', '1945-12-29', 'Information Technology', 800000000.00, 200000, 'https://www.wipro.com'),
('HDFC Bank', 'Mumbai, Maharashtra', '1994-01-05', 'Banking', 1200000000.00, 100000, 'https://www.hdfcbank.com'),
('ICICI Bank', 'Mumbai, Maharashtra', '1994-01-05', 'Banking', 1200000000.00, 100000, 'https://www.icicibank.com'),
('Bharti Airtel', 'New Delhi', '1995-07-06', 'Telecommunications', 1500000000.00, 30000, 'https://www.airtel.in'),
('State Bank of India', 'Mumbai, Maharashtra', '1995-01-01', 'Banking', 200000000.00, 250000, 'https://www.sbi.co.in'),
('Hindustan Unilever Limited', 'Mumbai, Maharashtra', '1933-10-17', 'Consumer Goods', 600000000.00, 40000, 'https://www.hul.co.in'),
('Larsen & Toubro', 'Mumbai, Maharashtra', '1938-02-07', 'Engineering & Construction', 15000000000.00, 50000, 'https://www.larsentoubro.com');


-- 1.Select Queries

-- Select All Records 
Select * from companies;

-- 1. Select Specific Columns 
Select company_name, headquaters_location, revenue from companies;

-- 2. Select companies in a specific industry 
select * from companies where industry = 'Information Technology';

-- 3. Select companies with Revenue Greater than a certain amount
Select * from companies where revenue > 1000000000.00;

-- 4. Select companies Established in a specific year 
Select * from companies where year (established_date)= 1994;

-- 5. Select Companies ordered by revenue in descending order 
select * from companies order by revenue DESC;

-- 6. select companies with a specific headquaters location
Select * from Companies where headquaters_location = 'Mumbai, Maharashtra';

-- 7. Select Companies with employee count greater than a certain number 
Select * from Companies where employee_count > 100000;

-- 8. Select Companies established after a certain date
Select * from Companies where established_date > '2000-01-01';

-- 9. Select Companies with a revenue between two values 
Select * from Companies where revenue between 5000000000.00 and 2000000000;

-- 10. Count the Number of Companies in each industry
Select industry, Count(*) as company_count from companies group by industry;

/* 
the error message you're encountering indicates that MySQL's "safe update mode" is enabled.
This mode prevents you from executing UPDATE or DELETE statement that do not include a WHERE 
clause that uses a key column (like a primary key). This is a safety feature to prevent accidental
updates or deletions of all rows in a table.
*/

-- Disable Safe Update mode temporarily
SET SQL_SAFE_UPDATES=0;

SET SQL_SAFE_UPDATES = 1; -- Re-enable safe updates 

-- 2. Alter Queries 
-- used to modify structure of a table (add column, drop column, change name, make changes in datatype,constraints )

-- 1. Add a new column
Alter Table Companies 
Add column stock_symbol varchar (10);

select * from companies;
 
-- 2. Modify (Change) an existing column 
Alter Table Companies 
Modify Column revenue Decimal(20,2) Check (revenue >= 0);

-- 3. Drop a column
Alter Table Companies 
Drop column stock_symbol;

-- 4. Rename a Column
Alter Table Companies
Change Column headquaters_location location varchar (100);

-- 5, Add a default value to an existing column  
Alter Table Companies 
Alter column employee_count set default 1;

-- 6. Add a new column with a default value 
Alter Table Companies 
Add Column Countries varchar (100) default 'India';

-- 7 Drop a column if it exists (Not Supported)
Alter Table Companies 
Drop Column if exists country;

-- 8. Add a unique Constraint
Alter Table Companies 
Add Constraint unique_website unique (website);

-- 9. Change the data type of a column
Alter Table Companies 
Modify Column established_date DATETIME;

-- 10. Add a Foreign Key Constraint
Alter Table Companies
Add Constraint fk_industry foreign key (industry) references Industries (industry_name);

-- 11. Add a new column
Alter Table Companies 
Add column Ceo varchar (100);

-- 12. Rename a Column 
Alter Table Companies 
Change column Ceo ceo_name varchar (100);

-- 13. 	Add a new column with default value 
Alter Table Companies 
Add column client_name varchar (100) default 'RAM MANOHAR';

-- 3. Delete Queries 
-- drop (complete table)
-- truncate (complete records only)
-- delete (specific records)

-- 1. Delete a specific record
Delete From companies
where company_name = 'HDFC Bank';

select * from companies;
 
SET SQL_SAFE_UPDATES=0; -- disable safety mode

-- 2. Delete records based on a condition
Delete From Companies 
where industry = 'Banking';

-- 3. Delete records with revenue below a certain amount 
Delete from Companies 
where revenue < 500000000.00;

-- 4. Delete records established before a certain date 
Delete from companies
where established_date < '2000-01-01';

-- 5. Delete records with a specific headquaters location
Delete from companies 
where location = 'New Dehli';

-- 6. Delete records with a specific employee count 
delete from companies
where employee_count = 0;

-- 7. Delete records with a specific website 
Delete from companies 
where website = 'https://www.hdfcbank.com';

-- 8. Delete records based on multiple conditions 
delete from companies
where industry = 'Telecommunications' and revenue < 100000000.00;

-- 9. Delete all records (use with caution)
delete from companies;

-- 10. Delete records with a specific name pattern
Delete from companies 
where company_name Like 'H%';

use MNC;
-- 4. Rename query (we can rename any table name, column name)

-- 1. Rename the Database (database remaning is not allowed)
Alter database MNC Rename to MultiNationalCompanies;

-- 2. Rename the Companies Table
Alter table companies rename to MultiNationalCompany;

-- 3. Rename the company_id column
Alter table MultiNationalCompany rename column company_id to id;

select * from MultinationalCompany; 

-- 4. Rename the company_name Column 
Alter table MultinationalCompany rename column company_name to name;

-- 5. Rename the location Column
Alter Table MultinationalCompany Rename Column location to headquaters;

-- 6. Rename Multiple Columns 
Alter table MultinationalCompany 
rename column industry to business_sector,
rename column website to company_website;

select * from MultinationalCompany;

-- 5. update query
-- 1. update a specific records
update MultinationalCompany
Set revenue = 220000000.00, employee_count = 520000
where name = ' Tata Consultancy Services';

-- 2. Update Multiple records 
update MultinationalCompany
set business_sector = 'Telecom'
Where name IN ('Bharti Airtel', 'Reliance Industries Limited');

-- 3. update revenue for all companies in a specific industry
update MultinationalCompany
set revenue = revenue * 1.10 
where business_sector = 'Banking';

-- 4. Update employee count for a specific company
Update MultinationalCompany
set employee_count = 210000
where name = 'Wipro';

-- 5. Update headquaters location
Update MultinationalCompany
set headquaters = 'Gurugram, Haryana'
where name = 'ICICI Bank';

-- 6. Updated Established Date 
Update MultinationalCompany
set established_date = '1994-01-01'
where name = 'ICICI Bank';

-- 7. Update website URL 
Update MultinationalCompany
set company_website = 'https://www.infosys.co.in'
where name = 'Infosys';

-- 8. Update Revenue for Countries with low employee count 
update MultinationalCompany
set revenue = 0 
where employee_count < 50000;

-- 9. Update Industry for a Specific Company
Update MultinationalCompany
set business_sector = 'Consumer Products'
where name = 'Hindustan Unilever Limited';

-- 10. Update Industry for a specific company
Update MultinationalCompany
set revenue = 1600000000.00, business_sector = 'Construction & Engineering'
where name = 'Larsen & Tourbo';

drop table MultinationalCompanies;

-- Table 2 
-- Create the Projects table
CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    budget DECIMAL(15, 2) NOT NULL,
    id INT NOT NULL
);

INSERT INTO Projects (project_name, start_date, end_date, budget, id)  
VALUES 
('Global E-Commerce Platform', '2023-01-01', '2023-12-31', 1000000.00, 1),
('AI Chatbot Integration', '2023-05-15', '2024-03-30', 250000.00, 3),
('Cloud Infrastructure Upgrade', '2022-09-10', '2023-09-10', 500000.00, 4),
('Next-Gen Automotive AI', '2024-01-20', '2024-11-15', 750000.00, 2),
('Pharmaceutical R&D Dashboard', '2023-06-01', '2024-06-01', 450000.00, 9),
('International Payroll System', '2023-03-01', '2023-12-01', 300000.00, 5),
('Supply Chain Automation', '2022-11-01', '2023-10-01', 600000.00, 6),
('Smart Home IoT Suite', '2024-02-01', '2024-12-01', 400000.00, 7),
('Global Customer Loyalty App', '2023-08-10', '2024-08-10', 350000.00, 8),
('Cybersecurity Risk Assessment', '2023-12-01', '2024-09-01', 200000.00, 10);

drop table projects;

-- 1. Select Queries 

-- 1. select all records 
select * from projects;

-- 2. Select Specific Columns
select project_id, project_name, budget from projects;

-- 3. select projects with budget greater than a certain amount 
select * from projects where budget > 10000.00;

-- 4. select projects started in a specific year 
select * from projects where year(start_date)= '2023';

-- 5. select companies ordered by bugdet in descending order 
select * from projects order by budget desc;

-- 6. select projects with specifc project_name
select * from projects where project_name = 'Next-Gen Automotive AI';

-- 7. select projects with bugdet count greater than a certain number 
SELECT * FROM Projects WHERE budget > 50000;

-- 8. select projects started after certain date
select * from projects where start_date > '2022-01-01';

-- 9. select projects with budget between two values 
select * from projects where budget between 100000.00 and 600000.00;

-- 10. count number of projects
select project_name, count(*) as project_name from projects group by project_name;

/*
The error message you're encountering indicates that MySQL's "safe update mode" is enabled. 
This mode prevents you from executing UPDATE or DELETE statements that do not include 
a WHERE clause that uses a key column (like a primary key). This is a safety feature 
to prevent accidental updates or deletions of all rows in a table.
*/
--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates

-- 2. Alter Queries 
-- used to modify structure of a table (add column, drop column, name, datatype, constraints)

-- 1. Add a new column
alter table projects 
add column project_head varchar (100);

select * from projects;

-- 2. modify an existing column
alter table projects 
modify column budget decimal (20,8) check (budget >= 0);

-- 3. drop a column
alter table projects 
drop column project_head;

-- 4. rename a column 
alter table projects 
change column project_name projects varchar (100);

-- 5. add a default value to existing column
alter table projects 
alter column budget set default 10000000;

-- 6. add a new column with default value 
alter table projects 
add column clients varchar (100) default 'ishan';

-- 7. drop a column if it exists (not supported)
alter table projects 
drop column if exists project_name;

-- 8. add a unique constraint 
alter table projects 
add constraint unique_projects unique (projects);

-- 9. Add a new column
alter table projects 
add column revenue varchar (100);

-- 10. change the data type of a column
alter table projects
modify column revenue int;

-- 11. add a foriegn key contraint 
alter table projects 
add constraint fk_business_sector foreign key (business_sector) references MultinationalCompany (business_sector);

-- 3. DELETE Queries
-- drop(complete table(records+attributes) ), 
-- truncate(complete record only), 
-- delete(specific record)

-- 1. delete specific record
delete from projects 
where projects = 'Supply Chain Automation';

select * from projects;

-- 2. delete records based on a condition
delete from projects 
where budget = '500000.00000000';

-- 3. delete records started before a certain date
delete from projects 
where start_date < '2023-01-01';

-- 4. delete records with budget under certain amount 
delete from projects 
where budget > '500000';

-- 5. delete records with specfic names
delete from projects 
where projects = 'Smart Home IoT Suite';

-- 6. delete records with a specific bugdet amount 
delete from projects 
where budget = 0;

-- 7. delete records based on multiple conditions
delete from projects 
where projects = 'Global Customer Loyalty App'and budget > '350000.00000000';

-- 8. delete all records (with caution)
delete from projects;

-- 9. delete records from specific name patterns 
delete from projects 
where projects like 'H%';

use MNC;

-- 4. RENAME Query (we can rename any table name, coulmn name)

select * from project;

-- 1. rename database (database cannot be renamed)
ALTER database mnc rename to mcc;

-- 2. rename the projects table 
alter table projects rename to project;

-- 3. rename the project_id column
alter table project rename column project_id to ids;

-- 4. rename the projects column
alter table project rename column projects to projects_name;

-- 5. rename multiple columns 
alter table project 
rename column start_date to project_assigned, 
rename column end_date to project_submitted;

-- 5. update query

drop table project;

-- 1. update a specific records 
update project
set budget = 10000000000.00
where projects_name = 'Global Customer Loyalty App';

-- 2. update multiple records 
update project
set budget = '4000000.00'
where budget in ('Cloud Infrastructure Upgrade','Cybersecurity Risk Assessment');

-- 3. Update start_date for a Specific projects
UPDATE project
SET project_assigned = '2022-01-01' 
WHERE projects_name = 'Cloud Infrastructure Upgrade';

-- 4. Update end_date for a Specific projects
UPDATE project
SET project_submitted = '2023-01-01' 
WHERE projects_name = 'Cybersecurity Risk Assessment';

-- 5. Update Multiple columns for a Specific project
UPDATE project 
SET budget = 160000000.00, projects_name = 'Global Customer Loyalty App' 
WHERE project_submitted = '2024-08-10';

select * from MultinationalCompany;

-- table 3 
-- Create the Departments table
CREATE TABLE Departments (
department_id INT AUTO_INCREMENT PRIMARY KEY,
department_name VARCHAR(100) NOT NULL,
id INT,
manager_id INT,
FOREIGN KEY (id) REFERENCES MultinationalCompany (id) ON DELETE CASCADE ON UPDATE CASCADE,
UNIQUE (department_name, id) 
); 

INSERT INTO Departments (department_name, id, manager_id)
VALUES  
('Engineering', 1, 1),
('Marketing', 1, 2),
('Human Resources', 2, 3),
('Finance', 2, 4),
('Research & Development', 3, 5),
('IT Support', 3, 6),
('Sales', 4, 7),
('Customer Service', 4, 8),
('Legal', 5, 9),
('Product Management', 5, 10);

1. Select Queries
 
-- Select All records 
Select * from Departments;

-- 1. select specific columns 
select department_name, manager_id from Departments;

-- 2. Select Department in a specific department_name
select * from departments where department_name = 'Customer Service';

-- 3. Select department manager_id with specific id 
select * from departments where manager_id = 5;

-- 4. Select department ordered by manager_id in descending sequence 
select * from departments order by manager_id DESC;

-- 5. Select department with specific department_name
select * from departments where department_name = 'Marketing';

-- 6. Select comapanies with manager_id between two ids
select * from departments where manager_id between 5 and 10;

-- 7. Count the number of Departments 
select manager_id, count(*) as departments_count from departments group by manager_id;

/*
The error message you're encountering indicates that MySQL's "safe update mode" is enabled. 
This mode prevents you from executing UPDATE or DELETE statements that do not include 
a WHERE clause that uses a key column (like a primary key). This is a safety feature 
to prevent accidental updates or deletions of all rows in a table.
*/
--  Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe updates

Select * from Departments;

-- 2. ALTER Queries
-- used to modify structure of a table (add column, drop column, name, datatype, constraints)

-- 1. Add a new column
alter table departments 
add column manager_name varchar (100);

-- 2. Drop a column
alter table departments
drop column manager_name;

-- 3. Rename a column
alter table departments 
change column manager_id managerid varchar (100);

-- 4. Add a new column 
alter table departments
add column revenue int;

-- 5. modify an existing column 
alter table departments 
modify column revenue varchar (100);

-- 6. add a new column with a default value 
alter table departments
add column clients varchar (100) default 'Ishan';

-- 7. add a unique contraint 
alter table departments
add constraint unique_department_name unique (department_name);

-- 8. Change the data type of column 
alter table departments
modify column revenue int;

-- 3. DELETE Queries
-- drop(complete table(records+attributes) ), 
-- truncate(complete record only), 
-- delete(specific record)

Select * from Departments;

-- 1. Delete a specific record
delete from departments 
where department_name = 'Human Resources';

-- 2. Delete records based on a condition
delete from departments 
where department_name = 'Finance';

-- 3. Delete records whose manager_id below certain number
delete from departments 
where managerid < 5;

-- 4. Delete records with a specific department_name 
delete from departments
where department_name = 'IT Support';

-- 5.Delete records with specific id count 
delete from departments 
where department_id = 7;

-- 6.delete records based on multiple conditions
delete from departments
where department_name = 'Legal' and managerid < 9;

-- 7. delete all records (use it with caution)
delete from departments;

-- 8. delete records with specific name pattern
delete from departments
where department_name like 'E%';

use MNC;

-- 4. RENAME Query (we can rename any table name, coulmn name)

Select * from Department;

-- 1. rename the departments table
alter table departments rename to department; 

-- 2. rename the department column 
alter table department rename column managerid to manager_id;

-- 3. rename the department_name column
alter table department rename column department_name to department;

-- 4. rename the cliets column 
alter table department rename column clients to client;

-- 5. rename multiple columns 
alter table department 
rename column revenue to inflow,
rename column department to department_name;

-- 5. UPDATE Query

Select * from Department;

-- 1. update specific record
update department 
set inflow = 2000000 , client = 'Yash'
where department_name = 'IT Support';

-- 2. update multiple records 
update department 
set department_name = 'CEO office'
where department_name in ('Finance');

-- 3. update inflow for all departments 
update department
set inflow = inflow * 1.10
where department_name = 'CEO office';

-- 4. Update clients for departments 
update department 
set client = 'Virat'
where department_name = 'CEO office';

-- 5.update revenue for departments
update department
set inflow = 20000000
where inflow < 3000000;

-- 6.-- 10. Update Multiple Fields for a Specific Company
UPDATE Companies 
SET revenue = 16000000000.00, industry = 'Construction & Engineering' 
WHERE company_name = 'Larsen & Toubro';
-- (this is doubt -- need to ask ma'am)

drop table department;
