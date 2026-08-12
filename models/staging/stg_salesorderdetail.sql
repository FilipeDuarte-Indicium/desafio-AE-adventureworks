with source as (
    select * from {{ source('adventure_works', 'sales_order_detail') }}
)
select
    cast(_c0 as int) as id_pedido,
    cast(_c1 as int) as id_pedido_item,
    cast(_c3 as int) as quantidade,
    cast(_c4 as int) as id_produto,
    cast(_c6 as numeric(18,4)) as preco_unitario,
    cast(_c7 as numeric(18,4)) as desconto_unitario
from source