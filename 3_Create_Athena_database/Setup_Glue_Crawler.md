## Steps to Make the Crawler
- Go to **Glue** > **Crawlers** > **Create crawler** in AWS Console.

### Step 1: Set Crawler Properties
- Put in a name for the crawler, like `Create_Table_Athena`.
![Create Crawler name](images/1_create_crawler_name.png)

### Step 2: Choose Data Sources and Classifiers
- Pick **S3** as the data source.
- Put the S3 path  `s3://serverless-datalake-project-supermarket/landing_zone/parquet_supermarket/supermarket_sales/`.
  - Just the folder path, don’t add the file name (like no `supermarket_sales_20250321.parquet`).
![Create Crawler name](images/2_choose_data_sources.png)


### Step 3: Configure Security Settings
- Set up an **IAM role** for the crawler.
![Create Crawler name](images/3_configure_security_IAM_role.png)
- Add permissions
![Create Crawler name](images/4_add_permissions_policies.png)

### Step 4: Set Output Configuration
- Pick a **Target database** where the table goes, like `supermarket_landing_zone`.
![Create Crawler name](images/5_set_output_target_database.png)

### Step 5: Review and Create
- Check everything
![Create Crawler name](images/6_review.png)
- Click **create crawler**.

### Step 6: Run Crawler
![Create Crawler name](images/7_run_crawler.png)


### Step 7: Check Athena Result
- Open **Athena**.
- Go to the database (`supermarket_landing_zone`).
- See if the table (like `supermarket_sales`) shows up.
- Try a quick query: SHOW CREATE TABLE `supermarket_sales`;
![Create Crawler name](images/8_check_result.png)
- The Glue Crawler helps create tables and generates DDL automatically.