with 
    product_subcategory as (
        select *
        from {{ ref('stg_bd__productsubcategory') }}
    )

    , product_category as (
        select *
        from {{ ref('stg_bd__productcategory') }}
    )

    , product as (
        select *
        from {{ ref('stg_bd__product') }}
    )

    , joined as (
        select
            product_subcategory.PK_PRODUCT_SUBCATEGORY
            , product_subcategory.FK_PRODUCT_CATEGORY
            , product_category.NAME_PRODUCT_CATEGORY
        from product_subcategory
        left join product_category 
            on product_subcategory.FK_PRODUCT_CATEGORY = product_category.PK_PRODUCT_CATEGORY
    )

    , joined2 as (
        select
            product.PK_PRODUCT
            , product.STANDARD_COST
            , product.LIST_PRICE
            , product.DAY_MANUFACTURE
            , product.NAME_PRODUCT
            , joined.NAME_PRODUCT_CATEGORY
            , product.IS_DISCONTINUED
            , product.MODIFIEDDATE
            , product.TRANSFORMEDDATE
        from joined
        left join product
            on joined.PK_PRODUCT_SUBCATEGORY = product.FK_PRODUCT_SUBCATEGORY
    )

select *
from joined2
