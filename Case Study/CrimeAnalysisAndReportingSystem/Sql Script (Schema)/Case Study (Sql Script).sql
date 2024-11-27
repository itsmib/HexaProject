DROP DATABASE IF EXISTS CrimeReport;

CREATE DATABASE CrimeReport;

USE CrimeReport;

DROP TABLE IF EXISTS Evidence, Reports, Incidents, Victims, Suspects, Officers, LawEnforcementAgencies;

-- Create Victims Table
CREATE TABLE Victims (
    VictimID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender ENUM('MALE','FEMALE'),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

-- Insert sample data into Victims
INSERT INTO Victims (FirstName, LastName, DateOfBirth, Gender, Email, PhoneNumber)
VALUES
    ('Ravi', 'Kumar', '1980-01-15', 'Male', 'ravi.kumar@gmail.com', '9876543210'),
    ('Priya', 'Sharma', '1990-02-20', 'Female', 'priya.sharma@gmail.com', '9876543211'),
    ('Amit', 'Verma', '1985-05-10', 'Male', 'amit.verma@gmail.com', '9876543212'),
    ('Sunita', 'Reddy', '1992-09-15', 'Female', 'sunita.reddy@gmail.com', '9876543213'),
    ('Vikram', 'Mehta', '1988-11-25', 'Male', 'vikram.mehta@gmail.com', '9876543214'),
    ('Anjali', 'Patil', '1993-06-20', 'Female', 'anjali.patil@gmail.com', '9876543215'),
    ('Rajesh', 'Nair', '1984-03-12', 'Male', 'rajesh.nair@gmail.com', '9876543216'),
    ('Deepika', 'Joshi', '1995-12-30', 'Female', 'deepika.joshi@gmail.com', '9876543217'),
    ('Arjun', 'Singh', '1987-08-08', 'Male', 'arjun.singh@gmail.com', '9876543218'),
    ('Kavya', 'Pandey', '1991-07-14', 'Female', 'kavya.pandey@gmail.com', '9876543219');

-- Create Suspects Table
CREATE TABLE Suspects (
    SuspectID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender ENUM('MALE','FEMALE'),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

-- Insert sample data into Suspects
INSERT INTO Suspects (FirstName, LastName, DateOfBirth, Gender, Email, PhoneNumber)
VALUES
    ('Rahul', 'Shah', '1975-03-10', 'Male', 'rahul.shah@gmail.com', '9876543220'),
    ('Meena', 'Iyer', '1985-07-25', 'Female', 'meena.iyer@gmail.com', '9876543221'),
    ('Karan', 'Chopra', '1990-04-18', 'Male', 'karan.chopra@gmail.com', '9876543222'),
    ('Pooja', 'Das', '1987-11-11', 'Female', 'pooja.das@gmail.com', '9876543223'),
    ('Suresh', 'Kulkarni', '1979-12-01', 'Male', 'suresh.kulkarni@gmail.com', '9876543224'),
    ('Nisha', 'Malhotra', '1982-06-15', 'Female', 'nisha.malhotra@gmail.com', '9876543225'),
    ('Vikas', 'Gupta', '1992-09-22', 'Male', 'vikas.gupta@gmail.com', '9876543226'),
    ('Sneha', 'Roy', '1994-10-30', 'Female', 'sneha.roy@gmail.com', '9876543227'),
    ('Manoj', 'Das', '1986-05-05', 'Male', 'manoj.das@gmail.com', '9876543228'),
    ('Aarti', 'Goyal', '1993-08-19', 'Female', 'aarti.goyal@gmail.com', '9876543229');

-- Create Law Enforcement Agencies Table
CREATE TABLE LawEnforcementAgencies (
    AgencyId INT PRIMARY KEY AUTO_INCREMENT,
    AgencyName VARCHAR(100),
    Jurisdiction VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

-- Insert sample data into Law Enforcement Agencies
INSERT INTO LawEnforcementAgencies (AgencyName, Jurisdiction, Email, PhoneNumber)
VALUES
    ('Municipal Police', 'Delhi', 'rajesh@gmail.com', '9876543230'),
    ('CBI', 'Mumbai', 'riyas@gmail.com', '9876543231');

-- Create Officers Table
CREATE TABLE Officers (
    OfficerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BadgeNumber VARCHAR(20),
    Ranks VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    AgencyID INT,
    FOREIGN KEY (AgencyID) REFERENCES LawEnforcementAgencies(AgencyID)
);

-- Insert sample data into Officers
INSERT INTO Officers (FirstName, LastName, BadgeNumber, Ranks, Email, PhoneNumber, AgencyID)
VALUES
    ('Anil', 'Kapoor', '12345', 'Inspector', 'anil.kapoor@gmail.com', '9876543232', 1),
    ('Sonia', 'Jain', '67890', 'Sub-Inspector', 'sonia.jain@gmail.com', '9876543233', 2);

-- Create Incidents Table
CREATE TABLE Incidents (
    IncidentID INT PRIMARY KEY AUTO_INCREMENT,
    IncidentType VARCHAR(50),
    IncidentDate DATE,
    City VARCHAR(100),
    Description TEXT,
    Status enum('OPEN','CLOSED','UNDER INVESTIGATION'),
    VictimID INT,
    SuspectID INT,
    OfficerID INT,
    FOREIGN KEY (VictimID) REFERENCES Victims(VictimID),
    FOREIGN KEY (SuspectID) REFERENCES Suspects(SuspectID),
    FOREIGN KEY (OfficerID) REFERENCES Officers(OfficerID)
);

-- Insert sample data into Incidents
INSERT INTO Incidents (IncidentType, IncidentDate, City, Description, Status, VictimID, SuspectID, OfficerID)
VALUES
    ('Robbery', '2024-01-01', 'Delhi', 'A robbery occurred at a jewelry store', 'Open', 1, 1, 1),
    ('Theft', '2024-02-15', 'Mumbai', 'A phone was stolen in a crowded market', 'Closed', 2, 2, 2),
    ('Assault', '2024-03-10', 'Bangalore', 'A person was attacked by a group of individuals in a park', 'UNDER INVESTIGATION', 1, 3, 2),
    ('Burglary', '2024-04-05', 'Chennai', 'A house was broken into during the night', 'Open', 1, 1, 2),
    ('Vandalism', '2024-05-20', 'Kolkata', 'A building was spray-painted with graffiti', 'Closed', 5, 2, 2),
    ('Fraud', '2024-06-25', 'Hyderabad', 'A person was scammed through a fake investment scheme', 'UNDER INVESTIGATION', 6, 2, 1),
    ('Kidnapping', '2024-07-30', 'Pune', 'A child was kidnapped from a playground', 'Open', 7, 2, 2),
    ('Murder', '2024-08-15', 'Ahmedabad', 'A murder occurred in a quiet neighborhood', 'UNDER INVESTIGATION', 8, 1, 1),
    ('Theft', '2024-09-10', 'Mumbai', 'A car was stolen from a parking lot', 'Closed', 9, 1, 2),
    ('Assault', '2024-10-05', 'Delhi', 'A person was assaulted by a group in a restaurant', 'Open', 10, 2, 2);


-- Create Evidence Table
CREATE TABLE Evidence (
    EvidenceId INT PRIMARY KEY AUTO_INCREMENT,
    Description TEXT,
    City VARCHAR(100),
    IncidentId INT,
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID)
);
INSERT INTO Evidence (Description, City, IncidentID)
VALUES 
    ('Fingerprint analysis found at the crime scene', 'Mumbai', 1),
    ('CCTV footage showing a suspect entering the building', 'Delhi', 2),
    ('Blood sample matched with a suspect', 'Bangalore', 3),
    ('Witness statement collected from the neighborhood', 'Hyderabad', 4),
    ('Suspicious vehicle sighted near the incident location', 'Chennai', 5);

-- Create Reports Table
CREATE TABLE Reports (
    ReportId INT PRIMARY KEY AUTO_INCREMENT,
    IncidentId INT,
    ReportingOfficer INT,
    ReportDate DATE,
    ReportDetails TEXT,
    Status enum('OPEN','CLOSED','UNDER_INVESTIGATION'),
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID),
    FOREIGN KEY (ReportingOfficer) REFERENCES Officers(OfficerID)
);

-- Insert sample data into Reports
INSERT INTO Reports (IncidentID, ReportingOfficer, ReportDate, ReportDetails, Status)
VALUES
    (1, 1, '2024-01-05', 'Initial report of the robbery case', 'OPEN'),
    (1, 1, '2024-02-20', 'Final report of the robbery case', 'CLOSED');
    
-- Insert sample data into Reports table
INSERT INTO Reports (IncidentID, ReportingOfficer, ReportDate, ReportDetails, Status)
VALUES
    (4, 2, '2024-03-01', 'Initial investigation of the burglary case', 'UNDER_INVESTIGATION'),
    (4, 2, '2024-04-15', 'Preliminary findings for the assault case', 'UNDER_INVESTIGATION'),
    (5, 2, '2024-05-10', 'Investigation ongoing for the hit-and-run case', 'UNDER_INVESTIGATION'),
    (5, 2, '2024-06-20', 'Detailed report submitted for the fraud case', 'CLOSED'),
    (3, 2, '2024-07-30', 'Final report for the assault case', 'CLOSED');


-- Display tables
SHOW TABLES;