with creditcard as (
    select * from {{ ref('stg_creditcard') }}
),
cartoes as (
    select
        id_cartao_credito,
        coalesce(tipo_cartao, 'Não informado') as tipo_cartao
    from creditcard
),
desconhecido as (
    select
        0 as id_cartao_credito,
        'Não informado' as tipo_cartao
)
select * from cartoes
union all
select * from desconhecido