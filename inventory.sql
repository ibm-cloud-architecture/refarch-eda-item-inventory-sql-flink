CREATE TABLE inventory (
  `id` INT,
  `price` FLOAT,
  `quantity` INT,
  `sku` STRING,
  `storeName` STRING,
  `timestamp`STRING,
  `type` STRING,
  `ts` TIMESTAMP(3) METADATA FROM 'timestamp'
) WITH (
  'connector' = 'kafka',
  'topic' = 'items',
  'properties.bootstrap.servers' = 'localhost:9092',
  'properties.group.id' = 'testGroup',
  'scan.startup.mode' = 'earliest-offset',
  'format' = 'json'
);