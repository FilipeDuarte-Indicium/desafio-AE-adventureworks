-- Garante que nenhuma data de pedido seja maior que a data atual (consistência temporal)
select 
    id_pedido,
    data_pedido
from {{ ref('stg_salesorderheader') }}
where data_pedido > current_timestamp()