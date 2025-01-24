CREATE DATABASE HospitalManagement;
USE HospitalManagement;

-- Table 1: Patients
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    ContactNumber VARCHAR(15),
    Address TEXT
);

-- Table Departments
CREATE TABLE Departments (
    DepartmentID INT  PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Table  Doctors
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table  Appointments
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Table  MedicalRecords
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    Diagnosis TEXT NOT NULL,
    Treatment TEXT,
    RecordDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);



-- Table  Rooms
CREATE TABLE Rooms (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    RoomNumber VARCHAR(10) NOT NULL UNIQUE,
    RoomType ENUM('General', 'ICU', 'Private', 'Semi-Private') NOT NULL,
    Status ENUM('Available', 'Occupied', 'Under Maintenance') DEFAULT 'Available'
);

-- Table  Staff
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Role VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


-- Insert into Departments
INSERT INTO Departments (DepartmentID,DepartmentName)
VALUES (1001,'Cardiology'), (1002,'Neurology'), (1003,'Orthopedics'), (1004,'Pediatrics'),
(1005,'Radiology'),(1006,'Oncology'),(1007,'Dermatology'),(1008,'Psychiatry'),
(1009,'Endocrinology'),(1010,'Gastroenterology'),(1011,'Hematology'),
(1012,'Nephrology'),(1013,'Rheumatology'),(1014,'Urology'),(1015,'Pulmonology'),
(1016,'Ophthalmology'),(1017,'Otolaryngology'),(1018,'Anesthesiology'),(1019,'Pathology'),
(1020,'Allergy and Immunology'),(1021,'Infectious Disease'),(1022,'Critical Care Medicine'),
(1023,'Emergency Medicine'),(1024,'Family Medicine'),(1025,'Geriatrics'),
(1026,'Internal Medicine'),(1027,'Nuclear Medicine'),
(1028,'Plastic Surgery'),(1029,'Reproductive Medicine'),(1030,'Sports Medicine');
select * from Departments;

-- Insert into Patients
INSERT INTO Patients (PatientID,FirstName, LastName, DateOfBirth, Gender, ContactNumber, Address)
VALUES 
(101,'John', 'Doe', '1985-06-15', 'Male', '1234567890', '123 Elm Street'),
(102,'Jane', 'Smith', '1992-08-22', 'Female', '9876543210', '456 Oak Street'),
(103,'Emily', 'Johnson', '1990-03-10', 'Female', '2345678901', '789 Pine Street'),
(104,'Michael', 'Williams', '1987-11-19', 'Male', '3456789012', '321 Maple Avenue'),
(105,'Emma', 'Brown', '1995-05-30', 'Female', '4567890123', '654 Cedar Lane'),
(106,'James', 'Jones', '1980-12-25', 'Male', '5678901234', '987 Birch Boulevard'),
(107,'Olivia', 'Garcia', '2000-07-14', 'Female', '6789012345', '159 Spruce Street'),
(108,'Benjamin', 'Martinez', '1993-02-28', 'Male', '7890123456', '753 Willow Way'),
(109,'Sophia', 'Hernandez', '1989-09-07', 'Female', '8901234567', '852 Cherry Court'),
(110,'Alexander', 'Lopez', '1982-06-21', 'Male', '9012345678', '456 Aspen Road'),
(111,'Isabella', 'Gonzalez', '1998-01-13', 'Female', '1234509876', '741 Oakwood Drive'),
(112,'Daniel', 'Wilson', '1991-10-11', 'Male', '2345609876', '963 Magnolia Terrace'),
(113,'Mia', 'Anderson', '1994-03-03', 'Female', '3456709876', '258 Cypress Avenue'),
(114,'Elijah', 'Thomas', '1986-08-16', 'Male', '4567809876', '159 Poplar Lane'),
(115,'Ava', 'Moore', '1997-04-09', 'Female', '5678909876', '357 Hickory Path'),
(116,'William', 'Taylor', '1988-05-20', 'Male', '6789009876', '753 Dogwood Circle'),
(117,'Charlotte', 'Martin', '1999-12-01', 'Female', '7890109876', '654 Juniper Way'),
(118,'Lucas', 'Jackson', '1981-07-28', 'Male', '8901209876', '852 Laurel Drive'),
(119,'Amelia', 'White', '1996-02-15', 'Female', '9012309876', '456 Sycamore Place'),
(120,'Henry', 'Harris', '1984-11-05', 'Male', '1230987654', '789 Fir Street'),
(121,'Harper', 'Clark', '1993-06-30', 'Female', '2340987654', '321 Alder Road'),
(122,'Ethan', 'Lewis', '1985-03-12', 'Male', '3450987654', '654 Birch Court'),
(123,'Abigail', 'Walker', '2001-10-23', 'Female', '4560987654', '987 Pinewood Lane'),
(124,'Sebastian', 'Hall', '1992-01-17', 'Male', '5670987654', '159 Redwood Drive'),
(125,'Ella', 'Allen', '1994-08-25', 'Female', '6780987654', '753 Maplewood Street'),
(126,'Logan', 'Young', '1983-09-09', 'Male', '7890987654', '852 Oak Lane'),
(127,'Scarlett', 'King', '1999-05-18', 'Female', '8900987654', '456 Pine Avenue'),
(128,'Matthew', 'Scott', '1986-12-30', 'Male', '9010987654', '741 Elm Court'),
(129,'Jo','Tesa','2000-12-03','Female','9876505492','22 court lane'),
(130,'Nick','Nock','2003-10-30','Male','9309487102','99 Oak avenue');

select * from Patients;

-- Insert into Doctors
INSERT INTO Doctors (FirstName, LastName, Specialization, ContactNumber, DepartmentID)
VALUES 
('Alice', 'Brown', 'Cardiologist', '5551234567', 1001),
('Bob', 'Johnson', 'Neurologist', '5559876543', 1002),
('Charlie', 'Smith', 'Orthopedic Surgeon', '5551112222', 1003),
('Diana', 'Taylor', 'Pediatrician', '5553334444', 1004),
('Ethan', 'Williams', 'Radiologist', '5555556666', 1005),
('Fiona', 'Davis', 'Oncologist', '5557778888', 1006),
('George', 'Miller', 'Dermatologist', '5559990000', 1007),
('Hannah', 'Moore', 'Psychiatrist', '5551122333', 1008),
('Ian', 'Wilson', 'Endocrinologist', '5554455666', 1009),
('Jackie', 'Anderson', 'Gastroenterologist', '5557788999', 1010),
('Kevin', 'Thomas', 'Hematologist', '5552233445', 1011),
('Laura', 'Harris', 'Nephrologist', '5553344556', 1012),
('Michael', 'Clark', 'Rheumatologist', '5554455667', 1013),
('Nina', 'Lewis', 'Urologist', '5555566778', 1014),
('Oscar', 'Young', 'Pulmonologist', '5556677889', 1015),
('Paula', 'King', 'Ophthalmologist', '5557788990', 1016),
('Quentin', 'Hall', 'Otolaryngologist', '5558899001', 1017),
('Rebecca', 'Allen', 'Anesthesiologist', '5559900112', 1018),
('Sam', 'Wright', 'Pathologist', '5550011223', 1019),
('Tina', 'Scott', 'Immunologist', '5551122334', 1020),
('Umar', 'Phillips', 'Infectious Disease Specialist', '5552233446', 1021),
('Victoria', 'Evans', 'Critical Care Specialist', '5553344557', 1022),
('Will', 'Carter', 'Emergency Physician', '5554455668', 1023),
('Xena', 'Perez', 'Family Medicine Physician', '5555566779', 1024),
('Yusuf', 'Collins', 'Geriatrician', '5556677880', 1025),
('Zara', 'Cook', 'Internist', '5557788991', 1026),
('Alex', 'Barnes', 'Nuclear Medicine Specialist', '5558899002', 1027),
('Bella', 'Foster', 'Plastic Surgeon', '5559900113', 1028),
('Chris', 'Patterson', 'Reproductive Medicine Specialist', '5550011224', 1029),
('Dana', 'Ramirez', 'Sports Medicine Specialist', '5551122335', 1030);
select * from Doctors;
-- Insert into Appointments
INSERT INTO Appointments (AppointmentID,PatientID, DoctorID, AppointmentDate, Status, Notes)
VALUES 
(301,101, 1, '2024-01-15 09:00:00', 'Scheduled', 'Follow-up'),
(302,102, 2, '2024-01-16 10:30:00', 'Scheduled', 'Initial consultation'),
(303,103, 3, '2024-01-17 11:00:00', 'Scheduled', 'Routine check-up'),
(304,104, 4, '2024-01-18 13:00:00', 'Scheduled', 'Vaccination'),
(305,105, 5, '2024-01-19 14:30:00', 'Scheduled', 'Diagnostic imaging'),
(306,106, 6, '2024-01-20 09:00:00', 'Completed', 'Chemotherapy session'),
(307,107, 7, '2024-01-21 11:30:00', 'Scheduled', 'Skin rash treatment'),
(308,108, 8, '2024-01-22 15:00:00', 'Cancelled', 'Rescheduled by patient'),
(309,109, 9, '2024-01-23 10:00:00', 'Scheduled', 'Diabetes follow-up'),
(310,110, 10, '2024-01-24 12:00:00', 'Scheduled', 'Digestive issues'),
(311,111, 11, '2024-01-25 08:30:00', 'Completed', 'Blood disorder consultation'),
(312,112, 12, '2024-01-26 14:00:00', 'Scheduled', 'Kidney health check-up'),
(313,113, 13, '2024-01-27 16:00:00', 'Scheduled', 'Joint pain management'),
(314,114, 14, '2024-01-28 09:30:00', 'Scheduled', 'Kidney health check-up'),
(315,115, 15, '2024-01-29 10:00:00', 'Scheduled', 'Breathing issues follow-up'),
(316,116, 16, '2024-01-30 11:00:00', 'Completed', 'Vision test'),
(317,117, 17, '2024-02-01 14:00:00', 'Scheduled', 'Hearing aid adjustment'),
(318,118, 18, '2024-02-02 09:00:00', 'Scheduled', 'Pre-surgery consultation'),
(319,119, 19, '2024-02-03 13:00:00', 'Completed', 'Lab test review'),
(320,120, 20, '2024-02-04 15:30:00', 'Cancelled', 'Doctor unavailable'),
(321,121, 21, '2024-02-05 10:00:00', 'Scheduled', 'Infection treatment'),
(322,122, 22, '2024-02-06 11:30:00', 'Scheduled', 'ICU discharge follow-up'),
(323,123, 23, '2024-02-07 12:00:00', 'Completed', 'Emergency trauma care'),
(324,124, 24, '2024-02-08 16:00:00', 'Scheduled', 'Routine family check-up'),
(325,125, 25, '2024-02-09 14:00:00', 'Completed', 'Emergency trauma care'),
(326,126, 26, '2024-02-10 09:30:00', 'Scheduled', 'Elderly care assessment'),
(327,127, 27, '2024-02-11 10:00:00', 'Scheduled', 'Radioisotope scan'),
(328,128, 28, '2024-02-12 15:00:00', 'Scheduled', 'Cosmetic surgery consultation'),
(329,129, 29, '2024-02-13 08:00:00', 'Completed', 'Fertility treatment review'),
(330,130, 30, '2024-02-14 14:30:00', 'Scheduled', 'Sports injury follow-up');
select * from Appointments;
-- Insert into MedicalRecords
INSERT INTO MedicalRecords (RecordID,PatientID, Diagnosis, Treatment)
VALUES 
(401,101, 'Hypertension', 'Medication prescribed'),
(402,102, 'Migraine', 'Lifestyle changes advised'),
(403,103, 'Diabetes Type 2', 'Insulin therapy initiated'),
(404,104,'Asthma', 'Inhaler prescribed'),
(405,105,'Allergic Rhinitis', 'Antihistamines recommended'),
(406,106, 'Pneumonia', 'Antibiotics administered'),
(407,107, 'Acute Appendicitis', 'Surgery performed'),
(408,108, 'Depression', 'Psychotherapy sessions scheduled'),
(409,109, 'Chronic Kidney Disease', 'Dialysis initiated'),
(410,110, 'Eczema', 'Topical steroid prescribed'),
(411,111, 'Anemia', 'Iron supplements prescribed'),
(412,112, 'Gastric Ulcer', 'Proton pump inhibitors recommended'),
(413,113, 'Osteoarthritis', 'Pain management therapy initiated'),
(414,114, 'Fracture', 'Cast applied and physiotherapy planned'),
(415,115,'Hypertensive Crisis', 'Emergency IV medications given'),
(416,116, 'Acute Bronchitis', 'Cough suppressants prescribed'),
(417,117, 'Hepatitis B', 'Antiviral therapy initiated'),
(418,118,'Breast Cancer', 'Chemotherapy scheduled'),
(419,119, 'Heart Failure', 'Diuretics prescribed'),
(20,120, 'Stroke', 'Rehabilitation therapy planned'),
(421,121, 'Obesity', 'Dietary consultation scheduled'),
(422,122, 'Sleep Apnea', 'CPAP therapy recommended'),
(423,123, 'Thyroid Dysfunction', 'Levothyroxine therapy initiated'),
(424,124,'Celiac Disease', 'Gluten-free diet advised'),
(425,125, 'Epilepsy', 'Antiepileptic drugs prescribed'),
(426,126, 'UTI', 'Antibiotic course recommended'),
(427,127, 'Skin Infection', 'Topical and oral antibiotics prescribed'),
(428,128, 'Hypertrophic Cardiomyopathy', 'Beta blockers initiated'),
(429,129, 'Gallstones', 'Surgery recommended'),
(430,130, 'Chronic Fatigue Syndrome', 'Cognitive behavioral therapy advised');


-- Insert into Rooms
INSERT INTO Rooms (RoomNumber, RoomType, Status)
VALUEs
('201', 'General', 'Available'),
('202', 'ICU', 'Occupied'),
('203', 'Private', 'Available'),
('204', 'Semi-Private', 'Occupied'),
('205', 'General', 'Under Maintenance'),
('206', 'ICU', 'Available'),
('207', 'Private', 'Occupied'),
('208', 'Semi-Private', 'Available'),
('209', 'General', 'Available'),
('210', 'ICU', 'Occupied'),
('211', 'Private', 'Under Maintenance'),
('212', 'Semi-Private', 'Available'),
('213', 'General', 'Occupied'),
('214', 'ICU', 'Available'),
('215', 'Private', 'Occupied'),
('216', 'Semi-Private', 'Under Maintenance'),
('217', 'General', 'Available'),
('218', 'ICU', 'Occupied'),
('219', 'Private', 'Available'),
('220', 'Semi-Private', 'Occupied'),
('221', 'General', 'Under Maintenance'),
('222', 'ICU', 'Available'),
('223', 'Private', 'Occupied'),
('224', 'Semi-Private', 'Available'),
('225', 'General', 'Available'),
('226', 'ICU', 'Occupied'),
('227', 'Private', 'Under Maintenance'),
('228', 'Semi-Private', 'Available'),
('229', 'General', 'Occupied'),
('230', 'ICU', 'Available');
select * from Rooms;

-- Insert into Staff
INSERT INTO Staff (FirstName, LastName, Role, ContactNumber, DepartmentID)
VALUES 
('Sarah', 'Connor', 'Nurse', '5551237890', 1001),
('James', 'Smith', 'Technician', '5559873210', 1002),
('Emily', 'Davis', 'Receptionist', '5556543210', 1003),
('Michael', 'Brown', 'Pharmacist', '5551234561', 1004),
('Jessica', 'Taylor', 'Nurse', '5559876541', 1005),
('David', 'Wilson', 'Lab Technician', '5554567891', 1006),
('Sophia', 'Johnson', 'Physiotherapist', '5552345671', 1007),
('Daniel', 'Clark', 'Surgeon Assistant', '5553456781', 1008),
('Olivia', 'Hall', 'Anesthesia Technician', '5555678901', 1009),
('Ethan', 'Martin', 'Billing Clerk', '5556789012', 1010),
('Mia', 'White', 'Nurse', '5557890123', 1011),
('Liam', 'Harris', 'Radiology Technician', '5558901234', 1012),
('Isabella', 'Thompson', 'Nutritionist', '5559012345', 1013),
('Noah', 'Moore', 'Emergency Technician', '5550123456', 1014),
('Ava', 'Allen', 'Ward Clerk', '5551234567', 1015),
('Lucas', 'Lee', 'Medical Coder', '5552345678', 1016),
('Charlotte', 'King', 'Surgical Technician', '5553456789', 1017),
('Mason', 'Wright', 'Lab Manager', '5554567890', 1018),
('Ella', 'Scott', 'Nurse', '5555678902', 1019),
('Logan', 'Adams', 'Phlebotomist', '5556789013', 1020),
('Amelia', 'Evans', 'HR Assistant', '5557890124', 1021),
('Jacob', 'Collins', 'Maintenance Staff', '5558901235', 1022),
('Harper', 'Bell', 'ICU Nurse', '5559012346', 1023),
('Elijah', 'Parker', 'Transporter', '5550123457', 1024),
('Sofia', 'Cook', 'OT Assistant', '5551234568', 1025),
('Benjamin', 'Peterson', 'Respiratory Therapist', '5552345679', 1026),
('Abigail', 'Carter', 'Case Manager', '5553456790', 1027),
('Henry', 'Mitchell', 'Sterile Processing Tech', '5554567892', 1028),
('Grace', 'Phillips', 'Speech Therapist', '5555678903', 1029),
('Alexander', 'Edwards', 'Medical Records Clerk', '5556789014', 1030);
select * from Staff;

-- Queries to Test the System

-- List all patients and their appointments
SELECT p.PatientID, p.FirstName, p.LastName, a.AppointmentDate, a.Status
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID;

-- List all doctors and their specializations
SELECT FirstName, LastName, Specialization FROM Doctors;

-- Check room availability
SELECT * FROM Rooms WHERE Status = 'Available';


-- Retrieve medical records for a patient
SELECT * FROM MedicalRecords WHERE PatientID = 101;
