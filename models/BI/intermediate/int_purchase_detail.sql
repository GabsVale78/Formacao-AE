with 
    purchase_detail as (
        select *
        from {{ ref('stg_bd__purchaseorderdetail') }}
    )

    , product as (
        select *
        from {{ ref('stg_bd__product') }}
    )

    , joined as (
        select
            purchase_detail.PK_PURCHASE_DETAIL
            , purchase_detail.FK_PURCHASE_ORDER
            , product.NAME_PRODUCT
            , purchase_detail.DUE_DATE_PURCHASE
            , purchase_detail.ORDER_QTY_PURCHASE
            , purchase_detail.RECEIVED_QTY_PURCHASE
            , purchase_detail.UNIT_PRICE_PURCHASE
            , purchase_detail.MODIFIEDDATE
            , purchase_detail.TRANSFORMEDDATE
        from purchase_detail
        left join product
            on purchase_detail.FK_PRODUCT = product.PK_PRODUCT
    )

select *
from joined