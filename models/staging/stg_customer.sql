with source as (
    select * from {{ source('adventure_works', 'customer') }}
)
select
    cast(_c0 as int) as id_cliente,
    cast(_c1 as int) as id_pessoa,
    cast(_c2 as int) as id_loja,
    cast(_c3 as int) as id_territorio
from source