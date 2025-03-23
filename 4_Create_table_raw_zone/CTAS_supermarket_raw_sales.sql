create table supermarket_temp_zone.supermarket_sales
with(
    format = 'parquet',
    parquet_compression = 'snappy',
    external_location = 's3://serverless-datalake-project-supermarket/raw_zone/supermarket_sales/2025/202503/20250318'
)
as
select
    sale_id,
    customer_id,
    product_id,
    branch_id,
    sale_date,
    quantity,
    unit_price,
    total_amount,
    '2025' AS year,
    '202503' AS month,
    '20250318' AS day
from
    supermarket_landing_zone.supermarket_sales;

alter table supermarket_raw_zone.supermarket_sales
add partition (year='2025', month='202503', day='20250318')
location 's3://serverless-datalake-project-supermarket/raw_zone/supermarket_sales/2025/202503/20250318/';

DROP TABLE supermarket_temp_zone.supermarket_sales;