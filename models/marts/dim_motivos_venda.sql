with motivos as (
    select * from {{ ref('int_motivos_venda_pedido') }}
)
select
    id_pedido,
    nome_motivo_venda
from motivos