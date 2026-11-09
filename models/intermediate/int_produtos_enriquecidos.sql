with product as (
    select * from {{ ref('stg_product') }}
),
subcategory as (
    select * from {{ ref('stg_productsubcategory') }}
),
category as (
    select * from {{ ref('stg_productcategory') }}
)
select
    p.id_produto,
    p.nome_produto,
    p.codigo_produto,
    p.id_subcategoria,
    coalesce(s.nome_subcategoria, 'Sem subcategoria') as nome_subcategoria,
    s.id_categoria,
    coalesce(c.nome_categoria, 'Sem categoria') as nome_categoria
from product p
left join subcategory s on p.id_subcategoria = s.id_subcategoria
left join category c on s.id_categoria = c.id_categoria