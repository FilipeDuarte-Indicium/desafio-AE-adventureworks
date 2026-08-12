with customer as (
    select * from {{ ref('stg_customer') }}
),
person as (
    select * from {{ ref('stg_person') }}
)
select
    c.id_cliente,
    coalesce(p.nome_completo, concat('Cliente Loja ID ', c.id_loja)) as nome_cliente
from customer c
left join person p on c.id_pessoa = p.id_pessoa