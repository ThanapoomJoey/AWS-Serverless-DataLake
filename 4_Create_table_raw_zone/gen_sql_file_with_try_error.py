import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
logger = logging.getLogger("gen_sql_file")


tablenames = ["supermarket_branches", "supermarket_categories","supermarket_customers","supermarket_locations",
              "supermarket_products","supermarket_sales"]

has_error = False
error_messages = []
for table in tablenames:
    
    input_file = f"landing_zone_{table}.sql"
    input_path = f"/Users/thanapoomtongplengsri/Desktop/gen_sql_file/{input_file}"
    output_file = f"CREATE_raw_{table}.sql"
    output_path = f"/Users/thanapoomtongplengsri/Desktop/gen_sql_file/{output_file}"
    
    try:
        with open(input_path, 'r') as file:
            content = file.read()
    
        start = content.find('CREATE EXTERNAL TABLE')
        end = content.find(')') + 1
        schema_part = content[start:end]
        query = f"{schema_part}\nSTORED AS PARQUET\nLOCATION\n  's3://serverless-datalake-project-supermarket/raw_zone/{table}/';"

        with open(output_path,'w') as file:
            file.write(query)
        logger.info(f"Write file : {output_file} successfully")
        
    except Exception as e:
        error_msg = f"Error at file {table} : {str(e)}"
        logger.error(error_msg)
        has_error = True
        error_messages.append(error_msg) 
        continue

if has_error:
    raise Exception("Job completed with errors: " + "; ".join(error_messages))
