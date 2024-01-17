SELECT * FROM sales LIMIT 10;
SELECT * FROM employee LIMIT 10;

-- Show the number of cars sold by each employee

SELECT employee.employeeId, employee.firstName, employee.lastName, count(*) as NumOfCarsSold
FROM sales
INNER JOIN employee
ON sales.employeeId = employee.employeeId
GROUP BY employee.employeeId, employee.firstName, employee.lastName
ORDER BY NumOfCarsSold DESC;