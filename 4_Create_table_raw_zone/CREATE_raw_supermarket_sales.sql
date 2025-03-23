CREATE EXTERNAL TABLE `supermarket_raw_zone.supermarket_sales`(
  `sale_id` string, 
  `customer_id` string, 
  `product_id` string, 
  `branch_id` string, 
  `sale_date` string, 
  `quantity` int, 
  `unit_price` double, 
  `total_amount` double)
PARTITIONED BY ( 
  `year` string, 
  `month` string, 
  `day` string)
STORED AS PARQUET
LOCATION
  's3://serverless-datalake-project-supermarket/raw_zone/supermarket_sales';