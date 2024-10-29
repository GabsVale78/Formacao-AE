with

    sales_order as (
        select *
        from {{ ref('stg_bd__salesorderheader') }}
    )

    , order_detail as (
        select *
        from {{ ref('stg_bd__salesorderdetail') }}
    )
    
    , product as (
        select *
        from {{ ref('stg_bd__product') }}
    )

    , status as (
        select *
        from {{ ref('status') }}
    )


    , joined as (
        select
            order_detail.PK_ORDER_DETAIL
            , sales_order.PK_SALES_ORDER as FK_SALES_ORDER
            , order_detail.FK_PRODUCT
            , sales_order.FK_CUSTOMER
            , sales_order.FK_TERRITORY
            , sales_order.FK_SHIP_ADDRESS
            , sales_order.FK_CREDIT_CARD
            , sales_order.ORDER_DATE_SALES_ORDER
            , order_detail.ORDER_QTY
            , order_detail.UNIT_PRICE
            , order_detail.DISCOUNT
            , sales_order.SUBTOTAL_SALES_ORDER
            , sales_order.TAXAMT_SALES_ORDER
            , sales_order.TOTALDUE_SALES_ORDER
            , sales_order.FREIGHT_SALES_ORDER
            , status.NAME_STATUS
            , sales_order.MODIFIEDDATE
            , sales_order.TRANSFORMEDDATE
        from order_detail
        left join sales_order 
            on order_detail.FK_SALES_ORDER = sales_order.PK_SALES_ORDER
        left join product
            on order_detail.fk_product = product.pk_product
        left join status 
            on sales_order.status_sales_order = status.status
    )

    , measure as (
        select
            *
            , {{ round_decimals('order_qty * unit_price') }}  as total_price
            , round(FREIGHT_SALES_ORDER / NULLIF(count(*) over(partition by FK_SALES_ORDER), 0), 2) as PRORATED_FREIGHT
            , round(TAXAMT_SALES_ORDER / NULLIF(count(*) over(partition by FK_SALES_ORDER), 0), 2) as PRORATED_TAXAMT
            , ORDER_QTY * UNIT_PRICE - (1 - DISCOUNT) as NET_SALES
            , case 
                when DISCOUNT > 0 then true
                else false
            end as IS_DISCOUNTED
        from joined
        
    )

    , final_select as (
        select
            PK_ORDER_DETAIL
            , FK_SALES_ORDER
            , FK_PRODUCT
            , FK_CUSTOMER
            , FK_SHIP_ADDRESS
            , FK_TERRITORY
            , FK_CREDIT_CARD
            , ORDER_DATE_SALES_ORDER
            , ORDER_QTY
            , UNIT_PRICE
            , DISCOUNT
            , TOTAL_PRICE
            , SUBTOTAL_SALES_ORDER
            , PRORATED_TAXAMT
            , PRORATED_FREIGHT
            , TOTALDUE_SALES_ORDER
            , NET_SALES
            , IS_DISCOUNTED
            , NAME_STATUS
            , MODIFIEDDATE
            , TRANSFORMEDDATE  
        from measure
    ) 

select *
from final_select
