with source as (
    select * from {{ source('adventure_works', 'address') }}
)
select
    cast(_c0 as int) as id_endereco,
    cast(_c1 as string) as endereco_linha1,
    cast(_c2 as string) as endereco_linha2,
    cast(_c3 as string) as cidade,
    cast(_c4 as int) as id_estado
from source