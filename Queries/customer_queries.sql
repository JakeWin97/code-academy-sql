
-- @block get customer name
SELECT customer_name FROM CodeAcademy.customer;


-- @block get customer name & email
SELECT customer_name, email FROM CodeAcademy.customer;

-- @block get all customer columns
SELECT * FROM CodeAcademy.customer;

-- @block sort by customer name ascending
SELECT * FROM CodeAcademy.customer ORDER BY customer_name ASC;

-- @block sort by customer name descending
SELECT * FROM CodeAcademy.customer ORDER BY customer_name DESC;

-- @block select disinct cities
SELECT DISTINCT city FROM CodeAcademy.customer;

-- @block select disinct cities sort ascending
SELECT DISTINCT city FROM CodeAcademy.customer ORDER BY city ASC;

-- @block select customers from Birmingham
SELECT * FROM CodeAcademy.customer WHERE city='Birmingham';

-- @block select customers from Birmingham/London
SELECT * FROM CodeAcademy.customer 
WHERE city='Birmingham' OR city='London';

-- @block select customers not from Birmingham
SELECT * FROM CodeAcademy.customer WHERE city != 'Birmingham';

-- @block select orders after 31st Mar 19
SELECT * FROM CodeAcademy.order WHERE order_date > '2019-03-31';

-- @block select orders equal to or greater than/equal £100
SELECT * FROM CodeAcademy.order WHERE total_amount >= 100;

-- @block select orders after 31 March 19 and total_amount greater/equal £100
SELECT * FROM CodeAcademy.order WHERE order_date > '2019-03-19' 
AND total_amount >= 100;

-- @block select 5 orders
SELECT * FROM CodeAcademy.order LIMIT 5;

-- @block select top 5 orders
SELECT * FROM CodeAcademy.order ORDER BY total_amount DESC LIMIT 5;

-- @block select customers with no phone number
SELECT * FROM CodeAcademy.customer WHERE phone_number IS NULL;

-- @block select customers with phone numbers
SELECT * FROM CodeAcademy.customer WHERE phone_number IS NOT NULL;

-- @block select assign temporary alias to address_line_1
SELECT address_line_1 FROM CodeAcademy.customer AS add1;

--- JOINS ----

-- @block inner join
SELECT A.customer_name, B.*
FROM CodeAcademy.customer A
INNER JOIN CodeAcademy.order B
    ON A.customer_id = B.customer_id
LIMIT 10;

-- @block left join
SELECT A.customer_name, B.*
FROM CodeAcademy.customer A
LEFT JOIN CodeAcademy.order B
    ON A.customer_id = B.customer_id;


-- @block number of people per city
SELECT COUNT(customer_id), city
FROM CodeAcademy.customer
GROUP BY city
ORDER BY COUNT(customer_id) DESC;

-- @block select first order
SELECT A.customer_name, MIN(B.order_date)
FROM CodeAcademy.customer A
INNER JOIN CodeAcademy.order B
    ON A.customer_id = B.customer_id
GROUP BY A.customer_name;

-- @block select most recent order
SELECT A.customer_name, MAX(B.order_date)
FROM CodeAcademy.customer A
INNER JOIN CodeAcademy.order B
    ON A.customer_id = B.customer_id
GROUP BY A.customer_name;


-- @block total spend per customer
SELECT A.customer_name, SUM(B.total_amount)
FROM CodeAcademy.customer A
LEFT JOIN CodeAcademy.order B
    ON A.customer_id = B.customer_id
GROUP BY A.customer_name
ORDER BY SUM(B.total_amount) DESC;

-- @block total spend per customer nulls to zero
SELECT customer_name,
CASE
WHEN sum(total_amount) IS NULL THEN 0
ELSE sum(total_amount) END total_spend
FROM CodeAcademy.customer C
left join CodeAcademy.order o ON c.customer_id = o.customer_id
GROUP BY customer_name ORDER BY SUM(total_amount) ASC