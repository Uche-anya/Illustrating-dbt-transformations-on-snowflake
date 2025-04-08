# dbt Snowflake Workflow Example

This project demonstrates a complete dbt (data build tool) workflow using Snowflake as the data warehouse adapter. It covers essential steps from raw data extraction to final analytical models, including testing and documentation.

## Project Overview

1.  **Raw Data Extraction:**
    * Raw data is stored in Snowflake within the `landing` schema.
    * Raw tables include:
        * `customers`
        * `orders`
        * `dates`
        * `employees`
        * `orderitems`
        * `products`
        * `stores`
        * `suppliers`

2.  **Staging Models:**
    * Located in the `models/staging/` directory.
    * Perform initial data transformations (e.g., `customers_stg.sql`, `orders_stg.sql`, `order_items_stg.sql`, `orders_fact_stg.sql`).
    * Clean and standardize raw data.
    * Materialized as views or tables in the `processing_dbt_schema` schema in Snowflake.

3.  **Final Analytical Models (Marts):**
    * Located in the `models/marts/` directory.
    * Organize transformed data into business-ready analytical tables.
    * Reside in the `my_dbt_schema` schema in Snowflake.
    * These models provide aggregated data for reporting and analysis.

4.  **Testing and Data Quality:**
    * **Generic Tests for Staging Models:**
        * Defined in YAML files (e.g., `generic_test.yml`) within the `models/` directory.
        * Ensure data quality after transformations (e.g., non-null columns, unique identifiers, accepted values, relationships).
    * **Source Data Tests:**
        * Defined in YAML files (e.g., `source_schema.yml`) within the `models/` directory.
        * Validate raw source data in the `landing` schema (e.g., freshness, non-null constraints, unique columns).

## How to Get Started

1.  **Clone the Repository:**

    ```bash
    git clone [https://github.com/your-username/my_dbt_project.git](https://github.com/your-username/my_dbt_project.git)
    cd my_dbt_project
    ```

2.  **Set Up Your dbt Profile:**

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
    ```


3.  **Install dbt Packages:**

    ```bash
    dbt deps
    ```

4.  **Run Your Models:**

    ```bash
    dbt run
    ```

5.  **Run Tests:**

    ```bash
    dbt test
    ```

6.  **Generate Documentation:**

    ```bash
    dbt docs generate
    dbt docs serve
    ```

## Additional Concepts Covered

* **Incremental Materialization:**
    * Process only new or updated rows during each run for efficient data loads.
* **Snapshots:**
    * Track historical data changes using dbt snapshots (SCD Type 2).
* **Jinja Templating & Macros:**
    * Write reusable code and dynamically generate SQL queries.
* **Seeds & Sources:**
    * Load CSV reference data (seeds) and configure raw source data (sources) with data quality and freshness tests.
* **dbt Tests & Doc Blocks:**
    * Ensure data quality with tests defined in YAML files and document models for clarity.

## Contributing

Feel free to contribute !
