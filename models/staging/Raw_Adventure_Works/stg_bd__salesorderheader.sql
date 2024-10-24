with 
    source_sales_order as (
        select *
        from {{ source('BD_Adventure_Works', 'salesorderheader') }}
    )

    , _rename_ as (
        select
            cast(SALESORDERID as int) as fk_sales_order
            , cast(CUSTOMERID as int) as fk_customer
            , cast(SALESPERSONID as int) as fk_sales_person
            , cast(TERRITORYID as int) as fk_territory
            , cast(CREDITCARDID as int) as fk_credit_card
            , cast(ORDERDATE as date) as order_date_sales_order
            , cast(STATUS as int) as status_sales_order
            , {{ round_decimals('SUBTOTAL') }} as subtotal
            , {{ round_decimals('TAXAMT') }} as taxamt
            , {{ round_decimals('TOTALDUE') }} as totaldue
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
            --, cast(SHIPDATE as date) as ship_date_sales_order
            --, cast(DUEDATE as date) as due_date_sales_order
            --, cast(FREIGHT as int) as freight
            --, cast(REVISIONNUMBER as int) as revision_number
            --, cast(PURCHASEORDERNUMBER as varchar) as purchase_order_number
            --, cast(COMMENT as varchar) as
            --, cast(ROWGUID as varchar) as
            --, cast(CREDITCARDAPPROVALCODE as varchar) as
            --, cast(CURRENCYRATEID as varchar) as
            --, cast(BILLTOADDRESSID as varchar) as
            --, cast(SHIPTOADDRESSID as varchar) as
            --, cast(SHIPMETHODID as varchar) as            
            --, cast(ACCOUNTNUMBER as varchar) as
            --, cast(ONLINEORDERFLAG as varchar) as
        from source_sales_order
    )

select *
from _rename_
