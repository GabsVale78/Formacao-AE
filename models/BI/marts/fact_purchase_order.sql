with
    dim_purchase_detail as (
        select *
        from {{ ref('dim_purchase_detail') }}
    )

    , int_purchase_order as (
        select *
        from {{ ref('int_purchase_order') }}
    )

select *
from int_purchase_order