CREATE EXTERNAL TABLE `supermarket_branches`(
  `branch_id` string, 
  `branch_name` string, 
  `location_id` string, 
  `open_date` string, 
  `manager_name` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://serverless-datalake-project-supermarket/landing_zone/parquet_supermarket/supermarket_branches/'
TBLPROPERTIES (
  'CRAWL_RUN_ID'='ee72ccb3-f2c7-4201-bd53-63f7bfe3b960', 
  'CrawlerSchemaDeserializerVersion'='1.0', 
  'CrawlerSchemaSerializerVersion'='1.0', 
  'UPDATED_BY_CRAWLER'='dedd', 
  'averageRecordSize'='92', 
  'classification'='parquet', 
  'compressionType'='none', 
  'last_modified_by'='hadoop', 
  'last_modified_time'='1742386051', 
  'objectCount'='1', 
  'recordCount'='10', 
  'sizeKey'='4130', 
  'transient_lastDdlTime'='1742386051', 
  'typeOfData'='file')