with source as (
    select * from {{ source('adventure_works', 'state_province') }}
)
select
    cast(_c0 as int) as id_estado,
    cast(_c1 as string) as sigla_estado,
    cast(_c2 as string) as codigo_pais,
    cast(_c3 as string) as nome_estado
from source