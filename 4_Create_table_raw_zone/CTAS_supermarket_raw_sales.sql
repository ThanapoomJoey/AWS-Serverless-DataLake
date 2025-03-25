CREATE TABLE supermarket_temp_zone.supermarket_sales
WITH (
    format = 'PARQUET',
    parquet_compression = 'SNAPPY',
    external_location = 's3://serverless-datalake-project-supermarket/raw_zone/supermarket_sales/2025/202503/20250318'
)
AS
SELECT
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
FROM
    supermarket_landing_zone.supermarket_sales;