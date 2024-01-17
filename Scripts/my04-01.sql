SELECT * FROM model LIMIT 5;

-- For each salesperson, rank the car models that they've sold the most
SELECT employee.firstName, employee.lastName, model.model,
  count(model.model) AS noSold,
  rank() OVER (
    PARTITION BY sales.employeeId 
    ORDER BY count(model.model) desc
  ) AS Rank
FROM employee
INNER JOIN sales
  ON sales.employeeId = employee.employeeId
INNER JOIN inventory
  ON inventory.inventoryId = sales.inventoryId
INNER JOIN model
  ON model.modelId = inventory.modelId
GROUP BY employee.firstName, employee.lastName, model.model