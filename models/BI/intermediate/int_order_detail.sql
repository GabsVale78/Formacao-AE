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
            order_detail.PK_ORDER_DETAIL
            , order_detail.FK_SALES_ORDER
            , product.PK_PRODUCT
            , order_detail.order_qty
            , order_detail.UNIT_PRICE
            , order_detail.DISCOUNT
        from order_detail
        left join product
            on order_detail.fk_product = product.pk_product
    )
    
    , measure as (
        select 
            *
            , {{ round_decimals('order_qty * unit_price') }}  as total_price
        from joined
    )



select *
from measure
