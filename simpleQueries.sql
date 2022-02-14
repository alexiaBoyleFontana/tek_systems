show databases;

use classicmodels;

-- Write a query to display the name, product line, and buy price of all products. 
-- The output columns should display as “Name”, “Product Line”, and “Buy Price”. 
-- The output should display the most expensive items first.
select 
		productName as 'Name',
		productLine as 'Product Line', 
		buyPrice as 'Buy Price'
		FROM products ORDER BY buyPrice DESC;
		
-- 2. Write a query to display the first name, last name, and city for all customers from Germany.
-- Columns should display as “First Name”, “Last Name”, and “City”. 
-- The output should be sorted by the customer’s last name (ascending).
		
select 
	contactFirstName as 'First Name',
	contactLastName as 'Last Name',
	city as 'City' 
	FROM customers WHERE country = 'Germany' 
	ORDER BY contactLastName ASC;
	
-- 3. Write a query to display each of the unique values of the status field in the orders table. 
-- The output should be sorted alphabetically increasing. 
-- Hint: the output should show exactly 6 rows.
	
select 
	UNIQUE status FROM orders ORDER BY status ASC;

-- 4. Select all fields from the payments table for payments made on or after January 1, 2005. 
-- Output should be sorted by increasing payment date.
	
select 
	paymentDate FROM payments WHERE paymentDate > 20050101 ORDER BY paymentDate ASC;
	
-- 5. Write a query to display all Last Name, First Name, Email and Job Title of
-- all employees working out of the San Francisco office. 
-- Output should be sorted by last name.

--- select officeCode FROM offices WHERE city = 'San Francisco';

select 
	firstName as 'First Name',
	lastName as 'Last Name',
	email, jobTitle as 'Job Title'
	FROM employees WHERE officeCode = (select officeCode FROM offices WHERE city = 'San Francisco')
	ORDER BY lastName;

-- Write a query to display the Name, Product Line, Scale, and Vendor of all of the car products 
-- – both classic and vintage. 
-- The output should display all vintage cars first (sorted alphabetically by name), 
-- and all classic cars last (also sorted alphabetically by name).

select 
   	productName as 'Name',
   	productLine as 'Product Line',
   	productScale as 'Scale',
   	productVendor as 'Vendor'
   	FROM products WHERE productLine REGEXP '.Cars'
    ORDER BY productLine DESC, (SELECT SUBSTRING(productName, 5)) ASC;
   


	