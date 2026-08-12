with product as (
    select * from {{ ref('stg_product') }}
)
select
    id_produto,
    nome_produto,
    codigo_produto
from product