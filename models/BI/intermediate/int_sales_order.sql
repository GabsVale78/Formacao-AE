with

    sales_order_reason as (
        select *
        from {{ ref('stg_bd__salesorderheadersalesreason') }}
    )
    
    , sales_reason as (
        select *
        from {{ ref('stg_bd__salesreason') }}
    )

    , sales_order as (
        select *
        from {{ ref('stg_bd__salesorderheader') }}
    )

    , int_order_detail as (
        select *
        from {{ ref('int_order_detail') }}
    )

    , status as (
        select *
        from {{ ref('status') }}
    )

    , joined1 as (
        select
            sales_order.pk_sales_order
            , sales_reason.REASON_TYPE
        from sales_order
        left join sales_order_reason
            on sales_order.pk_sales_order = sales_order_reason.fk_sales_order
        left join sales_reason
            on sales_order_reason.fk_sales_reason = sales_reason.pk_sales_reason

    )

    , joined as (
        select
            int_order_detail.PK_ORDER_DETAIL
            , sales_order.PK_SALES_ORDER as FK_SALES_ORDER
            , int_order_detail.FK_PRODUCT
            , sales_order.FK_CUSTOMER
            , sales_order.FK_SALES_PERSON
            , sales_order.FK_TERRITORY
            , sales_order.FK_SHIP_ADDRESS
            , sales_order.FK_CREDIT_CARD
            , joined1.REASON_TYPE
            , sales_order.ORDER_DATE_SALES_ORDER
            , int_order_detail.ORDER_QTY
            , int_order_detail.UNIT_PRICE
            , int_order_detail.DISCOUNT
            , int_order_detail.TOTAL_PRICE
            , sales_order.SUBTOTAL_SALES_ORDER
            , sales_order.TAXAMT_SALES_ORDER
            , sales_order.TOTALDUE_SALES_ORDER
            , sales_order.FREIGHT_SALES_ORDER
            , status.NAME_STATUS
            , sales_order.MODIFIEDDATE
            , sales_order.TRANSFORMEDDATE
        from int_order_detail
        left join sales_order 
            on int_order_detail.FK_SALES_ORDER = sales_order.PK_SALES_ORDER
        left join joined1
            on sales_order.pk_sales_order = joined1.pk_sales_order
        left join status 
            on sales_order.status_sales_order = status.status
    )

    , measure as (
        select
            *
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
            , FK_SALES_PERSON
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
            , REASON_TYPE
            , NAME_STATUS
            , MODIFIEDDATE
            , TRANSFORMEDDATE  
        from measure
    ) 

select *
from final_select
