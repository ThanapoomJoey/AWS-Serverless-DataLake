CREATE EXTERNAL TABLE `supermarket_locations`(
  `location_id` string, 
  `city` string, 
  `region` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://serverless-datalake-project-supermarket/landing_zone/parquet_supermarket/supermarket_locations/'
TBLPROPERTIES (
  'CRAWL_RUN_ID'='ee72ccb3-f2c7-4201-bd53-63f7bfe3b960', 
  'CrawlerSchemaDeserializerVersion'='1.0', 
  'CrawlerSchemaSerializerVersion'='1.0', 
  'UPDATED_BY_CRAWLER'='dedd', 
  'averageRecordSize'='48', 
  'classification'='parquet', 
  'compressionType'='none', 
  'last_modified_by'='hadoop', 
  'last_modified_time'='1742386152', 
  'objectCount'='1', 
  'recordCount'='10', 
  'sizeKey'='2567', 
  'transient_lastDdlTime'='1742386152', 
  'typeOfData'='file')