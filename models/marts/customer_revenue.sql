
SELECT
    os.customerid,
    c.customername,
    SUM(os.ordercount) AS total_ordercount,
    SUM(os.revenue) AS total_revenue
FROM
    {{ ref('orders_fact_stg') }} os
JOIN
    {{ ref('customers_stg') }} c
    ON os.customerid = c.customerid
GROUP BY
    os.customerid,
    c.customername
