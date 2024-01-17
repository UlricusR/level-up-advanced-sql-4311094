SELECT * FROM sales LIMIT 5;
SELECT * FROM inventory LIMIT 5;
SELECT * FROM model LIMIT 5;

-- Find all sales where the car purchased was electric
SELECT sales.soldDate, sales.salesAmount, inventory.colour, inventory.year
FROM sales
INNER JOIN inventory
  ON sales.inventoryId = inventory.inventoryId
WHERE inventory.modelId IN (
  SELECT modelId
  FROM model
  WHERE EngineType = 'Electric'
);