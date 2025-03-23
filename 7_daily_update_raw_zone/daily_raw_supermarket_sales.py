import boto3
import time
from datetime import datetime

athena_client = boto3.client('athena', region_name='ap-southeast-1')

year = '2025'
month = '202503'
day = datetime.today().strftime("%Y%m%d")
database = 'supermarket_raw_zone'
query_string = """
        CREATE TABLE supermarket_temp_zone.supermarket_sales_{2}
        WITH (
          format = 'PARQUET',
          parquet_compression = 'SNAPPY',
          external_location = 's3://serverless-datalake-project-supermarket/raw_zone/supermarket_sales/{0}/{1}/{2}'
        )
        AS
        SELECT
            sale_id,
            customer_id,
            product_id,
            branch_id,
            sale_date,
            quantity,
            unit_price,
            total_amount,
        '{0}' AS year,
        '{1}' AS month,
        '{2}' AS day
        FROM
            supermarket_landing_zone.supermarket_sales;
        ALTER TABLE supermarket_raw_zone.supermarket_sales
        ADD PARTITION (year='{0}', month='{1}', day='{2}')
        LOCATION 's3://serverless-datalake-project-supermarket/raw_zone/supermarket_sales/{0}/{1}/{2}/';
        DROP TABLE supermarket_temp_zone.supermarket_sales_{2}
        """.format(year,month,day)

# Submit the query
query_list = query_string.split(";")
for query in query_list:
    response = athena_client.start_query_execution(
        QueryString=query,
        QueryExecutionContext={
            'Database': database
        },
        ResultConfiguration={
            'OutputLocation': 's3://serverless-datalake-project-supermarket/glue'
        }
        )
    query_execution_id = response['QueryExecutionId']
    status = None
    while status not in ['SUCCEEDED', 'FAILED', 'CANCELLED']:
        response2 = athena_client.get_query_execution(
            QueryExecutionId=query_execution_id
        )
        status = response2['QueryExecution']['Status']['State']
        if status == 'SUCCEEDED':
            print("Query execution completed successfully.")
            break
        elif status in ['FAILED', 'CANCELLED']:
            print("Query execution failed or was cancelled.")
            break
        time.sleep(5)

    print("Query Execution ID:", query_execution_id)