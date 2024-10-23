with 
    source_salesorderheadersalesreason as (
        select *
        from {{ source('BD_Adventure_Works', 'salesorderheadersalesreason') }}
    )

    , _rename_ as (
        select
            cast(SALESORDERID as int) as fk_salesorderid
            , cast(SALESREASONID as int) as fk_salesreasonid
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
        from source_salesorderheadersalesreason
    )

select *
from _rename_