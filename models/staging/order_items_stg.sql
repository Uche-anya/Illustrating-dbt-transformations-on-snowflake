
select
      orderitemid,
      orderid,
      productid,
      quantity,
      unitprice,
      quantity * unitprice as totalprice,
      updated_at
from
    {{source('landing','orderitems')}}
