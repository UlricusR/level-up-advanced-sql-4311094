-- Find sales people who have zero sales

SELECT employee.employeeId, employee.firstName, employee.lastName, employee.title, sales.salesId
FROM employee
LEFT JOIN sales
ON sales.employeeId = employee.employeeId
WHERE employee.title = "Sales Person"
AND sales.salesId IS NULL;