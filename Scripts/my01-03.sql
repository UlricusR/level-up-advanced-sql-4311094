SELECT * FROM customer LIMIT 10;
SELECT * FROM sales LIMIT 10;

-- Get a list of all sales and all customers even if some of the data has been removed

SELECT customer.lastName, customer.firstName, sales.salesAmount, sales.soldDate
FROM customer
INNER JOIN sales
ON customer.customerId = sales.customerId
-- UNION with sales w/o customer
UNION
SELECT customer.lastName, customer.firstName, sales.salesAmount, sales.soldDate
FROM sales
LEFT JOIN customer
ON customer.customerId = sales.customerId
WHERE customer.customerId IS NULL
-- UNION with customer w/o sales
UNION
SELECT customer.lastName, customer.firstName, sales.salesAmount, sales.soldDate
FROM customer
LEFT JOIN sales
ON customer.customerId = sales.customerId
WHERE sales.salesId IS NULL;