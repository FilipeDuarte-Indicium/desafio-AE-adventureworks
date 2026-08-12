with dates as (
    select explode(sequence(to_date('2011-01-01'), to_date('2015-12-31'), interval 1 day)) as data_dia
)
select
    data_dia,
    year(data_dia) as ano,
    month(data_dia) as mes,
    date_format(data_dia, 'yyyy-MM') as ano_mes,
    dayofweek(data_dia) as dia_semana
from dates