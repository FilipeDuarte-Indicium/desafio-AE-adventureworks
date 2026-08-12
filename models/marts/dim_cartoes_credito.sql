with creditcard as (
    select * from {{ ref('stg_creditcard') }}
)
select
    id_cartao_credito,
    coalesce(tipo_cartao, 'Não informado') as tipo_cartao
from creditcard