use familia;

create or replace view v_mae_pai_filho as
select 	p.nome as 'mae/pai',				
		count(f.codigo) as 'Quantidade de Filhos',
		f.nome as 'filho'
from 	filho f
inner join pai p on f.pai_codigo = p.codigo
group by  p.nome 
having  count(f.codigo) > 1 
union all
select 	m.nome as 'mae/pai',		
		count(f.codigo) as 'Quantidade de Filhos',
		f.nome as 'filho'
from 	filho f
inner join mae m on f.mae_codigo = m.codigo
group by  m.nome
having  count(f.codigo) > 1 ;