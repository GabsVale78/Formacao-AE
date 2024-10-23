with 
    dim_salesorderdetail as (
        select *
        from {{ ref('dim_salesorderdetail') }}
    )
    
    ,int_salesorderheader as (
        select *
        from {{ ref('int_salesorderheader') }}
    )

select *
from int_salesorderheader