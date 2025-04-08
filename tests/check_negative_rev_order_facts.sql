-- tests/check_negative_rev_order_facts.sql

SELECT *
FROM {{ ref('orders_fact_stg') }}
WHERE revenue < 0
