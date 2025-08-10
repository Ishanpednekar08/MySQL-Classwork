-- Single line Comment 

/* 
Multi
line 
Comment 
*/

-- -------------------------------------------------- Database Queries -------------------------------------------------------------------------------------------
-- to create a database 
create database Healthcare_System;

-- to work on it we need to use the database
use Healthcare_System;

-- --------------------------------------------------- Database Analysis -------------------------------------------------------------------------------------------
/*
Patients: Patient_ID (Primary Key), Name, Age, Gender, Contact, Address.
Doctors: Doctor_ID (Primary Key), Name, Specialty, Phone, Email.
Appointments: Appointment_ID (Primary Key), Patient_ID (FK), Doctor_ID (FK), Date, Time, Status.
Medical_History: History_ID (Primary Key), Patient_ID (FK), Diagnosis, Treatment, Notes.
Medications: Medication_ID (Primary Key), Name, Type, Price, Description.
Prescriptions: Prescription_ID (Primary Key), Patient_ID (FK), Medication_ID (FK), Date_Provided, Dosage.
Bills: Bill_ID (Primary Key), Patient_ID (FK), Total_Amount, Payment_Status, Date.
Staff: Staff_ID (Primary Key), Name, Role, Contact, Shift.
Departments: Department_ID (Primary Key), Name, Location, Phone.
Facilities: Facility_ID (Primary Key), Name, Type, Cost, Availability_Status.
*/

-- --------------------------------------------------- Table Queries ------------------------------------------------------------------------------------

-- Table 1: Patient_ID 
create table patients (
Patient_ID Int Primary key, 
Name varchar (100),
Age int,
Gender varchar (100),
Contact varchar (100),
address varchar (100)
);

-- inserting records into the table 
insert into Patients 
VALUES
(1, 'John Doe', 45, 'Male', '555-1234', '123 Elm Street'),
(2, 'Mary Smith', 32, 'Female', '555-2345', '456 Oak Avenue'),
(3, 'Robert Johnson', 67, 'Male', '555-3456', '789 Pine Road'),
(4, 'Patricia Brown', 29, 'Female', '555-4567', '321 Maple Blvd'),
(5, 'Michael Davis', 54, 'Male', '555-5678', '654 Cedar Lane'),
(6, 'Linda Wilson', 38, 'Female', '555-6789', '987 Birch Drive'),
(7, 'James Miller', 73, 'Male', '555-7890', '159 Spruce Street'),
(8, 'Barbara Moore', 41, 'Female', '555-8901', '753 Walnut Avenue'),
(9, 'William Taylor', 60, 'Male', '555-9012', '852 Chestnut Road'),
(10, 'Elizabeth Anderson', 50, 'Female', '555-0123', '951 Poplar Court');

-- show all patients
select * from patients;

-- delete all patient data
truncate table patients;

-- delete patients table
drop table patients;

-- select queries
-- 1. Select specific patient with specific patient_id 
select * from patients 
where patient_id = 3;

-- 2. selecting specific patient with gender female
select name, age , contact 
from patients 
where gender = 'Female';

-- 3. selecting patients with certain age order
select name, contact, address
from patients 
order by age Desc;

-- 4. Selecting oldest patients (only 3)
select name, contact, address
from patients 
order by age DESC
limit 3;

-- 5. Selecting patients between certain age 
select * from patients 
where age >= 30 and age <= 60;

-- alter queries 
-- 1. making columns not null
alter table patients
modify name varchar (100) not null;

-- 2. adding unique constraint on contact
alter table patients 
add constraint unique_contact unique (contact);

-- 3. adding check constraint on age 
alter table patients 
add constraint check_age check (age >= 0 and age <= 120);

-- 4. adding default constraint to gender column is null
alter table patients 
modify gender varchar (100) default	'unknown';

-- 5. altering column name
alter table patients 
change column name fullname varchar (100);

-- disables safe update mode,
SET SQL_SAFE_UPDATES = 0;

-- turn safe mode back
SET SQL_SAFE_UPDATES = 1;

-- Delete queries
-- 1. deleting specific patient id
delete from patients
where patient_ID = 10;

-- 2. deleting all males patients over certain age
delete from patients 
where gender = 'Male' and age > 65;

-- 3. deleting specific patients with specific name
delete from patients 
where fullname like 'M%';

-- 4. deleting patients with specific address
delete from patients 
where address in ('786 pine road' , '321 Mapie Blvd');

-- 5. deleting the 2 oldest patients
delete from patients 
order by age desc
limit 2;

-- update queries 
-- 1. update specific patient contact number
update patients 
set contact = '888-222'
where patient_id = 3;

-- 2. updating address of certain age patients
update patients 
set address = 'Old age home'
where age > 60;

-- 3. update gender where gender is null
update patients 
set gender = 'other'
where gender is null;

-- 4. update names of certain patients
update patients 
set fullname = CONCAT(fullname, ' Uday')
where Patient_ID in (1, 3, 5);

-- Table 2: Doctors 
create table Doctors (
Doctor_ID Int Primary Key, 
Name varchar (100), 
Specialty varchar (100), 
Phone varchar (100), 
Email varchar (100)
);

-- inserting records into the table 
INSERT INTO Doctors 
VALUES
(1, 'Dr. Emily Clark', 'Cardiology', '555-1001', 'eclark@hospital.org'),
(2, 'Dr. David Lee', 'Orthopedics', '555-1002', 'dlee@hospital.org'),
(3, 'Dr. Susan Adams', 'Neurology', '555-1003', 'sadams@hospital.org'),
(4, 'Dr. Mark Patel', 'Dermatology', '555-1004', 'mpatel@hospital.org'),
(5, 'Dr. Karen Wright', 'Pediatrics', '555-1005', 'kwright@hospital.org'),
(6, 'Dr. Steven Martinez', 'Gastroenterology', '555-1006', 'smartinez@hospital.org'),
(7, 'Dr. Jennifer Lewis', 'Oncology', '555-1007', 'jlewis@hospital.org'),
(8, 'Dr. Brian Scott', 'Endocrinology', '555-1008', 'bscott@hospital.org'),
(9, 'Dr. Angela Turner', 'Ophthalmology', '555-1009', 'aturner@hospital.org'),
(10, 'Dr. Kevin Hall', 'Psychiatry', '555-1010', 'khall@hospital.org');

-- show all doctors
select * from doctors;

-- delete all doctor data
truncate table doctors;

-- delete doctors table
drop table doctors;

-- Select Queries 
-- 1. Select all Cardiologists
SELECT * FROM Doctors
WHERE Specialty = 'Cardiology';

-- 2. Count doctors per specialty
SELECT Specialty, COUNT(*) AS Total_Doctors
FROM Doctors
GROUP BY Specialty;

-- 3. Select specialties with more than 1 doctor
SELECT Specialty, COUNT(*) AS Count_Specialty
FROM Doctors
GROUP BY Specialty
HAVING COUNT(*) > 1;

-- 4. Get doctors ordered by name
SELECT Doctor_ID, Name, Specialty
FROM Doctors
ORDER BY Name ASC;

-- 5. Show first 3 entries
SELECT * FROM Doctors
LIMIT 3;

-- Alter Queries
-- 1. Add NOT NULL constraint to Name
ALTER TABLE Doctors
MODIFY Name VARCHAR(100) NOT NULL;

-- 2. Add UNIQUE constraint to Email
ALTER TABLE Doctors
ADD CONSTRAINT unique_email UNIQUE (Email);

-- 3. Add a new column: Experience (in years)
ALTER TABLE Doctors
ADD Experience INT;

-- 4. Add CHECK constraint on Experience (must be >= 1)
ALTER TABLE Doctors
ADD CONSTRAINT check_experience CHECK (Experience >= 1);

-- 5. Add DEFAULT value for Experience (5 years)
ALTER TABLE Doctors
ALTER COLUMN Experience SET DEFAULT 5;

-- Rename Queries
-- 1. Rename column Phone to Contact
ALTER TABLE Doctors
RENAME COLUMN Phone TO Contact;

-- 2. Rename table to Medical_Professionals
ALTER TABLE Doctors
RENAME TO Medical_Professionals;

-- 3. Rename column Specialty to Department
ALTER TABLE Medical_Professionals
RENAME COLUMN Specialty TO Department;

-- 4. Rename column Email to Email_ID
ALTER TABLE Medical_Professionals
RENAME COLUMN Email TO Email_ID;

-- 5. Rename column Experience to Years_of_Experience
ALTER TABLE Medical_Professionals
RENAME COLUMN Experience TO Years_of_Experience;

-- 6. Rename table to Doctors
ALTER TABLE Medical_Professionals
RENAME TO Doctors;

-- disables safe update mode,
SET SQL_SAFE_UPDATES = 0;

-- turn safe mode back
SET SQL_SAFE_UPDATES = 1;

-- Delete queries
-- 1. Delete a doctor by ID
DELETE FROM Doctors
WHERE Doctor_ID = 10;

-- 2. Delete doctors from Endocrinology department
DELETE FROM Doctors
WHERE Department = 'Endocrinology';

-- 3. Delete all doctors with more than 30 years of experience
DELETE FROM Doctors
WHERE Years_of_Experience > 30;

-- 4. Delete doctors whose name starts with 'Dr. S'
DELETE FROM Doctors
WHERE Name LIKE 'Dr. S%';

-- 5. Delete doctors with NULL contact info
DELETE FROM Doctors
WHERE Contact IS NULL;

select * from doctors;

-- update Queries
-- 1. Update experience of Dr. Emily Clark to 12 years
UPDATE Doctors
SET Experience = 12
WHERE Name = 'Dr. Emily Clark';

-- 2. Set default experience to 5 for all null values
UPDATE Doctors
SET Experience = 5
WHERE Experience IS NULL;

-- 3. Change department of Dr. Karen Wright to 'Neonatology'
UPDATE Doctors
SET Department = 'Neonatology'
WHERE Name = 'Dr. Karen Wright';

-- 4. Update email of Dr. David Lee
UPDATE Doctors
SET Email_ID = 'dr.lee@hospital.org'
WHERE Doctor_ID = 2;

-- 5. Increase experience by 1 year for all doctors in Cardiology
UPDATE Doctors
SET Experience = Experience + 1
WHERE Department = 'Cardiology';

-- Table 3: Appointments 
create table Appointments (
Appointment_ID int Primary Key, 
Patient_ID int, 
Doctor_ID int, 
Date Date, 
Time Time, 
Status Enum ('Completed' , 'Scheduled'),
Constraint fk_patient
Foreign key (Patient_ID) References Patients (Patient_ID)
ON DELETE SET NULL                          
-- If a Patients is deleted, set the Appointment's Patient_ID to NULL
ON UPDATE CASCADE,                            
-- If a Patient_ID is updated, update it in Appointments
constraint fk_doctor
Foreign key (Doctor_ID) References Doctors (Doctor_ID)
ON DELETE SET NULL                          
-- If a Doctors is deleted, set the Appointment's Doctor_ID to NULL
ON UPDATE CASCADE                            
-- If a Doctor_ID is updated, update it in Appointments
);

-- inserting records into the table 
INSERT INTO Appointments 
VALUES
(1, 1, 1, '2025-07-01', '09:00:00', 'Completed'),
(2, 2, 2, '2025-07-02', '10:30:00', 'Scheduled'),
(3, 3, 3, '2025-07-03', '11:15:00', 'Completed'),
(4, 4, 4, '2025-07-04', '14:00:00', 'Completed'),
(5, 5, 5, '2025-07-05', '15:45:00', 'Scheduled'),
(6, 6, 6, '2025-07-06', '08:30:00', 'Completed'),
(7, 7, 7, '2025-07-07', '09:45:00', 'Scheduled'),
(8, 8, 8, '2025-07-08', '13:00:00', 'Completed'),
(9, 9, 9, '2025-07-09', '10:00:00', 'Scheduled'),
(10, 10, 10, '2025-07-10', '16:00:00', 'Completed');

-- show all appointments
select * from appointments;

-- delete all appointment data
truncate table appointments;

-- delete appointments table
drop table appointments;

-- Select Queries
-- 1. select all scheduled appointments
select * from appointments
where status = 'Scheduled';

-- 2. count of appointments per doctor
select doctor_id, count(*) as total_appointments
from appointments
group by doctor_id;

-- 3. find doctors who have more than 1 completed appointment
select doctor_id, count(*) as completed_count
from appointments
where status = 'Completed'
group by doctor_id
having count(*) > 1;

-- 4. list appointments in descending order of date
select * from appointments
order by date desc;

-- 5. get the first 5 appointments by time
select * from appointments
order by time
limit 5;

-- Alter queries
-- 1. add a not null constraint to Date
alter table appointments
modify date date not null;

-- 2. add a new column room_number with default 101
alter table appointments
add room_number int default 101;

-- 3. add a unique constraint on appointment time per doctor
alter table appointments
add constraint unique_time_per_doctor unique (doctor_id, time);

-- 4. add a check constraint on appointment time to allow only business hours (8 AM - 6 PM)
alter table appointments
add constraint check_time check (time between '08:00:00' and '18:00:00');

-- 5. add a new column remarks with default value 'none'
alter table appointments
add remarks varchar(100) default 'none';

-- Rename queries 
-- 1. rename column 'date' to 'appointment_date'
alter table appointments
rename column date to appointment_date;

-- 2. rename column 'time' to 'appointment_time'
alter table appointments
rename column time to appointment_time;

-- 3. rename column 'status' to 'appointment_status'
alter table appointments
rename column status to appointment_status;

-- 4. rename column 'room_number' to 'consultation_room'
alter table appointments
rename column room_number to consultation_room;

-- 5. rename column 'remarks' to 'notes'
alter table appointments
rename column remarks to notes;

-- Delete queries
-- 1. delete all appointments scheduled in consultation room 101
delete from appointments
where consultation_room = 101;

-- 2. delete appointments with appointment_status = 'Completed' and notes = 'none'
delete from appointments
where appointment_status = 'Completed' and notes = 'none';

-- 3. delete appointments after '2025-07-08'
delete from appointments
where appointment_date > '2025-07-08';

-- 4. delete appointments scheduled before 9 AM
delete from appointments
where appointment_time < '09:00:00';

-- 5. delete appointments where patient_id is null
delete from appointments
where patient_id is null;

-- update queries 
-- 1. update consultation room to 202 for doctor_id 3
update appointments
set consultation_room = 202
where doctor_id = 3;

-- 2. update appointment_status to 'Completed' for appointment_id 2
update appointments
set appointment_status = 'Completed'
where appointment_id = 2;

-- 3. change notes to 'Follow-up needed' for all scheduled appointments
update appointments
set notes = 'Follow-up needed'
where appointment_status = 'Scheduled';

-- 4. update appointment_time to '10:00:00' for appointment_id 6
update appointments
set appointment_time = '10:00:00'
where appointment_id = 6;

-- 5. change appointment_date to '2025-07-15' for doctor_id 5
update appointments
set appointment_date = '2025-07-15'
where doctor_id = 5;

-- Table 4: Medical_History: 
create table Medical_History (
History_ID INT Primary Key, 
Patient_ID INT, 
Diagnosis varchar (100), 
Treatment varchar (100), 
Notes varchar (100),
Foreign key (Patient_ID) references Patients (Patient_ID)
ON DELETE SET NULL                          
-- If a Patients is deleted, set the Medical_History's Patient_ID to NULL
ON UPDATE CASCADE                           
-- If a Patient_ID is updated, update it in Medical_History
);

INSERT INTO Medical_History (History_ID, Patient_ID, Diagnosis, Treatment, Notes) VALUES
(1, 1, 'Hypertension', 'Medication', 'Blood pressure stable'),
(2, 2, 'Fractured Arm', 'Cast Application', 'Healing as expected'),
(3, 3, 'Stroke', 'Rehabilitation Therapy', 'Speech improving'),
(4, 4, 'Eczema', 'Topical Cream', 'Skin irritation reduced'),
(5, 5, 'Asthma', 'Inhaler', 'Symptoms under control'),
(6, 6, 'Ulcer', 'Antacid Therapy', 'Requires follow-up'),
(7, 7, 'Lung Cancer', 'Chemotherapy', 'Responding to treatment'),
(8, 8, 'Diabetes', 'Insulin Therapy', 'Blood sugar monitored'),
(9, 9, 'Cataract', 'Surgery', 'Vision improved'),
(10, 10, 'Depression', 'Counseling & Medication', 'Mood stable');

-- show all history
select * from medical_history;

-- delete all history data
truncate table medical_history;

-- delete medical_history table
drop table medical_history;

-- Select queries
-- 1. select all patients diagnosed with diabetes
select * from medical_history
where diagnosis = 'Diabetes';

-- 2. count of patients per diagnosis
select diagnosis, count(*) as total_patients
from medical_history
group by diagnosis;

-- 3. find diagnoses that appear more than once
select diagnosis, count(*) as diagnosis_count
from medical_history
group by diagnosis
having count(*) > 1;

-- 4. list all records ordered by treatment in ascending order
select * from medical_history
order by treatment asc;

-- 5. select top 3 records with patient_id not null
select * from medical_history
where patient_id is not null
limit 3;

-- alter queries 
-- 1. add a not null constraint to diagnosis
alter table medical_history
modify diagnosis varchar(100) not null;

-- 2. add a new column diagnosis_date with default as current date
alter table medical_history
add diagnosis_date date;

-- 3. add a unique constraint on combination of patient_id and diagnosis
alter table medical_history
add constraint unique_patient_diagnosis unique (patient_id, diagnosis);

-- 4. add a check constraint on treatment length (minimum 5 characters)
alter table medical_history
add constraint check_treatment_length check (char_length(treatment) >= 5);

-- 5. add a default value to notes column as 'no remarks'
alter table medical_history
alter column notes set default 'no remarks';

-- rename queries
-- 1. rename column diagnosis to condition
alter table medical_history
rename column diagnosis to medicalcondition;

-- 2. rename column treatment to prescribed_treatment
alter table medical_history
rename column treatment to prescribed_treatment;

-- 3. rename column notes to doctor_notes
alter table medical_history
rename column notes to doctor_notes;

-- 4. rename column diagnosis_date to reported_on
alter table medical_history
rename column doctor_notes to notes;

-- 5. rename table medical_history to patient_medical_history
alter table medical_history
rename to patient_medical_history;

-- delete queries
-- 1. delete records where prescribed_treatment = 'Inhaler'
delete from patient_medical_history
where prescribed_treatment = 'Inhaler';

-- 2. delete records where doctor_notes is 'no remarks'
delete from patient_medical_history
where doctor_notes = 'no remarks';

-- 3. delete records reported before '2025-01-01'
delete from patient_medical_history
where reported_on < '2025-01-01';

-- 4. delete records where condition = 'Ulcer' and patient_id = 6
delete from patient_medical_history
where condition = 'Ulcer' and patient_id = 6;

-- 5. delete records where prescribed_treatment length is less than 6 characters
delete from patient_medical_history
where char_length(prescribed_treatment) < 6;

-- update queries
-- 1. update prescribed_treatment to 'Laser Therapy' for patient_id 9
update patient_medical_history
set treatment = 'Laser Therapy'
where patient_id = 9;

select * from patient_medical_history;
-- 2. update doctor_notes to 'recovered well' where condition = 'Fractured Arm'
update patient_medical_history
set notes = 'recovered well'
where medicalcondition = 'Fractured Arm';

-- 3. change reported_on to '2025-08-01' for all depression cases
update patient_medical_history
set diagnosis_date = '2025-08-01'
where medicalcondition = 'Depression';

-- 4. update prescribed_treatment to 'Lifestyle Changes' for all cases of Diabetes
update patient_medical_history
set treatment = 'Lifestyle Changes'
where medicalcondition = 'Diabetes';

-- 5. update doctor_notes to 'follow-up in 1 week' for all patient_ids less than 5
update patient_medical_history
set notes = 'follow-up in 1 week'
where patient_id < 5;

-- Table 5: Medications 
create table Medications (
Medication_ID Int primary key,
Name varchar (100), 
Type Enum ('Tablet', 'Inhaler', 'Capsule' , 'Topical'), 
Price decimal (20,8), 
Description varchar (100)
);

INSERT INTO Medications (Medication_ID, Name, Type, Price, Description) VALUES
(1, 'Lisinopril', 'Tablet', 25.00, 'Used for high blood pressure'),
(2, 'Ibuprofen', 'Tablet', 10.00, 'Pain reliever'),
(3, 'Metformin', 'Tablet', 30.00, 'Controls blood sugar in diabetes'),
(4, 'Albuterol Inhaler', 'Inhaler', 45.00, 'Relieves asthma symptoms'),
(5, 'Fluoxetine', 'Capsule', 20.00, 'Treats depression'),
(6, 'Omeprazole', 'Capsule', 15.00, 'Reduces stomach acid'),
(7, 'Amlodipine', 'Tablet', 18.00, 'Treats hypertension'),
(8, 'Hydrocortisone Cream', 'Topical', 12.00, 'Reduces skin inflammation'),
(9, 'Warfarin', 'Tablet', 22.00, 'Blood thinner'),
(10, 'Atorvastatin', 'Tablet', 28.00, 'Lowers cholesterol');

-- show all medications
select * from medications;

-- delete all medication data
truncate table medications;

-- delete medications table
drop table medications;

-- Select queries
-- 1. select all medications of type 'tablet'
select * from medications
where type = 'Tablet';

-- 2. count of medications by type
select type, count(*) as total
from medications
group by type;

-- 3. select types that have more than 2 medications
select type, count(*) as count_type
from medications
group by type
having count(*) > 2;

-- 4. list all medications sorted by price descending
select * from medications
order by price desc;

-- 5. show the top 3 cheapest medications
select * from medications
order by price asc
limit 3;

-- alter queries
-- 1. make name not null
alter table medications
modify name varchar(100) not null;

-- 2. add a unique constraint on name
alter table medications
add constraint unique_med_name unique (name);

-- 3. add a column manufacturer with default value 'unknown'
alter table medications
add manufacturer varchar(100) default 'unknown';

-- 4. add a check constraint to ensure price is greater than 0
alter table medications
add constraint check_price_positive check (price > 0);

-- 5. add a column stock_quantity with default 100
alter table medications
add stock_quantity int default 100;

-- rename queries
-- 1. rename column name to med_name
alter table medications
rename column name to med_name;

-- 2. rename column type to med_type
alter table medications
rename column type to med_type;

-- 3. rename column price to cost
alter table medications
rename column price to cost;

-- 4. rename column description to med_description
alter table medications
rename column description to med_description;

-- 5. rename table medications to pharmacy_inventory
alter table medications
rename to pharmacy_inventory;

-- 5. rename table medications to pharmacy_inventory
alter table pharmacy_inventory
rename to medications;

-- delete queries
-- 1. delete all medications where cost is less than 15
delete from pharmacy_inventory
where cost < 15;

-- 2. delete medications where med_type is 'topical'
delete from pharmacy_inventory
where med_type = 'Topical';

-- 3. delete medications with stock_quantity = 100
delete from pharmacy_inventory
where stock_quantity = 100;

-- 4. delete medications where manufacturer is 'unknown'
delete from pharmacy_inventory
where manufacturer = 'unknown';

-- 5. delete medications whose med_name starts with 'A'
delete from pharmacy_inventory
where med_name like 'A%';
select * from pharmacy_inventory;
-- Update queries
-- 1. update cost of 'fluoxetine' to 25
update pharmacy_inventory
set price = 25.00
where med_name = 'Fluoxetine';

-- 2. change manufacturer to 'pfizer' for all capsules
update pharmacy_inventory
set manufacturer = 'Pfizer'
where med_type = 'Capsule';

-- 3. increase cost by 5 for all tablets
update pharmacy_inventory
set price = price + 5
where med_type = 'Tablet';

-- 4. set stock_quantity to 50 where cost > 40
update pharmacy_inventory
set stock_quantity = 50
where price > 40;

-- 5. update med_description to 'updated description' for 'warfarin'
update pharmacy_inventory
set med_description = 'Updated description'
where med_name = 'Warfarin';

-- Table 6: Prescriptions
create table prescriptions (
prescription_id int primary key,
patient_id int,
medication_id int,
date_provided date,
dosage varchar(50),
foreign key (patient_id) references patients(patient_id) 
on delete set null on update cascade,
foreign key (medication_id) references medications(medication_id) 
on delete set null on update cascade
);

-- insert values
insert into prescriptions values
(1, 1, 1, '2025-07-01', '10mg daily'),
(2, 2, 2, '2025-07-02', '200mg twice a day'),
(3, 3, 3, '2025-07-03', '500mg after meals'),
(4, 4, 4, '2025-07-04', '2 puffs as needed'),
(5, 5, 5, '2025-07-05', '20mg once daily'),
(6, 6, 6, '2025-07-06', '1 capsule before breakfast'),
(7, 7, 7, '2025-07-07', '5mg daily'),
(8, 8, 8, '2025-07-08', 'apply twice daily'),
(9, 9, 9, '2025-07-09', '2 tablets daily'),
(10, 10, 10, '2025-07-10', '10mg nightly');

select * from prescriptions;
-- Select queries
-- select all prescriptions with dosage information
select * from prescriptions;

-- select patient_id and medication_id for prescriptions given after july 5, 2025
select patient_id, medication_id from prescriptions
where date_provided > '2025-07-05';

-- select unique dosages to avoid repetition
select distinct dosage from prescriptions;

-- count how many prescriptions were given per day
select date_provided, count(*) as total_prescriptions from prescriptions
group by date_provided
order by total_prescriptions desc;

-- select first 3 prescriptions ordered by date
select * from prescriptions
order by date_provided asc
limit 3;

-- Alter queries
-- add a new column for prescribing doctor
alter table prescriptions add column doctor_name varchar(100);

-- add a not null constraint to dosage
alter table prescriptions modify column dosage varchar(50) not null;

-- add a check constraint to ensure dosage is not empty
alter table prescriptions 
add constraint chk_dosage_not_empty
check (dosage <> '');

-- add a default date if date_provided is not specified
alter table prescriptions 
alter column date_provided 
set default current_date;

-- add unique constraint to ensure no duplicate prescription id
alter table prescriptions 
add constraint unique_prescription_id
unique (prescription_id);

-- Rename queries
-- rename table prescriptions to patient_prescriptions
alter table prescriptions 
rename to patient_prescriptions;

-- rename table patient_prescriptions to prescriptions
alter table patient_prescriptions 
rename to prescriptions;

-- rename column dosage to dosage_instructions
alter table patient_prescriptions
 rename column dosage to dosage_instructions;

-- rename column date_provided to prescription_date
alter table patient_prescriptions 
rename column date_provided to prescription_date;

-- rename column medication_id to drug_id
alter table patient_prescriptions 
rename column medication_id to drug_id;

-- rename column patient_id to recipient_id
alter table patient_prescriptions 
rename column patient_id to recipient_id;

-- Delete queries
-- delete prescription where prescription_id is 10
delete from prescriptions 
where prescription_id = 10;

-- delete all prescriptions before july 4, 2025
delete from prescriptions 
where date_provided < '2025-07-04';

-- delete prescriptions with dosage containing 'capsule'
delete from prescriptions 
where dosage like '%capsule%';

-- delete prescriptions for patient_id 5
delete from prescriptions 
where patient_id = 5;

-- delete all prescriptions with null medication_id
delete from prescriptions 
where medication_id is null;

-- Update Queries
-- update dosage to '15mg daily' where prescription_id is 1
update prescriptions 
set dosage = '15mg daily'
where prescription_id = 1;

-- update date_provided to current date for prescriptions with null date
update prescriptions 
set prescription_date = current_date
where prescription_date is null;

-- set medication_id to null (to test on delete set null) where medication_id = 4
update prescriptions 
set medication_id = null
where medication_id = 4;

-- update dosage for all prescriptions with 'daily' to standard format
update prescriptions 
set dosage = 'daily dosage as prescribed'
where dosage like '%daily%';

-- update patient_id to 20 where prescription_id is 9 (to test foreign key constraint)
update prescriptions 
set patient_id = 20
where prescription_id = 9;

-- Table 7: Bills
-- create the bills table
create table bills (
bill_id int primary key,
patient_id int,
total_amount decimal(10, 2),
payment_status varchar(20),
date date,
Foreign key (patient_id) references patient_medical_history (patient_id)
);

-- insert 10 sample records
insert into bills 
values
(1, 1, 1200.50, 'paid', '2025-07-01'),
(2, 2, 850.00, 'unpaid', '2025-07-02'),
(3, 3, 1450.75, 'paid', '2025-07-03'),
(4, 4, 900.00, 'pending', '2025-07-04'),
(5, 5, 2000.00, 'paid', '2025-07-05'),
(6, 6, 1100.00, 'unpaid', '2025-07-06'),
(7, 7, 1750.90, 'paid', '2025-07-07'),
(8, 8, 1300.00, 'pending', '2025-07-08'),
(9, 9, 950.00, 'paid', '2025-07-09'),
(10, 10, 1025.00, 'unpaid', '2025-07-10');

-- show all bills
select * from bills;

-- delete all bills data
truncate table bills;

-- delete bills table
drop table bills;

-- select queries
-- select all bill records
select * from bills;

-- select unpaid bills only
select * from bills where payment_status = 'unpaid';

-- select bills with amount greater than 1000
select * from bills where total_amount > 1000;

-- count number of bills by payment status
select payment_status, count(*) as total_bills from bills
group by payment_status;

-- get top 3 highest billed amounts
select * from bills
order by total_amount desc
limit 3;

-- Alter Queries
-- add a new column for payment mode
alter table bills 
add column payment_mode varchar(30);

-- make payment_status not null
alter table bills 
modify column payment_status varchar(20) not null;

-- add check constraint to ensure total_amount is positive
alter table bills 
add constraint chk_amount_positive
check (total_amount > 0);

-- set default payment status as 'pending'
alter table bills 
alter column payment_status 
set default 'pending';

-- add unique constraint to prevent duplicate bill id
alter table bills 
add constraint unique_bill_id
unique (bill_id);

-- Rename queries
-- rename table bills to hospital_bills
alter table bills 
rename to hospital_bills;

-- rename column date to billing_date
alter table hospital_bills 
rename column date to billing_date;

-- rename column total_amount to amount_due
alter table hospital_bills 
rename column total_amount to amount_due;

-- rename column payment_status to status
alter table hospital_bills 
rename column status to payment_status;

-- rename column patient_id to patient_reference
alter table hospital_bills 
rename column patient_id to patient_reference;

-- rename table bills to hospital_bills
alter table hospital_bills 
rename to bills;

-- delete queries
-- delete bill with bill_id = 10
delete from bills 
where bill_id = 10;

-- delete all bills with status as 'pending'
delete from bills 
where payment_status = 'pending';

-- delete bills where amount is less than 1000
delete from bills 
where total_amount < 1000;

-- delete bills for patient_id = 4
delete from bills 
where patient_id = 4;

-- delete all bills after july 7, 2025
delete from bills 
where date > '2025-07-07';

-- update queries
-- update payment status to 'paid' where bill_id is 2
update bills 
set payment_status = 'paid'
where bill_id = 2;

-- increase total amount by 100 for unpaid bills
update bills 
set total_amount = total_amount + 100
where payment_status = 'unpaid';

-- update date to current date where it is missing
update bills set date = current_date
where date is null;

-- change payment_status to 'review' where amount is over 1800
update bills set payment_status = 'review'
where total_amount > 1800;

-- update patient_id to 15 where bill_id is 5 (test foreign key constraint)
update bills set patient_id = 15
where bill_id = 5;

-- Table 8: Staff
create table staff (
staff_id int primary key,
name varchar(100),
role varchar(50),
contact varchar(15),
shift varchar(20)
);

-- insert 10 sample records
insert into staff 
values
(1, 'rahul sharma', 'doctor', '9876543210', 'morning'),
(2, 'anita verma', 'nurse', '9876543211', 'evening'),
(3, 'rohit mehra', 'receptionist', '9876543212', 'morning'),
(4, 'seema joshi', 'lab technician', '9876543213', 'night'),
(5, 'vikas singh', 'pharmacist', '9876543214', 'morning'),
(6, 'sneha patil', 'nurse', '9876543215', 'night'),
(7, 'arjun desai', 'doctor', '9876543216', 'evening'),
(8, 'neha kumari', 'janitor', '9876543217', 'night'),
(9, 'manoj thakur', 'security', '9876543218', 'evening'),
(10, 'kavita yadav', 'admin assistant', '9876543219', 'morning');

-- show all staff
select * from staff;

-- delete all staff data
truncate table staff;

-- delete staff table
drop table staff;

-- Select queries
-- select all staff details
select * from staff;

-- select names and roles of staff working night shift
select name, role from staff 
where shift = 'night';

-- count number of staff in each role
select role, count(*) as total_staff from staff
group by role;

-- select all staff ordered by name alphabetically
select * from staff
order by name asc;

-- select first 3 staff who work morning shift
select * from staff
where shift = 'morning'
limit 3;

-- Alter queries
-- add a new column for staff email
alter table staff 
add column email varchar(100);

-- make contact column not null
alter table staff 
modify column contact varchar(15) not null;

-- add unique constraint to ensure contact numbers are not repeated
alter table staff 
add constraint unique_contact
unique (contact);

-- add check constraint to allow only morning, evening, or night shifts
alter table staff 
add constraint chk_shift
check (shift in ('morning', 'evening', 'night'));

-- set default shift to 'morning'
alter table staff 
alter column shift set default 'morning';

-- rename queries
-- rename table staff to hospital_staff
alter table staff 
rename to hospital_staff;

-- rename column name to full_name
alter table hospital_staff 
rename column name to full_name;

-- rename column role to job_title
alter table hospital_staff 
rename column role to job_title;

-- rename column contact to phone_number
alter table hospital_staff 
rename column contact to phone_number;

-- rename column shift to duty_shift
alter table hospital_staff 
rename column shift to duty_shift;

-- rename table hospital_staff to staff 
alter table hospital_staff 
rename to staff;

-- delete queries
-- delete staff record with staff_id = 10
delete from staff 
where staff_id = 10;

-- delete all nurses from the staff
delete from staff 
where role = 'nurse';

-- delete staff working night shifts
delete from staff 
where shift = 'night';

-- delete staff whose name contains 'rohit'
delete from staff where name like '%rohit%';

-- delete staff with contact number starting with '9876'
delete from staff where contact like '9876%';

-- Update queries
-- update shift to 'evening' for staff_id 1
update staff 
set shift = 'evening'
where staff_id = 1;

-- update contact number for 'seema joshi'
update staff
set contact = '9999999999'
where name = 'seema joshi';

-- update role to 'head nurse' where name is 'sneha patil'
update staff 
set role = 'head nurse'
where name = 'sneha patil';

-- set default contact number for missing contacts
update staff 
set contact = '0000000000'
where contact is null;

-- update shift to 'night' for all security and janitor staff
update staff 
set shift = 'night'
where role in ('security', 'janitor');

-- Table 9: Departments
create table departments (
department_id int primary key,
name varchar(100),
location varchar(100),
phone varchar(15)
);

-- insert 10 sample records
insert into departments 
values
(1, 'cardiology', 'building a, floor 2', '0221234561'),
(2, 'neurology', 'building b, floor 3', '0221234562'),
(3, 'orthopedics', 'building c, floor 1', '0221234563'),
(4, 'radiology', 'building a, basement', '0221234564'),
(5, 'pediatrics', 'building d, floor 2', '0221234565'),
(6, 'gynecology', 'building b, floor 1', '0221234566'),
(7, 'dermatology', 'building c, floor 2', '0221234567'),
(8, 'emergency', 'building e, ground floor', '0221234568'),
(9, 'oncology', 'building d, floor 3', '0221234569'),
(10, 'urology', 'building b, floor 2', '0221234570');

-- show all departments
select * from departments;

-- delete all departments data
truncate table departments;

-- delete departments table
drop table departments;

-- select queries
-- select all departments
select * from departments;

-- select departments located in building b
select name, location from departments
where location like 'building b%';

-- count how many departments exist per building
select substring(location from 1 for 10) as building, count(*) as dept_count
from departments
group by building;

-- select departments ordered by floor number in ascending order
select * from departments
order by location asc;

-- select first 3 departments for quick reference
select * from departments
limit 3;

-- alter queries
-- add a new column for department head name
alter table departments 
add column head_name varchar(100);

-- make phone column not null
alter table departments 
modify column phone varchar(15) not null;

-- add unique constraint to prevent duplicate department names
alter table departments 
add constraint unique_dept_name
unique (name);

-- add check constraint to ensure phone number starts with '022'
alter table departments add constraint chk_phone_prefix
check (phone like '022%');

-- set default location as 'building a, ground floor'
alter table departments 
alter column location 
set default 'building a, ground floor';

-- Rename queries
-- rename table departments to hospital_departments
alter table departments 
rename to hospital_departments;

-- rename column name to department_name
alter table hospital_departments 
rename column name to department_name;

-- rename column location to department_location
alter table hospital_departments 
rename column location to department_location;

-- rename column phone to contact_number
alter table hospital_departments 
rename column phone to contact_number;

-- rename column department_id to dept_id
alter table hospital_departments 
rename column department_id to dept_id;

-- rename table hospital_departments to departments 
alter table hospital_departments  
rename to departments;

-- delete queries
-- delete department with department_id = 10
delete from departments 
where department_id = 10;

-- delete departments located in building d
delete from departments 
where location like 'building d%';

-- delete all departments in basement or ground floor
delete from departments 
where location like '%basement%' or location like '%ground floor%';

-- delete dermatology department
delete from departments 
where name = 'dermatology';

-- delete departments with contact numbers ending in '65'
delete from departments 
where phone like '%65';

-- update queries
-- update phone number for cardiology department
update departments 
set phone = '0229999999'
where name = 'cardiology';

-- update location to 'building z, floor 5' for oncology
update departments 
set location = 'building z, floor 5'
where name = 'oncology';

-- add 'dr. mehta' as head of neurology
update departments 
set head_name = 'dr. mehta'
where name = 'neurology';

-- change all departments in building b to building f
update departments 
set location = replace(location, 'building b', 'building f')
where location like 'building b%';

-- update phone number to null where number is invalid (not starting with 022)
update departments 
set phone = null
where phone not like '022%';

-- Table 10: Facilities
create table facilities (
facility_id int primary key,
name varchar(100),
type varchar(50),
cost decimal(10, 2),
availability_status varchar(20)
);

-- insert 10 sample records
insert into facilities 
values
(1, 'mri scan', 'diagnostic', 5000.00, 'available'),
(2, 'ct scan', 'diagnostic', 4000.00, 'unavailable'),
(3, 'x-ray', 'diagnostic', 800.00, 'available'),
(4, 'icu bed', 'treatment', 15000.00, 'available'),
(5, 'operation theatre', 'surgical', 25000.00, 'unavailable'),
(6, 'blood bank', 'support', 0.00, 'available'),
(7, 'ambulance', 'transport', 2000.00, 'available'),
(8, 'dialysis unit', 'treatment', 3000.00, 'available'),
(9, 'physiotherapy', 'rehabilitation', 1200.00, 'unavailable'),
(10, 'private room', 'accommodation', 3500.00, 'available');

-- show all facilities
select * from facilities;

-- delete all facilities data
truncate table facilities;

-- delete facilities table
drop table facilities;

-- Select queries
-- select all facility details
select * from facilities;

-- select names and costs of all available facilities
select name, cost from facilities
where availability_status = 'available';

-- count how many facilities are available and unavailable
select availability_status, count(*) as total
from facilities
group by availability_status;

-- list top 3 most expensive facilities
select * from facilities
order by cost desc
limit 3;

-- get number of facilities by type, only if count is more than 1
select type, count(*) as type_count
from facilities
group by type
having count(*) > 1;

-- alter queries
-- add a column for facility location
alter table facilities 
add column location varchar(100);

-- make cost column not null
alter table facilities 
modify column cost decimal(10, 2) not null;

-- add unique constraint to facility name
alter table facilities 
add constraint unique_facility_name
unique (name);

-- add check constraint to ensure cost is not negative
alter table facilities
add constraint chk_cost_non_negative
check (cost >= 0);

-- set default availability status as 'available'
alter table facilities 
alter column availability_status 
set default 'available';

-- rename queries
-- rename table facilities to hospital_facilities
alter table facilities 
rename to hospital_facilities;

-- rename column name to facility_name
alter table hospital_facilities 
rename column name to facility_name;

-- rename column type to category
alter table hospital_facilities 
rename column type to category;

-- rename column cost to usage_cost
alter table hospital_facilities 
rename column cost to usage_cost;

-- rename column availability_status to status
alter table hospital_facilities 
rename column availability_status to status;

-- rename table hospital_facilities to facilities 
alter table hospital_facilities
rename to facilities;

-- delete queries
-- delete facility with facility_id = 9
delete from facilities
where facility_id = 9;

-- delete all unavailable facilities
delete from facilities 
where availability_status = 'unavailable';

-- delete facilities costing less than 1000
delete from facilities 
where cost < 1000;

-- delete diagnostic facilities
delete from facilities 
where type = 'diagnostic';

-- delete facilities with name containing the word 'unit'
delete from facilities 
where name like '%unit%';

-- update queries
-- update availability status of ct scan to 'available'
update facilities 
set availability_status = 'available'
where name = 'ct scan';

-- increase cost by 500 for all surgical facilities
update facilities 
set cost = cost + 500
where type = 'surgical';

-- set cost to 0 for support facilities
update facilities 
set cost = 0
where type = 'support';

-- update name to 'standard private room' where facility_id is 10
update facilities 
set name = 'standard private room'
where facility_id = 10;

-- update all unavailable facilities to 'under maintenance'
update facilities 
set availability_status = 'under maintenance'
where availability_status = 'unavailable';


