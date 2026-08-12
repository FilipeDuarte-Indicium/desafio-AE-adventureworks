with address as (
    select * from {{ ref('stg_address') }}
),
state as (
    select * from {{ ref('stg_stateprovince') }}
),
country as (
    select * from {{ ref('stg_countryregion') }}
)
select
    a.id_endereco as id_local,
    a.cidade,
    s.nome_estado as estado,
    c.nome_pais as pais
from address a
left join state s on a.id_estado = s.id_estado
left join country c on s.codigo_pais = c.codigo_pais