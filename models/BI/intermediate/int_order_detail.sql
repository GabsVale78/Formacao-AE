with 
    order_detail as (
        select *
        from {{ ref('stg_bd__salesorderdetail') }}
    )

    , product as (
        select *
        from {{ ref('stg_bd__product') }}
    )

    , joined as (
        select
            order_detail.PK_SALESORDERDETAILID
            , order_detail.FK_SALESORDERID
            , product.name_product
            , order_detail.ORDERQTY
            , order_detail.UNITPRICE
            , order_detail.UNITPRICEDISCOUNT
            , order_detail.SPECIALOFFERID
        from order_detail
        left join product
            on order_detail.fk_productid = product.pk_product
    )
    
    , measure as (
        select 
            *
            , {{ round_decimals('orderqty * unitprice') }}  as total_price
        from joined
    )



select *
from measure
