--01.Create a database with two tables: Persons(Id(PK), FirstName, LastName, SSN) 
--and Accounts(Id(PK), PersonId(FK), Balance).
--Insert few records for testing.
--Write a stored procedure that selects the full names of all persons.
CREATE TABLE Persons (
	PersonID INT IDENTITY,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	SSN NVARCHAR(50),
	CONSTRAINT PK_Persons PRIMARY KEY (PersonID)
	)

CREATE TABLE Accounts (
	ID INT IDENTITY,
	PersonID INT NOT NULL,
	Balance MONEY,
	CONSTRAINT PK_Accounts PRIMARY KEY (ID),
	CONSTRAINT FK_Accounts_Persons_PersonID FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
	)

INSERT INTO Persons (FirstName, LastName, SSN)
VALUES
('Georgi', 'Ivanov', '1234567'),
('Ivan', 'Paskalev', '0342135'),
('Dimitar', 'Milanov', '1235345'),
('Hasan', 'Mehmed', '5412343'),
('Dragomir', 'Stanimirov', '54543567')

INSERT INTO Accounts (PersonID, Balance)
VALUES
(1, 554.00),
(2, 6543.00),
(3, 432.00),
(4, 7676.00),
(5, 312.00)
GO
CREATE PROCEDURE usp_SelectFullnameOfAllPersons
AS
	SELECT FirstName + ' ' + LastName AS [Fullname]
	FROM Persons
	ORDER BY LastName
GO

--02.Create a stored procedure that accepts a number as a parameter and 
--returns all persons who have more money in their accounts than the supplied number.
CREATE PROCEDURE usp_MoneyInAccountsMoreThanGivenNumber(@givenMoney money = 550.00)
AS
	SELECT p.FirstName, p.LastName, a.Balance
	FROM Persons p
	JOIN Accounts a
	ON p.PersonID = a.PersonID
	WHERE a.Balance > @givenMoney
	ORDER BY a.Balance
GO
