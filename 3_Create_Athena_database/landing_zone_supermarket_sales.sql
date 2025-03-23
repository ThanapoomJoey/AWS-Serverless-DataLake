CREATE EXTERNAL TABLE `supermarket_sales`(
  `sale_id` string, 
  `customer_id` string, 
  `product_id` string, 
  `branch_id` string, 
  `sale_date` string, 
  `quantity` bigint, 
  `unit_price` double, 
  `total_amount` double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://serverless-datalake-project-supermarket/landing_zone/parquet_supermarket/supermarket_sales'
TBLPROPERTIES (
  'CRAWL_RUN_ID'='ee72ccb3-f2c7-4201-bd53-63f7bfe3b960', 
  'CrawlerSchemaDeserializerVersion'='1.0', 
  'CrawlerSchemaSerializerVersion'='1.0', 
  'UPDATED_BY_CRAWLER'='dedd', 
  'averageRecordSize'='61', 
  'classification'='parquet', 
  'compressionType'='none', 
  'last_modified_by'='hadoop', 
  'last_modified_time'='1742630629', 
  'objectCount'='1', 
  'recordCount'='100000', 
  'sizeKey'='8757', 
  'transient_lastDdlTime'='1742645342', 
  'typeOfData'='file')