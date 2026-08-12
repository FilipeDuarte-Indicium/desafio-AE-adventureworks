with source as (
    select * from {{ source('adventure_works', 'sales_order_header') }}
)
select
    cast(_c0 as int) as id_pedido,
    cast(_c2 as timestamp) as data_pedido,
    cast(_c4 as int) as status_pedido,
    cast(_c10 as int) as id_cliente,
    cast(_c14 as int) as id_endereco_entrega,
    cast(_c18 as int) as id_cartao_credito,
    cast(_c19 as numeric(18,4)) as subtotal_pedido,
    cast(_c20 as numeric(18,4)) as imposto,
    cast(_c21 as numeric(18,4)) as frete,
    cast(_c22 as numeric(18,4)) as valor_total_pedido
from source