
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name TEXT,
    age INT,
    gender TEXT
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name TEXT,
    specialization TEXT
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    date TEXT
);

CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    diagnosis TEXT,
    cost INT
);


INSERT INTO Patients VALUES (1, 'Sai', 21, 'Male');
INSERT INTO Patients VALUES (2, 'Ravi', 30, 'Male');
INSERT INTO Patients VALUES (3, 'Anita', 25, 'Female');
INSERT INTO Patients VALUES (4, 'Kiran', 40, 'Male');
INSERT INTO Patients VALUES (5, 'Priya', 28, 'Female');
INSERT INTO Patients VALUES (6, 'Arjun', 35, 'Male');

INSERT INTO Doctors VALUES (101, 'Dr. Kumar', 'Cardiology');
INSERT INTO Doctors VALUES (102, 'Dr. Meena', 'Dermatology');
INSERT INTO Doctors VALUES (103, 'Dr. Reddy', 'Orthopedic');
INSERT INTO Doctors VALUES (104, 'Dr. Shah', 'Neurology');


INSERT INTO Appointments VALUES (1, 1, 101, '2024-01-10');
INSERT INTO Appointments VALUES (2, 2, 101, '2024-01-12');
INSERT INTO Appointments VALUES (3, 3, 102, '2024-01-15');
INSERT INTO Appointments VALUES (4, 4, 103, '2024-02-05');
INSERT INTO Appointments VALUES (5, 5, 102, '2024-02-10');
INSERT INTO Appointments VALUES (6, 6, 104, '2024-03-12');
INSERT INTO Appointments VALUES (7, 1, 101, '2024-03-15'); 
INSERT INTO Appointments VALUES (8, 2, 103, '2024-02-18');


INSERT INTO Treatments VALUES (4, 4, 'Fracture', 7000);
INSERT INTO Treatments VALUES (5, 5, 'Skin Allergy', 3000);
INSERT INTO Treatments VALUES (6, 6, 'Migraine', 4000);
INSERT INTO Treatments VALUES (7, 1, 'Heart Issue', 5500);
INSERT INTO Treatments VALUES (8, 2, 'Fracture', 6500);
INSERT INTO Treatments VALUES (1, 1, 'Heart Issue', 5000);
INSERT INTO Treatments VALUES (2, 2, 'Heart Issue', 6000);
INSERT INTO Treatments VALUES (3, 3, 'Skin Allergy', 2000);


SELECT * FROM Patients;

SELECT substr(A.date, 6, 2) AS month, SUM(cost) AS total_revenue
FROM Appointments A
JOIN Treatments T ON A.patient_id = T.patient_id
GROUP BY month;

SELECT diagnosis, COUNT(*) AS total
FROM Treatments
GROUP BY diagnosis
ORDER BY total DESC;

SELECT patient_id, COUNT(*) AS visits
FROM Appointments
GROUP BY patient_id;


SELECT doctor_id, COUNT(*) AS total_patients
FROM Appointments
GROUP BY doctor_id
ORDER BY total_patients DESC;

SELECT doctor_id, COUNT(*) AS visits
FROM Appointments
GROUP BY doctor_id
ORDER BY visits DESC
LIMIT 1;