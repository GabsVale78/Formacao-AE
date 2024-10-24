with
    int_sales_reason as (
        select *
        from {{ ref('int_sales_reason') }}
    )

select *
from int_sales_reason