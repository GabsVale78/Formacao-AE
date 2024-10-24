with 
    source_business_entity as (
        select *
        from {{ source('BD_Adventure_Works', 'businessentitycontact') }}
    )

    , _rename_ as (
        select
            cast(BUSINESSENTITYID as int) as pk_business_entity
            , cast(PERSONID as int) as fk_person
            , cast(CONTACTTYPEID as int) as fk_contact_type
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
        from source_business_entity
    )

select *
from _rename_