with source as (
    select * from {{ source('adventure_works', 'credit_card') }}
)
select
    cast(_c0 as int) as id_cartao_credito,
    cast(_c1 as string) as tipo_cartao
from source