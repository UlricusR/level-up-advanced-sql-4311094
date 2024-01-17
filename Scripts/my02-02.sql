-- Find the least and most expensive car sold by each employee

SELECT employee.employeeId,
  employee.firstName,
  employee.lastName,
  COUNT(*) AS NumberCarsSold
FROM sales
INNER JOIN employee
ON sales.employeeId = employee.employeeId
GROUP BY employee.employeeId, employee.firstName, employee.lastName
HAVING NumberCarsSold > 5;