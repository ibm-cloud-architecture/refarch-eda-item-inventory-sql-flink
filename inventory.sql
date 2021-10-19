CREATE TABLE items (
  id INT,
  price FLOAT,
  quantity INT,
  sku STRING,
  storeName STRING,
  `timestamp` STRING,
  `type` STRING
) WITH (
  'connector' = 'kafka',
  'topic' = 'items',
  'properties.bootstrap.servers' = 'kafka:29092',
  'properties.group.id' = 'testGroup',
  'scan.startup.mode' = 'earliest-offset',
  'format' = 'json'
);

CREATE VIEW inventory AS
SELECT
  storeName,
  sku,
  COUNT(*) AS transactions,
  AVG(CASE WHEN `type` = 'RESTOCK' THEN `price` ELSE null END) AS average_restock_price,
  AVG(CASE WHEN `type` = 'SALE' THEN `price` ELSE null END) AS average_sale_price,
  SUM(CASE WHEN `type` = 'SALE' THEN -`quantity` ELSE `quantity` END) AS on_hand
FROM items
GROUP BY storeName,sku;


select * from inventory;