tablenames = ["supermarket_branches", "supermarket_categories","supermarket_customers","supermarket_locations",
              "supermarket_products","supermarket_sales"]

for table in tablenames:
    input_file = f"landing_zone_{table}.sql"
    input_path = f"/Users/thanapoomtongplengsri/Desktop/gen_sql_file/{input_file}"

    with open(input_path, 'r') as file:
        content = file.read()

    start = content.find('CREATE EXTERNAL TABLE')
    end = content.find(')') + 1
    schema_part = content[start:end]

    query = f"{schema_part}\nSTORED AS PARQUET\nLOCATION\n  's3://serverless-datalake-project-supermarket/raw_zone/{table}/';"

    output_file = f"CREATE_raw_{table}.sql"
    output_path = f"/Users/thanapoomtongplengsri/Desktop/gen_sql_file/{output_file}"
    with open(output_path,'w') as file:
            file.write(query)
    print(f"Create {output_file} success")