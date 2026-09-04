with source as (
    select * from {{ source('adventure_works', 'store') }}
)
select
    cast(_c0 as int) as id_entidade_negocio, -- businessentityid
    cast(_c1 as string) as nome_loja           -- store name
from source