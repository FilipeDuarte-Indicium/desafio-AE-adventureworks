with locais as (
    select * from {{ ref('int_locais_hierarquia') }}
)
select
    id_local,
    cidade,
    estado,
    pais
from locais