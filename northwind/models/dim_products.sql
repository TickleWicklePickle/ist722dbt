with stg_products as (
    select * from {{source('northwind','Products')}}
),

stg_suppliers as (
    select * from {{source('northwind','Suppliers')}}
)

select 
    {{ dbt_utils.generate_surrogate_key(['p.productid']) }} 
       as productkey, 
    productid,
    productname,
    s.supplierid,

from stg_products p
    left join stg_suppliers s on p.supplierid  = s.supplierid
