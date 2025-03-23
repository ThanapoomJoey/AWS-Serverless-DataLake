CREATE EXTERNAL TABLE `supermarket_raw_zone.supermarket_locations`(
  `location_id` string, 
  `city` string, 
  `region` string)
STORED AS PARQUET
LOCATION 
  's3://serverless-datalake-project-supermarket/raw_zone/supermarket_locations/';