with
    sales_order_reason as (
        select *
        from {{ ref('stg_bd__salesorderheadersalesreason') }}
    )

    , sales_order as (
        select *
        from {{ ref('stg_bd__salesorderheader') }}
    )

    , int_order_detail as (
        select *
        from {{ ref('int_order_detail') }}
    )

    , joined as (
        select
            {{ dbt_utils.generate_surrogate_key([
                'sales_order.FK_SALES_ORDER', 'PK_ORDER_DETAIL', 
                'PK_PRODUCT', 'FK_SALES_REASON'
            ]) }} as SK_SALES_ORDER
            , sales_order.FK_SALES_ORDER
            , int_order_detail.PK_ORDER_DETAIL as FK_ORDER_DETAIL
            , int_order_detail.PK_PRODUCT as FK_PRODUCT
            , sales_order.FK_CUSTOMER
            , sales_order.FK_SALES_PERSON
            , sales_order.FK_TERRITORY
            , sales_order.FK_CREDIT_CARD
            , sales_order_reason.FK_SALES_REASON
            , sales_order.ORDER_DATE_SALES_ORDER
            , sales_order.STATUS_SALES_ORDER
            , sales_order.SUBTOTAL
            , sales_order.TAXAMT
            , sales_order.TOTALDUE
            , sales_order.MODIFIEDDATE
            , sales_order.TRANSFORMEDDATE
        from sales_order
        left join int_order_detail
            on sales_order.fk_sales_order = int_order_detail.fk_sales_order
        left join sales_order_reason
            on sales_order.fk_sales_order = sales_order_reason.fk_sales_order
    )

select *
from joined