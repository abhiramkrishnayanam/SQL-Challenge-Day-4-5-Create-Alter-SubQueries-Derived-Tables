use challenge;-- Create Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

-- Insert 15 rows of data
INSERT INTO Employee (EmployeeID, FirstName, LastName, Age, Department, Position, Salary, HireDate) VALUES
(1, 'John', 'Doe', 29, 'IT', 'Software Engineer', 70000, '2019-05-14'),
(2, 'Jane', 'Smith', 35, 'HR', 'HR Manager', 65000, '2018-03-23'),
(3, 'Robert', 'Johnson', 41, 'Finance', 'Accountant', 58000, '2016-09-12'),
(4, 'Emily', 'Davis', 30, 'Marketing', 'Marketing Specialist', 50000, '2020-07-01'),
(5, 'Michael', 'Brown', 37, 'IT', 'System Administrator', 72000, '2017-11-20'),
(6, 'Linda', 'Jones', 26, 'Sales', 'Sales Executive', 45000, '2021-02-14'),
(7, 'William', 'Miller', 50, 'Finance', 'Finance Manager', 90000, '2014-06-30'),
(8, 'Elizabeth', 'Garcia', 33, 'Operations', 'Operations Manager', 62000, '2019-12-17'),
(9, 'James', 'Martinez', 28, 'IT', 'Data Analyst', 68000, '2020-08-11'),
(10, 'Patricia', 'Wilson', 42, 'HR', 'Recruiter', 53000, '2017-01-19'),
(11, 'David', 'Anderson', 39, 'Sales', 'Sales Manager', 71000, '2015-10-05'),
(12, 'Sarah', 'Thomas', 27, 'Marketing', 'Content Creator', 47000, '2022-04-22'),
(13, 'Charles', 'Taylor', 46, 'Finance', 'Chief Financial Officer', 120000, '2012-09-09'),
(14, 'Nancy', 'Moore', 31, 'IT', 'DevOps Engineer', 75000, '2018-12-01'),
(15, 'Daniel', 'Hernandez', 29, 'Operations', 'Logistics Coordinator', 56000, '2021-06-07');

select * from Employee;

#Modify the Salary column in the Employee table to increase its precision and scale to allow larger numbers.
ALTER TABLE Employee
MODIFY Salary DECIMAL(12, 2);

#Rename the Position column to JobTitle in the Employee table.
ALTER TABLE Employee
RENAME COLUMN Position TO Job_Title;

#Modify the HireDate column to include both date and time.
ALTER TABLE Employee
MODIFY HireDate DATETIME;

#Drop the Age column from the Employee table as it's no longer required-- 
ALTER TABLE Employee
DROP COLUMN Age;

#Add a new column to the Employee table for storing the phone numbers of employees.
ALTER TABLE EMPLOYEE ADD PHONE_NUMBERS INT;

#Add a DepartmentID column and link it as a foreign key to a Department table's DeptID:
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

ALTER TABLE EMPLOYEE
ADD DEPARTMENT_ID INT,
ADD CONSTRAINT FK_DEPARTMENT FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT(DEPTID);

#Remove the NOT NULL constraint from the Salary column:
ALTER TABLE Employee
MODIFY Salary DECIMAL(10, 2) NULL;

#Create a new Bonus column with a default value of 5000:
ALTER TABLE Employee
ADD Bonus DECIMAL(10, 2) DEFAULT 5000;

 #Ensure that the EmployeeID column has unique values:
ALTER TABLE Employee
ADD CONSTRAINT unique_EmployeeID UNIQUE (EmployeeID);

####SUBQUERIES

#Find Employees with a Salary Higher than the Average Salary.
SELECT * FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

#Get the Names of Employees Who Work in the Same Department as 'John Doe'.
SELECT firstname,lastname,DEPARTMENT FROM Employee 
WHERE DEPARTMENT=(SELECT DEPARTMENT from employee WHERE FirstName = 'John' and Lastname='Doe');

#List Departments with More Than 2 Employees.
SELECT  Department FROM employee
WHERE Department IN (SELECT Department FROM Employee GROUP BY Department HAVING COUNT(*) > 2);

#Get the Department Names Where Employees Earn More than $60,000.
SELECT  DISTINCT Department, SALARY FROM employee
where Department IN (SELECT DEPARTMENT FROM EMPLOYEE WHERE SALARY > 60000);
SELECT * FROM EMPLOYEE;

#Retrieve Employees Who Joined After the Employee with the Highest Salary.
SELECT * FROM Employee
WHERE HireDate > (SELECT HireDate FROM Employee ORDER BY Salary DESC LIMIT 1);

##Derived Tables
#Find Employees with Salary Greater Than the Average Salary Using a Derived Table
SELECT E.*
FROM Employee E, (SELECT AVG(Salary) AS AvgSalary FROM Employee) AS AvgSal
WHERE E.Salary > AvgSal.AvgSalary;

