import pandas as pd
import boto3
from datetime import datetime

s3 = boto3.client('s3')

bucket = 'serverless-datalake-project-supermarket'
day = datetime.today().strftime("%Y%m%d")
filename = f'supermarket_sales_{day}'

def writeparquet():
    try:
        csv_key = f'landing_zone/csv_supermarket/supermarket_sales/{day}/{filename}.csv'
        s3.download_file(bucket, csv_key, 'temp.csv')
        df = pd.read_csv('temp.csv')
        df.to_parquet(f'{filename}.parquet')

        parquet_key = f'landing_zone/parquet_supermarket/supermarket_sales/{day}/{filename}.parquet'
        s3.upload_file(f'{filename}.parquet', bucket, parquet_key)
        print(f"write parquet file {filename} : succeed")
    except Exception as e:
        raise Exception(f"Error to write {filename}.parquet : {str(e)}")
writeparquet()