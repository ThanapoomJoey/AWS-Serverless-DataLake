import pandas as pd
import boto3

s3 = boto3.client('s3')
bucket = 'serverless-datalake-project-supermarket'
filename = ['branches', 'categories', 'customers', 'locations', 'products', 'sales']

def writeparquet(filename):    
    for file in filename:
        csv_key = f'landing_zone/csv_supermarket/supermarket_{file}/supermarket_{file}.csv'
        parquet_key = f'landing_zone/parquet_supermarket/supermarket_{file}/supermarket_{file}.parquet'

        step = "initial"
        try:
            step = "download"
            print(f"Attempting to download: {csv_key}")
            s3.download_file(bucket, csv_key, 'temp.csv')

            step = "read_csv"
            print(f"Reading CSV: supermarket_{file}.csv")
            df = pd.read_csv('temp.csv')

            step = "write_parquet"
            print(f"Writing Parquet: supermarket_{file}.parquet")
            df.to_parquet(f'supermarket_{file}.parquet')

            step = "upload"
            print(f"Uploading to S3: {parquet_key}")
            s3.upload_file(f'supermarket_{file}.parquet', bucket, parquet_key)

            print(f"Processed supermarket_{file} successfully")

        except Exception as e:
            print(f"Error at step '{step}' for {file} ({csv_key}): {str(e)}")
            raise Exception(f"Error at step '{step}' for {file} ({csv_key}): {str(e)}")

writeparquet(filename)