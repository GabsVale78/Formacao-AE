with
    source_creditcard as (
        select *
        from {{ source('BD_Adventure_Works', 'creditcard') }}
    )

    , _rename_ as (
        select
            cast(CREDITCARDID as int) as pk_creditcardid
            , cast(CARDTYPE as varchar) as cardtype
            , cast(CARDNUMBER as int) as cardnumber
            , cast(EXPMONTH as int) as expmonth
            , cast(EXPYEAR as int) as expyear
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
        from source_creditcard
    )

select *
from _rename_
