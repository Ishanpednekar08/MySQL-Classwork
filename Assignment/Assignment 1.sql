-- single line comment 

/* 
Multi 
Line 
Comment 
*/

-- ------------------------------------------------ DataBase Analysis -----------------------------------------------------------------------------------
/* 
1. Railway Reservation System
Table 1: Trains: train_id, name, type, capacity, status
Table 2: Passengers: passenger_id, name, age, gender, contact
Table 3: Bookings: booking_id, train_id, passenger_id, seat_no, date
Table 4: route_id, source, destination, distance, duration
Table 5: Stations: station_id, name, location, code, platform_count

2. Management System
Table 1: Flights: flight_id, airline, departure, arrival, duration
Table 2:Tickets: ticket_id, flight_id, seat_class, price, status
Table 3:Passengers: passenger_id, name, passport_no, nationality, age
Table 4: Airports: airport_id, name, city, country, terminals
Table 5: Crew: crew_id, name, role, flight_id, experience_years

3. Company HR Management
Table 1:Employees: emp_id, name, email, dept_id, doj
Table 2:Departments: dept_id, name, location, head_id, budget
Table 3:Salaries: emp_id, base_salary, bonus, tax, net_pay
Table 4:Projects: project_id, name, manager_id, deadline, budget
Table 5:Attendance: emp_id, date, status, in_time, out_time

4. E-commerce Platform
Table 1:Products: product_id, name, price, stock, category
Table 2:Users: user_id, name, email, address, join_date
Table 3:Orders: order_id, user_id, date, total_amount, status
Table 4:Payments: payment_id, order_id, mode, status, amount
Table 5:Reviews: review_id, product_id, user_id, rating, comment

5. Hospital Management System
Table 1:Patients: patient_id, name, age, gender, admitted_on
Table 2:Doctors: doctor_id, name, specialty, contact, room_no
Table 3:Appointments: app_id, patient_id, doctor_id, date, status
Table 4:Medications: med_id, name, type, dosage, side_effects
Table 5:Rooms: room_id, type, capacity, availability, price

6. University/College Database
Table 1:Students: student_id, name, dob, dept, contact
Table 2:Courses: course_id, title, dept, credits, semester
Table 3:Faculties: faculty_id, name, dept, designation, email
Table 4:Enrollment: student_id, course_id, semester, year, status
Table 5:Results: student_id, course_id, marks, grade, semester

7. Library Management System
Table 1:Books: book_id, title, author_id, genre, copies
Table 2:Members: member_id, name, address, contact, join_date
Table 3:Issues: issue_id, member_id, book_id, issue_date, due_date
Table 4:Returns: return_id, issue_id, return_date, fine, status
Table 5:Authors: author_id, name, nationality, dob, books_written

8. Cinema Ticket Booking
Table 1:Movies: movie_id, title, genre, duration, rating
Table 2:Shows: show_id, movie_id, screen_id, time, date
Table 3:Screens: screen_id, capacity, type, location, audio_system
Table 4:Tickets: ticket_id, show_id, seat_no, price, status
Table 5:Customers: cust_id, name, email, mobile, city

9.  Hotel Booking System
Table 1:Rooms: room_id, type, price, availability, floor
Table 2:Guests: guest_id, name, phone, email, id_proof
Table 3:Bookings: booking_id, guest_id, room_id, check_in, check_out
Table 4:Services: service_id, name, charge, duration, availability
Table 5:Staff: staff_id, name, role, contact, shift

10.Online Learning Platform
Table 1: Courses: course_id, title, category, duration, rating
Table 2:Instructors: instructor_id, name, expertise, email, course_id
Table 3:Students: student_id, name, email, join_date, level
Table 4:Enrollments: enroll_id, student_id, course_id, date, status
Table 5:Quizzes: quiz_id, course_id, title, total_marks, duration

11. Banking System
Table 1:Accounts: acc_id, cust_id, type, balance, open_date
Table 2:Customers: cust_id, name, address, phone, dob
Table 3:Transactions: txn_id, acc_id, amount, type, date
Table 4:Loans: loan_id, acc_id, amount, interest_rate, term
Table 5:Branches: branch_id, name, city, manager, ifsc

12. Vehicle Registration System
Table 1: Vehicles: vehicle_id, type, brand, model, year
Table 2:Owners: owner_id, name, address, contact, dob
Table 3:Registrations: reg_id, vehicle_id, owner_id, date, valid_till
Table 4:Insurance: policy_id, vehicle_id, provider, amount, expiry
Table 5:Inspectors: inspector_id, name, region, contact, duty_days

13. Sports Tournament
Table 1:Teams: team_id, name, coach, city, rank
Table 2:Players: player_id, name, age, team_id, position
Table 3:Matches: match_id, team1_id, team2_id, venue_id, date
Table 4:Venues: venue_id, name, city, capacity, pitch_type
Table 5:Results: match_id, winner_id, score, mvp, duration

14. Food Delivery System
Table 1:Restaurants: res_id, name, location, rating, open_time
Table 2:Dishes: dish_id, res_id, name, price, category
Table 3:Orders: order_id, cust_id, dish_id, quantity, status
Table 4:Customers: cust_id, name, address, phone, email
Table 5:Delivery: delivery_id, order_id, delivery_person, time, rating

15. Gym/Fitness Center
Table 1:Members: member_id, name, age, gender, contact
Table 2:Trainers: trainer_id, name, specialty, experience, contact
Table 3:Subscriptions: sub_id, member_id, start_date, duration, amount
Table 4:Sessions: session_id, trainer_id, type, date, duration
Table 5:Equipment: eq_id, name, quantity, maintenance_date, area

16. Crime Records System
Table 1:Cases: case_id, type, date, location, status
Table 2:Criminals: criminal_id, name, crime_type, age, status
Table 3:Victims: victim_id, name, age, contact, case_id
Table 4:Officers: officer_id, name, rank, station, contact
Table 5:Courts: court_id, name, location, judge_name, jurisdiction

17.  Online Exam System
Table 1:Students: student_id, name, email, course, batch
Table 2:Exams: exam_id, subject, date, duration, total_marks
Table 3:Questions: ques_id, exam_id, text, marks, level
Table 4:Answers: ans_id, student_id, ques_id, response, correct
Table 5:Results: result_id, student_id, exam_id, score, grade

18.  Inventory Management
Table 1:Items: item_id, name, category, price, reorder_level
Table 2:Suppliers: supplier_id, name, contact, city, rating
Table 3:Stock: item_id, quantity, location, last_update, status
Table 4:Purchases: purchase_id, supplier_id, date, total_amount, status
Table 5:Shipments: shipment_id, item_id, quantity, dispatch_date, delivery_date

19. Freelance Platform
Table 1:Freelancers: freelancer_id, name, skill, rate, rating
Table 2:Clients: client_id, name, industry, location, contact
Table 3:Projects: project_id, title, client_id, freelancer_id, deadline
Table 4:Payments: payment_id, project_id, amount, mode, status
Table 5:Reviews: review_id, freelancer_id, client_id, rating, feedback

20. Transport Management
Table 1:Vehicles: vehicle_id, type, capacity, reg_no, model
Table 2:Drivers: driver_id, name, license_no, contact, experience
Table 3:Routes: route_id, source, destination, distance, stops
Table 4:Schedules: schedule_id, vehicle_id, route_id, time, day
Table 5:Bookings: booking_id, schedule_id, user_id, seat_no, fare

21. NGO Management
Table 1:Volunteers: vol_id, name, age, contact, skill
Table 2:Events: event_id, name, location, date, type
Table 3:Donors: donor_id, name, amount, contact, recurring
Table 4:Donations: donation_id, donor_id, amount, date, campaign_id
Table 5:Campaigns: campaign_id, name, goal, status, location

22. Job Portal
Table 1:Jobs: job_id, title, company_id, salary, location
Table 2:Companies: company_id, name, sector, contact, website
Table 3:Applicants: applicant_id, name, email, resume, skills
Table 4:Applications: app_id, job_id, applicant_id, date, status
Table 5:Interviews: interview_id, app_id, date, mode, result

23. Music Streaming App
Table 1:Songs: song_id, title, artist_id, duration, genre
Table 2:Artists: artist_id, name, country, debut_year, genre
Table 3:Albums: album_id, name, artist_id, release_year, type
Table 4:Playlists: playlist_id, user_id, name, created_on, genre
Table 5:Users: user_id, name, email, plan, signup_date

24. Pet Clinic
Table 1:Pets: pet_id, name, species, breed, age
Table 2:Owners: owner_id, name, contact, address, email
Table 3:Appointments: app_id, pet_id, vet_id, date, issue
Table 4:Vets: vet_id, name, specialty, contact, experience
Table 5:Treatments: treat_id, app_id, medicine, duration, cost

25. Travel Agency
Table 1:Packages: package_id, name, price, duration, type
Table 2:Destinations: dest_id, name, country, climate, rating
Table 3:Clients: client_id, name, contact, email, nationality
Table 4:Bookings: booking_id, client_id, package_id, date, members
Table 5:Payments: payment_id, booking_id, amount, method, status

26. Smart Home Management System
Table 1: Devices: device_id, name, type, status, location
Table 2: Users: user_id, name, email, access_level, registered_date
Table 3: UsageLogs: log_id, device_id, user_id, action, timestamp
Table 4: Alerts: alert_id, device_id, message, priority, date
Table 5: Rooms: room_id, name, floor, device_count, purpose

27. Digital Marketing Campaign Tracker
Table 1: Campaigns: campaign_id, name, platform, budget, duration
Table 2: Ads: ad_id, campaign_id, type, impressions, clicks
Table 3: Clients: client_id, name, industry, contact, region
Table 4: Teams: team_id, name, members_count, head_id, specialization
Table 5: Reports: report_id, campaign_id, date_generated, CTR, ROI

28. Insurance Management System
Table 1: Policies: policy_id, type, premium, duration, coverage
Table 2: Policy_Holders: holder_id, name, dob, address, contact
Table 3: Claims: claim_id, policy_id, amount, reason, status
Table 4: Agents: agent_id, name, region, clients_count, experience
Table 5: Payments: payment_id, holder_id, policy_id, amount, date

29. Real Estate Management
Table 1: Properties: property_id, type, location, price, status
Table 2: Owners: owner_id, name, contact, email, address
Table 3: Clients: client_id, name, contact, budget, preferred_location
Table 4: Deals: deal_id, property_id, client_id, agent_id, status
Table 5: Agents: agent_id, name, phone, region, license_no

30. Online Grocery Delivery System
Table 1: Products: product_id, name, category, price, stock
Table 2: Customers: cust_id, name, phone, address, email
Table 3: Orders: order_id, cust_id, order_date, total_amount, status
Table 4: Deliveries: delivery_id, order_id, delivery_person, time, feedback
Table 5: Staff: staff_id, name, role, shift, contact

*/

-- ---------------------------------------------- Database Queries ---------------------------------------------------



-- to create Hotel Booking System database
create database HotelBookingSystem;

CREATE TABLE Rooms (
room_id INT PRIMARY KEY,
type varchar (50),
price decimal (8,2),
availability varchar(10),
floor int
);

-- Insert into Rooms
INSERT INTO Rooms VALUES
(1, 'Single', 1200.00, 'Yes', 1),
(2, 'Double', 1800.00, 'Yes', 1),
(3, 'Deluxe', 2500.00, 'No', 2),
(4, 'Suite', 4000.00, 'Yes', 3),
(5, 'Single', 1200.00, 'No', 1),
(6, 'Double', 1800.00, 'Yes', 2),
(7, 'Deluxe', 2500.00, 'Yes', 2),
(8, 'Suite', 4000.00, 'No', 3),
(9, 'Single', 1200.00, 'Yes', 1),
(10, 'Double', 1800.00, 'Yes', 2);

-- to display records from the table
select * from Rooms;

-- to remove records from table
truncate table Rooms;

-- to remove complete records and attributes from table 
drop table Rooms;

-- to create table Guests
-- Table 2: Guests
CREATE TABLE Guests (
guest_id INT PRIMARY KEY,
name varchar (100),
phone varchar (15),
email varchar (100),
id_proof varchar (50)
);

INSERT INTO Guests VALUES
(1, 'Alice Johnson', '987653210', 'alice@gmail.com', 'Aadhar'),
(2, 'Bob Smith', '99887655', 'bob@gmail.com', 'Passport'),
(3, 'Charlie Lee', '91234789', 'charlie@gmail.com', 'Driving License'),
(4, 'Diana Parker', '999112223', 'diana@gmail.com', 'Aadhar'),
(5, 'Ethan Wright', '88976655', 'ethan@gmail.com', 'Voter ID'),
(6, 'Fiona Davis', '90345678', 'fiona@gmail.com', 'Passport'),
(7, 'George Hall', '877665544', 'george@gmail.com', 'Aadhar'),
(8, 'Hannah King', '87432109', 'hannah@gmail.com', 'Driving License'),
(9, 'Ian Moore', '76321098', 'ian@gmail.com', 'Voter ID'),
(10, 'Julia Reed', '9540876', 'julia@gmail.com', 'Passport');

-- Table 3: Bookings
CREATE TABLE Bookings (
booking_id INT PRIMARY KEY,
guest_id INT,
room_id INT,
check_in DATE,
check_out DATE
);

-- to insert records
INSERT INTO Bookings VALUES
(1, 1, 101, '2025-06-01', '2025-06-03'),
(2, 2, 102, '2025-06-04', '2025-06-07'),
(3, 3, 104, '2025-06-02', '2025-06-05'),
(4, 4, 106, '2025-06-06', '2025-06-09'),
(5, 5, 107, '2025-06-01', '2025-06-03'),
(6, 6, 110, '2025-06-10', '2025-06-13'),
(7, 7, 109, '2025-06-04', '2025-06-06'),
(8, 8, 103, '2025-06-05', '2025-06-08'),
(9, 9, 108, '2025-06-11', '2025-06-13'),
(10, 10, 105, '2025-06-03', '2025-06-04');

-- to display records from the table
select * from Bookings;

-- to remove records from table
truncate table Bookings;

-- to remove complete records and attributes from table 
drop table Bookings;

-- Table 4: Services
CREATE TABLE Services (
service_id INT PRIMARY KEY,
name varchar(100),
charge DECIMAL(6,2),
duration varchar(50),
availability varchar(10)
);

INSERT INTO Services VALUES
(1, 'Room Cleaning', 200.00, '30 mins', 'Yes'),
(2, 'Laundry', 300.00, '1 hour', 'Yes'),
(3, 'Breakfast Buffet', 500.00, '2 hours', 'Yes'),
(4, 'Spa', 1200.00, '1 hour', 'No'),
(5, 'Gym Access', 0.00, 'Unlimited', 'Yes'),
(6, 'Airport Pickup', 800.00, '30 mins', 'Yes'),
(7, 'Wi-Fi', 0.00, '24x7', 'Yes'),
(8, 'Mini Bar', 1500.00, 'Per stay', 'No'),
(9, 'Swimming Pool', 0.00, '8am-8pm', 'Yes'),
(10, 'Late Checkout', 1000.00, '3 hours', 'Yes');

-- to display records from the table
select * from Services;

-- to remove records from table
truncate table Services;

-- to remove complete records and attributes from table 
drop table Services;

-- Table 5: Staff
CREATE TABLE Staff (
staff_id INT PRIMARY KEY,
name varchar(100),
role varchar(50),
contact varchar(15),
shift varchar(20)
);

INSERT INTO Staff VALUES
(1, 'Ravi Kumar', 'Receptionist', '9876500011', 'Morning'),
(2, 'Sita Mehra', 'Housekeeping', '9876500022', 'Evening'),
(3, 'John Paul', 'Manager', '9876500033', 'Full-time'),
(4, 'Neha Sharma', 'Chef', '9876500044', 'Morning'),
(5, 'Arun Das', 'Security', '9876500055', 'Night'),
(6, 'Priya Rao', 'Front Desk', '9876500066', 'Evening'),
(7, 'Sunil Verma', 'Bellboy', '9876500077', 'Morning'),
(8, 'Anjali Menon', 'Spa Therapist', '9876500088', 'Afternoon'),
(9, 'Karan Malik', 'Electrician', '9876500099', 'Day'),
(10, 'Maya Singh', 'IT Support', '9876500010', 'Full-time');

