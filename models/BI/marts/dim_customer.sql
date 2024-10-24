with
    int_customer as (
        select *
        from {{ ref('int_customer') }}
    )

select *
from int_customer