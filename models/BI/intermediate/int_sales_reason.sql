with
    int_sales_reason as (
        select *
        from {{ ref('stg_bd__salesreason') }}
    )

select *
from int_sales_reason