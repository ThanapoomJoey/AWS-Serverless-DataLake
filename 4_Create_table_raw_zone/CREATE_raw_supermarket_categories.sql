CREATE EXTERNAL TABLE `supermarket_raw_zone.supermarket_categories`(
  `category_id` string, 
  `category_name` string)
STORED AS PARQUET
LOCATION
  's3://serverless-datalake-project-supermarket/raw_zone/supermarket_categories/';