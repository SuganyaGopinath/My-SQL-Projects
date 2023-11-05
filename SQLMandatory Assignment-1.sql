-- SQL Mandatory Assignment -1 [Module 1&2]
---Date :27-10-2023


CREATE TABLE Salesman (
    SalesmanId INT,
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255),
    Age INT
);
INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);
CREATE TABLE Customer (
    SalesmanId INT,
    CustomerId INT,
    CustomerName VARCHAR(255),
    PurchaseAmount INT,
    );
INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545);

CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount money)

INSERT INTO Orders Values 
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500);

SELECT * FROM Salesman;
SELECT * FROM Customer;
SELECT * FROM Orders;

--Tasks to be Performed:
---1. Insert a new record in your Orders table.

INSERT INTO Orders Values 
(5004,3747,107,'2021-05-10',2700);
---2. Add Primary key constraint for SalesmanId column in Salesman table. 
  
   ----Add not null constraint in Customer_name column for the Customer table.
ALTER TABLE Salesman
alter column SalesmanId INT not null;

Alter table Salesman
Add Primary Key(SalesmanId);

----Add default constraint for City column in Salesman table. 
ALTER TABLE Salesman
add constraint df_city
DEFAULT 'Unknown' for City;

 ----Add Foreign key constraint for SalesmanId column in Customer table. 

UPDATE Customer
SET SalesmanId =102
WHERE SalesmanId =107;

UPDATE Customer
SET SalesmanId =105
WHERE SalesmanId =110;

ALTER TABLE Customer
ADD CONSTRAINT fk_SalesmanId FOREIGN KEY (SalesmanId) REFERENCES Salesman(SalesmanId);

----Add not null constraint in Customer_name column for the Customer table.
ALTER TABLE Customer
alter column CustomerName VARCHAR(255) not null;

---3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase amount value greater than 500.

Select * from Customer where CustomerName like '%N' and PurchaseAmount>500;


---4. Using SET operators, retrieve the first result with unique SalesmanId values from two tables, and the other result containing SalesmanId with duplicates from two tables.
SELECT SalesmanId FROM Salesman
union
SELECT SalesmanId FROM Customer;

SELECT SalesmanId FROM Salesman
union all
SELECT SalesmanId FROM Customer;


---5. Display the below columns which has the matching data. Orderdate, Salesman Name, Customer Name, Commission, and City which has the range of Purchase Amount between 500 to 1500.

select o.Orderdate,o.SalesmanId,c.CustomerName,s.Commission,s.City from Salesman s
join Customer c on s.SalesmanId=c.SalesmanID
join Orders o on c.SalesmanId=o.SalesmanId
where PurchaseAmount between 500 and 1500;

---6. Using right join fetch all the results from Salesman and Orders table.

select * from Salesman s right join Orders o on s.SalesmanId=o.SalesmanId


