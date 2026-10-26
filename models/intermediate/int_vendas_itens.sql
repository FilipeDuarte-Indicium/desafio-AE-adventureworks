with header as (
    select * from {{ ref('stg_salesorderheader') }}
),
detail as (
    select * from {{ ref('stg_salesorderdetail') }}
),
motivos as (
    select * from {{ ref('int_motivos_venda_pedido') }}
)
select
    d.id_pedido_item,
    d.id_pedido,
    h.id_cliente,
    d.id_produto,
    coalesce(h.id_endereco_entrega, 0) as id_local,
    coalesce(h.id_cartao_credito, 0) as id_cartao_credito,
    h.data_pedido,
    cast(h.data_pedido as date) as data_dia,
    h.status_pedido,
    coalesce(m.nome_motivo_venda, 'Não informado') as nome_motivo_venda,
    d.quantidade,
    d.preco_unitario,
    d.desconto_unitario,
    cast((d.quantidade * d.preco_unitario) as numeric(18,4)) as valor_bruto,
    cast((d.quantidade * d.preco_unitario * d.desconto_unitario) as numeric(18,4)) as valor_desconto,
    cast((d.quantidade * d.preco_unitario * (1 - d.desconto_unitario)) as numeric(18,4)) as valor_liquido
from detail d
inner join header h on d.id_pedido = h.id_pedido
left join motivos m on d.id_pedido = m.id_pedido