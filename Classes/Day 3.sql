-- Single line comment 

/* 
Multi 
Line
Comment 
*/

-- ------------------------------------------------------- Database related Queries---------------------------------------------------------------------------------------------------
-- to create database Travelagent
create database Travelagent;

-- to work on database Travelagent
use Travelagent;

drop database Travelagent;

-- ------------------------------------------------------- Topics of the day ----------------------------------------------------------------------------
-- Data Types, Constraints, Clauses & Commands 

-- Data Types
/*

The data type of column in a MySQL database tells us what kind of values that column can hold,
such as:
-- Integer (whole number)
-- Character (text)
-- Data and Time (dates and times)
-- Binary (raw data)
-- Enum ( a list of allowed values )
-- Set (  a list of allowed values )
-- Time (time of day)
-- Timestamp (date and time )
-- Year (year)
-- Float (decimal values)
-- Double (decimal values)
-- Decimal (decimal values)

Every column in a database table must have a name and a data type
When creating a table, an SQL developer needs to choose the right data type for each column.
This helps MySQL know what kind of data to expect and how to use it.

Datatypes defines the type & size of data to be stored in an attribute. as- id int (1,2,3,....)
In MySQL, there are three main categories of data types: 

String: for text values (eg, names, description ).
Numeric: For numbers (eg, ages, prices)
Data and Time: for dates and times (eg birthdays, timestamps).

Note - Choosing the correct data type is important for ensuring data accuracy and efficient storage.

*/

-- Constaints 
/* 
In MySQL, Constraints and rules applied to column in a database table to enforce data integrity and 
ensure the accuracy and reliability of the data stored in the database. Constraints help maintain 
the quality of the data by restricting the types of data that can be entered into a table and by defining 
relationships between tables

Types of Constraints in SQL
1. NOT NULL 
Ensures that a column cannot have a NULL value.

Example
create table Students (
id int Not NULL,
name varchar(100) NOT NULL
);

2. UNIQUE 
Ensures that all values in a column are unique 

Example 
create table employees (
email varchar (100) UNIQUE 
); 

3. PRIMARY KEY 
Uniquely indentifies each record in a table 
Combines NOT NULL and UNIQUE constraints.

Example:
create table orders (
orderID int primary key,
ProducerName Varchar(100)
);

4. FOREIGN KEY 
Ensures referential integrity between two tables.
A column in one table refers to primary key of another table. 

Examples :
Create table Customers ( 
CustomerID int Primary key 
);

Create table orders (
orderID INT primary key,
CustomerID int, 
Foreign key (CustomerID) references Customer(CustomerID)
);

5. CHECK 
Ensure that all value in a column satisfy a special condition.

Example:
create table products (
productID INT PRIMARY KEY, 
PRICE DECIMAL(10,2) CHECK (PRICE > 0)
);

6. DEFAULT 
Assigns a default value to a column if no value is specified 

Example :
Create table users (
userID int primary key,
status varchar(20) Default 'Active'
);

7. AUTO_INCREMENT
Automatically generates a unique value for a column whenever a new records is inserted 

Example 

Create table Order (
OrderID int auto_increment primary key,
ProducerName varchar (50)
);

8. INDEX 
Improves the performance of queries by creating an index on specified columns.
While not a direct constraints, it enforce rules like uniqueness when combined with UNIQUE. 

Example:
Create Unique Index idx_email ON Employees(Email);

Benefits of using Constraints 

Data Integrity: Ensures valid and consistent data
Error Prevention: Avoids accidential insertion of invalid or duplicate data
Relational Consistency: Maintains proper reltionships between tables
Constraints are essential tools for maintaining a well- structured and reliability database system. 
*/

/* 
In MySQL, commands are insrtructions that you use to interact with the database. 
They allow you to perform various operations such as creating databases and tables,
inserting and updating data, quering data and managing user permissions.
MySQL commands can be categorized into several types based on the functionality:

DDL (Data Definition Language) : Defines Database structures (Create, Alter, Drop, truncate)
DML (Data Manipulation Langauge): Manipulates Data (Insert, Update, Delete)
DQL (Data Query Language): Queries data (Select) 
DCL (Data Control Language): Controls access (Grant, Revoke)
TCL (Trasactional Control Langauge): Manages transactions (Commit, Rollback , Savepoint)

*/

/* 
Clauses are components of a SQL statement that specify the actions to be performed on 
the data in a database. Each clause serves a specify purpose and help to define the 
structure and behaviour of the SQL query. Clauses can be combined to create complex 
queries that retrive, manipulate, or manage data.

the main clauses in MySQL include :
SELECT: Retrives data from a database table 
FROM: Specifies the table(s) to retrieve data from 
WHERE: Filter data based on conditions
GROUP BY: Groups data based on one or more columns 
HAVING: Filters grouped data based on conditions 
ORDER BY: Sorts data in ascending or descending order 
LIMIT: Limits the numbers of rows returned 

*/

/*
Clauses Vs Cammands --

Commands:
These are the main instructions you use to interact with the database
(e.g., SELECT, INSERT, UPDATE, DELETE, CREATE, etc.). They perform specific actions on the database.

Clauses:
These are parts of SQL statements that provide additional details or conditions to the commands
(e.g., WHERE, ORDER BY, GROUP BY, etc.). They help refine the command's operation.

Select * from students where name = 'Kavya';

In essence, commands are the actions you want to perform, while clauses are the conditions
or modifications that help define how those actions should be executed. Understanding both is crucial
for effective database management and querying.

*/

-- Types of Clauses 
/*
1. WHERE Clause 
The WHERE CLAUSE is used to filter records in a table based on specific conditions 
it is typically used in SELECT, UPDATE and DELETE statements 

Syntax 
SELECT column1,column2
FROM table_name
WHERE condition;

2. DISTINCT Clause 
The DISTINCT clause is used to return unique values from a column by removing duplicates 
in the result set.

Syntax: 
SELECT DISTINCT column1
FROM Table_name;

3. FROM Clause
The FROM Clauses specifies the table or tables from which the data is retrieved.
It is a mandatory part of the SELECT statement and can also be used with joins for combining data from multiple tables 

Syntax: 
SELECT column1,column2
FROM table_name;

4. ORDER BY Clause 
The ORDER BY Clause is used to sort the result set in ascending (ASC) or descending order based on one or more columns
syntax: 
SELECT column1, column2
FROM table_name
ORDER BY column_name [ASC|DESC];

5. GROUP BY Clause
The GROUP BY clause groups rows with the same values into summary rows,
often used with aggregate functions (e.g., COUNT, SUM, AVG).

Syntax:
SELECT column1, aggregate_function(column2)  
FROM table_name  
GROUP BY column1;

6. HAVING Clause
The HAVING clause is used to filter grouped data after the GROUP BY clause.
It works similarly to the WHERE clause but is applied to aggregated results.

Syntax:
SELECT column1, aggregate_function(column2)  
FROM table_name  
GROUP BY column1  
HAVING condition; 

7. LIMIT (or FETCH or TOP) Clauses 
The LIMIT CLAUSE is used to restrict the number of rows returned by a query
Different databases may use variations like FETCH or TOP

Syntax:
Select coloumn1,coloumn2
FROM table_name
LIMIT number_of_rows;

8.Join Clause
The JOIN CLAUSE is used to combine rows from two or more table based on related column

Syntax: 
SELECT columns 
FROM table1
JOIN table2
ON table1.common_column = table2.commoon_column;

9. UNION Clause
The UNION clause is used to combine the results of two or more SELECT statements.
Duplicate rows are removed by default.

Syntax:
SELECT column1,column2  
FROM table1  
UNION  
SELECT column1,column2  
FROM table2;  

10.INTO Clause
The INTO clause is used to insert query results into a new table or export data.

Syntax:
SELECT columns  
INTO new_table_name  
FROM table_name  
WHERE condition;  

11. Case Clause 
The CASE Clause allows condtional logic in SQL queries, similar to an if-else statement

Syntax:
Select column1,
CASE
WHEN Condition1 THEN result1
WHEN condition2 THEN result2
ELSE result3
END AS alias_name 
FROM TABLE_NAME;

12. IN CLAUSE
THE BETWEEN CLAUSE filters data within a specified range, inclusive of the boundaries 

Syntax:
SELECT column1, coloumn2
FROM TABLE_NAME 
WHERE colomn_name IN (VALUE1, VALUE2...);

13. Between Clauses 
THE BETWEEN CLAUSE Filters data within specified range, inclusive of the boundaries 

Syntax:
SELECT Column1,Column2
FROM table_name 
WHERE COLUMN_name BETWEEN VALUE1 AND VALUE2;

14. LIKE Clause
The LIKE clause is used to search for a specified pattern in a column. Wildcards include %(any number of
characters) and _(a single character).
example-  Develearn
1. (Start with)Dev%
2. (End with)%earn
3. (contain with)%le%

Syntax:
SELECT column1, column2  
FROM table_name  
WHERE column_name LIKE pattern;  

15. EXISTS Clause
The EXISTS clause checks for the existence of rows in a subquery.
Syntax:
SELECT column1, column2  
FROM table_name  
WHERE EXISTS (subquery);

16. AS CLAUSE
THE AS CLAUSE IS used to provide an alias (Temporary name) for columns or tables,
improving query readabilty

Syntax:
SELECT column name AS alias_name 
FROM table_name;

*/



/*
SELECT Query:
The SELECT statement is used to retrieve data from a databased table
It allows you to specify the coloumns you want to fetch and apply conditions to filter the results 

Syntax 
Select Colomn1,Column2,..
FROM table_name
WHERE condition;
*/

-- ------------------------------ Table Queries ------------------------------------------------------------------------


-- Data Definition Language (DDL) {Create,Alter,Drop,Truncate,Rename}
-- Data Manipulation Language (DML) {Insert, Update, Delete}
-- Data Query Language (DQL) {select query}
-- Comment

create database travelagent21;

use travelagent21;

-- Table 1 
-- Create the countries table 
CREATE TABLE countries (
-- Unique identifier for each country
id int primary key auto_increment,
-- name of the country 
NAME VARCHAR (100) not null UNIQUE,
-- dESCRIPTION of the COUNTRY 
description TEXT,
-- Capital city of the country
capital_city VARCHAR(50) NOT NULL,
-- Currency of the country
currency VARCHAR(20) NOT null
);

-- Insert records into the countries table 
INSERT INTO countries (name, description, capital_city, currency) VALUES
('United States', 'A country in North America known for its diverse culture and economy.', 'Washington D.C.', 'USD'),
('Canada', 'A country in North America known for its natural beauty and multicultural society.', 'Ottawa', 'CAD'),
('United Kingdom', 'A country in Europe consisting of England, Scotland, Wales, and Northern Ireland.', 'London', 'GBP'),
('Australia', 'A country and continent surrounded by the Indian and Pacific oceans.', 'Canberra', 'AUD'),
('Germany', 'A country in Central Europe known for its history, culture, and engineering.', 'Berlin', 'EUR'),
('France', 'A country in Western Europe known for its art, fashion, and cuisine.', 'Paris', 'EUR'),
('Japan', 'An island country in East Asia known for its technology and traditional culture.', 'Tokyo', 'JPY'),
('India', 'A country in South Asia known for its rich history and diverse culture.', 'New Delhi', 'INR'),
('Brazil', 'The largest country in South America known for its Amazon rainforest and carnival festival.', 'Brasília','BRL'),
('South Africa', 'A country at the southern tip of Africa known for its varied topography and cultural diversity.', 'Pretoria', 'ZAR');


-- Select queries
-- 1. Select All Columns from the Countries Table
SELECT* From countries;

-- select queries 

-- 1. select All coloumns from the countries table 
SELECT * From Countries;

-- 2 Select Specific Columns 
Select Name, capital_city from Countries;

-- 3. Select a country by Name 
Select * From countries Where name = 'India';

-- 4. Select Countries  with Specific currency 
Select * from countries Where currency = 'EUR';

-- 5. Count the Number of Countries 
select Count(*) as total_countries from countries;

-- 6. Select countries with description Containing a specific word 
Select * From Countries Where description Like '%culture%';

-- 7. Select Countries ordered by Name 
Select * From countries order by name;

-- 8. Select  countries with a capital city starting with 'B'
Select * FROM countries where capital_city LIKE 'B%';

-- 9. Select Countries with more than 50 characters in description 
Select * From countries where char_length (description) > 50;

-- 10 Select the First 5 Countries 
select * from countries Limit 5;

-- 11 Select Countries with a currency Name longer than 3 Characters 
Select * from countries Where char_length(currency) > 3;

-- 12 Select Countries with a description that does not contain 'A'
Select * from countries where description NOT LIKE '%A%';

-- 13 Select the country with longest name 
Select * from countries order by char_length(name) DESC LIMIT 1;

-- 14 SELECT Countries with a description containing 'known'
Select * from countries Where description LIKE '%Known%';

-- 15 Select countries with a capital city that is not 'Ottawa'
Select * from countries where capital_city != 'Ottawa';

-- 16 Select the Total Number of Unique Currencies 
Select Count(Distinct currency) as unique_currencies From Countries;

-- 17. Select Countries with Name that Have More that 6 Characters
Select * From countries where char_length(name) > 6;

-- 18. Select Countries ordered by currency
Select * From countries order by currency;

-- 19 Select Countries with a description that is not Null
Select * From Countries Where Description IS not null;

-- 20 Select countries with a capital city containing 'a'
Select * from countries where capital_city LIKE '%A%';

-- -------------------------------------------------------------

-- 21 Select specific columns 
Select name, currency from Countries;

-- 22 Select countries with a name containing 'i'
Select * from countries where name like '%I%';

-- 23 Select Countries ordered by discription 
Select * From countries order by description;

-- 24 Select Countries with Name that have less than 4 Characters
Select * from countries where char_length(name) < 4;

-- 25 Select Countries with a description that does not contain 'largest'
Select * from countries where description not like '%largest%';

-- 26 Select country with specific currency 'USD'
Select * from countries where currency = 'USD';

-- 27 Select the country with shortest name 
Select * from countries order by char_length(name) LIMIT 3;

-- 28 Select the last 2 Countries 
select * from countries Limit 2;

-- 29 Select Specific Columns 
Select Name, CURRENCY from Countries;

-- 30. Select Countries with more than 20 characters in description 
Select * From countries where char_length (description) > 20;

-- 31 Select specific columns 
Select DESCRIPTION, currency from Countries;

-- 32. Count the Number of CURRENCIES 
select Count(*) as total_CURRENCIES  from countries;

-- 33. Select Countries with a description that does not contain 'largest'
Select * from countries where description not like '%largest%';

-- 34. Select countries with a capital city that is not 'Berlin'
Select * from countries where capital_city != 'Berlin';

-- 35. Select the Total Number of Unique NAME 
Select Count(Distinct NAME) as unique_NAME From Countries;

-- 36. Select country with specific capital_city 'NEW DELHI'
Select * from countries where capital_city = 'Nee dehli';

-- 37. Select countries with a currency containing 'EUR'
Select * from countries where currency LIKE '%EUR%';

-- 38. Select Countries with a description that is Null
Select * From Countries Where Description IS null;

-- 39. Select the country with longest description 
Select * from countries order by char_length(description) DESC LIMIT 5;

-- 40. Select  countries with a currency starting with 'E'
Select * FROM countries where currency LIKE 'E%';