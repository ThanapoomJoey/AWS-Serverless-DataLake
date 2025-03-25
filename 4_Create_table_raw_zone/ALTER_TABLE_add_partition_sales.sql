ALTER TABLE supermarket_raw_zone.supermarket_sales
ADD PARTITION (year='2025', month='202503', day='20250318')
LOCATION 's3://serverless-datalake-project-supermarket/raw_zone/supermarket_sales/2025/202503/20250318/';