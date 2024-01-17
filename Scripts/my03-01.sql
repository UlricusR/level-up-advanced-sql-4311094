SELECT * FROM sales LIMIT 10;

-- Create a report showing the total sales per year

WITH yearlySales AS (
  SELECT strftime("%Y", soldDate) AS salesYear, salesAmount
  FROM sales
)
SELECT salesYear, FORMAT("$%.2f", SUM(salesAmount)) AS TotalSales
FROM yearlySales
GROUP BY salesYear
ORDER BY salesYear;