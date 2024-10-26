with 
    int_product as (
        select *
        from {{ ref('int_product') }}
    )

select *
from int_product