with 
    source_salesorderdetail as (
        select *
        from {{ source('BD_Adventure_Works', 'salesorderdetail') }}
    )

    , _rename_ as (
        select
            cast(SALESORDERDETAILID as int) as pk_salesorderdetailid
            , cast(SALESORDERID as int) as fk_salesorderid
            , cast(PRODUCTID as int) as fk_productid
            , cast(ORDERQTY as int) as orderqty
            , {{ round_decimals('UNITPRICE') }} as unitprice
            , {{ round_decimals('UNITPRICEDISCOUNT') }} as unitpricediscount
            , cast(SPECIALOFFERID as int) as specialofferid
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
           -- , cast(CARRIERTRACKINGNUMBER as int)
           -- , cast(ROWGUID as int) 
        from source_salesorderdetail
    )

select *
from _rename_
