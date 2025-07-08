/* 

what are operations in MySQL?

Operations in MySQL are special symbols or keywords used to perform operations on one or more operands 
(values, expression, or feilds ) in a MySQL query. They are essential for forming conditions, manipulating data,
'and retrieving desired results from database. Operations help in communications, comparisions, logicaL evaluations 
string concatenations, and much more.


1. Arithmethic Operators

+: Addition
-: Substraction
*: Multiplication
/: Division
%: Modulas (remainder after division)
DIV: Integer division (returns integer part of division )
MOD: Modulas (same as % in Mysql)

2. Comparison Operators 

=: Equal to
<> or !=: Not equal to 
>: Greater than
<: Less than 
>=: Greater than or equal to 
<=: Less than or equal to
LIKE: Pattern matching using wildcards (% and _)
NOT LIKE: Pattern not matching 
REGEXP: Regular  expression matching 
NOT REGEXP: Regular expression not matching 

3. Logical Operators 

AND: Logical AND (true if both conditions are true)
OR: Logical OR (true if at least one condition is true)
NOT: Logical NOT (negates the condition)
XOR: Logical exclusive OR (true if only one condition is true)

4. Assignment Operators

=: Assign a value to a variable or column 
:=: Assign a value to user - defined variable 
+=: Addition assignment (not standard in MySQL but used in some cases)
-=: Subtraction assignment 
*=: Multiplication assignment 
/=: Division assignment 
%= : Modulas Assignment 
DIV: Integer Division Assignment 
MOD: Modulas assignment 

5. Bitwise Operators 

&: Bitwise AND
|: Bitwise OR
^: Bitwise XOR 
~: Bitwise NOT (inverts the bits)
<<: Left shift 
>>: Right shift 

6. String Operators 

CONCAT (): Concatenate Strings (e.g., CONCAT ('Hello', 'World'))
||: String concatenation ( alternative to CONCAT in some MySQL versions)

7. Other Operators

IN: Membership test (checks if a value exists in a list or subquery)
NOT IN: Membership test (checks if a value does not exist in a list or subquery)
BETWEEN: Range test (checks if a value is in within a range )
NOT BETWEEN: Range test (checks if a value is outside a range)
IS NULL: Null test (checks if a value is not NULL)
EXISTS: Subquery test ( true if subquery returns any rows)
NOT EXISTS: Subquery test (true if subquery returns no rows )

Why Are Operators Important in MySQL?
Simplify Query Logic: Operators make it easy to specify conditions and manipulate data directly in SQL statements.
Dynamic Data Retrieval: Help fetch specific records based on comparisions and logical conditions.
Data Manipulation: Arithmetic and String operators allow dynamic computation and formatting of data.
Effective Filtering: Operators like LIKE and BETWEEN enable precise filtering for large datasets.

These operators cover a wide range of functionality, from basic arithmethic to advanced logical and 
string manipulations, enabling efficient data handling and quering in MySQL.

*/

-- Create the airline database if it does not already exist 

create database if not exists airline123;

use airline123; -- Set the context  to the airline database 

drop database airline123; -- to remove database completely 

-- ------------------------------------------------- Table Queries ------------------------------------------------------------------------------------

-- Data Definition Language (DDL) {Create, Alter, Drop, Truncate, Rename, Comment}
-- Data Manipulation Language (DML) {Insert, Update, Delete}
-- Data Query Language (DQL) {select query}

-- Table 1 Create Flights table 
create table flights (
Flight_ID int primary key, -- unique identifier for each flight (primary key)
flight_number varchar (10) NOT NULL, -- Flight number (e.g., AA123) (Not Null)
Departure_Airport varchar (100) NOT NULL, -- Name of the departure airport (not null)
Arrival_Airport varchar (100) NOT NULL, -- Name of the arrival airport (not null)
Departure_time DATETIME NOT NULL, -- Scheduled departure time (NOT NULL)
Arrival_time DATETIME NOT NULL, -- Scheduled arrival time (NOT NULL)
Flight_Duration INT NOT NULL, -- Duration of the flight in minutes (NOT NULL)
Seats_Available INT NOT NULL CHECK (Seats_available >= 0),
-- Number of available seats (NOT NULL, must be non-negative)
Aircraft_Type varchar (50) NOT NULL, -- Type of aircraft used for the flight (not null)
Status ENUM ('On Time', 'Delayed', 'Cancelled') NOT NULL Default 'ON Time'
-- Current status of the flight (NOT Null, default is 'on time')
);

-- Insert records into Flights table 

insert into flights (Flight_ID, flight_number, Departure_Airport, Arrival_Airport , Departure_time , Arrival_time, Flight_Duration , Seats_Available 
Aircraft_Type ,Status )
Values 
(1, 'AI101', 'Dehli (DEL)', 'Mumbai (BOM)', '2023-10-01 06:00:00', '2023-10-01 08:00:00', 120,50, 'Boeing 737', 'On Time'),
(2, 'AI102', 'Mumbai (BOM)', 'Delhi (DEL)', '2023-10-01 09:00:00', '2023-10-01 11:00:00', 120, 60, 'Airbus A320', 'On Time'),
(3, 'AI103', 'Delhi (DEL)', 'Banglore (BLR)', '2023-10-01 07:00:00', '2023-10-01 09:30:00', 150, 70, 'Boeing 737', 'On Time'),
(4, 'AI104', 'Banglore (BLR)', 'Delhi (DEL)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 80, 'Airbus A320', 'On Time'),
(5, 'AI105', 'Delhi (DEL)' , 'Chennai (MAA)', '2023-10-01 08:00:00', '2023-10-01 10:30:00', 150, 40, 'Boeing 737', 'On Time'),
(6, 'AI106', 'Chennai (MAA)', 'Delhi (DEL)', '2023-10-01 11:00:00', '2023-10-01 13:30:00', 150, 50, 'Airbus A320', 'On Time'),
(7, 'AI107', 'Delhi (DEL)', 'Kolkata (CCU)', '2023-10-01 09:00:00', '2023-10-01 11:30:00', 150, 30, 'Boeing 737', 'On Time'),
(8, 'AI108', 'Kolkata (CCU)', 'Delhi (DEL)', '2023-10-01 12:00:00', '2023-10-01 14:30:00', 150, 20, 'Airbus A320', 'On Time'),
(9, 'AI109', 'Delhi (DEL)', 'Hyderabad (HYD)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 60, 'Boeing 737', 'On Time'),
(10, 'AI110', 'Hyderabad (HYD)', 'Delhi (DEL)', '2023-10-01 13:00:00', '2023-10-01 15:30:00', 150, 50, 'Airbus A320', 'On Time'),
(11, 'AI111', 'Delhi (DEL)', 'Pune (PNQ)', '2023-10-01 14:00:00', '2023-10-01 16:00:00', 120, 40, 'Boeing 737', 'On Time'),
(12, 'AI112', 'Pune (PNQ)', 'Delhi (DEL)', '2023-10-01 17:00:00', '2023-10-01 19:00:00', 120, 30, 'Airbus A320', 'On Time'),
(13, 'AI113', 'Delhi (DEL)', 'Ahmedabad (AMD)', '2023-10-01 15:00:00', '2023-10-01 17:00:00', 120, 50, 'Boeing 737', 'On Time'),
(14, 'AI114', 'Ahmedabad (AMD)', 'Delhi (DEL)', '2023-10-01 18:00:00', '2023-10-01 20:00:00', 120, 40, 'Airbus A320', 'On Time'),
(15, 'AI115', 'Delhi (DEL)', 'Jaipur (JAI)', '2023-10-01 16:00:00', '2023-10-01 17:30:00', 90,  60, 'Boeing 737', 'On Time');

select * from flights;

 -- Select, Alter, delete & update Queries
 
 /*
 1. SELECT Query
The SELECT statement is used to retrieve data from a database table. 
It allows you to specify the columns you want to fetch and apply conditions to filter the results.

Syntax-

SELECT column1, column2, ...  
FROM table_name  
WHERE condition;  

2. ALTER Query
The ALTER statement is used to modify the structure of an existing table, 
such as adding, deleting, or modifying columns.
The ALTER query changes the table structure, not the data.

Syntax-

ALTER TABLE table_name  
ADD column_name datatype;  
-- or  
ALTER TABLE table_name  
DROP COLUMN column_name;  
-- or  
ALTER TABLE table_name  
MODIFY column_name new_datatype;  

3. DELETE Query
The DELETE statement is used to remove rows from a table based on a specified condition.

Syntax- 

DELETE FROM table_name  
WHERE condition;  

4. UPDATE Query
The UPDATE statement is used to modify existing records in a table.

Syntax:

UPDATE table_name  
SET column1 = value1, column2 = value2, ...  
WHERE condition;  


 */
 
-- select all records from flights table
select * from flights;

-- select flights that are delayed
select * from flights where status = 'delayed';

-- select distinct aircraft types used in flights
select distinct aircraft_type from flights;
 
-- select all flights ordered by departure_time
select * from flights order by departure_time;

-- count the number of flights per status
select status, count(*) as numberofflights 
from flights 
group by status;

-- select statuses with more than 5 flights
select status, count(*) as numberofflights 
from flights 
group by status 
having count(*) > 5; 

-- select flights from a specific departure airport
select * from flights where departure_airport = 'delhi (del)';

-- select flights with more than 50 seats available
select * from flights where seats_available > 50;

-- select flights ordered by arrival time
select * from flights order by arrival_time;

-- select flights with a duration greater than 120 minutes
select * from flights where flight_duration > 120;

-- select distinct aircraft types
select distinct aircraft_type from flights;

-- select flights with arrival time after a specific date
select * from flights where arrival_time > '2023-10-01 12:00:00';

-- select flights with a specific flight number
select * from flights where flight_number = 'ai101';

-- 2. update queries

-- update the number of available seats for a specific flight
update flights 
set seats_available = 49
where flight_id = 2;

select * from flights;

-- update the status of a flight
update flights set status = 'cancelled' where flight_id = 1;

-- update the arrival airport for a specific flight
update flights set arrival_airport = 'chennai (maa)' where flight_id = 3;

-- update the flight duration for a specific flight
update flights set flight_duration = 130 where flight_id = 4;

-- update the aircraft type for a specific flight
update flights set aircraft_type = 'boeing 777' where flight_id = 5;

-- update the departure time for a specific flight
update flights set departure_time = '2023-10-01 07:00:00' where flight_id = 6;

-- update multiple fields for a specific flight
update flights set seats_available = 60, status = 'on time' where flight_id = 7;

-- update status for all delayed flights
update flights set status = 'on time' where status = 'delayed';

-- update the flight number for a specific flight
update flights set flight_number = 'ai201' where flight_id = 8;

-- update the departure airport for multiple flights
update flights set departure_airport = 'delhi (del)' where arrival_airport = 'mumbai (bom)';

-- 3. delete queries

-- delete a specific flight
delete from flights 
where flight_id = 2;

-- delete all delayed flights
delete from flights where status = 'delayed';

-- delete flights with no available seats
delete from flights where seats_available = 0;

-- delete a flight by flight number
delete from flights where flight_number = 'ai101';

-- delete flights departing before a specific date
delete from flights where departure_time < '2023-10-01 00:00:00';

-- delete all flights to a specific destination
delete from flights where arrival_airport = 'jaipur (jai)';

-- delete flights with a duration less than a specific value
delete from flights where flight_duration < 90;

-- delete flights with a specific status
delete from flights where status = 'cancelled';

-- delete flights with a specific aircraft type
delete from flights where aircraft_type = 'airbus a320';

-- delete all flights with less than 30 seats available
delete from flights where seats_available < 30;

-- 4. alter queries

-- add a new column for flight's terminal
alter table flights 
add column terminal varchar(10);

-- drop the terminal column from flights table
alter table flights 
drop column terminal;

-- add a new column for flight's airline
alter table flights add column airline varchar(50);

-- change the data type of flight_number
alter table flights modify flight_number varchar(15);

-- rename the arrival_airport column
alter table flights rename column arrival_airport to destination_airport;

-- add a default value for seats_available
alter table flights alter column seats_available set default 100;

-- rename the flights table
alter table flights rename to flight_schedules;

-- 4. alter queries

-- add a new column for flight's terminal
alter table flights 
add column terminal varchar(10);

-- drop the terminal column from flights table
alter table flights 
drop column terminal;

-- add a new column for flight's airline
alter table flights add column airline varchar(50);

-- change the data type of flight_number
alter table flights modify flight_number varchar(15);

-- rename the arrival_airport column
alter table flights rename column arrival_airport to destination_airport;

-- add a default value for seats_available
alter table flights alter column seats_available set default 100;

-- rename the flights table
alter table flights rename to flight_schedules;

-- 5. add & drop constraints queries
-- add a check constraint to ensure flight_duration is positive
alter table flights 
add constraint chk_flight_duration check (flight_duration > 0);

-- drop the check constraint on flight_duration
alter table flights 
drop constraint chk_flight_duration;

-- add a check constraint for flight duration
alter table flights add constraint chk_flight_duration check (flight_duration > 0);

-- drop the check constraint on flight duration
alter table flights drop constraint chk_flight_duration;

-- add a unique constraint on flight_number
alter table flights add constraint unique_flight_number unique (flight_number);

-- add a check constraint for seats available
alter table flights add constraint chk_seats_available check (seats_available >= 0);

-- drop the check constraint on seats available
alter table flights drop constraint chk_seats_available;

-- add a foreign key constraint (if applicable)
alter table flights add constraint fk_airport foreign key (departure_airport) references airports(airport_name);

-- drop the foreign key constraint
alter table flights drop constraint fk_airport;

-- add a not null constraint to flight_number
alter table flights modify flight_number varchar(10) not null;

-- drop the not null constraint from flight_number
alter table flights modify flight_number varchar(10);

-- add a default constraint for status
alter table flights alter column status set default 'on time';

-- drop the default constraint for status
alter table flights alter column status drop default;

-- add a unique constraint on aircraft_type
alter table flights add constraint unique_aircraft_type unique (aircraft_type);

-- drop the unique constraint on aircraft_type
alter table flights drop constraint unique_aircraft_type;

/*
Using Information Schema Views:

Most relational database management systems(RDBMS) provides system views that contain 
metadata about the database objects, including constraints. You can query these views 
to find constraint names. 
*/

-- to get complete information about constraints and its name.
SELECT CONSTRAINT_NAME, TABLE_NAME, CONSTRAINT_TYPE
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Flights';


/*
Naming Conventions:

If you are creating constraints, it's a good practice to use a consistent naming convention.
This can help you easily identify constraints later. A common convention is to use the format: 

For CHECK constraint: chk_<table>_<column>
For UNIQUE constraints: unique_<table>_<column>
For FOREIGN KEY constraints: fk_<table>_<referenced_table>

Example of Adding constraints with Naming conventions

ALTER TABLE Flights
ADD CONSTRAINT chk_flight_duration CHECK (flight_duration > 0);
*/


SELECT 
  CONSTRAINT_NAME,
  TABLE_NAME,
  CONSTRAINT_TYPE
FROM 
information_schema.TABLE_CONSTRAINTS
WHERE 
TABLE_SCHEMA = 'airline123' AND
TABLE_NAME = 'Flights';

SELECT 
  COLUMN_NAME
  FROM 
  information_schema.COLUMNS
  WHERE 
  TABLE_SCHEMA = 'airline123' AND
  TABLE_NAME = 'Flights';
  
  -- Fetch datatytpes and properties of each column in the flight table 
  SELECT 
     COLUMN_NAME,
     DATA_TYPE,
     CHARACTER_MAXIMUM_LENGTH,
     IS_NULLABLE
FROM
   information_schema.COLUMNS
   WHERE 
   TABLE_SCHEMA = 'airline123' AND
   TABLE_NAME = 'Flights';
   
   -- `List all indexes on the Flights table to understand performance optimization 

SELECT 
   INDEX_NAME, 
   COLUMN_NAME,
   NON_UNIQUE
 FROM 
 information_schema.STATISTICS
 WHERE 
 TABLE_SCHEMA = 'airline123' AND
 TABLE_NAME = 'Flights';
 
 -- List all tables in airline123 schema to explore the database structure 
 SELECT 
 TABLE_NAME
 FROM
 information_schema.TABLES
 WHERE 
 TABLE_SCHEMA = 'airline123';
 
 
 -- operators
 /*
 In MySQL, oprators are special symbols or keywords that are used to perform operations on one or more
 opreands(values or variables). Operators are fundamental to constructing SQL queries, as they allow 
 you to manipulate data, compare values, and perform calculations. MySQL supports several types of operators,
 which can be catageorized as follows: 
 
 */
 
 -- Arithmetic Operators: +, -, *, /, %
 
 -- Calculate the total flight duration for flight AI101, adding 30 minutes for a layover
 SELECT Flight_number, Flight_duration + 30 AS Total_duration 
 FROM Flights
 WHERE Flight_number = 'AI101';
 
 -- Calculate the remaining seats after booking 10 seats for Flight AI102
 SELECT Flight_number, Seats_available - 10 AS Remaining_seats 
 FROM Flights
 WHERE Flight_number = 'AI102';
 
 -- Calculate the total available seats for all flights by summing the seats__available column
 SELECT SUM(Seats_available) AS Total_available_seats
 FROM Flights;
 
 -- Calculate the average flight duration across all flights
 SELECT AVG(Flight_duration) AS Average_flight_duration
 FROM Flights;
 
 -- Calculate the flight duration in hours for each flight 
 SELECT Flight_number, Flight_duration / 60 AS Duration_hours
 FROM Flights;
 
 -- Calculate the percentage of available seats for each flight based on a total of 100 seats 
 SELECT Flight_number, (Seats_available / 100.0) * 100 AS Percentage_available 
 FROM Flights;
 
 -- Calculate the remaining flight duration after 30 minutes for each flight 
 SELECT Flight_number, Flight_duration - 30 AS Remaining_duration
 FROM Flights
 WHERE Flight_duration > 30;
 
 -- Calculate the total number of seats for flights that have more than 50 availabe seats 
 SELECT SUM(Seats_available) AS Total_seats 
 FROM Flights
 WHERE seats_available > 50;
 
 -- Calculate the total durations of flight that are delayed
 SELECT SUM(Flight_duration) AS Toatl_duration_delayed
 FROM Flights
 WHERE status = 'Delayed';
 
 -- Calculate the total flight time for flights departing from Delhi
 SELECT SUM(Flight_duration) AS Total_flight_time
 FROM Flights
 WHERE Departure_airport = 'Delhi (DEL)';
 
 -- Assuming a hypothetical cost of $2 per minute, calculate total cost for each flight
SELECT Flight_Number, 
       Flight_Duration * 2 AS Total_Cost 
FROM Flights;

 
 -- Calculate the total available seats for flights with a duration greater than 120 minutes
SELECT SUM(Seats_Available) AS Total_Seats_Over_120 
FROM Flights 
WHERE Flight_Duration > 120;

-- Calculate the remaining seats after booking 5 seats for each flight 
SELECT Flight_number, seats_available - 5 AS Remaining_after_booking
FROM Flights;

-- Calculate total revenue from flights assuming a ticket price of $100 per seat
SELECT Flight_Number, 
       Seats_Available * 100 AS Total_Revenue 
FROM Flights;

-- Calculate the total flight duration for flights arriving in Mumbai
SELECT SUM(Flight_Duration) AS Total_Duration_Mumbai 
FROM Flights 
WHERE Arrival_Airport = 'Mumbai (BOM)';

-- Calculate the total number of available seats for flights that are on time
SELECT SUM(Seats_Available) AS Total_Seats_On_Time 
FROM Flights 
WHERE Status = 'On Time';

-- Calculate the total flight duration for flights that have more than 100 available seats
SELECT SUM(Flight_Duration) AS Total_Duration_Over_100 
FROM Flights 
WHERE Seats_Available > 100;

-- Calculate the percentage of flights that are delayed compared to total flights
SELECT (COUNT(CASE WHEN Status = 'Delayed' THEN 1 END) * 100) / COUNT(*) AS Percentage_Delayed 
FROM Flights;

-- Calculate the total number of seats for flights with a duration of less than 30 minutes
SELECT SUM(Seats_Available) AS Total_Seats_Under_30 
FROM Flights 
WHERE Flight_Duration < 30;

-- Comparison operators: =, <, >, <=, >=, != or <> (not equal to)

-- Select all details for the flight with Flight_Number 'AI101'
SELECT * 
FROM Flights 
WHERE Flight_Number = 'AI101';  -- Using '=' operator

-- Select all flights with a duration less than 120 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration < 120;  -- Using '<' operator

-- Select all flights with a duration greater than 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration > 150;  -- Using '>' operator

-- Select all flights with a duration less than or equal to 90 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration <= 90;  -- Using '<=' operator

-- Select all flights with a duration greater than or equal to 180 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration >= 180;  -- Using '>=' operator

-- Select all flights that are not arriving at Delhi (DEL)
SELECT * 
FROM Flights 
WHERE Arrival_Airport != 'Delhi (DEL)';  -- Using '!=' operator

-- Select all flights where the status is not equal to 'Cancelled'
SELECT * 
FROM Flights 
WHERE Status <> 'Cancelled'; -- Using '<>' operator

-- Select all flights departing from Mumbai (BOM)
SELECT * 
FROM Flights 
WHERE Departure_Airport = 'Mumbai (BOM)';  -- Using '=' operator

-- Select all flights that have more than 50 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available > 50;  -- Using '>' operator

-- Select all flights that have fewer than 30 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available < 30;  -- Using '<' operator

-- Select all flights that have exactly 60 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available = 60;  -- Using '=' operator

-- Select all flights that do not have a duration of 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration != 150;  -- Using '!=' operator

-- Select all flights with a duration greater than 120 and less than 180 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration > 120 AND Flight_Duration < 180;  -- Using '>' and '<' operators

-- Select all flights that are currently 'On Time'
SELECT * 
FROM Flights 
WHERE Status = 'On Time';  -- Using '=' operator

-- Select all flights that arrive after October 1, 2023
SELECT * 
FROM Flights 
WHERE Arrival_Time > '2023-10-01 00:00:00';  -- Using '>' operator

-- Select all flights that depart before October 1, 2023
SELECT * 
FROM Flights 
WHERE Departure_Time < '2023-10-01 00:00:00';  -- Using '<' operator

-- Select all flights that have seats available greater than or equal to 40
SELECT * 
FROM Flights 
WHERE Seats_Available >= 40;  -- Using '>=' operator

-- Select all flights that have seats available less than or equal to 20
SELECT * 
FROM Flights 
WHERE Seats_Available <= 20;  -- Using '<=' operator

-- Select all flights with a duration between 60 and 120 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration >= 60 AND Flight_Duration <= 120;  -- Using '>=' and '<=' operators

-- Select all flights where the status is not equal to 'Delayed'
SELECT * 
FROM Flights 
WHERE Status <> 'Delayed';  -- Using '<>' operator


-- Table-2 Create Passengers table
CREATE TABLE Passengers (
  Passenger_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each passenger (Primary Key, Auto Increment)
  First_Name VARCHAR(50) NOT NULL, -- Passenger's first name (Not Null)
  Last_Name VARCHAR(50) NOT NULL, -- Passenger's last name (Not Null)
  Email VARCHAR(100) UNIQUE NOT NULL, -- Passenger's email address (Not Null, must be unique)
  Phone_Number VARCHAR(15), -- Passenger's phone number (Optional)
  Date_of_Birth DATE NOT NULL, -- Passenger's date of birth (Not Null)
  Frequent_Flyer_Number VARCHAR(20) UNIQUE, -- Frequent flyer number (Optional, must be unique)
  Nationality VARCHAR(50) NOT NULL -- Nationality of the passenger (Not Null)
);


-- Insert Records into Passengers Table
INSERT INTO Passengers (First_Name, Last_Name, Email, Phone_Number, Date_of_Birth, Frequent_Flyer_Number, Nationality)
VALUES 
('Rahul', 'Sharma', 'rahul.sharma@example.com', '9876543210', '1990-01-15', 'FF001', 'India'),
('Priya', 'Verma', 'priya.verma@example.com', '8765432109', '1992-02-20', 'FF002', 'India'),
('Amit', 'Kumar', 'amit.kumar@example.com', '7654321098', '1988-03-25', 'FF003', 'India'),
('Sneha', 'Reddy', 'sneha.reddy@example.com', '6543210987', '1995-04-30', 'FF004', 'India'),
('Vikram', 'Singh', 'vikram.singh@example.com', '5432109876', '1985-05-05', 'FF005', 'India'),
('Neha', 'Gupta', 'neha.gupta@example.com', '4321098765', '1993-06-10', 'FF006', 'India'),
('Ravi', 'Patel', 'ravi.patel@example.com', '3210987654', '1987-07-15', 'FF007', 'India'),
('Anjali', 'Mehta', 'anjali.mehta@example.com', '2109876543', '1991-08-20', 'FF008', 'India'),
('Karan', 'Bansal', 'karan.bansal@example.com', '1098765432', '1989-09-25', 'FF009', 'India'),
('Pooja', 'Joshi', 'pooja.joshi@example.com', '0987654321', '1994-10-30', 'FF010', 'India'),
('Suresh', 'Nair', 'suresh.nair@example.com', '9876543210', '1986-11-05', 'FF011', 'India'),
('Tina', 'Chopra', 'tina.chopra@example.com', '8765432109', '1992-12-10', 'FF012', 'India'),
('Mohit', 'Agarwal', 'mohit.agarwal@example.com', '7654321098', '1988-01-15', 'FF013', 'India'),
('Ritika', 'Sethi', 'ritika.sethi@example.com', '6543210987', '1995-02-20', 'FF014', 'India'),
('Deepak', 'Kohli', 'deepak.kohli@example.com', '5432109876', '1985-03-25', 'FF015', 'India');

select * from Passengers;

truncate table passengers;

drop table passenger_list;


-- Select all passengers
SELECT * FROM Passengers;

-- Select passengers born after 1990
SELECT * FROM Passengers WHERE Date_of_Birth > '1990-01-01';

-- Select distinct nationalities
SELECT DISTINCT Nationality FROM Passengers;

-- Select passengers whose email ends with '@example.com'
SELECT * FROM Passengers WHERE Email LIKE '%@example.com';


-- Add a new column for gender
ALTER TABLE Passengers ADD COLUMN Gender VARCHAR(10);

-- Add a default nationality as 'India'
ALTER TABLE Passengers ALTER COLUMN Nationality SET DEFAULT 'India';

-- Modify the data type of Phone_Number
ALTER TABLE Passengers MODIFY Phone_Number VARCHAR(20);

-- Add a CHECK constraint to ensure valid phone number length (min 10 chars)
ALTER TABLE Passengers ADD CONSTRAINT chk_phone_length CHECK (CHAR_LENGTH(Phone_Number) >= 10);


-- Rename the column 'Date_of_Birth' to 'DOB'
ALTER TABLE Passengers RENAME COLUMN Date_of_Birth TO DOB;

-- Rename the column 'Phone_Number' to 'Contact_Number'
ALTER TABLE Passengers RENAME COLUMN Phone_Number TO Contact_Number;

-- Rename the table 'Passengers' to 'Passenger_List'
ALTER TABLE Passengers RENAME TO Passenger_List;

SET SQL_SAFE_UPDATES = 0;

-- Update nationality for a specific passenger
UPDATE Passenger_List SET Nationality = 'USA' WHERE Passenger_ID = 3;

-- Update email for a specific passenger
UPDATE Passenger_List SET Email = 'rahul.new@example.com' WHERE Passenger_ID = 1;

-- Set Gender for all passengers as 'Unknown' (assuming Gender column exists)
UPDATE Passenger_List SET Gender = 'Unknown';

-- Update Contact Number for a specific passenger
UPDATE Passenger_List SET Phone_Number = '9999999999' WHERE Passenger_ID = 5;

-- Update frequent flyer number for passengers without one
UPDATE Passenger_List SET Frequent_Flyer_Number = 'FF999' WHERE Frequent_Flyer_Number IS NULL;



-- Delete a passenger with a specific email
DELETE FROM Passenger_List WHERE Email = 'karan.bansal@example.com';

-- Delete all passengers born before 1988
DELETE FROM Passenger_List WHERE DOB < '1988-01-01';

-- Delete passengers with NULL Frequent Flyer Numbers
DELETE FROM Passenger_List WHERE Frequent_Flyer_Number IS NULL;

-- Delete passengers with nationality not equal to 'India'
DELETE FROM Passenger_List WHERE Nationality <> 'India';


-- Arithmetic operators 


-- Calculate the age in years of each passenger based on their date of birth
SELECT Passenger_ID, First_Name, Last_Name, 
       FLOOR(DATEDIFF(CURDATE(), Date_of_Birth) / 365.25) AS Age 
FROM Passengers;

-- Add 1000 to each Passenger_ID for internal mapping or display purposes
SELECT Passenger_ID, Passenger_ID + 1000 AS New_Passenger_ID 
FROM Passengers;

-- Calculate the number of months since the passenger was born
SELECT Passenger_ID, TIMESTAMPDIFF(MONTH, Date_of_Birth, CURDATE()) AS Months_Since_Birth 
FROM Passengers;

-- Calculate the number of characters in full name by adding first and last name lengths
SELECT Passenger_ID, LENGTH(First_Name) + LENGTH(Last_Name) AS Full_Name_Length 
FROM Passengers;

-- Estimate loyalty points by multiplying passenger age by 10
SELECT Passenger_ID, FLOOR(DATEDIFF(CURDATE(), Date_of_Birth) / 365.25) * 10 AS Loyalty_Points 
FROM Passengers;

-- Add 5 years to the birth year to estimate age after 5 years
SELECT Passenger_ID, First_Name, Last_Name,
       YEAR(Date_of_Birth) + 5 AS Birth_Year_Plus_5
FROM Passengers;

-- Assign a tier level based on Passenger_ID using modulus operation
SELECT Passenger_ID,
       CASE 
         WHEN Passenger_ID % 3 = 0 THEN 'Gold'
         WHEN Passenger_ID % 3 = 1 THEN 'Silver'
         ELSE 'Bronze'
       END AS Tier_Level
FROM Passengers;


-- Conditional operators

-- Select all passengers with nationality equal to 'India'
SELECT * 
FROM Passengers 
WHERE Nationality = 'India';  -- Using '=' operator

-- Select all passengers whose first name is not 'Rahul'
SELECT * 
FROM Passengers 
WHERE First_Name != 'Rahul';  -- Using '!=' operator

-- Select all passengers born after January 1, 1990
SELECT * 
FROM Passengers 
WHERE Date_of_Birth > '1990-01-01';  -- Using '>' operator

-- Select all passengers born before January 1, 1990
SELECT * 
FROM Passengers 
WHERE Date_of_Birth < '1990-01-01';  -- Using '<' operator

-- Select all passengers born on or after January 1, 1992
SELECT * 
FROM Passengers 
WHERE Date_of_Birth >= '1992-01-01';  -- Using '>=' operator

-- Select all passengers born on or before December 31, 1988
SELECT * 
FROM Passengers 
WHERE Date_of_Birth <= '1988-12-31';  -- Using '<=' operator

-- Select all passengers who do not have the frequent flyer number 'FF001'
SELECT * 
FROM Passengers 
WHERE Frequent_Flyer_Number <> 'FF001';  -- Using '<>' operator

-- Select all passengers with the first name 'Neha' and nationality 'India'
SELECT * 
FROM Passengers 
WHERE First_Name = 'Neha' AND Nationality = 'India';  -- Using '=' with AND condition



-- Table-3 Create Bookings table
CREATE TABLE Bookings (
  Booking_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each booking (Primary Key, Auto Increment)
  Flight_ID INT NOT NULL, -- Foreign key referencing Flights table (Not Null)
  Passenger_ID INT NOT NULL, -- Foreign key referencing Passengers table (Not Null)
  Booking_Date DATETIME NOT NULL, -- Date and time of booking (Not Null)
  Number_of_Seats INT NOT NULL CHECK (Number_of_Seats > 0), -- Number of seats booked (Not Null, must be greater than zero)
  Total_Price DECIMAL(10, 2) NOT NULL, -- Total price for the booking (Not Null)
  Booking_Status ENUM('Confirmed', 'Cancelled', 'Pending') NOT NULL DEFAULT 'Pending', -- Status of the booking (Not Null, default is 'Pending')
  FOREIGN KEY (Flight_ID) REFERENCES Flights(Flight_ID) ON DELETE CASCADE, -- Foreign key constraint linking to Flights table with cascading delete
  FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID) ON DELETE CASCADE -- Foreign key constraint linking to Passengers table with cascading delete
);


-- Insert Records into Bookings Table

INSERT INTO Bookings (Flight_ID, Passenger_ID, Booking_Date, Number_of_Seats, Total_Price, Booking_Status)
VALUES 
(1, 1, '2023-09-01 10:00:00', 1, 1500.00, 'Confirmed'),
(2, 2, '2023-09-02 11:00:00', 2, 3000.00, 'Confirmed'),
(3, 3, '2023-09-03 12:00:00', 1, 1500.00, 'Confirmed'),
(4, 4, '2023-09-04 13:00:00', 1, 1500.00, 'Confirmed'),
(5, 5, '2023-09-05 14:00:00', 1, 1500.00, 'Confirmed'),
(6, 6, '2023-09-06 15:00:00', 1, 1500.00, 'Confirmed'),
(7, 7, '2023-09-07 16:00:00', 1, 1500.00, 'Confirmed'),
(8, 8, '2023-09-08 17:00:00', 1, 1500.00, 'Confirmed'),
(9, 9, '2023-09-09 18:00:00', 1, 1500.00, 'Confirmed'),
(10, 10, '2023-09-10 19:00:00', 1, 1500.00, 'Confirmed'),
(11, 11, '2023-09-11 20:00:00', 1, 1500.00, 'Confirmed'),
(12, 12, '2023-09-12 21:00:00', 1, 1500.00, 'Confirmed'),
(13, 13, '2023-09-13 22:00:00', 1, 1500.00, 'Confirmed'),
(14, 14, '2023-09-14 23:00:00', 1, 1500.00, 'Confirmed'),
(15, 15, '2023-09-15 09:00:00', 1, 1500.00, 'Confirmed');

truncate table Bookings;


drop table bookings;

-- 1. Select all bookings
SELECT * FROM Bookings;

-- 2. Select confirmed bookings only
SELECT * FROM Bookings WHERE Booking_Status = 'Confirmed';

-- 3. Select bookings with more than 1 seat
SELECT * FROM Bookings WHERE Number_of_Seats > 1;

-- 4. Count total bookings per status
SELECT Booking_Status, COUNT(*) AS Total_Bookings 
FROM Bookings 
GROUP BY Booking_Status;


-- 5. Update booking status to 'Cancelled' for a specific booking
UPDATE Bookings 
SET Booking_Status = 'Cancelled' 
WHERE Booking_ID = 3;

-- 6. Update number of seats and price for a booking
UPDATE Bookings 
SET Number_of_Seats = 2, Total_Price = 3000.00 
WHERE Booking_ID = 4;

-- 7. Update booking status for all pending bookings
UPDATE Bookings 
SET Booking_Status = 'Confirmed' 
WHERE Booking_Status = 'Pending';

-- 8. Update booking date for a specific booking
UPDATE Bookings 
SET Booking_Date = '2023-09-05 10:30:00' 
WHERE Booking_ID = 5;

-- 9. Update total price for all bookings with more than 1 seat
UPDATE Bookings 
SET Total_Price = Total_Price + 500 
WHERE Number_of_Seats > 1;


-- 10. Add a new column for payment method
ALTER TABLE Bookings 
ADD COLUMN Payment_Method VARCHAR(50);

-- 11. Add a default value for Total_Price
ALTER TABLE Bookings 
ALTER COLUMN Total_Price SET DEFAULT 1000.00;

-- 12. Modify Total_Price to allow up to 12 digits (10 before decimal and 2 after)
ALTER TABLE Bookings 
MODIFY COLUMN Total_Price DECIMAL(12,2);

-- 13. Add a CHECK constraint to ensure Total_Price is greater than 0
ALTER TABLE Bookings 
ADD CONSTRAINT chk_total_price CHECK (Total_Price > 0);


-- 14. Rename the column Booking_Status to Status
ALTER TABLE Bookings 
RENAME COLUMN Booking_Status TO Status;

-- 15. Rename the table Bookings to Booking_Records
ALTER TABLE Bookings 
RENAME TO Booking_Records;

-- 16. Rename the column Booking_Date to Date_of_Booking
ALTER TABLE Booking_Records 
RENAME COLUMN Booking_Date TO Date_of_Booking;


-- 17. Delete a booking with specific ID
DELETE FROM Booking_Records 
WHERE Booking_ID = 10;

-- 18. Delete all cancelled bookings
DELETE FROM Booking_Records 
WHERE Status = 'Cancelled';

-- 19. Delete all bookings made before a certain date
DELETE FROM Booking_Records 
WHERE Date_of_Booking < '2023-09-05';

-- 20. Delete bookings where number of seats is more than 3
DELETE FROM Booking_Records 
WHERE Number_of_Seats > 3;

drop table booking_records;

ALTER TABLE tickets DROP FOREIGN KEY tickets_ibfk_1;


-- Arithmetic Operators

-- 1. Calculate the average price per seat for each booking
SELECT Booking_ID, Total_Price / Number_of_Seats AS Price_per_seat
FROM Bookings;

-- 2. Add a 5% tax to the total price of each booking
SELECT Booking_ID, Total_Price + (Total_Price * 0.05) AS Total_with_tax
FROM Bookings;

-- 3. Calculate total number of seats booked across all bookings
SELECT SUM(Number_of_Seats) AS Total_seats_booked
FROM Bookings;

-- 4. Calculate total revenue from all confirmed bookings
SELECT SUM(Total_Price) AS Total_revenue
FROM Bookings
WHERE Booking_Status = 'Confirmed';

-- 5. Calculate the number of additional seats needed to reach 100 seats per flight (assuming each booking belongs to a unique flight)
SELECT Flight_ID, 100 - SUM(Number_of_Seats) AS Seats_needed
FROM Bookings
GROUP BY Flight_ID;

-- 6. Calculate the price difference if each seat cost was Rs. 1600 instead of the actual price
SELECT Booking_ID, (1600 * Number_of_Seats) - Total_Price AS Price_difference
FROM Bookings;

-- 7. Calculate how many full groups of 4 seats were booked per booking
SELECT Booking_ID, Number_of_Seats / 4 AS Full_groups_of_4
FROM Bookings;


-- Conditional Operators

-- 1. Select all bookings where exactly 2 seats were booked
SELECT * 
FROM Bookings 
WHERE Number_of_Seats = 2;  -- Using '=' operator

-- 2. Select all bookings where more than 1 seat was booked
SELECT * 
FROM Bookings 
WHERE Number_of_Seats > 1;  -- Using '>' operator

-- 3. Select all bookings where only 1 seat was booked
SELECT * 
FROM Bookings 
WHERE Number_of_Seats = 1;  -- Using '=' operator

-- 4. Select all bookings with a total price less than 2000
SELECT * 
FROM Bookings 
WHERE Total_Price < 2000;  -- Using '<' operator

-- 5. Select all bookings made on or after '2023-09-10'
SELECT * 
FROM Bookings 
WHERE Booking_Date >= '2023-09-10';-- Using '>=' operator

-- 6. Select all bookings made before '2023-09-05'
SELECT * 
FROM Bookings 
WHERE Booking_Date < '2023-09-05';  -- Using '<' operator

-- 7. Select all bookings where the status is not 'Confirmed'
SELECT * 
FROM Bookings 
WHERE Booking_Status <> 'Confirmed';  -- Using '<>' operator

-- 8. Select all bookings where the total price is not equal to 1500
SELECT * 
FROM Bookings 
WHERE Total_Price != 1500;  -- Using '!=' operator





-- Table-4 Create Airlines table
CREATE TABLE Airlines (
  Airline_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each airline (Primary Key, Auto Increment)
  Airline_Name VARCHAR(100) NOT NULL, -- Name of the airline (Not Null)
  IATA_Code VARCHAR(3) UNIQUE NOT NULL, -- IATA code for the airline (Not Null, must be unique)
  Country VARCHAR(50) NOT NULL, -- Country where the airline is based (Not Null)
  Established_Year INT CHECK (Established_Year > 1900), -- Year the airline was established (Must be greater than 1900)
  Headquarter_Location VARCHAR(100) NOT NULL -- Location of the airline's headquarters (Not Null)
);

-- Insert Records into Airlines Table

INSERT INTO Airlines (Airline_Name, IATA_Code, Country, Established_Year, Headquarter_Location)
VALUES 
('Air India', 'AI', 'India', 1932, 'Mumbai'),
('IndiGo', '6E', 'India', 2006, 'Gurgaon'),
('SpiceJet', 'SG', 'India', 2005, 'Gurgaon'),
('Vistara', 'UK', 'India', 2013, 'Gurgaon'),
('GoAir', 'G8', 'India', 2005, 'Mumbai'),
('AirAsia India', 'I5', 'India', 2014, 'Bangalore'),
('Alliance Air', '9I', 'India', 1996, 'Delhi'),
('Jet Airways', '9W', 'India', 1993, 'Mumbai'),
('Air India Express', 'IX', 'India', 2005, 'Kochi'),
('Star Air', 'S5', 'India', 2019, 'Bangalore'),
('Akasa Air', 'QP', 'India', 2022, 'Mumbai'),
('TruJet', '2T', 'India', 2015, 'Hyderabad'),
('Zoom Air', 'Z5', 'India', 2017, 'Delhi'),
('Flybig', 'FB', 'India', 2020, 'Indore'),
('Deccan Charters', 'DC', 'India', 1997, 'Bangalore');


select * from Airlines;

truncate table Airlines;

drop table airlines;


-- 1. Select all airlines
SELECT * FROM Airlines;

-- 2. Select airlines established after 2010
SELECT * FROM Airlines WHERE Established_Year > 2010;

-- 3. Count airlines based in each city
SELECT Headquarter_Location, COUNT(*) AS Total_Airlines 
FROM Airlines 
GROUP BY Headquarter_Location;

-- 4. Get airline names and IATA codes from Bangalore
SELECT Airline_Name, IATA_Code 
FROM Airlines 
WHERE Headquarter_Location = 'Bangalore';


-- 5. Update headquarter location of GoAir to 'Delhi'
UPDATE Airlines 
SET Headquarter_Location = 'Delhi' 
WHERE Airline_Name = 'GoAir';

-- 6. Change country of all airlines from 'India' to 'Bharat'
UPDATE Airlines 
SET Country = 'Bharat' 
WHERE Country = 'India';

-- 7. Update IATA code of Flybig
UPDATE Airlines 
SET IATA_Code = 'FG' 
WHERE Airline_Name = 'Flybig';

-- 8. Update established year of Jet Airways
UPDATE Airlines 
SET Established_Year = 1992 
WHERE Airline_Name = 'Jet Airways';

-- 9. Set headquarter location of all airlines established before 2000 to 'Delhi'
UPDATE Airlines 
SET Headquarter_Location = 'Delhi' 
WHERE Established_Year < 2000;


-- 10. Add a column for Airline Rating
ALTER TABLE Airlines 
ADD COLUMN Rating DECIMAL(3,2);

-- 11. Modify Airline_Name column to allow 150 characters
ALTER TABLE Airlines 
MODIFY COLUMN Airline_Name VARCHAR(150);

-- 12. Add a CHECK constraint to ensure Rating is between 0 and 5
ALTER TABLE Airlines 
ADD CONSTRAINT chk_rating CHECK (Rating BETWEEN 0 AND 5);

-- 13. Set default Rating to 3.5
ALTER TABLE Airlines 
ALTER COLUMN Rating SET DEFAULT 3.5;


-- 14. Rename column Headquarter_Location to HQ_City
ALTER TABLE Airlines 
RENAME COLUMN Headquarter_Location TO HQ_City;

-- 15. Rename column Airline_Name to Name
ALTER TABLE Airlines 
RENAME COLUMN Airline_Name TO Name;

-- 16. Rename table Airlines to Airline_Companies
ALTER TABLE Airlines 
RENAME TO Airline_Companies;


-- 17. Delete airline with IATA Code 'FB'
DELETE FROM Airline_Companies 
WHERE IATA_Code = 'FB';

-- 18. Delete airlines based in Gurgaon
DELETE FROM Airline_Companies 
WHERE HQ_City = 'Gurgaon';

-- 19. Delete airlines established before 2000
DELETE FROM Airline_Companies 
WHERE Established_Year < 2000;

-- 20. Delete all airlines with NULL Rating
DELETE FROM Airline_Companies 
WHERE Rating IS NULL;


-- Arithmetic Operators 

-- 1. Calculate the number of years each airline has been in operation (assuming current year is 2025)
SELECT Airline_Name, 2025 - Established_Year AS Years_in_operation
FROM Airlines;

-- 2. Calculate the average year of establishment for all airlines
SELECT AVG(Established_Year) AS Average_established_year
FROM Airlines;

-- 3. Count how many airlines were established after the year 2000
SELECT COUNT(*) AS Airlines_after_2000
FROM Airlines
WHERE Established_Year > 2000;

-- 4. Count how many airlines were established in or before the year 2010
SELECT COUNT(*) AS Airlines_before_or_in_2010
FROM Airlines
WHERE Established_Year <= 2010;

-- 5. Calculate how many years have passed since the oldest airline was established
SELECT 2025 - MIN(Established_Year) AS Years_since_oldest_airline
FROM Airlines;

-- 6. Calculate how many years have passed since the most recently established airline
SELECT 2025 - MAX(Established_Year) AS Years_since_newest_airline
FROM Airlines;

-- 7. Group airlines by headquarters and count how many are based in each location
SELECT Headquarter_Location, COUNT(*) AS Airline_count
FROM Airlines
GROUP BY Headquarter_Location;



-- Conditional Operators 

-- 1. Select all airlines established before the year 2000
SELECT * 
FROM Airlines 
WHERE Established_Year < 2000;  -- Using '<' operator

-- 2. Select all airlines established in or after the year 2010
SELECT * 
FROM Airlines 
WHERE Established_Year >= 2010;  -- Using '>=' operator

-- 3. Select all airlines that are headquartered in Mumbai
SELECT * 
FROM Airlines 
WHERE Headquarter_Location = 'Mumbai';  -- Using '=' operator

-- 4. Select all airlines not headquartered in Bangalore
SELECT * 
FROM Airlines 
WHERE Headquarter_Location != 'Bangalore';  -- Using '!=' operator

-- 5. Select all airlines that are not based in Delhi
SELECT * 
FROM Airlines 
WHERE Headquarter_Location <> 'Delhi';  -- Using '<>' operator

-- 6. Select all airlines with IATA code equal to 'AI'
SELECT * 
FROM Airlines 
WHERE IATA_Code = 'AI';  -- Using '=' operator

-- 7. Select all airlines established after 2015
SELECT * 
FROM Airlines 
WHERE Established_Year > 2015;  -- Using '>' operator

-- 8. Select all airlines established in the year 2005
SELECT * 
FROM Airlines 
WHERE Established_Year = 2005;  -- Using '=' operator




-- Table-5 Create Tickets table
CREATE TABLE Tickets (
  Ticket_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each ticket (Primary Key, Auto Increment)
  Booking_ID INT NOT NULL, -- Foreign key referencing Bookings table (Not Null)
  Ticket_Price DECIMAL(10, 2) NOT NULL, -- Price of the ticket (Not Null, with two decimal places)
  Ticket_Status ENUM('Confirmed', 'Cancelled', ' Pending') NOT NULL, -- Status of the ticket (Not Null, must be one of the specified values)
  Seat_Number VARCHAR(5) NOT NULL, -- Assigned seat number for the ticket (Not Null)
  Baggage_Allowance INT DEFAULT 0, -- Baggage allowance in kilograms (Default is 0)
  FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID) ON DELETE CASCADE -- Foreign key constraint linking to Bookings table with cascading delete
);

-- Insert Records into Tickets Table
INSERT INTO Tickets (Booking_ID, Ticket_Price, Ticket_Status, Seat_Number, Baggage_Allowance)
VALUES 
(1, 1500.00, 'Confirmed', '1A', 15),
(2, 1500.00, 'Confirmed', '1B', 20),
(3, 1500.00, 'Confirmed', '1C', 15),
(4, 1500.00, 'Confirmed', '1D', 15),
(5, 1500.00, 'Confirmed', '1E', 15),
(6, 1500.00, 'Confirmed', '1F', 15),
(7, 1500.00, 'Confirmed', '1G', 15),
(8, 1500.00, 'Confirmed', '1H', 15),
(9, 1500.00, 'Confirmed', '1I', 15),
(10, 1500.00, 'Confirmed', '1J', 15),
(11, 1500.00, 'Confirmed', '1K', 15),
(12, 1500.00, 'Confirmed', '1L', 15),
(13, 1500.00, 'Confirmed', '1M', 15),
(14, 1500.00, 'Confirmed', '1N', 15),
(15, 1500.00, 'Confirmed', '1O', 15);


-- 1. Select all columns from Tickets table
SELECT * FROM Tickets;

-- 2. Select Ticket_ID, Seat_Number, and Ticket_Status for all tickets
SELECT Ticket_ID, Seat_Number, Ticket_Status FROM Tickets;

-- 3. Select tickets where Baggage_Allowance is more than 15 kg
SELECT * FROM Tickets WHERE Baggage_Allowance > 15;

-- 4. Select the total number of 'Confirmed' tickets
SELECT COUNT(*) AS Confirmed_Tickets FROM Tickets WHERE Ticket_Status = 'Confirmed';


-- 5. Add a new column for flight class (e.g., Economy, Business)
ALTER TABLE Tickets ADD Flight_Class ENUM('Economy', 'Business') DEFAULT 'Economy';

-- 6. Modify the Ticket_Price to allow higher precision
ALTER TABLE Tickets MODIFY Ticket_Price DECIMAL(12, 2);

-- 7. Add a CHECK constraint to ensure Baggage_Allowance does not exceed 40 kg
ALTER TABLE Tickets ADD CONSTRAINT chk_baggage CHECK (Baggage_Allowance <= 40);

-- 8. Drop the CHECK constraint added above
ALTER TABLE Tickets DROP CHECK chk_baggage;


-- 9. Rename column Ticket_Status to Status
ALTER TABLE Tickets CHANGE Ticket_Status Status ENUM('Confirmed', 'Cancelled', 'Pending');

-- 10. Rename the Tickets table to Passenger_Tickets
RENAME TABLE Tickets TO Passenger_Tickets;

-- 11. Rename the table back to Tickets
RENAME TABLE Passenger_Tickets TO Tickets;


-- 12. Update Baggage_Allowance to 25 for ticket with ID 2
UPDATE Tickets SET Baggage_Allowance = 25 WHERE Ticket_ID = 2;

-- 13. Update Ticket_Price to 1800.00 for all tickets with more than 20kg baggage
UPDATE Tickets SET Ticket_Price = 1800.00 WHERE Baggage_Allowance > 20;

-- 14. Set Ticket_Status to 'Cancelled' for Ticket_ID 5
UPDATE Tickets SET Status = 'Cancelled' WHERE Ticket_ID = 5;

-- 15. Update Seat_Number to '2A' for Ticket_ID 1
UPDATE Tickets SET Seat_Number = '2A' WHERE Ticket_ID = 1;

-- 16. Increase all ticket prices by 10%
UPDATE Tickets SET Ticket_Price = Ticket_Price * 1.10;



-- 17. Delete ticket with Ticket_ID = 15
DELETE FROM Tickets WHERE Ticket_ID = 15;

-- 18. Delete all tickets where Ticket_Status is 'Cancelled'
DELETE FROM Tickets WHERE Status = 'Cancelled';

-- 19. Delete all tickets with 0 baggage allowance (if any)
DELETE FROM Tickets WHERE Baggage_Allowance = 0;

-- 20. Delete all tickets with price greater than 2000
DELETE FROM Tickets WHERE Ticket_Price > 2000;


-- Airthmetic Queries

-- 1. Calculate the total ticket revenue (sum of all ticket prices)
SELECT SUM(Ticket_Price) AS Total_Ticket_Revenue
FROM Tickets;

-- 2. Calculate the average ticket price
SELECT AVG(Ticket_Price) AS Average_Ticket_Price
FROM Tickets;

-- 3. Calculate total baggage allowance across all tickets
SELECT SUM(Baggage_Allowance) AS Total_Baggage_Allowance
FROM Tickets;

-- 4. Add 5kg extra baggage allowance to each ticket (for display only)
SELECT Ticket_ID, Baggage_Allowance + 5 AS Updated_Baggage_Allowance
FROM Tickets;

-- 5. Calculate the total revenue from tickets that have more than 15kg baggage allowance
SELECT SUM(Ticket_Price) AS Revenue_High_Baggage
FROM Tickets
WHERE Baggage_Allowance > 15;

-- 6. Calculate the difference between ticket price and a standard price of 1600
SELECT Ticket_ID, 1600 - Ticket_Price AS Price_Difference
FROM Tickets;

-- 7. Calculate the baggage allowance in grams (1 kg = 1000 grams)
SELECT Ticket_ID, Baggage_Allowance * 1000 AS Baggage_Grams
FROM Tickets;


-- Conditional Operators

-- 1. Select all tickets with a ticket price equal to 1500
SELECT * 
FROM Tickets 
WHERE Ticket_Price = 1500;  -- Using '=' operator

-- 2. Select all tickets with a baggage allowance greater than 15 kg
SELECT * 
FROM Tickets 
WHERE Baggage_Allowance > 15;  -- Using '>' operator

-- 3. Select all tickets with a baggage allowance less than or equal to 15 kg
SELECT * 
FROM Tickets 
WHERE Baggage_Allowance <= 15;  -- Using '<=' operator

-- 4. Select all tickets with a ticket price not equal to 1500
SELECT * 
FROM Tickets 
WHERE Ticket_Price != 1500;  -- Using '!=' operator

-- 5. Select all tickets with a ticket status that is not 'Confirmed'
SELECT * 
FROM Tickets 
WHERE Ticket_Status <> 'Confirmed';  -- Using '<>' operator

-- 6. Select all tickets with a baggage allowance less than 20 kg
SELECT * 
FROM Tickets 
WHERE Baggage_Allowance < 20;  -- Using '<' operator

-- 7. Select all tickets where the seat number is '1A'
SELECT * 
FROM Tickets 
WHERE Seat_Number = '1A';  -- Using '=' operator

-- 8. Select all tickets where the baggage allowance is exactly 15 kg
SELECT * 
FROM Tickets 
WHERE Baggage_Allowance = 15;  -- Using '=' operator