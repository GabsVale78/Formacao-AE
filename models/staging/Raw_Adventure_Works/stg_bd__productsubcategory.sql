with 
    source_productsubcategory as (
        select *
        from {{ source('BD_Adventure_Works', 'productsubcategory') }}
    )

    , _rename_ as (
        select
            cast(PRODUCTSUBCATEGORYID as int) as pk_product_subcategory
            , cast(PRODUCTCATEGORYID as int) as fk_product_category
            , cast(NAME as varchar) as name_product_subcategory
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
        from source_productsubcategory
    )

select *
from _rename_