-- Garante que o valor bruto total dos itens de um pedido bate com a soma da fct_vendas (sem divergências de arredondamento)
with soma_itens_fato as (
    select 
        id_pedido,
        sum(valor_bruto) as total_bruto_itens
    from {{ ref('fct_vendas') }}
    group by id_pedido
),
soma_itens_staging as (
    select 
        id_pedido,
        sum(cast(quantidade as numeric(18,4)) * cast(preco_unitario as numeric(18,4))) as total_bruto_calculado
    from {{ ref('stg_salesorderdetail') }}
    group by id_pedido
)
select 
    f.id_pedido,
    f.total_bruto_itens,
    s.total_bruto_calculado,
    abs(f.total_bruto_itens - s.total_bruto_calculado) as diferenca
from soma_itens_fato f
join soma_itens_staging s on f.id_pedido = s.id_pedido
where abs(f.total_bruto_itens - s.total_bruto_calculado) > 0.01