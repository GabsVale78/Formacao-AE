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
            , sales_territory.PK_TERRITORY as FK_TERRITORY
            , address.CITY_ADDRESS
            , stateprovince.NAME_STATEPROVINCE
            , countryregion.NAME_COUNTRYREGION
            , stateprovince.MODIFIEDDATE
            , stateprovince.TRANSFORMEDDATE
        from stateprovince
        left join countryregion
            on stateprovince.fk_country_code = countryregion.pk_country_code
        left join address
            on stateprovince.pk_state_province = address.fk_state_province
        left join sales_territory
            on stateprovince.fk_territory = sales_territory.pk_territory
    )

select *
from joined