with
    int_credit_card as (
        select *
        from {{ ref('int_credit_card') }}
    )

select *
from int_credit_card