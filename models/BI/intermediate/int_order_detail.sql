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
            , product.PK_PRODUCT as FK_PRODUCT
            , order_detail.order_qty
            , order_detail.UNIT_PRICE
            , order_detail.DISCOUNT
            , order_detail.MODIFIEDDATE
            , order_detail.TRANSFORMEDDATE
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

    , final_select as (
       select
            PK_ORDER_DETAIL
            , FK_SALES_ORDER
            , FK_PRODUCT
            , ORDER_QTY
            , UNIT_PRICE
            , DISCOUNT
            , TOTAL_PRICE
            , MODIFIEDDATE
            , TRANSFORMEDDATE
        from measure
    )


select *
from final_select
