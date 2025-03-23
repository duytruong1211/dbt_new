with cte as (select * from  {{ source('raw', 'olist_order_items_dataset') }} )
select
    order_id,
    order_item_id,
    seller_id,
    product_id,
    price::decimal price,
    freight_value::decimal freight_value,
    COALESCE(NULLIF(shipping_limit_date, ''), NULL)::timestamp shipping_limit_date
from
    cte