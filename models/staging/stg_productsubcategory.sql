with source as (
    select * from {{ source('adventure_works', 'product_subcategory') }}
)
select
    cast(_c0 as int) as id_subcategoria,
    cast(_c1 as int) as id_categoria,
    cast(_c2 as string) as nome_subcategoria
from source