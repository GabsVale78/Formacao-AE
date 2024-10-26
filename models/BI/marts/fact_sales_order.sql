with 
    dim_order_detail as (
        select *
        from {{ ref('dim_order_detail') }}
    )
    
    , dim_location as (
        select *
        from {{ ref('dim_location') }}
    )

    , dim_product as (
        select *
        from {{ ref('dim_product') }}
    )

    , dim_customer as (
        select *
        from {{ ref('dim_customer') }}
    )

    , dim_credit_card as (
        select *
        from {{ ref('dim_credit_card') }}
    )
    
    ,int_sales_order as (
        select *
        from {{ ref('int_sales_order') }}
    )

select *
from int_sales_order