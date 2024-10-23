with 
    int_location as (
        select *
        from {{ ref('int_location') }}
    )

select *
from int_location