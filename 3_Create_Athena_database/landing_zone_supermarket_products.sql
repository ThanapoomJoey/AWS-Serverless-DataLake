CREATE EXTERNAL TABLE `supermarket_products`(
  `product_id` string, 
  `product_name` string, 
  `category_id` string, 
  `unit_cost` double, 
  `unit_price` double, 
  `stock_quantity` int, 
  `last_restock_date` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://serverless-datalake-project-supermarket/landing_zone/parquet_supermarket/supermarket_products/'
TBLPROPERTIES (
  'CRAWL_RUN_ID'='ee72ccb3-f2c7-4201-bd53-63f7bfe3b960', 
  'CrawlerSchemaDeserializerVersion'='1.0', 
  'CrawlerSchemaSerializerVersion'='1.0', 
  'UPDATED_BY_CRAWLER'='dedd', 
  'averageRecordSize'='95', 
  'classification'='parquet', 
  'compressionType'='none', 
  'last_modified_by'='hadoop', 
  'last_modified_time'='1742386166', 
  'objectCount'='1', 
  'recordCount'='20', 
  'sizeKey'='6139', 
  'transient_lastDdlTime'='1742386166', 
  'typeOfData'='file')