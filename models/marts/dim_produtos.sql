with produtos as (
    select * from {{ ref('int_produtos_enriquecidos') }}
)
select
    id_produto,
    nome_produto,
    codigo_produto,
    id_subcategoria,
    nome_subcategoria,
    id_categoria,
    nome_categoria
from produtos