with source as (
    select * from {{ source('adventure_works', 'product') }}
)
select
    cast(_c0 as int) as id_produto,
    cast(_c1 as string) as nome_produto,
    cast(_c2 as string) as codigo_produto,
    cast(_c3 as int) as id_subcategoria
from source