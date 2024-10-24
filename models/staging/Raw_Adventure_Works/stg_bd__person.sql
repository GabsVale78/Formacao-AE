with 
    source_person as (
        select *
        from {{ source('BD_Adventure_Works', 'person') }}
    )

    , _rename_ as (
        select
            cast(BUSINESSENTITYID as int) as pk_person
            , cast(PERSONTYPE as varchar) as person_type
            , FIRSTNAME || ' ' || LASTNAME as name_person
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
            --, cast(SUFFIX as varchar)
            --, cast(TITLE as varchar)
            --, cast(EMAILPROMOTION as varchar)
            --, cast(ADDITIONALCONTACTINFO as varchar)
            --, cast(DEMOGRAPHICS as varchar)
            --, cast(ROWGUID as varchar)
            --, cast(NAMESTYLE as varchar)
        from source_person
    )

select *
from _rename_
