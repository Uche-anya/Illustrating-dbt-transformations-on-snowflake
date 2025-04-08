
with customer_orders as(

 select c.customerid, concat(c.firstname, ' ', c.lastname) as customername, count(o.orderid) as no_of_orders
 from landing_dbt_schema.customers c
 join landing_dbt_schema.orders o on c.customerid = o.customerid
 group by c.customerid, customername
 order by no_of_orders desc
 )
 select customerid, customername, no_of_orders
 from customer_orders


