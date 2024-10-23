with
    source_stateprovince as (
        select *
        from {{ source('BD_Adventure_Works', 'stateprovince') }}
    )

    , _rename_ as (
        select
            cast(STATEPROVINCEID as int) as pk_state_province
            , cast(TERRITORYID as int) as fk_territory
            , cast(COUNTRYREGIONCODE as varchar) as fk_country_code
            , cast(STATEPROVINCECODE as varchar) as state_code
            , cast(NAME as varchar) as name_stateprovince
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
            --, cast(ISONLYSTATEPROVINCEFLAG as int)
        from source_stateprovince
    )

select *
from _rename_