show databases;

use Banking;

-- 1. For each product, show the product name "Product" and the product type name "Type".

select 
	p.name as 'Product',
	t.name as 'Type'
	FROM product as p
	JOIN product_type as t on p.product_type_cd = t.product_type_cd ;
	
-- 2. For each branch, list the branch name and city, plus the last name 
-- and title of each employee who works in that branch.

select 
	b.name as 'Branch',
	b.city as 'City',
	e.last_name as 'Last Name', 
	e.title as 'Title'
	FROM employee as e 
	JOIN branch as b on e.assigned_branch_id = b.branch_id
	ORDER BY 'Branch';

-- 3. Show a list of each unique employee title.

select 
	UNIQUE title FROM employee;

-- 4. Show the last name and title of each employee, along with the last name 
-- and title of that employee's boss.

 select 
 	e.last_name as 'Name',
 	e.title as 'Title',
 	boss.last_name as 'Boss Name',
 	boss.title as 'Boss Title'
 	FROM employee as e
 	LEFT JOIN employee as boss on e.superior_emp_id = boss.emp_id;


-- 5. For each account, show the name of the account's product, 
-- the available balance, and the customer's last name.
 
select 
	a.account_id as 'Account',
	p.name as 'Product',
	avail_balance as 'Available Balance',
	IF (i.last_name IS NULL, b.name, i.last_name) as 'Customer'
	FROM account as a 
	LEFT JOIN product as p on a.product_cd = p.product_cd
	LEFT JOIN customer as c on a.cust_id = c.cust_id
	LEFT JOIN individual as i on c.cust_id = i.cust_id
	LEFT JOIN business as b on c.cust_id = b.cust_id 
	ORDER BY a.account_id;
	

-- 6. List all account transaction details for individual customers 
-- whose last name starts with 'T'.

select 
	i.last_name as 'Customer',
	ac.*
	FROM individual as i
	LEFT JOIN customer as c on i.cust_id = c.cust_id
	LEFT JOIN account as a on c.cust_id = a.cust_id 
	LEFT JOIN acc_transaction as ac on a.account_id = ac.account_id
	WHERE last_name regexp '^T' 
	;