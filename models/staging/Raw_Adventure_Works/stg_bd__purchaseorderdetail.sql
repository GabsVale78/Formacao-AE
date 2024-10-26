with
    source_purchase_detail as (
        select *
        from {{ source('BD_Adventure_Works', 'purchaseorderdetail') }}
    )

    , _rename_ as (
        select
            cast("purchaseorderdetailid" as int) as pk_purchase_detail
            , cast("purchaseorderid" as int) as fk_purchase_order
            , cast("productid" as int) as fk_product
            , cast("duedate" as date) as due_date_purchase
            , cast("orderqty" as int) as order_qty_purchase
            , cast("receivedqty" as int) as received_qty_purchase
            , "unitprice"::numeric(16, 2) as unit_price_purchase
            , cast("modifieddate" as date) as modifieddate
            , current_date as transformeddate
            --, cast(rejectedqty as int) as
        from source_purchase_detail
    )

select *
from _rename_
