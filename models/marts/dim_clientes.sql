with clientes as (
    select * from {{ ref('int_clientes_unificados') }}
)
select
    id_cliente,
    id_pessoa,
    id_loja,
    id_territorio,
    nome_cliente,
    tipo_cliente
from clientes