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

insert