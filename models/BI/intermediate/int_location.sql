with 
    address as (
        select *
        from {{ ref('stg_bd__address') }}
    )

    , countryregion as (
        select *
        from {{ ref('stg_bd__countryregion') }}
    )
    
    , stateprovince as (
        select *
        from {{ ref('stg_bd__stateprovince') }}
    )

    , joined as (
        select
            address.PK_ADDRESS
            , address.CITY_ADDRESS
            , stateprovince.STATE_CODE
            , stateprovince.NAME_STATEPROVINCE
            , countryregion.PK_COUNTRY_CODE as COUNTRY_CODE
            , countryregion.NAME_COUNTRYREGION
        from stateprovince
        left join countryregion
            on stateprovince.fk_country_code = countryregion.pk_country_code
        left join address
            on stateprovince.pk_state_province = address.fk_state_province
    )

select *
from joined