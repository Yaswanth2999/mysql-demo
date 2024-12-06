# DML Operations - INSERT, UPDATE, DELETE

-- The INSERT statement allows you to insert one or more rows into a table. 
-- The following illustrates the syntax of the INSERT statement:

/*INSERT INTO table(c1,c2,...)
VALUES (v1,v2,...); */

USE classicmodels;


-- Insert demo without specifying column names
SELECT * FROM productlines;

-- Insert record without specifying column names
INSERT INTO productlines 
    VALUES('Bicycles','A vintage collection of Bicycles',NULL,NULL);
    
INSERT INTO productlines 
    VALUES('Tractors','Legacy of Farmers',NULL,NULL);
    
INSERT INTO productlines 
    VALUES('Kid Cars','Charm for Kids',NULL,NULL);
    
SELECT * FROM productlines;

-- Insert record specifying column names - To enter values for specific fields
INSERT INTO productlines(productLine,textDescription)
	VALUES('Drones','To Supply Medicines to Villages');
	
INSERT INTO productlines(productLine,textDescription)
	VALUES('Vintage Rickshaw','Pride of Passengers');
	
SELECT * FROM productlines;

-- Insert new Employees
SELECT * FROM employees;
DESC employees;

INSERT INTO employees 
    VALUES(1777,'Gs','Rajashekar','x555','raj@classicmodels.com','3',1056,
	 'Data Analyst');
    
INSERT INTO employees 
    VALUES(1888,'Wideneus','Monty','x666','monty@classicmodels.com','1',1002,'VP Technical');
    
SELECT * FROM employees;
SELECT * FROM offices;

/*
The UPDATE statement updates data in a table. 
It allows you to change the values in one or more columns of a single row or multiple rows.

 syntax of the UPDATE statement:

UPDATE  table_name 
SET 
    column_name1 = expr1,
    column_name2 = expr2,
    ...
[WHERE
    condition];
*/

SELECT * FROM employees WHERE employeeNumber=1401;

-- Update lastName, emailid of Pamela
UPDATE employees
	SET lastName='Micheal', email='pmicheal@classicmodelcars.com'
		WHERE employeeNumber=1401;

SELECT * FROM employees WHERE employeeNumber=1401;

-- Update email domain of all Sales Reps with office code 6 to @sydneyclassicmodelcars.com

SELECT * FROM employees WHERE officeCode=5;
SELECT * FROM offices WHERE officeCode=5;

UPDATE employees 
	SET email=REPLACE (email,'@classicmodelcars.com','@tokyoclassicmodelcars.com')
		WHERE jobTitle='Sales Rep' AND officeCode=5;

SELECT * FROM employees WHERE officeCode=5;

SELECT * FROM employees;

-- UPDATE jobTitle of Monty to ' VP Technical & IT'
-- Cannot select data from same table , which is used to update
UPDATE employees -- Error
	SET jobTitle='VP Technical & IT'
		WHERE employeeNumber=(SELECT employeeNumber FROM employees WHERE firstName LIKE 'Monty');
		
UPDATE employees e
JOIN (SELECT employeeNumber FROM employees WHERE firstName LIKE 'Monty') AS subquery
ON e.employeeNumber = subquery.employeeNumber
SET e.jobTitle = 'VP Technical';


SELECT * FROM employees;

-- Update buyPrice of all Products by 10%;
SELECT * FROM products;

UPDATE products
	SET buyPrice = buyPrice * 1.10;
	
SELECT * FROM products;

-- Update buyPrice of all Classic cars by 5%
UPDATE products
	SET buyPrice = buyPrice * 1.05
		WHERE productLine LIKE 'Classic Cars';
		
SELECT * FROM products;

# DELETE statement
 /*To delete data from a table, you use the MySQL DELETE statement. 
 
 syntax of the DELETE statement:

DELETE FROM table_name
WHERE condition;  */

CREATE TABLE employeesbackup2024 AS SELECT * FROM employees;

SELECT * FROM employeesbackup2024;

-- delete employee with id 1621

DELETE FROM employeesbackup2024 WHERE employeeNumber =1621;

SELECT * FROM employeesbackup2024;

DELETE FROM employeesbackup2024 WHERE jobTitle LIKE 'VP Sales';

SELECT * FROM employeesbackup2024;

DELETE FROM employeesbackup2024 WHERE officeCode IN(1,4);

SELECT * FROM employeesbackup2024;

DELETE FROM employeesbackup2024;  -- Caution : Deletes all Records - Don't execute

# Delete Table
-- Drop statement deletes the table permanently from DB

DROP TABLE employeesbackup2024;
