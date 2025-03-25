import pandas as pd
import boto3
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
logger = logging.getLogger("s3_csv_to_parquet")

s3 = boto3.client('s3')

bucket = 'serverless-datalake-project-supermarket'
filename = ['branches','categories','customers','locations','products','sales']
    
def writeparquet(filename):    
    for file in filename:
        try:        
            csv_key = f'landing_zone/csv_supermarket/supermarket_{file}/supermarket_{file}.csv'
            s3.download_file(bucket, csv_key, 'temp.csv')
            logger.info(f"Read CSV : supermarket_{file}.csv")
            df = pd.read_csv('temp.csv')
 
            logger.info(f"Write Parquet : supermarket_{file}.parquet")
            df.to_parquet(f'supermarket_{file}.parquet')

            parquet_key = f'landing_zone/parquet_supermarket/supermarket_{file}/supermarket_{file}.parquet'
            s3.upload_file(f'supermarket_{file}.parquet', bucket, parquet_key)
            logger.info(f"Write parquet file supermarket_{file} : succeed")
        except Exception as e:
            logger.error(f"Error occurred: {str(e)}")

writeparquet(filename)