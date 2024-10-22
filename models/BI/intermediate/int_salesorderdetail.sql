with 
    salesorderdetail as (
        select *
        from {{ ref('stg_bd_salesorderdetail') }}
    )

    , product as (
        select *
        from {{ ref('stg_bd_product') }}
    )

    , _join_ as (
        select
            salesorderdetail.PK_SALESORDERDETAILID
            , salesorderdetail.FK_SALESORDERID
            , product.name_product
            , salesorderdetail.ORDERQTY
            , salesorderdetail.SPECIALOFFERID
            , salesorderdetail.UNITPRICE
            , salesorderdetail.UNITPRICEDISCOUNT
        from salesorderdetail
        left join product
            on salesorderdetail.fk_productid = product.pk_product
    ) 

select *
from _join_
