-- Garante que nenhum item de venda possua valor líquido negativo ou desconto inconsistente (>100%)
select 
    id_pedido_item,
    valor_liquido
from {{ ref('fct_vendas') }}
where valor_liquido < 0