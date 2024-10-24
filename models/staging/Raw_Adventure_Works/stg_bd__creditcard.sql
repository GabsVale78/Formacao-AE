with
    source_credit_card as (
        select *
        from {{ source('BD_Adventure_Works', 'creditcard') }}
    )

    , _rename_ as (
        select
            cast(CREDITCARDID as int) as pk_credit_card
            , cast(CARDTYPE as varchar) as card_type
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
            --, cast(CARDNUMBER as int) as card_number
            --, cast(EXPMONTH as int) as exp_month
            --, cast(EXPYEAR as int) as exp_year
        from source_credit_card
    )

select *
from _rename_
