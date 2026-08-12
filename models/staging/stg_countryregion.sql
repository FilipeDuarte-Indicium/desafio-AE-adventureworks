with source as (
    select * from {{ source('adventure_works', 'country_region') }}
)
select
    cast(_c0 as string) as codigo_pais,
    cast(_c1 as string) as nome_pais
from source
