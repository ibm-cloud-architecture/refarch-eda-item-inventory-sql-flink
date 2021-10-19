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
)