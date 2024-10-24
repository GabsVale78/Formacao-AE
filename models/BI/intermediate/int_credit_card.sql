with
    credit_card as (
        select *
        from {{ ref('stg_bd__creditcard') }}
    )

select *
from credit_card