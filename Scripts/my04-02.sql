-- Generate a sales report showing total sales per month and an annual running total

-- get needed data
WITH cte_sales AS (
  SELECT strftime('%Y', soldDate) as soldYear,
    strftime('%m', soldDate) as soldMonth,
    SUM(salesAmount) AS salesAmount
  FROM sales
  GROUP BY soldYear, soldMonth
)
SELECT soldYear, soldMonth, salesAmount,
  SUM(salesAmount) OVER (
    PARTITION BY soldYear
    ORDER BY soldYear, soldMonth
  ) AS AnnualSales_RunningTotal
FROM cte_sales
ORDER BY soldYear, soldMonth