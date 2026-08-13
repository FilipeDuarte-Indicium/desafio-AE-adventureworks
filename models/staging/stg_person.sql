with source as (
    select * from {{ source('adventure_works', 'person') }}
)
select
    cast(_c0 as int) as id_pessoa,
    cast(trim(concat_ws(' ', _c4, _c6)) as string) as nome_completo
from source