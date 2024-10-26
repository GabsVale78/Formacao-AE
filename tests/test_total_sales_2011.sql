/*
    Test para confirmar que as vendas de 2011 está de acordo com o 
    levantado pela equipe de auditoria da contabilidade: 
    $12.646.112,16
*/

with
    sales_2011 as (
        select sum(total_price) as gross_sale
        from {{ ref('int_sales_order') }}
        where order_date_sales_order between '2011-01-01' and '2011-12-31'
    )

select gross_sale
from sales_2011
where gross_sale not between 12646112*0.99 and 12646112*1.01