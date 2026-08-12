with source as (
    select * from {{ source('adventure_works', 'sales_reason') }}
)
select
    cast(_c0 as int) as id_motivo_venda,
    cast(_c1 as string) as nome_motivo_venda,
    cast(_c2 as string) as tipo_motivo_venda
from source