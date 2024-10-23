with 
    source_businessentitycontact as (
        select *
        from {{ source('BD_Adventure_Works', 'businessentitycontact') }}
    )

    , _rename_ as (
        select
            cast(BUSINESSENTITYID as int) as pk_businessentityid
            , cast(PERSONID as int) as fk_personid_businessentitycontact
            , cast(CONTACTTYPEID as int) as fk_contacttypeid
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
        from source_businessentitycontact
    )

select *
from _rename_