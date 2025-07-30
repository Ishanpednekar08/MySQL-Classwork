
-- ----------------------------------- Database Queries --------------------------------------
-- Create SBI Bank database
CREATE DATABASE SBI_Bank;

-- Select the database for use
USE SBI_Bank;

-- ---------------------------------- Table Queries -----------------------------------------

-- Table-1 : Customers

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    DOB DATE,
    Gender VARCHAR(10),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AadharNumber VARCHAR(16),
    PANNumber VARCHAR(12),
    Address TEXT,
    BranchCode VARCHAR(10)
);

INSERT INTO Customers VALUES
(1, 'Rahul Sharma', '1988-06-12', 'Male', 'rahul88@gmail.com', '9876543210', '123412341234', 'ABCDE1234F', 'Delhi, India', 'SBI001'),
(2, 'Anjali Mehta', '1992-03-25', 'Female', 'anjali25@gmail.com', '9856432109', '987698769876', 'GHYTR5678G', 'Mumbai, India', 'SBI002'),
(3, 'Amit Roy', '1985-01-10', 'Male', 'amitroy@gmail.com', '9871122334', '123456781234', 'DFGTR1234E', 'Kolkata, India', 'SBI003'),
(4, 'Pooja Nair', '1990-09-17', 'Female', 'pooja.n@gmail.com', '9934567890', '567812341234', 'POIUY6789H', 'Chennai, India', 'SBI004'),
(5, 'Vikram Sinha', '1982-12-04', 'Male', 'vikram.sinha@gmail.com', '9765432101', '345612341234', 'PLMNB2345J', 'Bangalore, India', 'SBI005'),
(6, 'Riya Sen', '1994-11-30', 'Female', 'riya.sen@gmail.com', '9823456781', '876543218765', 'LKJHG8765K', 'Hyderabad, India', 'SBI006'),
(7, 'Neeraj Das', '1987-07-23', 'Male', 'neeraj.das@gmail.com', '9812345672', '765412349876', 'MNBVC2345L', 'Ahmedabad, India', 'SBI007'),
(8, 'Seema Agarwal', '1993-04-15', 'Female', 'seema.a@gmail.com', '9743124567', '234512347654', 'QWERT1234P', 'Surat, India', 'SBI008'),
(9, 'Anil Kumar', '1989-08-12', 'Male', 'anil.k@gmail.com', '9687654321', '112233445566', 'ZXCVB3456M', 'Jaipur, India', 'SBI009'),
(10, 'Sneha Das', '1991-02-22', 'Female', 'sneha.d@gmail.com', '9765123890', '667788990011', 'ASDFG5678T', 'Bhopal, India', 'SBI010'),
(11, 'Aditya Mehra', '1990-03-11', 'Male', 'aditya.m@gmail.com', '9845000001', '123400000123', 'PQWER6789Z', 'Lucknow, India', 'SBI011'),
(12, 'Divya Thakur', '1995-06-19', 'Female', 'divya.t@gmail.com', '9789456123', '234500000123', 'LKJHG0001A', 'Kanpur, India', 'SBI012'),
(13, 'Manish Tiwari', '1984-05-15', 'Male', 'manish.t@gmail.com', '9876541290', '321654987000', 'ZMXNB7890D', 'Nagpur, India', 'SBI013'),
(14, 'Priya Kaur', '1987-07-21', 'Female', 'priya.k@gmail.com', '9712314567', '654321009876', 'REWQ1234AS', 'Amritsar, India', 'SBI014'),
(15, 'Kunal Ghosh', '1992-10-01', 'Male', 'kunal.g@gmail.com', '9834567890', '223344556677', 'IUYTRE4321Z', 'Guwahati, India', 'SBI015'),
(16, 'Rachna Pathak', '1989-12-12', 'Female', 'rachna.p@gmail.com', '9854123987', '334455667788', 'OIUYT5678B', 'Indore, India', 'SBI016'),
(17, 'Saurabh Jain', '1985-08-08', 'Male', 'saurabh.j@gmail.com', '9723456789', '445566778899', 'XCVBN2345U', 'Kota, India', 'SBI017'),
(18, 'Meera Joshi', '1991-09-09', 'Female', 'meera.j@gmail.com', '9745123467', '556677889900', 'TREWQ3456N', 'Raipur, India', 'SBI018'),
(19, 'Arun Verma', '1993-06-06', 'Male', 'arun.v@gmail.com', '9887654321', '667788990011', 'NBVCX9876P', 'Agra, India', 'SBI019'),
(20, 'Meena Kapoor', '1991-08-09', 'Female', 'meenak@gmail.com', '9945362819', '673498761234', 'FHTRE7865J', 'Pune, India', 'SBI020');

-- Display all customers
SELECT * FROM Customers;

-- Delete all customer records but keep the table structure
TRUNCATE TABLE Customers;

-- Completely remove the Customers table from the database
DROP TABLE Customers;

-- Queries
-- 1 selecting customers by specific orders
select * from Customers order by  AadharNumber Desc;

-- 2. select count of pannumber
select PANNumber, Count(*) as count from customers group by PANNumber having count(*) > 4;

-- 3. select fullname with distincnt
select FullName as fname from customers;

-- 4. Selecting specfific fullname 
select * from Customers where FullName = 'Meena Kapoor';

-- 5. Selecting customers with specific emails
Select * from customers where Email in ('manish.t@gmail.com' , 'sneha.d@gmail.com');

-- 6. selecting customers with null addharcard
select FullName , AadharNumber from customers where AadharNumber is null;

-- 7.selecting multiple columns
select FullName, DOB
from customers
where AadharNumber = 987698769876
order by PANNumber DESC;

-- 8. Selecting specific names with specific phone number
select Fullname, DOB
from customers
where Fullname like 'A%';

-- 9. selecting multiple columns
select Fullname 
from customers
where DOB in ('1993-04-15','1993-06-06','1989-08-12')
order by PANNumber DESC;

-- 10. Renaming specific column
alter table customers rename column fullname to full_name;

-- 11. Renaming specific column
alter table customers rename column phone to mobile_number;

-- 12. Renaming specific column
alter table customers rename column dob to date_of_birth;

-- 13. Altering specific 
alter table customers 
modify Fullname varchar (1000);

-- 14. Uppercasing certain columns
select Upper(Fullname) as upper_fullnamne from customers;

-- 15. Lowercasing certain columns
select Lower(Address) as lower_address from customers;

-- 16. Concatenating certain coolumns
select Concat('Manish Tiwari' , ' - ' , 'Nagpur, India') as concat_info from customers;

-- 17. Using arithmetic operatos 
select Phone - 10 as updated_info from customers;

-- 18. Using Sum operators
select SUM(Phone) as sum_phones from customers;

-- 19. Choosing customers born before 1995 
select * from customers 
where DOB > 1995-06-19;

-- 20. Selecting customers born after 1995
select * from customers 
where DOB < 1995-06-19;

-- 21. Selecting specific customers with not specfic PANNumber
select Fullname , Address
from customers
where PANNumber <> 'IUYTRE4321Z';

-- 22. Selecting Specfic customers with 
select Address, BranchCode, Email
from customers
where Address = 'Mumbai, India';

-- 23. ADD constraint on specific column
alter table customers
add constraint unique_email unique (email);

-- 24.Add not null constraint to phone
alter table customers
modify phone varchar(15) not null;

-- 25. Alter gender column
alter table customers
alter column gender 
set default 'Not Specified';

-- 26. add specific key
alter table customers
add constraint fk_branchcode 
foreign key (branchcode) references branches(branchcode);

-- 27. drop constraint on gender
alter table customers
drop constraint chk_gender;

-- 28. alter table aadharnumber
alter table customers
modify aadharnumber char(12);

-- 29. Update specific customer's phone number
update customers
set phone = '9999999999'
where customerid = 1;

-- 30. Updating specfifc address
update customers
set address = 'Mumbai, Maharashtra'
where address = 'Mumbai, India';

-- 31. Updating specific brancode
update customers
set branchcode = 'SBI000'
where branchcode is null;

-- 32. update specific brancode for specific address
update customers
set branchcode = 'SBI999'
where address like '%Bhopal%' or address like '%Jaipur%';

-- 33. Using Union operator to combine specific data
select fullname , DOB from customers
where DOB = '1989-12-12'
Union
select Address, branchcode from customers
where branchcode = 'SBI018';

-- 34. Using Union operator to combine infomartion
Select AadharNumber , PANNumber , Address from customers
where Address in ('Jaipur, India','Surat, India','Chennai, India')
Union all
select CustomerID , Fullname , Email from customers
where CustomerID in ( 1 , 2 , 3);

-- 35. Using logical operators
select * from customers
where Address = 'Jaipur, India'
and Fullname = 'Vikram Sinha'
and branchcode = 'SBI020';

-- 36. using or operatos
select * from customers 
where DOB = '1982-12-04'
or DOB = '2023-09-12';

-- 37. Select using NOT operator
Select * from customers
where not address = 'California';

-- 38. Using string operator CONCAT
select Concat ('Neeraj Das','-', '1987-07-23','-', '9812345672') as necessaryinfo from customers;

-- 39. Customers applicable for certain policy
Select CASE
when DOB = '1990-03-11' THEN 'NOT APPLICABLE'
when DOB = '1991-09-09' THEN 'NOT APPLICABLE'
when DOB = '1995-06-19' THEN 'NOT APPLICABLE'
else 'APPLICABLE'
end as customer_applicable
from customers;

-- 40. metro membership
Select CASE
when Address = 'Kolkata, India' THEN 'Metro membership available'
when Address = 'Mumbai, India' THEN 'Metro membership available'
when Address = 'Chennai, India' THEN 'Metro membership available'
else 'Metro membership unavailable'
end as customer_Metromembership 
from customers;

-- 41. selecting only years from customers
select fullname, year(dob) as birth_year from customers;

-- 42. selecting only days from customers
select fullname, day(dob) as day_of_birth from customers;

-- 43. selecting only months from customers
select fullname, monthname(dob) as birth_month from customers

-- 44. selecting specific gender 
select * from customers 
where gender != 'male';

-- 45. selecting specific customerid 
select * from customers 
where customerid > 10;

-- 46. selecting not like gmail
select * from Customers 
where Email not like '%gmail%';

-- 47. selecting phonenumber in specific order
select * from Customers order by phone DESC;

-- 48. delete specificdata
delete from Customers 
where CustomerID = 20;

-- 49. select specific customer ID 
select * from Customers 
where CustomerID = 20;

-- 50. update customer info
update Customers
set Email = 'vikram.updated@gmail.com'
where CustomerID = 5;

-- Table-2: Accounts

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    OpenDate DATE,
    Balance DECIMAL(12,2),
    IFSCCode VARCHAR(11),
    BranchCode VARCHAR(10),
    Status VARCHAR(10),
    NomineeName VARCHAR(100),
    Currency VARCHAR(5),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Accounts VALUES
(101, 1, 'Savings', '2020-01-15', 55000.75, 'SBIN000001', 'SBI001', 'Active', 'Reena Sharma', 'INR'),
(102, 2, 'Current', '2019-05-22', 125000.00, 'SBIN000002', 'SBI002', 'Active', 'Vijay Mehta', 'INR'),
(103, 3, 'Savings', '2021-11-10', 67000.00, 'SBIN000003', 'SBI003', 'Active', 'Asha Roy', 'INR'),
(104, 4, 'Savings', '2018-07-09', 89000.00, 'SBIN000004', 'SBI004', 'Active', 'Pritam Nair', 'INR'),
(105, 5, 'Current', '2022-01-01', 32000.00, 'SBIN000005', 'SBI005', 'Active', 'Kiran Sinha', 'INR'),
(106, 6, 'Savings', '2020-06-15', 47000.90, 'SBIN000006', 'SBI006', 'Active', 'Aman Sen', 'INR'),
(107, 7, 'Savings', '2021-02-25', 51000.50, 'SBIN000007', 'SBI007', 'Active', 'Sonal Das', 'INR'),
(108, 8, 'Current', '2017-09-10', 95000.00, 'SBIN000008', 'SBI008', 'Active', 'Vivek Agarwal', 'INR'),
(109, 9, 'Savings', '2023-04-20', 22000.00, 'SBIN000009', 'SBI009', 'Active', 'Rina Kumar', 'INR'),
(110, 10, 'Savings', '2019-12-12', 34000.00, 'SBIN000010', 'SBI010', 'Active', 'Neeraj Das', 'INR'),
(111, 11, 'Savings', '2021-08-12', 78000.45, 'SBIN000011', 'SBI011', 'Active', 'Priya Mehra', 'INR'),
(112, 12, 'Current', '2022-03-19', 125000.00, 'SBIN000012', 'SBI012', 'Active', 'Ajay Thakur', 'INR'),
(113, 13, 'Savings', '2023-01-23', 33000.00, 'SBIN000013', 'SBI013', 'Active', 'Anita Tiwari', 'INR'),
(114, 14, 'Savings', '2020-10-14', 59000.00, 'SBIN000014', 'SBI014', 'Active', 'Karan Kaur', 'INR'),
(115, 15, 'Current', '2021-04-18', 40500.00, 'SBIN000015', 'SBI015', 'Active', 'Deepak Ghosh', 'INR'),
(116, 16, 'Savings', '2019-11-11', 22000.00, 'SBIN000016', 'SBI016', 'Active', 'Nidhi Pathak', 'INR'),
(117, 17, 'Savings', '2020-05-30', 47000.50, 'SBIN000017', 'SBI017', 'Active', 'Tarun Jain', 'INR'),
(118, 18, 'Current', '2022-06-22', 110000.00, 'SBIN000018', 'SBI018', 'Active', 'Ankit Joshi', 'INR'),
(119, 19, 'Savings', '2023-03-03', 56000.00, 'SBIN000019', 'SBI019', 'Active', 'Radhika Verma', 'INR'),
(120, 20, 'Savings', '2023-07-07', 43250.50, 'SBIN000020', 'SBI020', 'Active', 'Amit Kapoor', 'INR');

-- Show all accounts
SELECT * FROM Accounts;

-- Delete all account records but keep the structure
TRUNCATE TABLE Accounts;

-- Completely remove the Accounts table
DROP TABLE Accounts;

-- Queries

-- 1. Selecting accounts ordered by AccountID
select * from Accounts order by AccountID Desc;

-- 2. Select count of Balance
select IFSCCode, COUNT(*) as count from Accounts group by IFSCCode having COUNT(*) > 1;

-- 3. Select specific Account Types
select distinct AccountType from Accounts;

-- 4. select specfic accounts
SELECT * from Accounts where AccountID = 101;

-- 5. Selecting accounts with specific ifsc codes
select * from accounts where ifsccode in ('sbin000003', 'sbin000008');

-- 6. Selecting accounts where branchcode is null
select accountid, branchcode from accounts where branchcode is null;

-- 7. Selecting multiple columns for specific customerid
select accountid, opendate from accounts where customerid = 3 order by balance desc;

-- 8. Selecting accounts with nominee names starting with 'a'
select accountid, opendate from accounts where nomineeName like 'a%';

-- 9. Selecting accounts with specific opendates
select accountid from accounts 
where opendate in ('2020-01-15','2022-01-01') 
order by balance desc;

-- 10. Renaming column nomineeName to nominee_full_name
alter table accounts rename column nomineename to nominee_full_name;

-- 11. Renaming column to account_open_date
alter table accounts rename column opendate to account_open_date;

-- 12. Renaming column to ifsc_code
alter table accounts rename column ifsccode to ifsc_code;

-- 13. Modifying account type length
alter table accounts modify accounttype varchar(50);

-- 14. Uppercasing nominee names
select upper(nomineename) as upper_nominee from accounts;

-- 15. Lowercasing status column
select lower(status) as lower_status from accounts;

-- 16. Concatenating nominee and branch info
select concat(nomineename, ' - ', branchcode) as nominee_branch from accounts;

-- 17. Using arithmetic: deduct 100 from balance
select balance - 100 as adjusted_balance from accounts;

-- 18. Summing all account balances
select sum(balance) as total_balance from accounts;

-- 19. Selecting accounts opened before 2021
select * from accounts where opendate < '2021-01-01';

-- 20. Selecting accounts opened after 2021
select * from accounts where opendate > '2021-01-01';

-- 21. Selecting accounts excluding a specific branchcode
select accountid, balance from accounts where branchcode <> 'sbi010';

-- 22. Selecting accounts with branchcode 'sbi018'
select accountid, branchcode, status from accounts where branchcode = 'sbi018';

-- 23. Adding unique constraint to ifsccode
alter table accounts add constraint unique_ifsc unique (ifsccode);

-- 24. Adding not null constraint to balance
alter table accounts modify balance decimal(12,2) not null;

-- 25. Setting default value for status column
alter table accounts alter column status set default 'inactive';

-- 26. Adding foreign key constraint to branchcode
alter table accounts 
add constraint fk_branchcode foreign key (branchcode) references branches(branchcode);

-- 27. Dropping a constraint on status (assumed name)
alter table accounts drop constraint chk_status;

-- 28. Modifying currency column
alter table accounts modify currency char(5);

-- 29. Updating balance for a specific account
update accounts set balance = 99999.99 where accountid = 101;

-- 30. Updating specific ifsc code
update accounts set ifsccode = 'sbin999999' where ifsccode = 'sbin000001';

-- 31. Updating null branchcodes
update accounts set branchcode = 'sbi000' where branchcode is null;

-- 32. Updating branchcode for specific nominees
update accounts 
set branchcode = 'sbi999' 
where nomineename like '%agarwal%' or nomineename like '%kapoor%';

-- 33. Using union to combine accounts opened on a date with those from specific branch
select accountid, opendate from accounts 
where opendate = '2023-01-23'
union
select accountid, branchcode from accounts 
where branchcode = 'sbi018';

-- 34. Using union all to combine different columns
select accountid, balance, branchcode from accounts 
where branchcode in ('sbi017','sbi018','sbi019')
union all
select customerid, accountid, status from accounts 
where customerid in (1, 2, 3);

-- 35. selecting specfic account details
select * from accounts 
where branchcode = 'sbi020' 
and nomineeName = 'amit kapoor' 
and accounttype = 'savings';

-- 36. selecting specfifc opendates
select * from accounts 
where opendate = '2022-01-01' 
or opendate = '2023-09-12';

-- 37. select account with not sbi999
select * from accounts 
where not branchcode = 'sbi999';

-- 38. Concataning specific information
select concat('neeraj das', '-', '2019-12-12', '-', 'savings') as necessaryinfo 
from accounts;

-- 39. Selecting account_policy_status
select case 
when opendate = '2020-01-15' then 'not applicable'
when opendate = '2022-06-22' then 'not applicable'
when opendate = '2023-07-07' then 'not applicable'
else 'applicable'
end as account_policy_status
from accounts;

-- 40. Selecting availabilty of ATM
select case
when branchcode in ('sbi002', 'sbi003', 'sbi004') then 'ATM available'
else 'ATM unavailable'
end as ATM_availabilty_status
from accounts;

-- 41. selecting opendates years
select accountid, year(opendate) as open_year from accounts;

-- 42. selecting openday
select accountid, day(opendate) as open_day from accounts;

-- 43. selecting openmonths 
select accountid, monthname(opendate) as open_month from accounts;

-- 44. Selecting savings account
select * from accounts 
where accounttype != 'current';

-- 45. selecting account bigger than 110
select * from accounts 
where accountid > 110;

-- 46. updating account
update Accounts 
set Status = 'Inactive' 
where AccountID = 105;

-- 47. deleting account 
delete from Accounts 
where OpenDate < '2018-01-01';

-- 48 opening specfic account
select * from Accounts 
where OpenDate >= '2022-01-01';

-- 49 
select * from Accounts 
where AccountType = 'Current';

--  Table-3: Transactions

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Type VARCHAR(10),
    Amount DECIMAL(10,2),
    Description TEXT,
    Mode VARCHAR(20),
    Status VARCHAR(10),
    BalanceAfter DECIMAL(12,2),
    BranchCode VARCHAR(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Transactions VALUES
(1001, 101, '2024-06-10', 'Credit', 5000.00, 'Salary credited', 'NEFT', 'Success', 60000.75, 'SBI001'),
(1002, 101, '2024-06-15', 'Debit', 2000.00, 'Mobile recharge', 'UPI', 'Success', 58000.75, 'SBI001'),
(1003, 102, '2024-05-22', 'Debit', 1500.00, 'Electricity bill', 'Net Banking', 'Success', 123500.00, 'SBI002'),
(1004, 103, '2024-07-01', 'Credit', 20000.00, 'Cheque deposit', 'Cheque', 'Success', 87000.00, 'SBI003'),
(1005, 104, '2024-07-02', 'Debit', 500.00, 'ATM Withdrawal', 'ATM', 'Success', 88500.00, 'SBI004'),
(1006, 105, '2024-06-20', 'Credit', 10000.00, 'UPI received', 'UPI', 'Success', 42000.00, 'SBI005'),
(1007, 106, '2024-05-10', 'Debit', 1500.00, 'Online shopping', 'UPI', 'Success', 45500.90, 'SBI006'),
(1008, 107, '2024-07-15', 'Debit', 2500.00, 'Fuel payment', 'Card', 'Success', 48500.50, 'SBI007'),
(1009, 108, '2024-06-30', 'Credit', 7000.00, 'Client payment', 'IMPS', 'Success', 102000.00, 'SBI008'),
(1010, 109, '2024-05-18', 'Debit', 1000.00, 'Recharge', 'UPI', 'Success', 21000.00, 'SBI009'),
(1011, 110, '2024-07-05', 'Credit', 5000.00, 'Salary', 'NEFT', 'Success', 39000.00, 'SBI010'),
(1012, 111, '2024-06-12', 'Debit', 2000.00, 'Shopping', 'UPI', 'Success', 76000.45, 'SBI011'),
(1013, 112, '2024-05-25', 'Credit', 15000.00, 'Cheque', 'Cheque', 'Success', 140000.00, 'SBI012'),
(1014, 113, '2024-06-07', 'Debit', 2000.00, 'Rent', 'NEFT', 'Success', 31000.00, 'SBI013'),
(1015, 114, '2024-05-29', 'Debit', 1000.00, 'Petrol', 'UPI', 'Success', 58000.00, 'SBI014'),
(1016, 115, '2024-07-18', 'Credit', 10000.00, 'Client Payment', 'IMPS', 'Success', 50500.00, 'SBI015'),
(1017, 116, '2024-06-25', 'Debit', 500.00, 'Bill Payment', 'Net Banking', 'Success', 21500.00, 'SBI016'),
(1018, 117, '2024-07-03', 'Credit', 12000.00, 'Cash Deposit', 'Cash', 'Success', 59000.50, 'SBI017'),
(1019, 118, '2024-06-17', 'Debit', 1000.00, 'Restaurant', 'Card', 'Success', 109000.00, 'SBI018'),
(1020, 119, '2024-07-21', 'Credit', 8000.00, 'Transfer from friend', 'UPI', 'Success', 64000.00, 'SBI019');

-- Show all transactions
SELECT * FROM Transactions;

-- Remove all transaction records (preserves structure)
TRUNCATE TABLE Transactions;

-- Delete the Transactions table permanently
DROP TABLE Transactions;

-- Queries
-- 1. selecting specific transactionid
select * from transactions order by transactionid desc;

-- 2. select count of transactions 
select branchcode, count(*) as count from transactions group by branchcode having count(*) > 1;

-- 3. select distinct transaction types
select distinct type from transactions;

-- 4. select specific transaction
select * from transactions where transactionid = 1001;

-- 5. selecting transactions with specific branchcodes
select * from transactions where branchcode in ('sbi001', 'sbi002');

-- 6. selecting transactions where description is null
select transactionid, description from transactions where description is null;

-- 7. selecting multiple columns for specific accountid
select transactionid, transactiondate from transactions where accountid = 101 order by amount desc;

-- 8. selecting transactions where description starts with 's'
select transactionid, transactiondate from transactions where description like 's%';

-- 9. selecting transactions with specific dates
select transactionid from transactions 
where transactiondate in ('2024-06-10', '2024-07-21') 
order by amount desc;

-- 10. renaming column description to transaction_detail
alter table transactions rename column description to transaction_detail;

-- 11. renaming column transactiondate to txn_date
alter table transactions rename column transactiondate to txn_date;

-- 12. renaming column branchcode to branch_code
alter table transactions rename column branchcode to branch_code;

-- 13. modifying type column length
alter table transactions modify type varchar(20);

-- 14. uppercasing descriptions
select upper(description) as upper_description from transactions;

-- 15. lowercasing status column
select lower(status) as lower_status from transactions;

-- 16. concatenating description and mode
select concat(description, ' - ', mode) as description_mode from transactions;

-- 17. using arithmetic: deduct 100 from amount
select amount - 100 as adjusted_amount from transactions;

-- 18. summing all transaction amounts
select sum(amount) as total_amount from transactions;

-- 19. selecting transactions before 2024-06-01
select * from transactions where transactiondate < '2024-06-01';

-- 20. selecting transactions after 2024-06-01
select * from transactions where transactiondate > '2024-06-01';

-- 21. selecting transactions excluding a specific branchcode
select transactionid, amount from transactions where branchcode <> 'sbi010';

-- 22. selecting transactions with branchcode 'sbi018'
select transactionid, branchcode, status from transactions where branchcode = 'sbi018';

-- 23. adding unique constraint to transactionid
alter table transactions add constraint unique_txn unique (transactionid);

-- 24. adding not null constraint to amount
alter table transactions modify amount decimal(10,2) not null;

-- 25. setting default value for status column
alter table transactions alter column status set default 'pending';

-- 26. adding foreign key constraint to accountid
alter table transactions 
add constraint fk_accountid foreign key (accountid) references accounts(accountid);

-- 27. dropping a constraint on status (assumed name)
alter table transactions drop constraint chk_status;

-- 28. modifying mode column
alter table transactions modify mode varchar(30);

-- 29. updating amount for a specific transaction
update transactions set amount = 9999.99 where transactionid = 1001;

-- 30. updating specific branchcode
update transactions set branchcode = 'sbi999' where branchcode = 'sbi001';

-- 31. updating null descriptions
update transactions set description = 'not specified' where description is null;

-- 32. updating branchcode for specific descriptions
update transactions 
set branchcode = 'sbi998' 
where description like '%salary%' or description like '%rent%';

-- 33. using union to combine transactions on a date and those from a specific branch
select transactionid, transactiondate from transactions 
where transactiondate = '2024-07-21'
union
select transactionid, branchcode from transactions 
where branchcode = 'sbi018';

-- 34. using union all to combine different columns
select transactionid, amount, branchcode from transactions 
where branchcode in ('sbi017','sbi018','sbi019')
union all
select accountid, transactionid, status from transactions 
where accountid in (101, 102, 103);

-- 35. selecting specific transaction details
select * from transactions 
where branchcode = 'sbi020' 
and description = 'fuel payment' 
and type = 'debit';

-- 36. selecting specific transaction dates
select * from transactions 
where transactiondate = '2024-06-10' 
or transactiondate = '2024-07-21';

-- 37. select transactions with branchcode not sbi999
select * from transactions 
where not branchcode = 'sbi999';

-- 38. concatenating specific information
select concat('john doe', '-', '2024-07-21', '-', 'credit') as necessaryinfo 
from transactions;

-- 39. selecting transaction status
select case 
when transactiondate = '2024-06-10' then 'sucessfull'
when transactiondate = '2024-07-05' then 'sucessfull'
when transactiondate = '2024-07-07' then 'sucessfull'
else 'pending'
end as transaction_status
from transactions;

-- 40. selecting new transaction system 
select case
when branchcode in ('sbi002', 'sbi003', 'sbi004') then 'new transaction system '
else 'old transaction system '
end as transaction_system 
from transactions;

-- 41. selecting transaction year
select transactionid, year(transactiondate) as transaction_year from transactions;

-- 42. selecting transaction day
select transactionid, day(transactiondate) as transaction_day from transactions;

-- 43. selecting transaction month
select transactionid, monthname(transactiondate) as transaction_month from transactions;

-- 44. selecting all credit transactions
select * from transactions 
where type != 'debit';

-- 45. selecting transactions with id greater than 1010
select * from transactions 
where transactionid > 1010;

-- 46.selecting Upi with sucess
select * from Transactions 
WHERE Mode = 'UPI' AND Status = 'Success';

-- 47 Transactions between specific dates
select * from Transactions 
where TransactionDate between '2024-07-01' and '2024-07-31';

-- 48. failed transaction
update Transactions 
set Status = 'Failed' 
where TransactionID = 1014;

-- 49. trransaction moide
alter table Transactions 
change column TransactionMode VARCHAR(20);


-- Table-4: Loans

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType VARCHAR(20),
    Amount DECIMAL(12,2),
    StartDate DATE,
    TenureMonths INT,
    InterestRate FLOAT,
    EMI DECIMAL(10,2),
    Status VARCHAR(10),
    BranchCode VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Loans VALUES
(201, 1, 'Home', 2500000.00, '2023-01-01', 240, 7.5, 22345.67, 'Active', 'SBI001'),
(202, 2, 'Car', 800000.00, '2023-05-10', 60, 9.2, 16543.00, 'Active', 'SBI002'),
(203, 3, 'Personal', 200000.00, '2024-01-15', 36, 11.5, 6720.45, 'Active', 'SBI003'),
(204, 4, 'Education', 400000.00, '2022-06-01', 48, 10.0, 10450.30, 'Active', 'SBI004'),
(205, 5, 'Home', 1500000.00, '2023-04-20', 180, 8.0, 15400.00, 'Active', 'SBI005'),
(206, 6, 'Car', 950000.00, '2022-03-01', 60, 9.5, 17250.20, 'Active', 'SBI006'),
(207, 7, 'Business', 1200000.00, '2023-07-10', 84, 8.9, 19300.00, 'Active', 'SBI007'),
(208, 8, 'Education', 350000.00, '2021-08-15', 48, 10.2, 9450.00, 'Active', 'SBI008'),
(209, 9, 'Home', 1800000.00, '2023-09-01', 240, 7.0, 19800.50, 'Active', 'SBI009'),
(210, 10, 'Car', 600000.00, '2022-02-20', 60, 9.1, 13450.00, 'Active', 'SBI010'),
(211, 11, 'Personal', 250000.00, '2023-11-10', 36, 11.2, 7300.00, 'Active', 'SBI011'),
(212, 12, 'Home', 3000000.00, '2022-12-12', 240, 6.9, 24500.00, 'Active', 'SBI012'),
(213, 13, 'Education', 420000.00, '2023-05-01', 60, 10.4, 9900.00, 'Active', 'SBI013'),
(214, 14, 'Car', 700000.00, '2021-10-10', 48, 9.3, 15000.00, 'Active', 'SBI014'),
(215, 15, 'Home', 2200000.00, '2022-01-05', 240, 7.2, 21400.00, 'Active', 'SBI015'),
(216, 16, 'Business', 1000000.00, '2022-06-25', 120, 8.8, 19500.00, 'Active', 'SBI016'),
(217, 17, 'Personal', 300000.00, '2023-04-14', 36, 11.0, 8800.00, 'Active', 'SBI017'),
(218, 18, 'Education', 250000.00, '2022-07-07', 48, 10.5, 7800.00, 'Active', 'SBI018'),
(219, 19, 'Car', 850000.00, '2023-03-03', 60, 9.0, 15800.00, 'Active', 'SBI019'),
(220, 20, 'Personal', 200000.00, '2024-03-20', 36, 11.5, 6720.45, 'Active', 'SBI020');

-- List all home loans above ₹20 lakhs
SELECT * FROM Loans;

-- Clear all loan records
TRUNCATE TABLE Loans;

-- Delete the Loans table from database
DROP TABLE Loans;

-- Queries

-- 1. selecting loans ordered by loanid
select * from loans order by loanid desc;

-- 2. select count of loans by branchcode
select branchcode, count(*) as count from loans group by branchcode having count(*) > 1;

-- 3. select distinct loan types
select distinct loantype from loans;

-- 4. select specific loan
select * from loans where loanid = 201;

-- 5. selecting loans with specific branchcodes
select * from loans where branchcode in ('sbi001', 'sbi002');

-- 6. selecting specific loans 
select loanid, interestrate from loans where interestrate is null;

-- 7. selecting multiple columns 
select loanid, startdate from loans where customerid = 3 order by amount desc;

-- 8. selecting loantype starting with spoecifc word
select loanid, startdate from loans where loantype like 'h%';

-- 9. selecting loans with specific start dates
select loanid from loans 
where startdate in ('2023-01-01', '2022-12-12') 
order by amount desc;

-- 10. renaming column loantype to loan_category
alter table loans rename column loantype to loan_category;

-- 11. renaming column startdate to loan_start_date
alter table loans rename column startdate to loan_start_date;

-- 12. renaming column branchcode to branch_code
alter table loans rename column branchcode to branch_code;

-- 13. modifying loan_category column length
alter table loans modify loantype varchar(30);

-- 14. uppercasing loan types
select upper(loantype) as upper_loantype from loans;

-- 15. lowercasing status column
select lower(status) as lower_status from loans;

-- 16. concatenating loan type and branch info
select concat(loantype, ' - ', branchcode) as loan_branch from loans;

-- 17. using arithmetic: deduct 50000 from loan amount
select amount - 50000 as adjusted_amount from loans;

-- 18. summing all loan amounts
select sum(amount) as total_loans from loans;

