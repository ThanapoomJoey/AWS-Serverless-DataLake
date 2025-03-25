import pandas as pd
import boto3

s3 = boto3.client('s3')
bucket = 'serverless-datalake-project-supermarket'
filenames = ["supermarket_branches", "supermarket_categories","supermarket_customers","supermarket_locations",
              "supermarket_products","supermarket_sales"]

def writeparquet(filenames):    
    has_error = False
    error_messages = []

    for file in filenames:
        csv_key = f'landing_zone/csv_supermarket/{file}/{file}.csv'
        parquet_key = f'landing_zone/parquet_supermarket/{file}/{file}.parquet'

        step = "initial"
        try:
            step = "download"
            s3.download_file(bucket, csv_key, 'temp.csv')

            step = "read_csv"
            df = pd.read_csv('temp.csv')

            step = "write_parquet"
            df.to_parquet(f'supermarket_{file}.parquet')

            step = "upload"
            s3.upload_file(f'supermarket_{file}.parquet', bucket, parquet_key)

            print(f"Processed {file} successfully")

        except Exception as e:
            error_msg = f"Error at step '{step}' for {file} : {str(e)}"
            print(error_msg)
            has_error = True
            error_messages.append(error_msg) 
            continue 

    if has_error:
        print("Job completed with errors: " + "; ".join(error_messages))
        raise Exception("Job completed with errors: " + "; ".join(error_messages))

writeparquet(filenames)