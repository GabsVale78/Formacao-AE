with
    source_salesterritory as (
        select *
        from {{ source('BD_Adventure_Works', 'salesterritory') }}
    )

    , _rename_ as (
        select
            cast(TERRITORYID as int) as pk_territory
            , cast(NAME as varchar) as country_region_territory
            , cast(COUNTRYREGIONCODE as varchar) as country_region_code_territory
            --, cast(group as int) as
            --, cast(SALESYTD as int) as
            --, cast(SALESLASTYEAR as int) as
            --, cast(COSTYTD as int) as
            --, cast(COSTLASTYEAR as int) as
        from source_salesterritory
    )

select *
from _rename_