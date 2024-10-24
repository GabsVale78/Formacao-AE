with 
    source_order_detail as (
        select *
        from {{ source('BD_Adventure_Works', 'salesorderdetail') }}
    )

    , _rename_ as (
        select
            cast(SALESORDERDETAILID as int) as pk_order_detail
            , cast(SALESORDERID as int) as fk_sales_order
            , cast(PRODUCTID as int) as fk_product
            , cast(ORDERQTY as int) as order_qty
            , {{ round_decimals('UNITPRICE') }} as unit_price
            , {{ round_decimals('UNITPRICEDISCOUNT') }} as discount
            , cast(SPECIALOFFERID as int) as specialofferid
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
           -- , cast(CARRIERTRACKINGNUMBER as int)
           -- , cast(ROWGUID as int) 
        from source_order_detail
    )

select *
from _rename_
