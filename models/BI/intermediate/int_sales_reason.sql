with
    sales_order_reason as (
        select *
        from {{ ref('stg_bd__salesorderheadersalesreason') }}
    )
    
    , sales_reason as (
        select *
        from {{ ref('stg_bd__salesreason') }}
    )

    , sales_order as (
        select *
        from {{ ref('stg_bd__salesorderheader') }}
    )

    , joined as (
        select
            sales_order.pk_sales_order
            , sales_reason.REASON_TYPE
        from sales_order
        left join sales_order_reason
            on sales_order.pk_sales_order = sales_order_reason.fk_sales_order
        left join sales_reason
            on sales_order_reason.fk_sales_reason = sales_reason.pk_sales_reason
    )

    , ranked_sales as (
        select
            pk_sales_order,
            REASON_TYPE,
            row_number() over (partition by pk_sales_order order by 
            case 
                when REASON_TYPE <> 'Other' then 1 
                else 2 
            end) as rn
        from joined
    )

    , final_select as (
        select
            pk_sales_order,
            REASON_TYPE
        from ranked_sales
        where rn = 1
    )

select *
from final_select