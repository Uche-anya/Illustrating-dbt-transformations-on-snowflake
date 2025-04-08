
select
     os.storeid,
     sum(ofact.revenue) as actualsales,
     sum(st.salestarget) as targetsales
from
    {{ref('orders_stg')}} os
join
    {{ref('orders_fact_stg')}} ofact on os.orderid = ofact.orderid
join
    {{ref('store_sales_target')}} st on st.storeid = os.storeid
group by 1
