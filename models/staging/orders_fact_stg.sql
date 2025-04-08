
{{ config(materialized='table') }}
SELECT
    o.orderid,
    o.orderdate,
    o.customerid,
    o.employeeid,
    o.storeid,
    o.statuscd,
    o.statusdesc,
    o.updated_at,
    COUNT(DISTINCT o.orderid) AS ordercount,
    SUM(oi.totalprice) AS revenue
FROM
    {{ ref('orders_stg') }} o
JOIN
    {{ ref('order_items_stg') }} oi
    ON o.orderid = oi.orderid
GROUP BY
    o.orderid,
    o.orderdate,
    o.customerid,
    o.employeeid,
    o.storeid,
    o.statuscd,
    o.statusdesc,
    o.updated_at
