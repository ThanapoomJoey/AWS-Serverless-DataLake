CREATE EXTERNAL TABLE `supermarket_raw_zone.supermarket_branches` (
  `branch_id` string, 
  `branch_name` string, 
  `location_id` string, 
  `open_date` string, 
  `manager_name` string
)
STORED AS PARQUET
LOCATION 
  's3://serverless-datalake-project-supermarket/raw_zone/supermarket_branches/';