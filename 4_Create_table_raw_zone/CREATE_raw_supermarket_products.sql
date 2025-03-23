CREATE EXTERNAL TABLE `supermarket_raw_zone.supermarket_products`(
  `product_id` string, 
  `product_name` string, 
  `category_id` string, 
  `unit_cost` double, 
  `unit_price` double, 
  `stock_quantity` int, 
  `last_restock_date` string)
STORED AS PARQUET
LOCATION 
  's3://serverless-datalake-project-supermarket/raw_zone/supermarket_products/';