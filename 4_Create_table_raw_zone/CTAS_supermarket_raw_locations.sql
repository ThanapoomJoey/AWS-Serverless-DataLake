create table supermarket_temp_zone.supermarket_locations
with(
    format = 'parquet',
    parquet_compression = 'snappy',
    external_location = 's3://serverless-datalake-project-supermarket/raw_zone/supermarket_locations'
)
as
select
  location_id,
  city,
  region
from
    supermarket_landing_zone.supermarket_locations;

DROP TABLE supermarket_temp_zone.supermarket_locations;