import boto3
from datetime import datetime

athena_client = boto3.client('athena', region_name='ap-southeast-1')

#day = '20250319'
day = datetime.today().strftime("%Y%m%d")
database = 'supermarket_landing_zone'
query = f"""
        alter table supermarket_sales
        set location 's3://serverless-datalake-project-supermarket/landing_zone/parquet_supermarket/supermarket_sales/{day}'
        """

response = athena_client.start_query_execution(
    QueryString=query,
    QueryExecutionContext={
        'Database': database
    },
    ResultConfiguration={
        'OutputLocation': 's3://serverless-datalake-project-supermarket/glue'
    }
)