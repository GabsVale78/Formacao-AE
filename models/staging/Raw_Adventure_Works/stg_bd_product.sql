with 
    source_product as (
        select *
        from {{ source('BD_Adventure_Works', 'product') }}
    )

    , _rename_ as (
        select
            cast(PRODUCTID as int) as pk_product
            , cast(NAME as varchar) as name_product
            , cast(PRODUCTNUMBER as varchar) productnumber
            , {{ round_decimals('STANDARDCOST') }} as standardcost
    	    , {{ round_decimals('LISTPRICE') }} as listprice
            --, cast(DISCONTINUEDDATE as date) as discontinueddate
    	    --, cast(MAKEFLAG as varchar) 
            --, cast(FINISHEDGOODSFLAG as varchar) 
            --, cast(COLOR as varchar) 
    	    --, cast(SAFETYSTOCKLEVEL as varchar) 
    	    --, cast(REORDERPOINT as varchar) 
    	    --, cast(SIZE as varchar)
    	    --, cast(SIZEUNITMEASURECODE as varchar) 
    	    --, cast(WEIGHTUNITMEASURECODE as varchar) 
    	    --, cast(WEIGHT as varchar) 
    	    --, cast(DAYSTOMANUFACTURE as varchar)
    	    --, cast(PRODUCTLINE as varchar) 
    	    --, cast(CLASS as varchar) 
    	    --, cast(STYLE as varchar) 
    	    --, cast(PRODUCTSUBCATEGORYID as varchar) 
    	    --, cast(PRODUCTMODELID as varchar) 
    	    --, cast(SELLSTARTDATE as varchar) 
    	    --, cast(SELLENDDATE as varchar) 
    	    --, cast(ROWGUID as varchar)
    	    --, cast(MODIFIEDDATE as varchar)
        from source_product
    )

select *
from _rename_
