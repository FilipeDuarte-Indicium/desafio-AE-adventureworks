with header_reason as (
    select * from {{ ref('stg_salesorderheadersalesreason') }}
),
reason as (
    select * from {{ ref('stg_salesreason') }}
)
select
    hr.id_pedido,
    string_agg(r.nome_motivo_venda, ', ') as nome_motivo_venda
from header_reason hr
left join reason r on hr.id_motivo_venda = r.id_motivo_venda
group by hr.id_pedido