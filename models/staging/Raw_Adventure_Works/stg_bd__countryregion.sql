with
    source_countryregion as (
        select *
        from {{ source('BD_Adventure_Works', 'countryregion') }}
    )

    , _rename_ as (
        select
            cast(COUNTRYREGIONCODE as varchar) as pk_country_code
            , cast(NAME as varchar) as name_countryregion
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
        from source_countryregion
    )

select *
from _rename_