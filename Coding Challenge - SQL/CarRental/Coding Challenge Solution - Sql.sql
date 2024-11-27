CREATE DATABASE CarRental;

use CarRental;

create table vehicle (
vehicleID int auto_increment primary key,
make varchar(25),
model varchar(25),
year int,
dailyRate numeric(9,2),
status enum('available','notAvailable'),
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
(1, 'Toyota', 'Camry', 2022, 50.00, 'available', 4, 1450),
(2, 'Honda', 'Civic', 2023, 45.00, 'available', 7, 1500),
(3, 'Ford', 'Focus', 2022, 48.00, 'notAvailable', 4, 1400),
(4, 'Nissan', 'Altima', 2023, 52.00, 'available', 7, 1200),
(5, 'Chevrolet', 'Malibu', 2022, 47.00, 'available', 4, 1800),
(6, 'Hyundai', 'Sonata', 2023, 49.00, 'notAvailable', 7, 1400),
(7, 'BMW', '3 Series', 2023, 60.00, 'available', 7, 2499),
(8, 'Mercedes', 'C-Class', 2022, 58.00, 'available', 8, 2599),
(9, 'Audi', 'A4', 2022, 55.00, 'notAvailable', 4, 2500),
(10, 'Lexus', 'ES', 2023, 54.00, 'available', 4, 2500);

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

-- Questions 1
update vehicle set dailyRate = 68 where vehicleID = 8;

-- 2
DELETE FROM payment 
WHERE leaseID IN (SELECT leaseID FROM lease WHERE customerID = 10);

DELETE FROM lease 
WHERE customerID = 10;

DELETE FROM customer 
WHERE customerID = 10;


-- 3
ALTER TABLE payment RENAME COLUMN paymentDate TO transactionDate;

-- 4
SELECT * FROM CUSTOMER WHERE EMAIL = 'johndoe@example.com';

-- 5
select lease.* , customer.customerID
from lease 
inner join customer on
lease.customerID = customer.customerID
where customer.customerID = 1; 

-- 6
SELECT p.*
FROM payment p
JOIN lease l ON p.leaseID = l.leaseID
JOIN customer c ON l.customerID = c.customerID
WHERE c.phoneNumber = '555-555-5555';

-- 7
select status as Available_Cars, avg(dailyRate) from vehicle
where status = 'available'
group by status;

-- 8
select * from vehicle where dailyRate =  (select max(distinct dailyRate) from vehicle);

-- 9
SELECT v.*
FROM vehicle v
JOIN lease l ON v.vehicleID = l.vehicleID
JOIN customer c ON l.customerID = c.customerID
WHERE c.customerID = '1';

-- 10
select * 
from lease
order by startDate desc
limit 1;

-- 11
select * from
payment
where transactionDate between '2023-01-01' and '2023-12-31';

-- 12
select distinct c.*
from customer c
left join lease l on
l.customerID = c.customerID
left join payment p on
p.leaseID = l.leaseID
where p.paymentID is NULL ;

-- 13
SELECT v.vehicleID, v.make, v.model, v.year, v.dailyRate, SUM(p.amount) AS totalPayments
FROM vehicle v
JOIN lease l ON v.vehicleID = l.vehicleID
JOIN payment p ON l.leaseID = p.leaseID
GROUP BY v.vehicleID;

-- 14
SELECT c.customerID, c.firstName, c.lastName, SUM(p.amount) AS totalPayments
FROM customer c
JOIN lease l ON c.customerID = l.customerID
JOIN payment p ON l.leaseID = p.leaseID
GROUP BY c.customerID;

-- 15
SELECT l.leaseID, v.vehicleID, v.make, v.model, v.year, v.dailyRate
FROM lease l
JOIN vehicle v ON l.vehicleID = v.vehicleID;

-- 16
SELECT l.leaseID, l.startDate, l.endDate, c.firstName, c.lastName, v.make, v.model, v.year, v.dailyRate
FROM lease l
JOIN customer c ON l.customerID = c.customerID
JOIN vehicle v ON l.vehicleID = v.vehicleID
WHERE l.endDate >= CURDATE(); 

-- 17
SELECT c.customerID, c.firstName, c.lastName, SUM(p.amount) AS totalSpent
FROM customer c
JOIN lease l ON c.customerID = l.customerID
JOIN payment p ON l.leaseID = p.leaseID
GROUP BY c.customerID
ORDER BY totalSpent DESC
LIMIT 1;

-- 18
SELECT v.vehicleID, v.make, v.model, v.year, v.dailyRate, l.startDate, l.endDate, c.firstName, c.lastName
FROM vehicle v
LEFT JOIN lease l ON v.vehicleID = l.vehicleID AND l.endDate >= CURDATE()  -- Only active leases
LEFT JOIN customer c ON l.customerID = c.customerID;

