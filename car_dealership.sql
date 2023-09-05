CREATE TABLE Salesperson (
    seller_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    cars_sold INT
);

INSERT INTO Salesperson(seller_id, first_name, last_name, cars_sold)
VALUES
    (1, 'Vaidic', 'Trivedi', 10),
    (2, 'Joe', 'Mama', 15);
    
CREATE TABLE Car (
    serial_num INT PRIMARY KEY,
    model VARCHAR(50),
    make VARCHAR(50),
    year INT,
    seller_id INT,
    FOREIGN KEY (seller_id) REFERENCES Salesperson(seller_id)
);

INSERT INTO Car (serial_num, model, make, year, seller_id)
VALUES
    (1001, 'Camry', 'Toyota', 2020, 1),
    (1002, 'Accord', 'Honda', 2021, 2);
    
CREATE TABLE Invoice (
    invoice_num INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    serial_num INT,
    FOREIGN KEY (serial_num) REFERENCES Car(serial_num)
);

INSERT INTO Invoice (invoice_num, amount, serial_num)
VALUES
    (5001, 25000.00, 1001),
    (5002, 28000.00, 1002);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    invoice_num INT,
    FOREIGN KEY (invoice_num) REFERENCES Invoice(invoice_num)
);

INSERT INTO Customer (customer_id, first_name, last_name, invoice_num)
VALUES
    (101, 'Alice', 'Johnson', 5001),
    (102, 'Bob', 'Williams', 5002);
    
    
CREATE TABLE Services (
    ticket_id INT PRIMARY KEY,
    date DATE,
    customer_id INT,
    total_cost DECIMAL(10, 2),
    part_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (part_id) REFERENCES Parts(part_id)
);

INSERT INTO Services (ticket_id, date, customer_id, total_cost, part_id)
VALUES
    (10001, '2023-01-15', 101, 150.00, 1),
    (10002, '2023-02-20', 102, 200.00, 2);
    
CREATE TABLE Mechanic (
    mechanic_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    serial_num INT,
    service_type VARCHAR(50),
    FOREIGN KEY (serial_num) REFERENCES Car(serial_num)
);

INSERT INTO Mechanic (mechanic_id, first_name, last_name, serial_num, service_type)
VALUES
    (2001, 'David', 'Clark', 1001, 'Maintenance'),
    (2002, 'Sarah', 'Smith', 1002, 'Repair');
    
CREATE TABLE Parts (
    part_id INT PRIMARY KEY,
    partname VARCHAR(50),
    part_cost DECIMAL(10, 2)
);

INSERT INTO Parts (part_id, partname, part_cost)
VALUES
    (1, 'Oil Filter', 10.00),
    (2, 'Brake Pads', 30.00);
