with 
    dim_order_detail as (
        select *
        from {{ ref('dim_order_detail') }}
    )
    
    ,int_sales_order as (
        select *
        from {{ ref('int_sales_order') }}
    )

select *
from int_sales_order