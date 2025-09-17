-- Single line comment 
/*
Multi
Line 
Comment
*/

-- ----------------------------------------- Electricity Department --------------------------------------------------
-- creating database Electricity Department
create database electricitydepartment;

-- to work on database
use electricitydepartment;

-- -------------------------------------------- Table queries -------------------------------------------------------
-- Table 1:
-- create table Customer(CustomerID, Name, Address, City, Contact, ConnectionDate, Status)
create table Customer (
	customerid int primary key,
    name varchar(100),
    address varchar(100),
    city varchar(100),
    contact varchar(100) UNIQUE,
    connectiondate DATE,
    status varchar(100) DEFAULT 'Active'
);

-- inserting records 
insert into Customer (CustomerID, Name, Address, City, Contact, ConnectionDate, Status)
values 
(1,'Ishan Pednekar','Ganadhiraj','Mumbai','21235443','2023-04-03','Active'),
(2,'Shriya Shinde','Dindayal','Mumbai','321453546','2023-04-03','Inactive'),
(3,'Anika Paradkar','Sea Ocean','Pune','5312125132','2023-05-04','Active'),
(4,'Rajas Randive','Finyard','Delhi','23542352','2024-01-15','Inactive'),
(5,'Devaki Rao','Denyard','Panjim','2533235532','2023-04-14','Active');

-- Table 2:
-- create table Meter(MeterID, CustomerID, MeterType, InstallationDate, Status)
CREATE TABLE Meter (
    MeterID INT PRIMARY KEY,
    CustomerID INT,
    MeterType VARCHAR(50),
    InstallationDate DATE,
    Status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
drop table Meter;
INSERT INTO Meter (MeterID, CustomerID, MeterType, InstallationDate, Status)
VALUES
(101, 1, 'Electric', '2025-01-20', 'Active'), 
(102, 2, 'Water', '2025-01-25', 'Inactive'), 
(103, 3, 'Gas', '2025-02-05', 'Active'), 
(104, 1, 'Water', '2025-02-12', 'Active'), 
(105, 2, 'Electric', '2025-03-01', 'Inactive');
    
-- Table 3:
-- create table Bill(BillID, CustomerID, MeterID, BillMonth, UnitsConsumed, Amount, DueDate, Status)
CREATE TABLE Bill (
    BillID INT PRIMARY KEY,
    CustomerID INT,
    MeterID INT,
    BillMonth VARCHAR(20),
    UnitsConsumed INT,
    Amount DECIMAL(10,2),
    DueDate DATE,
    Status VARCHAR(20) DEFAULT 'Unpaid',
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (MeterID) REFERENCES Meter(MeterID)
);

drop table bill;

INSERT INTO Bill (BillID, CustomerID, MeterID, BillMonth, UnitsConsumed, Amount, DueDate, Status)
VALUES
(1001, 1, 101, 'January 2025', 250, 1250.00, '2025-02-10', 'Paid'),
(1002, 2, 102, 'January 2025', 180, 900.00, '2025-02-12', 'Unpaid'),
(1003, 3, 103, 'February 2025', 300, 1500.00, '2025-03-05', 'Unpaid'),
(1004, 1, 104, 'February 2025', 220, 1100.00, '2025-03-08', 'Paid'),
(1005, 2, 105, 'March 2025', 260, 1300.00, '2025-04-05', 'Paid');

-- Table 4:
-- create table Payment(PaymentID, BillID, PaymentDate, AmountPaid, Mode, Status)
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BillID INT,
    PaymentDate DATE,
    AmountPaid DECIMAL(10,2),
    Mode VARCHAR(50),
    Status VARCHAR(20) DEFAULT 'Successful',
    FOREIGN KEY (BillID) REFERENCES Bill(BillID)
);
drop table Payment;
INSERT INTO Payment (PaymentID, BillID, PaymentDate, AmountPaid, Mode, Status)
VALUES
(5001, 1001, '2025-02-05', 1250.00, 'UPI', 'Successful'),
(5002, 1002, '2025-02-15', 900.00, 'Cash', 'Successful'),
(5003, 1003, '2025-03-02', 1500.00, 'NetBanking', 'Pending'),
(5004, 1004, '2025-03-10', 1100.00, 'Credit Card', 'Failed'),
(5005, 1005, '2025-03-25', 1300.00, 'Debit Card', 'Sucessful');

-- Table 5:  Staff(StaffID, Name, Role, Salary, Branch)
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch VARCHAR(100)
);
drop table Staff;
INSERT INTO Staff (StaffID, Name, Role, Salary, Branch)
VALUES
(1, 'Anil Mehta', 'Manager', 65000.00, 'Mumbai'),
(2, 'Priya Sharma', 'Clerk', 30000.00, 'Delhi'),
(3, 'Ravi Kumar', 'Technician', 40000.00, 'Bangalore'),
(4, 'Neha Verma', 'Accountant', 35000.00, 'Mumbai'),
(5, 'Arjun Singh', 'Supervisor', 45000.00, 'Delhi');

-- Table 6: Complaint(ComplaintID, CustomerID, Date, Description, Status, StaffID)
CREATE TABLE Complaint (
    ComplaintID INT PRIMARY KEY,
    CustomerID INT,
    Date DATE,
    Description VARCHAR(255),
    Status VARCHAR(20) DEFAULT 'Open',
    StaffID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
drop table Complaint;

INSERT INTO Complaint (ComplaintID, CustomerID, Date, Description, Status, StaffID)
VALUES
(901, 1, '2025-02-01', 'Meter working properly', 'Resolved', 3),
(902, 2, '2025-02-05', 'High bill issue', 'In Progress', 4),
(903, 3, '2025-02-10', 'Water leakage in connect', 'In progress', 2),
(904, 1, '2025-02-15', 'Late bill generation', 'Open', 5),
(905, 2, '2025-02-20', 'Payment showing', 'Resolved', 1);

-- ------------------- Section A – Commands (DDL, DML, DQL, DCL, TCL) (Q1–Q7) -------------------------------------
-- 2. (DDL) Alter the Bill table to add a column LateFee DECIMAL(8,2).
Alter table Bill
ADD LateFee DECIMAL(10,2);

-- 3. (DML) Insert a new record of a customer “Rahul Sharma” from Lucknow with contact 9876543210.
set SQL_safe_updates = 0;
set SQL_safe_updates = 1;

update Customer
set City = 'Lucknow',
Contact = '9876543210'
where Name = 'Rahul Sharma';

-- 4. (DML) Update all bills where DueDate < CURRENT_DATE and set Status = 'Overdue'.
update Bill
set Status = 'Overdue'
where DueDate < CURRENT_DATE;

-- 5. (DQL) Write a query to display CustomerName, City, and ConnectionDate of all customers connected after 2020.
select name as CustomerName, City, ConnectionDate
from Customer
where ConnectionDate > '2020-12-31';

-- 6. 

-- 7.

-- ---------------------------------------------- Section B – Clauses (Q8–Q13)-------------------------------------
-- 8. Retrieve all customers from “Delhi” using the WHERE clause.
select * from Customer
where City = 'Delhi';

-- 9. Display customers grouped by city and count the number of connections in each city.
select City, Count(CustomerID) AS TotalConnections
from Customer
group by City;

-- 10. Find the maximum bill amount city-wise using GROUP BY and MAX().
SELECT City, MAX(Amount) AS MaxBillAmount
FROM Customer, Bill
WHERE Customer.CustomerID = Bill.CustomerID
GROUP BY City;

-- 11. Display customers whose name starts with ‘A’ using the LIKE clause.
select customerid, Name from customer
where name like 'A%';

-- 12.  Show the top 5 highest bill amounts using ORDER BY and LIMIT.
select * from bill
order by amount DESC limit 5;

-- 13. Find the average units consumed by customers having consumption more than 200 units (HAVING clause).


-- -------------------------------------- Section C – Constraints (Q14–Q16) -------------------------------------------
-- 14. Create the Meter table with a CHECK constraint to allow only MeterType IN ('Domestic','Commercial').
drop table meter;

create table Meter (
    MeterID int primary key,
    CustomerID int,
    MeterType varchar(50),
    InstallationDate DATE,
    Status varchar(20) DEFAULT 'Active',
    foreign key (CustomerID) references Customer(CustomerID),
    check (MeterType in ('Domestic','Commercial'))
);

insert into Meter (MeterID, CustomerID, MeterType, InstallationDate, Status)
values
(101, 1, 'Domestic', '2025-01-20', 'Active'),
(102, 2, 'Commercial', '2025-01-25', 'Inactive'),
(103, 3, 'Domestic', '2025-02-05', 'Active'),
(104, 4, 'Commercial', '2025-02-12', 'Active'),
(105, 5, 'Domestic', '2025-03-01', 'Inactive');

-- 15. Ensure that the BillID in the Bill table is Auto Increment Primary Key.
alter table Bill 
modify BillID int auto_increment;

-- 16. Add a FOREIGN KEY(CustomerID) in the Bill table referencing the Customer table.
alter table Bill
add constraint fk_bill_customer
foreign key (CustomerID) references Customer(CustomerID);

-- Section D – Joins (Q17–Q22)
-- 17. Display CustomerName, MeterType, InstallationDate of all customers using an INNER JOIN.
select c.name, m.metertype,m.installationdate
from customer c
inner join meter m on c.customerid = m.customerid;

-- 18. Show all customers and their bills (if any) using a LEFT JOIN
select c.name, c. address, b.BillID, b.BillMonth, b.Amount, b.Status
from customer c
left join bill b on c.customerid = b.customerid;

-- 19. Display all staff members who have not handled any complaints using a LEFT JOIN.
select s.staffID, s.name as staffName, s.role
from staff s
left join complaint c on s.staffID = c.staffID
where c.complaintID is null;

-- 20. Find the total amount collected by each staff member who handled payments using JOIN.

-- 21. List all customers who paid after the due date using JOIN between Bill and Payment.
select c.name, b.BillID, b.DueDate, p.PaymentDate
FROM Customer c
inner join Bill b on c.CustomerID = b.CustomerID
inner join Payment p on b.BillID = p.BillID
where p.PaymentDate > b.DueDate;

-- 22. Show CustomerName, ComplaintDescription, StaffName using JOIN on Complaint and Staff.
select c.Name , co.Description , st.Name
FROM Complaint co
INNER JOIN Customer c ON co.CustomerID = c.CustomerID
INNER JOIN Staff st ON co.StaffID = st.StaffID;

-- -------------------------------------------- Section F – Built-in & User-Defined Functions (Q29–Q33)---------------------------------
-- 29. Display the current date and time using a built-in function.
select now() as CurrentDateTime;

-- 31. Create a UDF GetFullName(CustomerID) that returns FirstName + ' ' + LastName
delimiter //
create function getfullname(customerid int)
returns varchar(100)
deterministic 
begin
	declare fullname varchar (100),
    select concat(firstname,' ', last name)
    into fullname
    from customer 
    where customerid = customerid;
    return fullname;
end //
delimiter ;

