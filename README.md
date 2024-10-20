# SQL-Challenge-Day4-Create-Alter-SubQueries

This README provides an overview of SQL commands for creating and modifying tables, as well as using subqueries to retrieve data.

## 1. CREATE TABLE

The CREATE TABLE statement is used to create a new table in the database.

**syntax**

CREATE TABLE table_name (

    column1 datatype constraints,
    
    column2 datatype constraints,
    
    ...
    
);
In this example, we create an Employee table with five columns, including EmployeeID as the primary key.

## 2. ALTER TABLE

The ALTER TABLE statement allows you to modify an existing table by adding, removing, or modifying columns and constraints.

**Syntax:**

Add a Column:

ALTER TABLE table_name

ADD column_name datatype;

Drop a Column:

ALTER TABLE table_name

DROP COLUMN column_name;

Modify a Column:

ALTER TABLE table_name

MODIFY column_name new_datatype;

**EXAMPLE**

Add a new column to the Employee table:


ALTER TABLE Employee

ADD PhoneNumber VARCHAR(15);

Modify the Salary column to allow NULL values:


ALTER TABLE Employee

MODIFY Salary DECIMAL(10, 2) NULL;


SQL README: CREATE, ALTER, and SUBQUERIES

This README provides an overview of SQL commands for creating and modifying tables and using subqueries to retrieve data.

## 1. CREATE TABLE
   
The CREATE TABLE statement is used to create a new table in the database.

Syntax:

CREATE TABLE table_name (

    column1 datatype constraints,
    
    column2 datatype constraints,
    ...
);
Example:

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

In this example, we create an Employee table with five columns, including EmployeeID as the primary key.

## 2.ALTER TABLE
   
The ALTER TABLE statement allows you to modify an existing table by adding, removing, or modifying columns and constraints.

Syntax:

Add a Column:

ALTER TABLE table_name

ADD column_name datatype;

Drop a Column:

ALTER TABLE table_name

DROP COLUMN column_name;

Modify a Column:

sql

ALTER TABLE table_name
MODIFY column_name new_datatype;

Example:

Add a new column to the Employee table:

ALTER TABLE Employee
ADD PhoneNumber VARCHAR(15);

Drop the PhoneNumber column from the Employee table:

ALTER TABLE Employee

DROP COLUMN PhoneNumber;

Modify the Salary column to allow NULL values:

sql

ALTER TABLE Employee

MODIFY Salary DECIMAL(10, 2) NULL;

## 3. SUBQUERIES

A subquery is a query nested inside another query. It can be used in various clauses such as SELECT, WHERE, FROM, etc.

Subqueries are used to retrieve data that will be used in the main query.

SELECT column_name(s) FROM table_name

WHERE column_name operator (SELECT column_name FROM another_table WHERE condition);

**Example 2:**

Get Employees Who Were Hired After the Highest Paid

SELECT * FROM Employee

WHERE HireDate > (SELECT HireDate FROM Employee ORDER BY Salary DESC LIMIT 1);





