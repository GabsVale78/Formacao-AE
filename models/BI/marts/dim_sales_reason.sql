with 
    int_sales_order as (
        select *
        from {{ ref('int_sales_reason') }}
    )

select *
from int_sales_order