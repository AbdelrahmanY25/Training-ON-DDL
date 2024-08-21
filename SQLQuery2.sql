-- 1- Create a table named "Employees" with columns for ID (integer),
--Name (varchar), and Salary (decimal).

CREATE TABLE Employees (
	ID int,
	Name varchar,
	Salary decimal
);

--2 -Add a new column named "Department" to the "Employees" table
-- with data type varchar(50).

alter table dbo.Employees ADD Department varchar(50);

-- 3- Remove the "Salary" column from the "Employees" table.

alter table dbo.Employees
drop column Salary;

-- 4- Rename the "Department" column in the "Employees" table to
 -- "DeptName".

 EXEC sp_rename "Employees.Department", "DeptName";

-- 5- Create a new table called "Projects" with columns
-- for ProjectID (integer) and ProjectName (varchar).

CREATE TABLE Projects (
	ProjectID int,
	ProjectName varchar
);

-- 6- Add a primary key constraint to the "Employees" table
-- for the "ID" column

alter table dbo.Employees
alter column ID INT NOT NULL;

alter table dbo.Employees
ADD primary key (ID);

-- 7- Create a foreign key relationship between the "Employees"
-- table (referencing "ID") and the "Projects" table
 -- (referencing "ProjectID").

ALTER TABLE dbo.Projects
ADD CONSTRAINT FK_Emp_Projects FOREIGN KEY(ProjectID) REFERENCES dbo.Employees(ID);

-- 8- Remove the foreign key relationship between
-- "Employees" and "Projects."

ALTER TABLE dbo.Projects
DROP CONSTRAINT FK_Emp_Projects;

-- 9- Add a unique constraint to the "Name" column in the
-- "Employees" table.

ALTER TABLE dbo.Employees
ADD CONSTRAINT Uique_Name UNIQUE(Name);

-- 10- Create a table named "Customers" with columns
-- for CustomerID (integer), FirstName (varchar),
-- LastName (varchar), and Email (varchar), and Status (varchar).

CREATE TABLE Customers (
	CustomerID int,
	FirstName varchar,
	LastName varchar,
	Email varchar, 
	Status varchar
);

-- 11- Add a unique constraint to the combination of
-- "FirstName" and "LastName" columns in the "Customers" table.

alter table dbo.Customers
ADD Constraint Unique_Fnamme UNIQUE(FirstName, LastName);

-- 12- Add a default value of 'Active' for the "Status"
-- column in the "Customers" table, where the default value
--should be applied when a new record is inserted.

ALTER TABLE dbo.Customers
ADD CONSTRAINT DF_Customers_Status DEFAULT 'Active' FOR Status;

 -- 13- Create a table named "Orders" with columns for
 -- OrderID (integer), CustomerID (integer), OrderDate (datetime),
 -- and TotalAmount (decimal).

 CREATE TABLE Orders (
	OrderID int,
	CustomerID int,
	OrderDate datetime,
	TotalAmount decimal
);

-- 14- Add a check constraint to the "TotalAmount" column
-- in the "Orders" table to ensure that it is greater than zero.

ALTER TABLE Sales.SalesOrders
ADD CONSTRAINT greater_than_zero CHECK (TotalAmount > 0);

-- 15- Create a schema named "Sales" and move the "Orders" table
-- into this schema.

CREATE SCHEMA Sales;
ALTER SCHEMA Sales Transfer Object :: dbo.Orders;

-- 16- Rename the "Orders" table to "SalesOrders."

EXEC sp_rename "Sales.Orders", "SalesOrders";