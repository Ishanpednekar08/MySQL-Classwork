-- Single Line Comment

/*
Multi
Line 
Comment 
*/

-- ---------------------------------------- Database Queries ----------------------------------------------------------
-- create hospital database
create database hospital;

-- to work with database use it
use hospital;

-- ---------------------------------------- Database Analysis -----------------------------------------------------------
-- Table 1: Patients: Patient_ID,Name,Age,Gender,Contact,address
-- Table 2: Doctors: Doctor_ID,Name,Specialty,Contact,Experience,Department
-- Table 3: Appointments: Appointment_ID,Patient_ID,Doctor_ID,Date,Time,Reason 	
-- Table 4: Medications: Medication_ID, Patient_ID, Medicine_Name,Dosage,Duration,Prescribed_By
-- Table 5: Bills: Bill_ID,Patient_ID,Amount,Payment_Status,Date,Mode_of_Pay 

-- --------------------------------------- Table Queries ---------------------------------------------------------------
-- Table 1: Patients 
CREATE TABLE Patients (
Patient_ID INT PRIMARY KEY,
Name varchar (50),
Age INT,
Gender varchar (10),
Contact varchar (15),
Address varchar (100)
);

-- to insert records 
INSERT INTO Patients VALUES 
(1, 'Raju', 25, 'Male', '98763210', 'Pune'),
(2, 'Ram', 30, 'Male', '87632109', 'Mumbai'),
(3, 'Sita', 28, 'Female', '99776655', 'Delhi'),
(4, 'Ishan', 22, 'Male', '89001122', 'Pune'),
(5, 'Pooja', 35, 'Female', '88990011', 'Nashik'),
(6, 'Sam', 40, 'Male', '90909090', 'Mumbai'),
(7, 'Meena', 29, 'Female', '83456789', 'Pune'),
(8, 'Ali', 33, 'Male', '70145678', 'Nagpur'),
(9, 'Neha', 31, 'Female', '23456780', 'Mumbai'),
(10, 'Rani', 27, 'Female', '998998899', 'Pune');

-- to display records from the table
select * from Patients;

-- to remove records from table
truncate table Patients;

-- to remove complete records and attributes from table 
drop table Patients;

-- Table 2: Doctors
CREATE TABLE Doctors (
Doctor_ID int PRIMARY KEY,
Name varchar(50),
Specialty varchar(30),
Contact_Number varchar(15),
Experience INT,
Department varchar(30)
);

-- to insert records 
INSERT INTO Doctors VALUES 
(1, 'Dr. Shyam', 'Cardiologist', '23451234', 10, 'Cardiology'),
(2, 'Dr. Neeta', 'Dermatologist', '84562345', 7, 'Skin'),
(3, 'Dr. Ravi', 'Neurologist', '85673456', 12, 'Neuro'),
(4, 'Dr. Lala', 'Pediatrician', '84784567', 9, 'Children'),
(5, 'Dr. Ovis', 'Orthopedic', '85895678', 15, 'Bones'),
(6, 'Dr. Nita', 'Gynecologist', '8678906789', 8, 'Women'),
(7, 'Dr. Amit', 'Physician', '8789890', 6, 'General'),
(8, 'Dr. Meera', 'Psychiatrist', '890128901', 11, 'Mental Health'),
(9, 'Dr. Farhan', 'ENT', '8901232', 5, 'Ear Nose Throat'),
(10, 'Dr. Soa', 'Oncologist', '12340123', 14, 'Cancer');

-- to display records from the table
select * from Doctors;

-- to remove records from table
truncate table Doctors;

-- to remove complete records and attributes from table 
drop table Doctors;

-- Table 3: Appointments
CREATE TABLE Appointments (
Appointment_ID int PRIMARY KEY,
Patient_ID INT,
Doctor_ID int,
Date DATE,
Time TIME,
Reason varchar(100),
Foreign key (Patient_ID) references Patients(Patient_ID),
Foreign key (Doctor_ID) references Doctors(Doctor_ID)
);

-- to insert records
INSERT INTO Appointments VALUES 
('1', 1, '1', '2025-06-20', '10:00:00', 'Heart Checkup'),
('2', 2, '2', '2025-06-18', '11:00:00', 'Skin Allergy'),
('3', 3, '3', '2025-06-19', '12:00:00', 'Head Pain'),
('4', 4, '4', '2025-06-20', '09:00:00', 'Child Fever'),
('5', 5, '5', '2025-06-21', '14:00:00', 'Back Pain'),
('6', 6, '6', '2025-06-22', '15:00:00', 'Routine Check'),
('7', 7, '7', '2025-06-18', '16:00:00', 'Fever'),
('8', 8, '8', '2025-06-21', '11:00:00', 'Stress'),
('9', 9, '9', '2025-06-23', '10:30:00', 'Ear Pain'),
('10', 10, '10', '2025-06-22', '12:00:00', 'Cancer Test');

-- to display records from the table
select * from Appointments;

-- to remove records from table
truncate table Appointments;

-- to remove complete records and attributes from table 
drop table Appointments;

-- Table 4: Medications
CREATE TABLE Medications (
Medication_ID INT PRIMARY KEY,
Patient_ID INT,
Medicine_Name varchar(50),
Dosage varchar(30),
Duration varchar(30),
Foreign key (Patient_ID) references Patients(Patient_ID)
);

INSERT INTO Medications VALUES 
(1, 1, 'Aspirin', '1 tab/day', '5 days'),
(2, 2, 'Cetirizine', '1 tab/night', '3 days'),
(3, 3, 'Paracetamol', '2 tab/day', '7 days'),
(4, 4, 'Ibuprofen', '1 tab/8hr', '4 days'),
(5, 5, 'Calpol', '1 tab/day', '3 days'),
(6, 6, 'Folic Acid', '1 tab/day', '30 days'),
(7, 7, 'Multivitamin', '1 tab/day', '15 days'),
(8, 8, 'Sertraline', '50mg/day', '60 days'),
(9, 9, 'Amoxicillin', '3 tab/day', '5 days'),
(10, 10, 'Tamoxifen', '20mg/day', '90 days');

-- to display records from the table
select * from Medications;

-- to remove records from table
truncate table Medications;

-- to remove complete records and attributes from table 
drop table Medications;

-- Table 5: Bills
CREATE TABLE Bills (
Bill_ID int PRIMARY KEY,
Patient_ID INT,
Amount DECIMAL(10,2),
Payment_Status varchar(10),
Date DATE,
Mode_of_Payment varchar(20),
foreign key (Patient_ID) references Patients(Patient_ID)
);

-- to insert records
INSERT INTO Bills VALUES 
(1, 1, 500.00, 'Paid', '2025-06-20', 'Cash'),
(2, 2, 300.00, 'Paid', '2025-06-18', 'UPI'),
(3, 3, 800.00, 'Pending', '2025-06-19', 'Card'),
(4, 4, 450.00, 'Paid', '2025-06-20', 'Cash'),
(5, 5, 1200.00, 'Paid', '2025-06-21', 'Online'),
(6, 6, 600.00, 'Pending', '2025-06-22', 'Card'),
(7, 7, 250.00, 'Paid', '2025-06-18', 'Cash'),
(8, 8, 700.00, 'Paid', '2025-06-21', 'UPI'),
(9, 9, 550.00, 'Paid', '2025-06-23', 'Card'),
(10, 10, 2000.00, 'Pending', '2025-06-22', 'Cash');

-- to display records from the table
select * from Bills;

-- to remove records from table
truncate table Bills;

-- to remove complete records and attributes from table 
drop table Bills;
