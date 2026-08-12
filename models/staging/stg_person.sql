with source as (
    select * from {{ source('adventure_works', 'person') }}
)
select
    cast(_c0 as int) as id_pessoa,
    cast(concat_ws(' ', _c1, _c2, _c3) as string) as nome_completo
from source