with
    purchase_order as (
        select *
        from {{ ref('stg_bd__purchaseorderheader') }}
    )

    , status as (
        select *
        from {{ ref('status') }}
    )

    , joined as (
        select
            purchase_order.PK_PURCHASE_ORDER
            , purchase_order.ORDER_DATE_PURCHASE
            , purchase_order.SUBTOTAL_PURCHASE
            , purchase_order.TAXAMT_PURCHASE
            , purchase_order.FREIGHT_PURCHASE
            , status.NAME_STATUS
            , purchase_order.MODIFIEDDATE
            , purchase_order.TRANSFORMEDDATE
        from purchase_order
        left join status 
            on purchase_order.status_purchase = status.status
    )

select *
from joined