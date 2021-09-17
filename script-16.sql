use familia;

CREATE TABLE PAI(
    CODIGO INT(18) NOT NULL PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL
);

CREATE TABLE MAE(
    CODIGO INT(18) NOT NULL PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL
);

CREATE TABLE FILHO(
    CODIGO INT(18) NOT NULL PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    PAI_CODIGO INT(18),
    MAE_CODIGO INT(18),
    FOREIGN KEY (PAI_CODIGO) REFERENCES PAI (CODIGO),
    FOREIGN KEY (MAE_CODIGO) REFERENCES MAE (CODIGO)
);

INSERT INTO MAE (CODIGO, NOME) VALUES (1, 'Maria');
INSERT INTO MAE (CODIGO, NOME) VALUES (2, 'Joana');
INSERT INTO MAE (CODIGO, NOME) VALUES (3, 'Gabriela');
INSERT INTO MAE (CODIGO, NOME) VALUES (4, 'Juliana');
INSERT INTO MAE (CODIGO, NOME) VALUES (5, 'Marina');

INSERT INTO PAI (CODIGO, NOME) VALUES (1, 'Alfredo');
INSERT INTO PAI (CODIGO, NOME) VALUES (2, 'Joaquim');
INSERT INTO PAI (CODIGO, NOME) VALUES (3, 'Juca');
INSERT INTO PAI (CODIGO, NOME) VALUES (4, 'Juliano');
INSERT INTO PAI (CODIGO, NOME) VALUES (5, 'Moacir');

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO) VALUES (1,  'Zézinho',   2, 1);
INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO) VALUES (2,  'Tuca',      null, 1);
INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO) VALUES (3,  'Jucelino',  3, 1);
INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO) VALUES (4,  'Marcelo',   4, 3);
INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO) VALUES (5,  'Chiquinha', 1, 4);
INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO) VALUES (6,  'Margarida', null, null);
INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO) VALUES (7,  'Rosa',      5, 5);
INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO) VALUES (8,  'Murilo',    1, 4);
INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO) VALUES (9,  'Rodrigo',   2, 2);
INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO) VALUES (10, 'Gustavo',   1, 2);
INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO) VALUES (11, 'Leônidas',  3, 3);

select * from pai p;
select * from mae m;
select * from filho f;

select f.codigo, f.NOME as 'Nome Filho', m.NOME as 'Nome mãe' from filho f inner join mae m on f.MAE_CODIGO = m.CODIGO;

/*
select colunas 
from tabela 
inner join ligacao obrigatoria
left join  ligacao opcional com a tabela mais fraca
right join ligacao opcional com a tabela mais fraca
where condicoes
 */

select f.nome, case when f.mae_codigo is null then 'não tem mãe' else 'tem mãe' end as 'mae',
case when f.pai_codigo is null then 'não tem pai' else 'tem pai' end as 'pai' from filho f;

COMMIT;

select f.nome, f.mae_codigo, case when f.mae_codigo is null then 'não tem mae'  else m.nome end as 'mae' from filho f 
left join mae m on m.codigo = f.mae_codigo;

select f.nome, f.mae_codigo, m.nome, case when f.pai_codigo is null then 'nao tem pai' else p.nome end as 'pai' from filho f 
inner join mae m on m.codigo = f.mae_codigo left join pai p on p.codigo = f.pai_codigo;

select count(f.codigo) from filho f where f.mae_codigo is null or f.pai_codigo is null;

select p.nome, count(f.codigo) from filho f inner join pai p on p.codigo = f.pai_codigo group by p.nome;

select f.nome, m.nome from filho f inner join mae m on m.codigo = f.mae_codigo order by m.nome;

select f.nome, m.nome from filho f inner join mae m on m.codigo = f.mae_codigo where m.nome = 'Gabriela' or m.nome = 'Juliana';

select f.nome from filho f  inner join pai p on p.codigo = f.pai_codigo where p.nome not in ('Juca', 'Juliano');

select p.nome count(f.pai_codigo) case when count(f.pai_codigo) > 1 from filho f left join pai p on f.pai_codigo = p.codigo group by p.nome;

select p.nome, count(f.pai_codigo) from filho f inner join pai p on f.pai_codigo = p.codigo where f.pai_codigo > 1 group by p.nome;

select p.NOME, count(f.CODIGO) as 'Quantidade de Filhos' 
from filho f 
inner join pai p on f.PAI_CODIGO = p.CODIGO 
group by p.NOME 
having count(f.CODIGO)>1;


-- Mostrar os nomes dos pais e mãe que possuem mais de 1 filho.
-- Mostrar o nome do pai e da mãe, mostrando a quantidade de filhos que tem juntos, 
	-- ordenando a consulta para trazer os que possuem mais filhos juntos.

select * 
from 	filho f
order by 3, 4; 


select 	p.nome as 'pai/mae',				
		count(f.codigo),
		f.nome as 'filho'
from 	filho f
inner join pai p on f.pai_codigo = p.codigo
group by  p.nome 
having  count(f.codigo) > 1 
union all
select 	m.nome as 'pai/mae',		
		count(f.codigo),
		f.nome as 'filho'
from 	filho f
inner join mae m on f.mae_codigo = m.codigo
group by  m.nome
having  count(f.codigo) > 1 ;
-- -------------------------------------------------------

select 	p.nome as 'pai',
		m.nome as 'mae',
		count(f.codigo),
		f.nome as 'filho'
from 	filho f
inner join pai p on f.pai_codigo = p.codigo
inner join mae m on f.mae_codigo = m.codigo
group by  p.nome, m.nome 
order by count(f.codigo) desc;


select 	p.nome as 'pai',
		m.nome as 'mae',
		case when count(f.codigo) = 1 then 'Tem um filho'
		when count(f.codigo) = 2 then 'Tem um casal'
		else 'Eles não dormem' end as 'Quantidade Filhos'
from 	filho f
inner join pai p on f.pai_codigo = p.codigo
inner join mae m on f.mae_codigo = m.codigo
group by  p.nome, m.nome 
order by 'Quantidade Filhos';

select count(f.CODIGO) 
from filho f 
where f.PAI_CODIGO is null 
and f.MAE_CODIGO is null;

-- ESSE 
select *
from mae m 
where   not exists 
		(select 1 from filho f where f.MAE_CODIGO = m.CODIGO);
	--  (select * from filho f where f.MAE_CODIGO = m.CODIGO);	
	
select 1 from filho f where f.MAE_CODIGO;
 -- OU ESSE
select m.nome as 'Mãe(s) sem filho(s)'
from mae m 
where m.nome not in
			 (select m.nome from filho f
			 inner join mae m on f.mae_codigo=m.codigo);


select f.NOME, p.NOME 
from filho f 
inner join pai p on p.CODIGO = f.PAI_CODIGO 
where lcase(f.NOME) like '%ri%'
order by p.NOME desc ;


select nome, length (nome) as 'Quantidade de letras do nome'
from pai p 









