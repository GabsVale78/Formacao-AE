with 
    salesorderdetail as (
        select *
        from {{ ref('stg_bd__salesorderdetail') }}
    )

    , product as (
        select *
        from {{ ref('stg_bd__product') }}
    )

    , joined as (
        select
            salesorderdetail.PK_SALESORDERDETAILID
            , salesorderdetail.FK_SALESORDERID
            , product.name_product
            , salesorderdetail.ORDERQTY
            , salesorderdetail.UNITPRICE
            , salesorderdetail.UNITPRICEDISCOUNT
            , salesorderdetail.SPECIALOFFERID
        from salesorderdetail
        left join product
            on salesorderdetail.fk_productid = product.pk_product
    )
    
    , measure as (
        select 
            *
            , {{ round_decimals('orderqty * unitprice') }}  as total_price
        from joined
    )



select *
from measure
