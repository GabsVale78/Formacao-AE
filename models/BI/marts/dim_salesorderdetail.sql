with 
    int_salesorderdetail as (
        select *
        from {{ ref('int_salesorderdetail') }}
    )

select *
from int_salesorderdetail