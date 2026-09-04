with customer as (
    select * from {{ ref('stg_customer') }}
),
person as (
    select * from {{ ref('stg_person') }}
),
store as (
    select * from {{ ref('stg_store') }}
),
transformed as (
    select
        c.id_cliente,
        c.id_pessoa,
        c.id_loja,
        c.id_territorio,
        coalesce(
            p.nome_completo,
            s.nome_loja,
            concat('Cliente ID ', cast(c.id_cliente as string))
        ) as nome_cliente,
        
        case 
            when c.id_loja is not null then 'B2B'
            else 'B2C'
        end as tipo_cliente
    from customer c
    left join person p on c.id_pessoa = p.id_pessoa
    left join store s on c.id_loja = s.id_entidade_negocio
)

select * from transformed