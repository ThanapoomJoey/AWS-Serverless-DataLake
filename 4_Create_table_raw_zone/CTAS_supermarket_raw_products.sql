create table supermarket_temp_zone.supermarket_products
with(
    format = 'parquet',
    parquet_compression = 'snappy',
    external_location = 's3://serverless-datalake-project-supermarket/raw_zone/supermarket_products'
)
as
select
  product_id,
  product_name,
  category_id,
  unit_cost,
  unit_price,
  stock_quantity,
  last_restock_date
from
    supermarket_landing_zone.supermarket_products;

DROP TABLE supermarket_temp_zone.supermarket_products;