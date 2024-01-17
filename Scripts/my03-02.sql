-- Create report showing the amount of sales per employee for each month in 2021
SELECT employee.firstName, employee.lastName,
  SUM(CASE 
    WHEN strftime('%m', soldDate) = '01'
    THEN sales.salesAmount
    END) AS janSales,
  SUM(CASE
    WHEN strftime('%m', soldDate) = '02'
    THEN sales.salesAmount
    END) AS febSales,
  SUM(CASE
    WHEN strftime('%m', soldDate) = '03'
    THEN sales.salesAmount
    END) AS marSales,
  SUM(CASE
    WHEN strftime('%m', soldDate) = '04'
    THEN sales.salesAmount
    END) AS aprSales,
  SUM(CASE
    WHEN strftime('%m', soldDate) = '05'
    THEN sales.salesAmount
    END) AS maySales,
  SUM(CASE
    WHEN strftime('%m', soldDate) = '06' 
    THEN sales.salesAmount
    END) AS junSales,
  SUM(CASE
    WHEN strftime('%m', soldDate) = '07'
    THEN sales.salesAmount
    END) AS julSales,
  SUM(CASE
    WHEN strftime('%m', soldDate) = '08'
    THEN sales.salesAmount
    END) AS augSales,
  SUM(CASE
    WHEN strftime('%m', soldDate) = '09'
    THEN sales.salesAmount
    END) AS sepSales,
  SUM(CASE
    WHEN strftime('%m', soldDate) = '10'
    THEN sales.salesAmount
    END) AS octSales,
  SUM(CASE
    WHEN strftime('%m', soldDate) = '11'
    THEN sales.salesAmount
    END) AS novSales,
  SUM(CASE
    WHEN strftime('%m', soldDate) = '12'
    THEN sales.salesAmount
    END) AS decSales
FROM sales
INNER JOIN employee
  ON employee.employeeId = sales.employeeId
WHERE sales.soldDate >= '2021-01-01'
  AND sales.soldDate < '2022-01-01'
GROUP BY employee.firstName, employee.lastName
ORDER BY employee.lastName, employee.firstName;