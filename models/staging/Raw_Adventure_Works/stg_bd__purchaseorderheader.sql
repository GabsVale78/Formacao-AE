with
    source_purchase_order as (
        select *
        from {{ source('BD_Adventure_Works', 'purchaseorderheader') }}
    )

    , _rename_ as (
        select
            cast(PURCHASEORDERID as int) as pk_purchase_order
            , cast(STATUS as int) as status_purchase
            , cast(ORDERDATE as date) as order_date_purchase
            , {{ round_decimals('SUBTOTAL') }} as subtotal_purchase
            , {{ round_decimals('TAXAMT') }} as taxamt_purchase
            , cast(FREIGHT as int)  as freight_purchase
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
            --, cast(REVISIONNUMBER as int) 
            --, cast(EMPLOYEEID as int)
            --, cast(VENDORID as int) 
            --, cast(SHIPMETHODID as date) 
            --, cast(SHIPDATE as int) 
        from source_purchase_order 
    )

select *
from _rename_