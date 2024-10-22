with 
    source_salesorderheader as (
        select *
        from {{ source('BD_Adventure_Works', 'salesorderheader') }}
    )

    , _rename_ as (
        select
            cast(SALESORDERID as int) as pk_salesorderid
            , cast(CUSTOMERID as int) as fk_customerid_salesorderheader
            , cast(SALESPERSONID as int) as fk_salespersonid_salesorderheader
            , cast(TERRITORYID as int) as fk_territoryid_salesorderheader
            , cast(CREDITCARDID as int) as fk_creditcardid_salesorderheader
            , cast(ORDERDATE as date) as orderdate_salesorderheader
            , cast(DUEDATE as date) as duedate_salesorderheader
            , cast(SHIPDATE as date) as shipdate_salesorderheader
            , cast(REVISIONNUMBER as int) as revisionnumber
            , cast(STATUS as int) as status_salesorderheader
            , cast(PURCHASEORDERNUMBER as varchar) as purchaseordernumber
            , {{ round_decimals('SUBTOTAL') }} as subtotal_salesorderheader
            , {{ round_decimals('TAXAMT') }} as taxamt
            , {{ round_decimals('FREIGHT') }} as freight
            , {{ round_decimals('TOTALDUE') }} as totaldue
            --, cast(COMMENT as varchar) as
            --, cast(ROWGUID as varchar) as
            --, cast(MODIFIEDDATE as varchar) as
            --, cast(CREDITCARDAPPROVALCODE as varchar) as
            --, cast(CURRENCYRATEID as varchar) as
            --, cast(BILLTOADDRESSID as varchar) as
            --, cast(SHIPTOADDRESSID as varchar) as
            --, cast(SHIPMETHODID as varchar) as            
            --, cast(ACCOUNTNUMBER as varchar) as
            --, cast(ONLINEORDERFLAG as varchar) as
        from source_salesorderheader
    )

select *
from _rename_
