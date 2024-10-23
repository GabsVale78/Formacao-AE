with
    source_address as (
        select *
        from {{ source('BD_Adventure_Works', 'address') }}
    )

    , _rename_ as (
        select
            cast(ADDRESSID as int) as pk_address
            , cast(STATEPROVINCEID as int) as fk_state_province
            , cast(CITY as varchar) as city_address
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
            --, cast(ADDRESSLINE1 as varchar)
            --, cast(SPATIALLOCATION as varchar)
            --, cast(POSTALCODE as varchar)
            --, cast(ADDRESSLINE2 as varchar)
        from source_address
    )

select *
from _rename_