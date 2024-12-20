with 
    source_product as (
        select *
        from {{ source('BD_Adventure_Works', 'product') }}
    )

    , _rename_ as (
        select
            cast(PRODUCTID as int) as pk_product
            , cast(PRODUCTSUBCATEGORYID as varchar) as fk_product_subcategory 
            , {{ round_decimals('STANDARDCOST') }} as standard_cost
    	    , {{ round_decimals('LISTPRICE') }} as list_price
            , cast(DAYSTOMANUFACTURE as int) as day_manufacture
            , cast(NAME as varchar) as name_product
            , cast(PRODUCTNUMBER as varchar) product_number
            , case 
                when DISCONTINUEDDATE is NULL then false
                else true
            end as is_discontinued
            , cast(MODIFIEDDATE as date) as modifieddate
            , current_date as transformeddate
    	    --, cast(MAKEFLAG as varchar) 
            --, cast(FINISHEDGOODSFLAG as varchar) 
            --, cast(COLOR as varchar) 
    	    --, cast(SAFETYSTOCKLEVEL as varchar) 
    	    --, cast(REORDERPOINT as varchar) 
    	    --, cast(SIZE as varchar)
    	    --, cast(SIZEUNITMEASURECODE as varchar) 
    	    --, cast(WEIGHTUNITMEASURECODE as varchar) 
    	    --, cast(WEIGHT as varchar) 
    	    --, cast(PRODUCTLINE as varchar) 
    	    --, cast(CLASS as varchar) 
    	    --, cast(STYLE as varchar) 
    	    --, cast(PRODUCTMODELID as varchar) 
    	    --, cast(SELLSTARTDATE as varchar) 
    	    --, cast(SELLENDDATE as varchar) 
    	    --, cast(ROWGUID as varchar)
        from source_product
    )

select *
from _rename_
