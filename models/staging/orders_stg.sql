{{ config(
    materialized='incremental',
    unique_key='orderid'
) }}

SELECT
    orderid,
    orderdate,
    customerid,
    employeeid,
    storeid,
    status AS statuscd,
    CASE
        WHEN status = 'InProgress' THEN 'Ongoing'
        WHEN status = 'Completed' THEN 'Done'
        WHEN status = 'Cancelled' THEN 'Stopped'
        ELSE 'Pending'
    END AS statusDesc,
    updated_at
FROM
    {{ source('landing', 'orders') }}

{% if is_incremental() %}
    WHERE updated_at > (SELECT MAX(updated_at) FROM {{ this }})
{% endif %}
