with vendas as (
    select * from {{ ref('int_vendas_itens') }}
)
select
    id_pedido_item,
    id_pedido,
    id_cliente,
    id_produto,
    id_local,
    id_cartao_credito,
    data_pedido,
    data_dia,
    status_pedido,
    nome_status_pedido,
    nome_motivo_venda,
    quantidade,
    preco_unitario,
    desconto_unitario,
    valor_bruto,
    valor_desconto,
    valor_liquido
from vendas