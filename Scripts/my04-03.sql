-- Display the number of cars sold this month and last month

-- My solution
WITH cte_sales AS (
  SELECT strftime('%Y', soldDate) as soldYear,
    strftime('%m', soldDate) as soldMonth,
    COUNT(salesId) AS SalesThisMonth
  FROM sales
  GROUP BY soldYear, soldMonth
)
SELECT soldYear, soldMonth, SalesThisMonth,
  LAG(SalesThisMonth) OVER (ORDER BY soldYear, soldMonth) SalesLastMonth
FROM cte_sales
ORDER BY soldYear, soldMonth

-- Trainer's solution
SELECT strftime('%Y-%m', soldDate) AS MonthSold,
  COUNT(*) AS NumberCarsSold,
  LAG (COUNT(*), 1, 0) OVER calMonth AS LastMonthCarsSold
FROM sales
GROUP BY strftime('%Y-%m', soldDate)
WINDOW calMonth AS (ORDER BY strftime('%Y-%m', soldDate))
ORDER BY strftime('%Y-%m', soldDate)