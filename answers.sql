
-- Question 1 Achieving 1NF (First Normal Form)

-- The 'Products column' contains multiple values, which violates 1NF.
-- Write an SQL query to transform this table into 1NF, ensuring that each row 
-- represents a single product for an order

-- so we split the table into two separate tables: Orders and OrderProducts.


-- So we start by creating a new table OrderProducts.

create table OrderProducts (
    OrderID int,
    Product varchar(255),
    foregn key (OrderID) references Orders(OrderID)
);

insert into productsItems (OrderID, CustomerName, Product) 
values
    (101, 'Laptop'),
    (101, 'Mouse'),
    (102, 'Tablet'),
    (102, 'Keyboard'),
    (102, 'Mouse'),
    (103, 'Phone');


-- Then we create the Orders table.
create table Orders (
    OrderID int primary key,,
    CustomerName varchar(255),
    
);

insert into Orders (OrderID, CustomerName)
values
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');


-- Question 2 Achieving 2NF (Second Normal Form)

-- Write an SQL query to transform this table into 2NF by removing partial dependencies. 
-- Ensure that each non-key column fully depends on the entire primary key.


-- To achieve 2NF, we have to remove partial dependencies. So we split the current
-- tables into two separate tables: Orders and Products.

create table Customers(

    OrderID int primary key,
    CustomerName varchar(255)
);

insert into Customers (OrderID, CustomerName)
values
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');


-- Create the OrderDetails table
CREATE TABLE Orders (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into the OrderDetails table
INSERT INTO Orders (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);


