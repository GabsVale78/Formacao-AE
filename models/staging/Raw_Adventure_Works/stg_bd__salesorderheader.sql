with 
    source_sales_order as (
        select *
        from {{ source('BD_Adventure_Works', 'salesorderheader') }}
    )

    , _rename_ as (
        select
            cast(SALESORDERID as int) as pk_sales_order
            , cast(CUSTOMERID as int) as fk_customer
            , cast(TERRITORYID as int) as fk_territory
            , cast(CREDITCARDID as int) as fk_credit_card
            , cast(SHIPTOADDRESSID as varchar) as fk_ship_address
            , cast(ORDERDATE as date) as order_date_sales_order
            , cast(STATUS as int) as status_sales_order
            , {{ round_decimals('SUBTOTAL') }} as subtotal_sales_order
            , {{ round_decimals('TAXAMT') }} as taxamt_sales_order
            , {{ round_decimals('TOTALDUE') }} as totaldue_sales_order
            , {{ round_decimals('FREIGHT') }} as freight_sales_order
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
            --, cast(SALESPERSONID as int) as
            --, cast(SHIPDATE as date) as 
            --, cast(DUEDATE as date) as 
            --, cast(REVISIONNUMBER as int) as 
            --, cast(PURCHASEORDERNUMBER as varchar) as 
            --, cast(COMMENT as varchar) as
            --, cast(ROWGUID as varchar) as
            --, cast(CREDITCARDAPPROVALCODE as varchar) as
            --, cast(CURRENCYRATEID as varchar) as
            --, cast(BILLTOADDRESSID as varchar) as
            --, cast(SHIPMETHODID as varchar) as            
            --, cast(ACCOUNTNUMBER as varchar) as
            --, cast(ONLINEORDERFLAG as varchar) as
        from source_sales_order
    )

select *
from _rename_
