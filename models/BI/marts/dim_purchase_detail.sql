with
    int_purchase_detail as (
        select *
        from {{ ref('int_purchase_detail') }}
    )

select *
from int_purchase_detail