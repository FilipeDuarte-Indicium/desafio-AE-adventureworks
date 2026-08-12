with source as (
    select * from {{ source('adventure_works', 'sales_order_header_sales_reason') }}
)
select
    cast(_c0 as int) as id_pedido,
    cast(_c1 as int) as id_motivo_venda
from source