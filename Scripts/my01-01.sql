-- Select all employees with their respective managers

SELECT
  A.firstName AS EmployeeFirstName,
  A.lastName AS EmployeeLastName,
  B.firstName AS ManagerFirstName,
  B.lastName AS ManagerLastName
FROM employee A
LEFT JOIN employee B
ON A.managerId = B.employeeId
ORDER BY ManagerLastName, EmployeeLastName;