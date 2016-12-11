--04.Write a SQL query to find all information about all departments (use "TelerikAcademy" database).
SELECT * 
FROM Departments

--05.Write a SQL query to find all department names.
SELECT d.Name 
FROM Departments d

--06.Write a SQL query to find the salary of each employee.
SELECT e.FirstName + ' ' + e.LastName AS [NAME], Salary 
FROM Employees e

--07.Write a SQL to find the full name of each employee.
SELECT e.FirstName + ' ' + e.LastName AS [FULL NAME] 
FROM Employees e

--08.Write a SQL query to find the email addresses of each employee 
--(by his first and last name). Consider that the mail domain is telerik.com. 
--Emails should look like “John.Doe@telerik.com". The produced column should 
--be named "Full Email Addresses".
SELECT e.FirstName + '.' + e.LastName + '@telerik.com' AS [Full Email Adresses] 
FROM Employees e

--09.Write a SQL query to find all different employee salaries.
SELECT DISTINCT e.Salary [All Different Salaries] 
FROM Employees e

--10.Write a SQL query to find all information about the employees whose job title is “Sales Representative“.
SELECT * 
FROM Employees e
WHERE e.JobTitle = 'Sales Representative'

--11.Write a SQL query to find the names of all employees whose first name starts with "SA".
SELECT e.FirstName + ' ' + e.LastName AS [Full name]
FROM Employees e
WHERE e.FirstName LIKE 'SA%'

--12.Write a SQL query to find the names of all employees whose last name contains "ei".
SELECT e.FirstName + ' ' + e.LastName AS [Full name]
FROM Employees e
WHERE e.LastName LIKE '%ei%'

--13.Write a SQL query to find the salary of all employees whose salary is in the range [20000…30000].
SELECT e.FirstName, e.LastName, e.Salary
FROM Employees e
WHERE e.Salary BETWEEN 20000 AND 30000
ORDER BY e.Salary ASC

--14.Write a SQL query to find the names of all employees whose salary is 25000, 14000, 12500 or 23600.
SELECT e.FirstName, e.LastName, e.Salary
FROM Employees e
WHERE e.Salary  = 25000 OR e.Salary = 14000 OR e.Salary = 12500 OR e.Salary = 23600
ORDER BY e.Salary ASC

--15.Write a SQL query to find all employees that do not have manager.
SELECT e.FirstName, e.LastName, e.ManagerID
FROM Employees e
WHERE e.ManagerID IS NULL
ORDER BY e.FirstName ASC

--16.Write a SQL query to find all employees that have salary more than 50000.
--Order them in decreasing order by salary.
SELECT e.FirstName, e.LastName, e.Salary
FROM Employees e
WHERE e.Salary > 50000
ORDER BY e.Salary DESC

--17.Write a SQL query to find the top 5 best paid employees.
SELECT TOP(5) e.FirstName, e.LastName, e.Salary
FROM Employees e
ORDER BY e.Salary DESC

--18.Write a SQL query to find all employees along with their address. Use inner join with ON clause.
SELECT e.FirstName, e.LastName, a.AddressText
FROM Employees e
	JOIN Addresses a
	ON e.AddressID = a.AddressID

--19.Write a SQL query to find all employees and their address. Use equijoins (conditions in the WHERE clause).
SELECT e.FirstName, e.LastName, a.AddressText
FROM Employees e, Addresses a
WHERE e.AddressID = a.AddressID

--20.Write a SQL query to find all employees along with their manager.
SELECT e.FirstName, e.LastName, m.FirstName + ' ' + m.LastName AS [MANAGER]
FROM Employees e
	JOIN Employees m
	ON e.EmployeeID = m.EmployeeID

--21.Write a SQL query to find all employees, along with their manager and their address. 
--Join the 3 tables: Employees e, Employees m and Addresses a.
 SELECT e.FirstName, e.LastName,a.AddressText AS [EMPOLYEE ADRESS], m.FirstName + ' ' + m.LastName AS [MANAGER]
 FROM Employees e
	JOIN Employees m
	ON e.EmployeeID = m.EmployeeID
	JOIN Addresses a
	ON e.AddressID = a.AddressID

--22.Write a SQL query to find all departments and all town names as a single list. Use UNION.
SELECT DISTINCT d.Name
FROM Departments d
UNION
SELECT DISTINCT t.Name
FROM Towns t

--23.Write a SQL query to find all the employees and the manager for each of them along
--with the employees that do not have manager. Use right outer join. 
--Rewrite the query to use left outer join.
SELECT e.LastName AS [EMPLOYEE], m.EmployeeID, m.LastName AS [MANAGER]
FROM Employees e RIGHT OUTER JOIN Employees m
ON e.ManagerID = m.EmployeeID

SELECT e.LastName AS [EMPLOYEE], m.EmployeeID, m.LastName AS [MANAGER]
FROM Employees e LEFT OUTER JOIN Employees m
ON e.ManagerID = m.EmployeeID

--24.Write a SQL query to find the names of all employees from the departments 
--"Sales" and "Finance" whose hire year is between 1995 and 2005.
SELECT e.FirstName + ' ' + e.LastName AS [FULLNAME], e.HireDate, d.Name
FROM Employees e
JOIN Departments d
ON (e.DepartmentID = d.DepartmentID
AND (e.HireDate BETWEEN '1/1/1995' AND '1/1/2005')
AND (d.Name = 'Sales' OR d.Name = 'Finance')) 

