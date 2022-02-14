show databases

use classicmodels;

-- 1. Write a query to display each customer’s name (as “Customer Name”) 
-- alongside the name of the employee who is responsible for that customer’s orders. 
--  The employee name should be in a single “Sales Rep” column formatted as “lastName, firstName”. 
-- The output should be sorted alphabetically by customer name.

select 
	c.customerName as 'Customer Name',
	CONCAT(e.lastName, ', ', e.firstName) as 'Sales Rep'
	FROM customers AS c
	JOIN employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber
	ORDER BY customerName; 
	
-- 2. Determine which products are most popular with our customers. 
-- For each product, list the total quantity ordered along with the total sale generated 
-- (total quantity ordered * priceEach) for that product. 
-- The column headers should be “Product Name”, “Total # Ordered” and “Total Sale”. 
-- List the products by Total Sale descending.

select 
	productName as 'Product Name', 
	quantityOrdered as 'Total $ Ordered',
	(priceEach * quantityOrdered) as 'Total Sale'
	FROM products AS p
	JOIN orderdetails AS o ON p.productCode = o.productCode
	GROUP BY p.productName
	ORDER BY `Total Sale` DESC;
	
	