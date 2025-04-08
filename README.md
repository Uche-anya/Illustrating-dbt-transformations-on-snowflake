## Project Overview

This project is designed to demonstrate a complete dbt workflow with Snowflake as the data warehouse adapter. It covers the following steps:

1. **Raw Data Extraction**  
   Raw data is stored in Snowflake in the **landing** schema. The raw tables include:
   - `customers`
   - `orders`
   - `dates`
   - `employees`
   - `orderitems`
   - `products`
   - `stores`
   - `suppliers`

2. **Staging Models**  
   In the `models/staging/` directory, staging models (such as `customers_stg.sql`, `orders_stg.sql`, `order_items_stg.sql`, and `orders_fact_stg.sql`) perform initial transformations on the raw data.  
   - These models clean and standardize the data, and they are materialized as either views or tables in the `processing_dbt_schema` schema in Snowflake.

3. **Final Analytical Models (Marts)**  
   In the `models/marts/` directory, final transformed data is organized into analytical tables that reside in the `my_dbt_schema` schema. These models provide business-ready, aggregated data for reporting and analysis.

4. **Testing and Data Quality**  
   The project includes tests at two levels:
   - **Generic Tests for Staging Models:**  
     A YAML file (e.g., `generic_test.yml`) in the `models/` directory contains tests for the staging models. These tests ensure data quality after transformations (e.g., verifying non-null columns, unique identifiers, accepted values, and relationships).
   - **Source Data Tests:**  
     Another YAML file (e.g., `source_schema.yml`) in the `models/` directory contains tests for the raw source data in the landing schema. These tests validate that the raw data meets expected quality criteria (e.g., freshness, non-null constraints, unique columns).

## How to Get Started

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/your-username/my_dbt_project.git
   cd my_dbt_project
   
### 2. Set Up Your dbt Profile

Configure your Snowflake connection in `~/.dbt/profiles.yml`:

```yaml
my_dbt_project:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <your_account>
      user: <your_username>
      password: <your_password>
      role: <your_role>
      database: <your_database>
      warehouse: <your_warehouse>
      schema: <your_schema>
      threads: 1
      client_session_keep_alive: False

### 3. Install Dependencies

Install any required dbt packages:

```bash
dbt deps

### 4. Run Your Models

Run the models and build the project:

```bash
dbt run

### 5. Run Tests

Validate your models and source data with:

```bash
dbt run

### 6. Generate Documentation

Validate your models and source data with:

```bash
dbt docs generate
dbt docs serve

## Additional Concepts Covered

- **Incremental Materialization:**  
  Only new or updated rows are processed during each run, making data loads more efficient.

- **Snapshots:**  
  Track historical changes in data using dbt snapshots (SCD Type 2).

- **Jinja Templating & Macros:**  
  Write reusable code and dynamically generate SQL queries.

- **Seeds & Sources:**  
  Load CSV reference data (seeds) and configure raw source data (sources) with tests for data quality and freshness.

- **DBT Tests & Doc Blocks:**  
  Ensure data quality by running tests defined in YAML files, and document your models for clarity.

## Contributing

Feel free to contribute


