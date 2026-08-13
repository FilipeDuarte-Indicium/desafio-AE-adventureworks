with customer as (
    select * from {{ ref('stg_customer') }}
),
person as (
    select * from {{ ref('stg_person') }}
)
select
    c.id_cliente,
    coalesce(
        nullif(p.nome_completo, ''), 
        concat('Cliente B2B ID ', c.id_loja),
        concat('Cliente ID ', c.id_cliente)
    ) as nome_cliente
from customer c
left join person p on c.id_pessoa = p.id_pessoa