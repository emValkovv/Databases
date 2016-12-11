--01.Write a SQL query to find the names and salaries of the employees that take 
--the minimal salary in the company. Use a nested SELECT statement
SELECT e.FirstName, e.LastName, e.Salary
FROM Employees e
WHERE Salary =
(SELECT MIN(Salary) FROM Employees s)

--02.Write a SQL query to find the names and salaries of the employees 
--that have a salary that is up to 10% higher than the minimal salary for the company.
SELECT e.FirstName, e.LastName, e.Salary
FROM Employees e
WHERE Salary <=
(SELECT MIN(Salary)FROM Employees s)*1.1
ORDER BY e.Salary DESC

--03.Write a SQL query to find the full name, salary and department of the employees 
--that take the minimal salary in their department. Use a nested SELECT statement.
SELECT FirstName, LastName, d.Name, Salary
FROM Employees e, Departments d
WHERE Salary = 
  (SELECT MIN(Salary) FROM Employees 
   WHERE DepartmentID = e.DepartmentID) AND
   d.Name =
   (SELECT Name FROM Departments
   WHERE DepartmentID = e.DepartmentID)
ORDER BY Salary

--04.Write a SQL query to find the average salary in the department #1.
SELECT AVG(Salary) AS [Average salary]
FROM Employees
WHERE DepartmentID = 1

--05.Write a SQL query to find the average salary in the "Sales" department.
SELECT AVG(Salary) AS [Average salary]
FROM Employees e
WHERE e.DepartmentID = 
(SELECT d.DepartmentID FROM Departments d
WHERE d.Name = 'Sales')

--06.Write a SQL query to find the number of employees in the "Sales" department.
SELECT COUNT(*) AS [People in Sales]
FROM Employees e
WHERE e.DepartmentID = 
(SELECT d.DepartmentID FROM Departments d
WHERE d.Name = 'Sales')

--07.Write a SQL query to find the number of all employees that have manager.
SELECT COUNT(*) AS [People with manager]
FROM Employees e
WHERE e.ManagerID IS NOT NULL

--08.Write a SQL query to find the number of all employees that have no manager.
SELECT COUNT(*) AS [People without manager]
FROM Employees e
WHERE e.ManagerID IS NULL

--09.Write a SQL query to find all departments and the average salary for each of them.
SELECT AVG(e.Salary) AS [Average Salary], d.Name as [Deparment]
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name

--10.Write a SQL query to find the count of all employees in each department and for each town.
SELECT COUNT(*), d.Name AS [Department], t.Name AS [Town]
FROM Employees e
	JOIN Departments d
	ON d.DepartmentID = e.DepartmentID
	JOIN Addresses a
	ON a.AddressID = e.AddressID
	JOIN Towns t
	ON t.TownID = a.TownID
GROUP BY d.Name, t.Name
ORDER BY t.Name

--11.Write a SQL query to find all managers that have exactly 5 employees. 
--Display their first name and last name.
SELECT m.FirstName + ' ' + m.LastName AS [Fullname]
FROM Employees m
	JOIN Employees e
	ON e.ManagerID = m.EmployeeID
GROUP BY m.LastName, m.FirstName
HAVING COUNT(*) = 5

--12.Write a SQL query to find all employees along with their managers. 
--For employees that do not have manager display the value "(no manager)".
SELECT e.FirstName, e.LastName, ISNULL(m.FirstName + ' ' + m.LastName, 'No manager') AS [Manager]
FROM Employees e
	LEFT OUTER JOIN Employees m
	ON e.ManagerID = m.EmployeeID
GROUP BY m.LastName, m.FirstName, e.FirstName, e.LastName
ORDER BY m.LastName

--13.Write a SQL query to find the names of all employees whose last name is exactly 5 characters long. 
--Use the built-in LEN(str) function.
SELECT e.FirstName, e.LastName
FROM Employees e
WHERE LEN(e.LastName) = 5 

--14.Write a SQL query to display the current date and time in the following format 
--"day.month.year hour:minutes:seconds:milliseconds". Search in Google to find how to format dates in SQL Server.
SELECT CONVERT(VARCHAR(24),GETDATE(),113)

--15.Write a SQL statement to create a table Users. 
--Users should have username, password, full name and last login time.
---Choose appropriate data types for the table fields. Define a primary key column with a primary key constraint.
---Define the primary key column as identity to facilitate inserting records.
---Define unique constraint to avoid repeating usernames.
---Define a check constraint to ensure the password is at least 5 characters long.
CREATE TABLE Users (
	UserID int IDENTITY,
	Username nvarchar(50) UNIQUE NOT NULL,
	[Password] NVARCHAR(40) CHECK (LEN([Password]) >= 5) NOT NULL,
	Fullname nvarchar(100),
	LastLogin datetime
	CONSTRAINT PK_Users PRIMARY KEY(UserID)
	)

--16.Write a SQL statement to create a view that displays the users from the 
--Users table that have been in the system today. Test if the view works correctly.
GO
CREATE VIEW [Test the view] AS
SELECT TOP 5 Username FROM Users

--17.Write a SQL statement to create a table Groups. Groups should have unique name (use unique constraint).
--Define primary key and identity column.
CREATE TABLE Groups (
	GroupID int IDENTITY,
	GroupName NVARCHAR(50) UNIQUE NOT NULL
	)

--18.Write a SQL statement to add a column GroupID to the table Users.
--Fill some data in this new column and as well in the `Groups table.
--Write a SQL statement to add a foreign key constraint between tables Users and Groups tables.
ALTER TABLE Users
ADD GroupID INT

GO
ALTER TABLE Users
ADD CONSTRAINT FK_Users_Groups
	FOREIGN KEY (GroupID)
	REFERENCES Groups(GroupID)

--19.Write SQL statements to insert several records in the Users and Groups tables.
INSERT INTO Users (Username, [Password], Fullname)
VALUES 
('shisharka', 'mnparolistanaha', 'Rado Shisharkata'),
('pishtovaa', 'prakalqvate', 'Mitio Pishtova')

INSERT INTO Groups (GroupName)
VALUES
('Prezidentite'),
('Glasopodovatelite')	

--20.Write SQL statements to update some of the records in the Users and Groups tables.
UPDATE Users
SET Username = 'jylyta'
WHERE Username = 'shisharka'

UPDATE Groups
SET GroupName = 'Zagubilite'
WHERE GroupName = 'Prezidentite'

--21.Write SQL statements to delete some of the records from the Users and Groups tables.
DELETE FROM Users
WHERE UserID = 3

DELETE FROM Groups
WHERE GroupID = 2

--22.Write SQL statements to insert in the Users table the names of all employees from the Employees table.
--Combine the first and last names as a full name.
--For username use the first letter of the first name + the last name (in lowercase).
--Use the same for the password, and NULL for last login time.
INSERT INTO Users (Username, [Password], Fullname)
SELECT LOWER(LEFT(FirstName, 1) + LastName),
	UPPER(LEFT(FirstName, 1) + LastName + '123'),
	FirstName + ' ' + LastName
FROM Employees

--23.Write a SQL statement that changes the password to NULL for all users 
--that have not been in the system since 10.03.2010.
UPDATE Users
SET [Password] = 'NULLABLE'
WHERE LastLogin < CONVERT(datetime, '2010-03-10')

--24.Write a SQL statement that deletes all users without passwords (NULL password).
DELETE FROM Users
WHERE [Password] = 'NULLABLE'

--25.Write a SQL query to display the average employee salary by department and job title.
SELECT AVG(e.Salary), e.JobTitle, d.Name
FROM Employees e
	JOIN Departments d
	ON d.DepartmentID = e.DepartmentID
GROUP BY d.Name, e.JobTitle
ORDER BY AVG(e.Salary)

--26.Write a SQL query to display the minimal employee salary by 
--department and job title along with the name of some of the employees that take it.
SELECT AVG(e.Salary), e.JobTitle, d.Name, e.FirstName + ' ' +e.LastName AS [Fullname]
FROM Employees e
	JOIN Departments d
	ON d.DepartmentID = e.DepartmentID
GROUP BY d.Name, e.JobTitle, e.FirstName, e.LastName
ORDER BY AVG(e.Salary)

--27.Write a SQL query to display the town where maximal number of employees work.
SELECT TOP(1) t.Name, COUNT(*) AS [Number of employees]
FROM Employees e
	JOIN Addresses a
	ON e.AddressID = a.AddressID
	JOIN Towns t
	ON a.TownID = t.TownID
GROUP BY t.Name
ORDER BY COUNT(*) DESC

--28.Write a SQL query to display the number of managers from each town.
SELECT t.Name, COUNT(*) AS [Number of managers]
FROM Employees e
	JOIN Employees m
	ON e.ManagerID = m.EmployeeID
	JOIN Addresses a
	ON e.AddressID = a.AddressID
	JOIN Towns t
	ON t.TownID = a.TownID
WHERE e.EmployeeId 
IN (SELECT DISTINCT m.EmployeeID
FROM Employees e
JOIN Employees m
ON e.ManagerID = m.EmployeeID)
GROUP BY t.Name
ORDER BY [Number of managers] DESC

--29.Write a SQL to create table WorkHours to store work reports for each employee 
--(employee id, date, task, hours, comments).
--Don't forget to define identity, primary key and appropriate foreign key.
--Issue few SQL statements to insert, update and delete of some data in the table.
--Define a table WorkHoursLogs to track all changes in the WorkHours table with triggers.
--For each change keep the old record data, the new record data and the command (insert / update / delete).
CREATE TABLE WorkHours(
	WorkHoursID INT IDENTITY PRIMARY KEY,
	EmployeeID int FOREIGN KEY REFERENCES Employees(EmployeeID),
	Date datetime,
	Taks NVARCHAR(200),
	hours int,
	comments NVARCHAR(200)
	)

--30.Start a database transaction, delete all employees from the 'Sales' department along with all dependent records from the pother tables.
--At the end rollback the transaction.
BEGIN TRAN
	ALTER TABLE EmployeesProjects
	DROP CONSTRAINT FK_EmployeesProjects_Employees
	ALTER TABLE Departments
	DROP CONSTRAINT FK_Departments_Employees

	DELETE FROM Employees
	SELECT d.Name
	FROM Employees e
	JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
	WHERE d.Name = 'Sales'
ROLLBACK TRAN

--31.Start a database transaction and drop the table EmployeesProjects.
--Now how you could restore back the lost table data?
DROP TABLE EmployeesProjects
