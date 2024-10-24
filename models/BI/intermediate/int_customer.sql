with 
    person as (
        select *
        from {{ ref('stg_bd__person') }}
    )

    , customer as (
        select *
        from {{ ref('stg_bd__customer') }}
    )

    , joined as (
        select
            customer.PK_CUSTOMER
            , person.NAME_PERSON
            , person.MODIFIEDDATE
            , person.TRANSFORMEDDATE
        from person
        right join customer
            on person.PK_PERSON = customer.FK_PERSON
    )

select *
from joined
