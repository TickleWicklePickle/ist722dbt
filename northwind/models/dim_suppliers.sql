with stg_suppliers as (
    select * from {{source('northwind','Suppliers')}}
)

select 
    {{ dbt_utils.generate_surrogate_key(['s.supplierid']) }} 
       as supplierkey, 
    supplierid,
	companyname 
	contactname,
	contacttitle,
	address,
	city,
	region,
	postalcode,
	country,
	phone,
	fax,
	homepage

from stg_suppliers s
  