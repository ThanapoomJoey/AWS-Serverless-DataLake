create table supermarket_temp_zone.supermarket_branches
with(
    format = 'parquet',
    parquet_compression = 'snappy',
    external_location = 's3://serverless-datalake-project-supermarket/raw_zone/supermarket_branches'
)
as
select
  branch_id,
  branch_name,
  location_id,
  open_date,
  manager_name
from
    supermarket_landing_zone.supermarket_branches;

DROP TABLE supermarket_temp_zone.supermarket_branches;