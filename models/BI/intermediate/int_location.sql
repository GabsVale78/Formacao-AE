with 
    address as (
        select *
        from {{ ref('stg_bd__address') }}
    )

    , countryregion as (
        select *
        from {{ ref('stg_bd__countryregion') }}
    )
    
    , sales_territory as (
        select *
        from {{ ref('stg_bd__salesterritory') }}
    )

    , stateprovince as (
        select *
        from {{ ref('stg_bd__stateprovince') }}
    )

    , joined as (
        select
            address.PK_ADDRESS
            , address.CITY_ADDRESS
            , stateprovince.NAME_STATEPROVINCE
            , countryregion.NAME_COUNTRYREGION
            , address.MODIFIEDDATE
            , address.TRANSFORMEDDATE
        from address
        left join stateprovince
            on address.fk_state_province = stateprovince.pk_state_province
        left join countryregion
            on stateprovince.fk_country_code = countryregion.pk_country_code
        left join sales_territory
            on stateprovince.fk_territory = sales_territory.pk_territory
    )

select *
from joined