with
    creditcard as (
        select *
        from {{ ref('stg_bd__creditcard') }}
    )

    , salesorderheadersalesreason as (
        select *
        from {{ ref('stg_bd__salesorderheadersalesreason') }}
    )

    , salesorderheader as (
        select *
        from {{ ref('stg_bd__salesorderheader') }}
    )

    , joined as (
        select
            salesorderheader.PK_SALESORDERID
            , salesorderheader.FK_CUSTOMERID
            , salesorderheader.FK_SALESPERSONID
            , salesorderheader.FK_TERRITORYID
            , salesorderheader.FK_CREDITCARDID
            , salesorderheadersalesreason.fk_salesreasonid
            , salesorderheader.ORDERDATE_SALESORDERHEADER
            , salesorderheader.DUEDATE_SALESORDERHEADER
            , salesorderheader.SHIPDATE_SALESORDERHEADER
            , salesorderheader.REVISIONNUMBER
            , salesorderheader.STATUS_SALESORDERHEADER
            , salesorderheader.PURCHASEORDERNUMBER
            , salesorderheader.SUBTOTAL
            , salesorderheader.TAXAMT
            , salesorderheader.FREIGHT
            , salesorderheader.TOTALDUE
            --, creditcard.cardtype
            , salesorderheader.MODIFIEDDATE
            , salesorderheader.TRANSFORMEDDATE
        from salesorderheader
        --left join creditcard
           -- on salesorderheader.fk_creditcardid = creditcard.pk_creditcardid
        left join salesorderheadersalesreason
            on salesorderheader.pk_salesorderid = salesorderheadersalesreason.fk_salesorderid 
    )

select *
from joined
