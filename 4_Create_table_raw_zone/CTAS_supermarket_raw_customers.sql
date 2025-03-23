create table supermarket_temp_zone.supermarket_customers
with(
    format = 'parquet',
    parquet_compression = 'snappy',
    external_location = 's3://serverless-datalake-project-supermarket/raw_zone/supermarket_customers'
)
as
select
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    location_id
from
    supermarket_landing_zone.supermarket_customers;

DROP TABLE supermarket_temp_zone.supermarket_customers;