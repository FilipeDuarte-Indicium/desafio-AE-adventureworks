with source as (
    select * from {{ source('adventure_works', 'product_category') }}
)
select
    cast(_c0 as int) as id_categoria,
    cast(_c1 as string) as nome_categoria
from source