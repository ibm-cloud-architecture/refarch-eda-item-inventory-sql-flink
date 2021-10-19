SELECT
  storeName,
  sku,
  COUNT(*) AS transactions,
  AVG(CASE WHEN `type` = 'RESTOCK' THEN `price` ELSE null END) AS average_restock_price,
  AVG(CASE WHEN `type` = 'SALE' THEN `price` ELSE null END) AS average_sale_price,
  SUM(CASE WHEN `type` = 'SALE' THEN -`quantity` ELSE `quantity` END) AS on_hand
FROM items
GROUP BY storeName,sku