-- 1. creation of customers table


-- CREATE TABLE Customers (
--     CustomerID INT PRIMARY KEY, 
--     FirstName VARCHAR(50),
--     LastName VARCHAR(50),
--     Email VARCHAR(100),
--     Phone VARCHAR(15),
--     Address VARCHAR(255),
--     DateOfBirth DATE,
--     LicenseNumber VARCHAR(20)
-- );

-- 	1.1 trigger on customer table
-- 		create or replace function alertcust()
-- 		returns trigger as $$
-- 		begin
-- 		if new.CustomerID<0 or new.CustomerID>1000 then
-- 		raise 'INVALID CUSTOMER ID';
-- 		end if;
-- 		return new;
-- 		end $$
-- 		language plpgsql;

-- 		create trigger alcust before insert on customers for each row execute function alertcust();

--     check trigger
-- 			insert into customers(CustomerID) values(-1);
-- 2.Insertion in customers table


-- INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, DateOfBirth, LicenseNumber)
-- VALUES
-- ('001', 'John', 'Doe', 'john.doe@email.com', '123-456-7890', '123 Main St, City', '1985-06-15', 'ABC123456789012'),
-- ('002', 'Jane', 'Smith', 'jane.smith@email.com', '987-654-3210', '456 Elm St, Town', '1990-03-21', 'XYZ987654321098'),
-- ('003', 'David', 'Johnson', 'david.johnson@email.com', '555-123-4567', '789 Oak Dr, Village', '1978-11-03', 'DEF789456123456'),
-- ('004', 'Sarah', 'Wilson', 'sarah.wilson@email.com', '111-222-3333', '101 Pine Ln, Suburb', '1995-09-28', 'GHI123789456789'),
-- ('005', 'Robert', 'Brown', 'robert.brown@email.com', '444-333-2222', '999 Cedar Rd, County', '1980-02-09', 'JKL987654321789'),
-- ('006', 'Alice', 'Johnson', 'alice.johnson@email.com', '222-333-4444', '222 Oak St, Town', '1993-07-12', 'MNO987654321456'),
-- ('007', 'Tom', 'Smith', 'tom.smith@email.com', '333-444-5555', '333 Elm St, City', '1998-01-02', 'PQR123456789012'),
-- ('008', 'Emily', 'Brown', 'emily.brown@email.com', '444-555-6666', '444 Pine Ln, Suburb', '1992-05-30', 'STU987654321789'),
-- ('009', 'Michael', 'Davis', 'michael.davis@email.com', '555-666-7777', '555 Cedar Rd, County', '1991-08-17', 'VWX123789456789'),
-- ('010', 'Sophia', 'Miller', 'sophia.miller@email.com', '666-777-8888', '666 Oak Dr, Village', '1987-12-04', 'YZA987654321456'),
-- ('011', 'Ella', 'Hernandez', 'ella.hernandez@email.com', '333-444-5555', '333 Elm St, Town', '1999-06-28', 'BCD123456789012'),
-- ('012', 'Noah', 'Jones', 'noah.jones@email.com', '444-555-6666', '444 Pine Ln, Suburb', '2002-12-11', 'EFG987654321789'),
-- ('013', 'Ava', 'Hernandez', 'ava.hernandez@email.com', '333-444-5555', '333 Elm St, Town', '1999-06-28', 'BCD123456789012'),
-- ('014', 'Noah', 'Jones', 'noah.jones@email.com', '444-555-6666', '444 Pine Ln, Suburb', '2002-12-11', 'EFG987654321789'),
-- ('015', 'Sophia', 'Anderson', 'sophia.anderson@email.com', '555-666-7777', '555 Cedar Rd, County', '2001-03-15', 'HIJ123456789012'),
-- ('016', 'Liam', 'Martinez', 'liam.martinez@email.com', '777-888-9999', '777 Main St, City', '2000-09-30', 'KLM987654321789'),
-- ('017', 'Olivia', 'Lopez', 'olivia.lopez@email.com', '666-555-4444', '666 Oak Dr, Village', '1998-11-22', 'NOP123456789012'),
-- ('018', 'Ethan', 'Brown', 'ethan.brown@email.com', '555-444-3333', '555 Pine Ln, Suburb', '2003-07-04', 'QRS987654321789'),
-- ('019', 'Emma', 'Garcia', 'emma.garcia@email.com', '444-333-2222', '444 Cedar Rd, County', '2002-05-10', 'TUV123789456789'),
-- ('020', 'Mia', 'Smith', 'mia.smith@email.com', '333-222-1111', '333 Elm St, Town', '2004-01-29', 'WXY987654321456');

-- 3. creation of cars table


-- CREATE TABLE Cars (
--     CarID INT  PRIMARY KEY, 
--     Make VARCHAR(50),
--     Model VARCHAR(50),
--     Year INT,
--     RegistrationNumber VARCHAR(20) UNIQUE,
--     Color VARCHAR(20),
--     DailyRentalRate DECIMAL(10, 2),
--     AvailabilityStatus VARCHAR(20)
-- );

	-- 3.1 trigger on cars table

-- 				create or replace function alertcars()
-- 				returns trigger as $$
-- 				begin
-- 				if new.CarID<100 or new.CarID>1000 then
-- 				raise 'INVALID CAR ID';
-- 				else if(new.year<2015) then 
-- 				raise'cannot be rented';
-- 				end if;
-- 				end if;
-- 				return new;
-- 				end $$
-- 				language plpgsql;

-- 				create trigger alcars before insert on cars for each row execute function alertcars();

--   		   check trigger
-- 					insert into cars(CarID) values(99);
-- 					insert into cars(year) values(2014);
		
-- drop trigger alcars on cars


-- 4. insertion in cars table

-- INSERT INTO Cars (CarID,Make, Model, Year, RegistrationNumber, Color, DailyRentalRate, AvailabilityStatus)
-- VALUES
-- (110,'Toyota', 'Camry', 2020, 'ABC-123', 'Blue', 50.00, 'Available'),
-- (111,'Honda', 'Civic', 2019, 'XYZ-456', 'Red', 45.00, 'Available'),
-- (112,'Ford', 'Focus', 2021, 'DEF-789', 'White', 55.00, 'Rented'),
-- (113,'Nissan', 'Altima', 2020, 'GHI-987', 'Silver', 52.00, 'Available'),
-- (114,'Chevrolet', 'Malibu', 2018, 'JKL-654', 'Black', 48.00, 'Rented'),
-- (115,'Mazda', 'CX-5', 2019, 'MNO-321', 'Gray', 53.00, 'Available'),
-- (116,'Hyundai', 'Elantra', 2022, 'PQR-654', 'Silver', 49.00, 'Available'),
-- (117,'Kia', 'Optima', 2020, 'STU-987', 'White', 52.00, 'Available'),
-- (118,'Subaru', 'Outback', 2021, 'VWX-123', 'Green', 55.00, 'Rented'),
-- (119,'Volkswagen', 'Passat', 2019, 'YZA-456', 'Blue', 46.00, 'Available'),
-- (120,'Toyota', 'Rav4', 2022, 'ABC-456', 'Red', 55.00, 'Available'),
-- (121,'Honda', 'Accord', 2020, 'XYZ-789', 'Silver', 52.00, 'Available'),
-- (122,'Ford', 'Explorer', 2021, 'DEF-321', 'Black', 60.00, 'Rented'),
-- (123,'Nissan', 'Maxima', 2022, 'GHI-654', 'White', 58.00, 'Available'),
-- (124,'Chevrolet', 'Equinox', 2020, 'JKL-987', 'Gray', 53.00, 'Available'),
-- (125,'Mazda', 'Mazda3', 2021, 'MNO-456', 'Blue', 51.00, 'Rented'),
-- (126,'Hyundai', 'Santa Fe', 2022, 'PQR-123', 'Black', 62.00, 'Available'),
-- (127,'Kia', 'Sorento', 2020, 'STU-456', 'White', 55.00, 'Available'),
-- (128,'Subaru', 'Forester', 2021, 'VWX-789', 'Green', 56.00, 'Available'),
-- (129,'Volkswagen', 'Jetta', 2020, 'YZA-123', 'Red', 50.00, 'Rented'),
-- (130,'Toyota', 'Highlander', 2022, 'BCD-456', 'Silver', 60.00, 'Available'),
-- (131,'Honda', 'CR-V', 2021, 'EFG-789', 'Blue', 54.00, 'Available'),
-- (132,'Ford', 'Mustang', 2020, 'HIJ-321', 'Red', 65.00, 'Rented'),
-- (133,'Nissan', 'Rogue', 2022, 'KLM-654', 'Black', 58.00, 'Available'),
-- (134,'Chevrolet', 'Camaro', 2021, 'NOP-987', 'Yellow', 65.00, 'Available'),
-- (135,'Mazda', 'CX-9', 2020, 'QRS-123', 'Red', 56.00, 'Rented'),
-- (136,'Hyundai', 'Tucson', 2021, 'TUV-456', 'Blue', 52.00, 'Available'),
-- (137,'Kia', 'Sportage', 2022, 'WXY-789', 'White', 57.00, 'Available'),
-- (138,'Subaru', 'Crosstrek', 2020, 'ZAB-123', 'Orange', 53.00, 'Available'),
-- (139,'Volkswagen', 'Tiguan', 2021, 'BCD-459', 'Black', 55.00, 'Rented');

--5. creation of Rental Records


-- CREATE TABLE RentalRecords (
--     RentalRecordID INT PRIMARY KEY, -- Assuming an auto-increment primary key
--     RentalStartDate DATE,
--     RentalEndDate DATE,
--     TotalCost DECIMAL(10, 2),
--     CustomerID INT, -- A foreign key to relate to the Customers table
--     CarID INT -- A foreign key to relate to the Cars table
-- );

-- drop table RentalRecords

-- 6. alter table rental records to add  foreign key customerid,carid records

-- alter table RentalRecords 
-- add constraint addcustid 
-- foreign key  (CustomerID)   REFERENCES  Customers( CustomerID);
-- alter table RentalRecords 
-- add constraint addcarid 
-- foreign key  (CarID)   REFERENCES cars( CarID);
-- select * from RentalRecords

-- 7.insertion into rental record where rental status of car rented

-- INSERT INTO RentalRecords (RentalRecordID,RentalStartDate, RentalEndDate, TotalCost, CustomerID, CarID)
-- VALUES
-- (100,'2023-10-01 09:00:00', '2023-10-03 17:00:00', 150.00, 1, 112),
-- (101,'2023-10-02 11:30:00', '2023-10-04 14:15:00', 180.50, 2, 114),
-- (102,'2023-10-03 08:15:00', '2023-10-05 12:30:00', 160.75, 3, 118),
-- (103,'2023-10-04 10:45:00', '2023-10-06 16:45:00', 210.25, 4, 122),
-- (104,'2023-10-05 14:00:00', '2023-10-07 10:30:00', 135.90, 5, 125),
-- (105,'2023-10-06 09:30:00', '2023-10-08 13:45:00', 195.30, 6, 129),
-- (106,'2023-10-07 12:45:00', '2023-10-09 19:00:00', 230.75, 7, 132),
-- (107,'2023-10-08 15:20:00', '2023-10-10 18:30:00', 170.80, 8, 135),
-- (108,'2023-10-09 10:00:00', '2023-10-11 15:15:00', 190.60, 9, 139);

-- 8. creation of employees table


-- CREATE TABLE Employees (
--     E_ID INT  PRIMARY KEY,
--     branch_id int,
--     FirstName VARCHAR(50),
--     LastName VARCHAR(50),
--     Email VARCHAR(100),
--     Phone VARCHAR(15),
--     HireDate DATE
-- );

-- alter table employees add constraint insertbid foreign key (branch_id) references Branches(BranchID);
 		

-- 9. insertion in employees table

-- INSERT INTO Employees (E_ID,FirstName, LastName, Email, Phone, HireDate, Branch_ID)
-- VALUES
-- (420,'John', 'Doe', 'john.doe@email.com', '123-456-7890', '2023-09-15',9009),
-- (421,'Jane', 'Smith', 'jane.smith@email.com', '987-654-3210', '2023-08-25',9010),
-- (422,'David', 'Johnson', 'david.johnson@email.com', '555-123-4567', '2023-10-05',9011),
-- (423,'Sarah', 'Wilson', 'sarah.wilson@email.com', '111-222-3333', '2023-07-12',9012),
-- (424,'Robert', 'Brown', 'robert.brown@email.com', '444-333-2222', '2023-06-18',9013),
-- (425,'Alice', 'Martinez', 'alice.martinez@email.com', '777-888-9999', '2023-09-02',9014),
-- (426,'Tom', 'Anderson', 'tom.anderson@email.com', '666-555-4444', '2023-10-11',9015),
-- (427,'Emily', 'Garcia', 'emily.garcia@email.com', '555-444-3333', '2023-08-15',9016),
-- (428,'Michael', 'Davis', 'michael.davis@email.com', '333-222-1111', '2023-11-04',9017),
-- (429,'Sophia', 'Lopez', 'sophia.lopez@email.com', '222-333-4444', '2023-07-19',9018),
-- (430,'Olivia', 'Wilson', 'olivia.wilson@email.com', '444-333-5555', '2023-06-22',9011),
-- (431,'James', 'Hernandez', 'james.hernandez@email.com', '555-666-7777', '2023-09-30',9012),
-- (432,'Ella', 'Brown', 'ella.brown@email.com', '444-555-6666', '2023-08-04',9013),
-- (435,'William', 'Smith', 'william.smith@email.com', '333-444-5555', '2023-11-26',9014),
-- (436,'Mia', 'Johnson', 'mia.johnson@email.com', '222-111-0000', '2023-10-17',9017);
-- select * from employees

-- 10.creation of brances table

-- CREATE TABLE Branches (
--     BranchID INT  PRIMARY KEY, 
--     CityName VARCHAR(100),
--     ManagerID INT
-- );

-- 11. insertion in branches table

-- Insert branch records into the Branches table
-- INSERT INTO Branches (BranchID,CityName, ManagerID)
-- VALUES
-- (9009,'New York', 101),
-- (9010,'Los Angeles', 102),
-- (9011,'Chicago', 103),
-- (9012,'Houston', 104),
-- (9013,'Phoenix', 105),
-- (9014,'Philadelphia', 106),
-- (9015,'San Antonio', 107),
-- (9016,'San Diego', 108),
-- (9017,'Dallas', 109),
-- (9018,'San Jose', 110);

-- 12.creation of maintainance records table

-- CREATE TABLE MaintenanceRecords (
--     MaintenanceRecordID INT  PRIMARY KEY,
--     CarID INT,
--     MaintenanceDate DATE,
--     Description TEXT,
--     Cost DECIMAL(10, 2),
--     constraint fk_carid FOREIGN KEY (CarID) REFERENCES Cars(CarID)
-- );


-- 13. insertion in maintanance records

-- Insert 20 distinct maintenance records with CarID between 110 and 139
-- INSERT INTO MaintenanceRecords ( MaintenanceRecordID,CarID, MaintenanceDate, Description, Cost)
-- VALUES
-- (1030,110, '2023-10-01', 'Oil change and filter replacement', 60.00),
-- (1031,112, '2023-10-02', 'Tire rotation and balance', 45.00),
-- (1032,114, '2023-10-03', 'Brake pad replacement', 120.00),
-- (1033,116, '2023-10-04', 'Air conditioning system check', 80.00),
-- (1034,118, '2023-10-05', 'Transmission fluid change', 100.00),
-- (1035,120, '2023-10-06', 'Engine diagnostics', 75.00),
-- (1036,122, '2023-10-07', 'Coolant system flush', 65.00),
-- (1037,124, '2023-10-08', 'Spark plug replacement', 55.00),
-- (1038,126, '2023-10-09', 'Wheel alignment', 70.00),
-- (1039,128, '2023-10-10', 'Battery replacement', 90.00),
-- (1040,130, '2023-10-11', 'Oil change and filter replacement', 60.00),
-- (1041,132, '2023-10-12', 'Tire rotation and balance', 45.00),
-- (1042,134, '2023-10-13', 'Brake pad replacement', 120.00),
-- (1043,136, '2023-10-14', 'Air conditioning system check', 80.00),
-- (1044,138, '2023-10-15', 'Transmission fluid change', 100.00),
-- (1045,111, '2023-10-16', 'Engine diagnostics', 75.00),
-- (1046,113, '2023-10-17', 'Coolant system flush', 65.00),
-- (1047,115, '2023-10-18', 'Spark plug replacement', 55.00),
-- (1048,117, '2023-10-19', 'Wheel alignment', 70.00),
-- (1049,119, '2023-10-20', 'Battery replacement', 90.00);


-- 14. can see all tables i.e. whole database

-- select * from customers;
-- select * from cars;
-- select * from branches;
-- select * from employees;
-- select * from maintenancerecords;
-- select * from rentalrecords;


-- 15. Show name of customers and their respective rented car name.


-- select customers.FirstName,customers.LastName,cars.make,cars.model from customers inner join rentalrecords on 
-- customers.CustomerID=rentalrecords.CustomerID inner join cars on 
-- cars.CarID=rentalrecords.CarID where  AvailabilityStatus='Rented';


-- 16.Give car details and total cost of top five cars with maximum mantainance.

-- select cars.CarID,cars.Make,cars.Model,SUM(maintenancerecords.cost) from cars 
-- inner join maintenancerecords on maintenancerecords.CarID=cars.CarID 
-- group by cars.CarID order by SUM(maintenancerecords.Cost) desc limit 5;

-- 17.Write a function which gives the customers and cars details along with amount they have to pay.


-- create or replace procedure showcustdetails(Customer_ID int)
-- as $$
-- declare 
-- custId INT;
-- fname VARCHAR(255);
-- lname VARCHAR(255);
-- company VARCHAR(255);
-- cmodel VARCHAR(255);
-- cost NUMERIC(10,2);

-- begin
-- select customers.CustomerID,customers.FirstName,customers.LastName,cars.Make,cars.Model, rentalrecords.totalcost 
-- INTO custId, fname, lname, company, cmodel, cost 
-- from customers inner join  rentalrecords on 
-- customers.CustomerID=rentalrecords.CustomerID 
-- inner join cars on cars.CarID=rentalrecords.CarID where customers.CustomerID=Customer_ID;
-- if not found then 
-- raise notice '% not found',Customer_ID;
-- else
-- raise notice 'CustomerID : %, Customer Name : % %, Car : % %, Amount: %', custId, fname, lname, company, cmodel, cost;

-- end if;

-- end $$
-- language plpgsql;

-- call showcustdetails(45);

-- 18. Create function that updates the rental cost of a given car by car id.

-- create or replace procedure updatecardetails(car_id int, rate numeric(10,2)) AS $$

-- BEGIN 
-- UPDATE cars SET dailyrentalrate = rate where carid=car_id;
-- IF NOT FOUND THEN
-- RAISE NOTICE 'CAR ID NOT FOUND: %',car_id;
-- ELSE
-- RAISE NOTICE 'CARS DETAILS UPDATED';
-- END IF;
-- end $$
-- language plpgsql;

-- CALL updatecardetails(110,65.00);
-- CALL updatecardetails(199,65.00);
