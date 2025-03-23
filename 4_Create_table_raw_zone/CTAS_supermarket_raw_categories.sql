create table supermarket_temp_zone.supermarket_categories
with(
    format = 'parquet',
    parquet_compression = 'snappy',
    external_location = 's3://serverless-datalake-project-supermarket/raw_zone/supermarket_categories'
)
as
select
  category_id,
  category_name
from
    supermarket_landing_zone.supermarket_categories;

DROP TABLE supermarket_temp_zone.supermarket_categories;