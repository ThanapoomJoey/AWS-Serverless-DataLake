import pandas as pd
import boto3

s3 = boto3.client('s3')

bucket = 'serverless-datalake-project-supermarket'
filename = ['branches','categories','customers','locations','products','sales']
    
def writeparquet(filename):    
    for file in filename:    
        csv_key = f'landing_zone/csv_supermarket/supermarket_{file}/supermarket_{file}.csv'
        s3.download_file(bucket, csv_key, 'temp.csv')

        df = pd.read_csv('temp.csv')
        df.to_parquet(f'supermarket_{file}.parquet')

        parquet_key = f'landing_zone/parquet_supermarket/supermarket_{file}/supermarket_{file}.parquet'
        s3.upload_file(f'supermarket_{file}.parquet', bucket, parquet_key)
        print(f"write parquet file supermarket_{file} : succeed")

writeparquet(filename)