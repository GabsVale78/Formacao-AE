with 
    source_salesreason as (
        select *
        from {{ source('BD_Adventure_Works', 'salesreason') }}
    )

    , _rename_ as (
        select
            cast(SALESREASONID as int) as pk_salesreasonid
            , cast(NAME as varchar) as name_salesreason
            , cast(REASONTYPE as varchar) as reasontype
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
        from source_salesreason
    )

select *
from _rename_