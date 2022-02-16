show databases;

use mock_sba;

show tables;
-- 1. Create a query to return all orders made by users with the first name of “Marion” 

select 
	O.ORDER_ID,
	O.USER_ID,
	O.STORE_ID
	FROM USERS as U 
	JOIN ORDERS as O ON U.USER_ID = O.USER_ID 
	WHERE U.FIRST_NAME = "Marion"
	; 
	
-- 2. Create a query to select all users that have not made an order 

SELECT 
	U.USER_ID, FIRST_NAME, LAST_NAME, CITY
	FROM USERS AS U 
	LEFT JOIN ORDERS AS O ON U.USER_ID = O.USER_ID 
	WHERE O.USER_ID IS NULL
; 

-- 3. Create a Query to select the names and prices of all items that have been part of 2 or 
-- more separate orders. 

SELECT 
	I.NAME, 
	I.PRICE
	FROM ITEMS AS I 
	JOIN ORDER_ITEMS AS O ON I.ITEM_ID = O.ITEM_ID 
	GROUP BY I.NAME, I.PRICE;
-- PUT A COUNT IN WHERE? 

-- 4. Create a query to return the Order Id, Item name, Item Price, and Quantity from orders 
-- made at stores in the city “New York”. Order by Order Id in ascending order. 

-- 5. Your boss would like you to create a query that calculates the total revenue generated 
-- by each item. Revenue for an item can be found as (Item Price * Total Quantity 
-- Ordered). Please return the first column as ‘ITEM_NAME’ and the second column as 
-- ‘REVENUE’. 

-- 6. (See PDF, too long)
	