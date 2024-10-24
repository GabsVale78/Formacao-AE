with 
    source_productcategory as (
        select *
        from {{ source('BD_Adventure_Works', 'productcategory') }}
    )

    , _rename_ as (
        select
            cast(PRODUCTCATEGORYID as int) as pk_product_category
            , cast(NAME as varchar) as name_product_category
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
        from source_productcategory
    )

select *
from _rename_