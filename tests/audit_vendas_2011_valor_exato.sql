with soma_vendas_2011 as (
    select 
        sum(valor_bruto) as total_bruto_2011
    from {{ ref('fct_vendas') }}
    where extract(year from data_dia) = 2011
)

select 
    total_bruto_2011,
    abs(total_bruto_2011 - 12646112.16) as diferenca
from soma_vendas_2011
where abs(total_bruto_2011 - 12646112.16) > 0.01