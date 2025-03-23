CREATE EXTERNAL TABLE `supermarket_raw_zone.supermarket_customers`(
  `customer_id` string, 
  `first_name` string, 
  `last_name` string, 
  `email` string, 
  `phone` string, 
  `location_id` string)
STORED AS PARQUET
LOCATION 
  's3://serverless-datalake-project-supermarket/raw_zone/supermarket_customers/';