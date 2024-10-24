with 
    source_salesreason as (
        select *
        from {{ source('BD_Adventure_Works', 'salesreason') }}
    )

    , _rename_ as (
        select
            cast(SALESREASONID as int) as pk_sales_reason
            , cast(NAME as varchar) as name_sales_reason
            , cast(REASONTYPE as varchar) as reason_type
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
        from source_salesreason
    )

select *
from _rename_