with 
    source_customer as (
        select *
        from {{ source('BD_Adventure_Works', 'customer') }}
    )

    , _rename_ as (
        select
            cast(CUSTOMERID as int) as pk_customerid
            , cast(PERSONID as int) as  fk_personid
            , cast(STOREID as int) as fk_storeid
            , cast(TERRITORYID as int) as fk_territoryid
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
        from source_customer
    )

select *
from _rename_