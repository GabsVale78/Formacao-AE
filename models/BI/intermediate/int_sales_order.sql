with
    credit_card as (
        select *
        from {{ ref('stg_bd__creditcard') }}
    )

    , sales_reason as (
        select *
        from {{ ref('stg_bd__salesorderheadersalesreason') }}
    )

    , sales_order as (
        select *
        from {{ ref('stg_bd__salesorderheader') }}
    )

    , joined as (
        select
            sales_order.PK_SALESORDERID
            , sales_order.FK_CUSTOMERID
            , sales_order.FK_SALESPERSONID
            , sales_order.FK_TERRITORYID
            , sales_order.FK_CREDITCARDID
            , sales_reason.fk_salesreasonid
            , sales_order.ORDERDATE_SALESORDERHEADER
            , sales_order.DUEDATE_SALESORDERHEADER
            , sales_order.SHIPDATE_SALESORDERHEADER
            , sales_order.REVISIONNUMBER
            , sales_order.STATUS_SALESORDERHEADER
            , sales_order.PURCHASEORDERNUMBER
            , sales_order.SUBTOTAL
            , sales_order.TAXAMT
            , sales_order.FREIGHT
            , sales_order.TOTALDUE
            --, credit_card.cardtype
            , sales_order.MODIFIEDDATE
            , sales_order.TRANSFORMEDDATE
        from sales_order
        --left join credit_card
           -- on sales_order.fk_creditcardid = credit_card.pk_creditcardid
        left join sales_reason
            on sales_order.pk_salesorderid = sales_reason.fk_salesorderid 
    )

select *
from joined
