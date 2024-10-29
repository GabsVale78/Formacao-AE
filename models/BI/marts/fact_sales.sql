with 
    
    dim_location as (
        select *
        from {{ ref('dim_location') }}
    )

    , dim_sales_reason as (
        select *
        from {{ ref('dim_sales_reason') }}
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
    
    , int_sales as (
        select *
        from {{ ref('int_sales') }}
    )

select *
from int_sales