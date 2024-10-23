with 
    int_order_detail as (
        select *
        from {{ ref('int_order_detail') }}
    )

select *
from int_order_detail