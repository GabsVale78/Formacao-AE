with 
    source_sales_order_reason as (
        select *
        from {{ source('BD_Adventure_Works', 'salesorderheadersalesreason') }}
    )

    , _rename_ as (
        select
            cast(SALESORDERID as int) as fk_sales_order
            , cast(SALESREASONID as int) as fk_sales_reason
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
        from source_sales_order_reason 
    )

select *
from _rename_