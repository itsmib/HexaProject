DROP DATABASE IF EXISTS CarRental;

CREATE DATABASE CarRental;

use CarRental;

DROP TABLE IF EXISTS Vehicle, Customer, Lease, Payments;

create table vehicle (
vehicleID int auto_increment primary key,
make varchar(25),
model varchar(25),
year varchar(35),
dailyRate numeric(9,2),
status enum('AVAILABLE','NOTAVAILABLE'),
passenegerCapacity int,
engineCapacity int
);

create table customer (
customerID int auto_increment primary key,
firstName varchar(25),
lastName varchar(25),
email varchar (25),
phoneNumber varchar(25)
);

create table lease (
leaseID int auto_increment primary key,
vehicleID int,
customerID int,
startDate date,
endDate date,
type enum('DailyLease','MonthlyLease'),
foreign key (vehicleID) references vehicle(vehicleID),
foreign key (customerID) references customer(customerID)
);


create table payment (
paymentID int auto_increment primary key,
leaseID int,
paymentDate date,
amount numeric(9,2),
foreign key (leaseID) references lease(leaseID)
);

-- Insert data into Vehicle table
INSERT INTO vehicle (vehicleID, make, model, year, dailyRate, status, passenegerCapacity, engineCapacity) VALUES
(1, 'Toyota', 'Camry', '2022', 50.00, 'AVAILABLE', 4, 1450),
(2, 'Honda', 'Civic', '2023', 45.00, 'AVAILABLE', 7, 1500),
(3, 'Ford', 'Focus', '2022', 48.00, 'NOTAVAILABLE', 4, 1400),
(4, 'Nissan', 'Altima', '2023', 52.00, 'AVAILABLE', 7, 1200),
(5, 'Chevrolet', 'Malibu', '2022', 47.00, 'AVAILABLE', 4, 1800),
(6, 'Hyundai', 'Sonata', '2023', 49.00, 'NOTAVAILABLE', 7, 1400),
(7, 'BMW', '3 Series', '2023', 60.00, 'AVAILABLE', 7, 2499),
(8, 'Mercedes', 'C-Class', '2022', 58.00, 'AVAILABLE', 8, 2599),
(9, 'Audi', 'A4', '2022', 55.00, 'NOTAVAILABLE', 4, 2500),
(10, 'Lexus', 'ES', '2023', 54.00, 'AVAILABLE', 4, 2500);

-- Insert data into Customer table
INSERT INTO customer (customerID, firstName, lastName, email, phoneNumber) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '555-555-5555'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '555-123-4567'),
(3, 'Robert', 'Johnson', 'robert@example.com', '555-789-1234'),
(4, 'Sarah', 'Brown', 'sarah@example.com', '555-456-7890'),
(5, 'David', 'Lee', 'david@example.com', '555-987-6543'),
(6, 'Laura', 'Hall', 'laura@example.com', '555-234-5678'),
(7, 'Michael', 'Davis', 'michael@example.com', '555-876-5432'),
(8, 'Emma', 'Wilson', 'emma@example.com', '555-432-1098'),
(9, 'William', 'Taylor', 'william@example.com', '555-321-6547'),
(10, 'Olivia', 'Adams', 'olivia@example.com', '555-765-4321');

-- Insert data into Lease table
INSERT INTO lease (leaseID, vehicleID, customerID, startDate, endDate, type) VALUES
(1, 1, 1, '2023-01-01', '2023-01-05', 'DailyLease'),
(2, 2, 2, '2023-02-15', '2023-02-28', 'MonthlyLease'),
(3, 3, 3, '2023-03-10', '2023-03-15', 'DailyLease'),
(4, 4, 4, '2023-04-20', '2023-04-30', 'MonthlyLease'),
(5, 5, 5, '2023-05-05', '2023-05-10', 'DailyLease'),
(6, 4, 3, '2023-06-15', '2023-06-30', 'MonthlyLease'),
(7, 7, 7, '2023-07-01', '2023-07-10', 'DailyLease'),
(8, 8, 8, '2023-08-12', '2023-08-15', 'MonthlyLease'),
(9, 3, 3, '2023-09-07', '2023-09-10', 'DailyLease'),
(10, 10, 10, '2023-10-10', '2023-10-31', 'MonthlyLease');

-- Insert data into Payment table
INSERT INTO payment (paymentID, leaseID, paymentDate, amount) VALUES
(1, 1, '2023-01-03', 200.00),
(2, 2, '2023-02-20', 1000.00),
(3, 3, '2023-03-12', 75.00),
(4, 4, '2023-04-25', 900.00),
(5, 5, '2023-05-07', 60.00),
(6, 6, '2023-06-18', 1200.00),
(7, 7, '2023-07-03', 40.00),
(8, 8, '2023-08-14', 1100.00),
(9, 9, '2023-09-09', 80.00),
(10, 10, '2023-10-25', 1500.00);
