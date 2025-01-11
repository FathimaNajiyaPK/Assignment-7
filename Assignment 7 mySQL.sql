CREATE database Country;
USE Country;

# Create a table named Country

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area INT
);


# Create a table named Persons

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    DOB DATE,
    Rating INT,
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

# Insert 10 Rows into the Country Table

INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331002651, 9833517),
(2, 'Canada', 37742154, 9984670),
(3, 'Brazil', 212559417, 8515767),
(4, 'India', 1380004385, 3287263),
(5, 'China', 1393409038, 9596961),
(6, 'Germany', 83783942, 357022),
(7, 'France', 67391582, 643801),
(8, 'Australia', 25499884, 7692024),
(9, 'Russia', 145934462, 17098242),
(10, 'Mexico', 128933207, 1964375);

# Insert 10 Rows into the Persons Table

INSERT INTO Persons (Id, Fname, Lname,DOB,Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe','2001-03-04', 331002651, 5, 1, 'USA'),
(2, 'Jane', 'Smith','1985-09-20', 37742154, 4, 2, 'Canada'),
(3, 'Carlos', 'Mendez','2000-11-03', 212559417, 4, 3, 'Brazil'),
(4, 'Amit', 'Sharma', '1995-03-12', 1380004385, 5, 4, 'India'),
(5, 'Li', 'Wang','1988-07-25',1393409038, 3, 5, 'China'),
(6, 'Max', 'Müller','1992-04-10', 83783942, 4, 6, 'Germany'),
(7, 'Sophie', 'Dupont','1998-12-22', 67391582, 5, 7, 'France'),
(8, 'Jack', 'Johnson','1987-06-30', 25499884, 4, 8, 'Australia'),
(9, 'Nikolai', 'Petrov','1993-01-18', 145934462, 5, 9, 'Russia'),
(10, 'Maria', 'Garcia','2002-08-08', 128933207, 4, 10, 'Mexico');

select* from persons;
select* from country;

# user-defined function to calculate age using DOB

DELIMITER $$

CREATE FUNCTION CalculateAge(dob DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, dob, CURDATE());
END$$

DELIMITER ;

# select query to fetch the Age of all persons using the function that has been created.

SELECT CalculateAge(DOB) AS Age
FROM Persons;

# length of each country name in the Country table

SELECT Country_name, 
CHAR_LENGTH(Country_name) AS Name_Length
FROM Country;

#  first three characters of each country's name in the Country table

SELECT Country_name, 
LEFT(Country_name, 3) AS First_Three_Chars
FROM Country;

# Convert all country names to uppercase and lowercase in the Country table.

SELECT Country_name, 
UPPER(Country_name) AS Uppercase_Name, 
LOWER(Country_name) AS Lowercase_Name
FROM Country;
