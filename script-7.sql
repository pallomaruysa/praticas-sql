use escola;

create table aluno(
	nome varchar(50),
	data_nascimento date,
	sobrenome varchar(50),
	endereco varchar(100)
);
drop table aluno;

create table aluno(
	nome varchar(50) not null,
	sobrenome varchar(50) not null,
	nome_pai varchar(100),
	nome_mae varchar(100),
	endereco varchar(100),
	n_casa int,
	cidade varchar(50),
	estado char(2)
);

create table instituicao_ensino(
	nome varchar(100) not null,
	endereco varchar(100) not null,
	razao_social varchar(20) not null,
	telefone varchar(20) not null,
	observacao varchar(100) not null
);

alter table instituicao_ensino drop column observacao;
alter table instituicao_ensino add column reitor varchar(50); 
alter table instituicao_ensino add column vice_reitor varchar(50);

desc instituicao_ensino;

alter table instituicao_ensino add column data_inauguracao timestamp not null;
alter table instituicao_ensino drop column reitor;
alter table instituicao_ensino drop column vice_reitor;

create table professor (
	nome varchar(100) not null,
	titularidade varchar(100) not null,
	endereco varchar(100) not null
);

drop table professor;
desc professor;

alter table professor drop column endereco;

alter table professor add cidade varchar(50) not null;
alter table professor add cidade_natal varchar(50) not null;
alter table professor add salario float(10, 2) not null;

rename table instituicao_ensino to faculdade;
desc faculdade;

create table departamento(
	nome_deoartamento	varchar(100) not null,
	nome_presidente		varchar(100) not null,
	localizacao			varchar(100) not null,
	orcamento			float(10,2)
);

rename table departamento to centro;
desc centro;

create table livro(
	id int not null auto_increment,
	nome_livro			varchar(100),
	ano_lancamento		char(4),
	autor				varchar(100),
	quantidade_pages	int,
	primary key(id)
);

drop table livro;
desc table livro;

insert into livro values (1, 'Dom Quixote',               1605, 'Miguel de Cervantes',    378);
insert into livro values (2, 'Guerra e Paz',              1869, 'Liev Tolstói',           652);
insert into livro values (3, 'A Montanha Mágica',         1924, 'Thomas Mann',            847);
insert into livro values (4, 'Ulisses',                   1922, 'James Joyce',             65);
insert into livro values (5, 'Cem Anos de Solidão',       1967, 'Gabriel García Márquez', 987);
insert into livro values (6, 'A Divina Comédia',          1321, 'Dante Alighieri',        587);
insert into livro values (7, 'Em Busca do Tempo Perdido', 1913, 'Marcel Proust',          872);
insert into livro values (8, 'O Som e a Fúria',           1929, 'William Faulkner',       254);

select * from livro;

select l.ano_lancamento from livro l where l.ano_lancamento > 1900 order by ano_lancamento;
select l.ano_lancamento from livro l where l.ano_lancamento < 1605;
select l.ano_lancamento from livro l where l.ano_lancamento >= 1967;

select nome_livro from livro where autor like '%Liev Tolstói%';
select nome_livro from livro where autor like '%James Joyce%' or autor like'%Marcel Proust%';
select quantidade_pages from livro where quantidade_pages >= 600 or quantidade_pages <= 1000 order by quantidade_pages;
select quantidade_pages from livro where quantidade_pages > 367 or ano_lancamento = 1605 order by quantidade_pages;
select nome_livro from livro where nome_livro like '%Ulisses%' and quantidade_pages >= 65;
select nome_livro, ano_lancamento from livro;
select autor from livro where quantidade_pages > 400;
select nome_livro from livro where nome_livro like '%Anos%';
select nome_livro from livro where autor like '%Liev%';
select nome_livro from livro where autor like '%w%';
select nome_livro from livro where nome_livro like 'g%';

select nome_livro as 'NOME', autor as 'AUTOR', ano_lancamento as 'ANO DO LANCAMENTO' from livro;
select nome_livro, 2021-ano_lancamento, 2000-ano_lancamento from livro;
select nome_livro, ano_lancamento from livro where 2021-ano_lancamento >= 60 and 2021-ano_lancamento <= 300;

insert into livro (id, nome_livro, ano_lancamento, autor, quantidade_pages) values (9, 'Chapeuzinho vermelho',      1899, 'Miguel de Cervantes',     12);
insert into livro (id, nome_livro, ano_lancamento, autor, quantidade_pages)values (10, 'Dona florinda',             1968, 'Miguel de Cervantes',     59);

select nome_livro, autor, ano_lancamento from livro order by  ano_lancamento desc;

alter table livro add column volume int;
desc livro ;
select * from livro;
update livro set volume=1 where id in (9,10);

alter table livro add column data_edicao datetime;
update livro set data_edicao = '2016/06/23' where id =1;
update livro set data_edicao = '1989/02/28' where id =2;
update livro set data_edicao = '2015/02/01 14:25' where id =3;
update livro set data_edicao = '1989/12/09' where id = 4;
update livro set data_edicao = '1902/08/29' where id = 5;
update livro set data_edicao = '1806/09/28' where id = 6;

update livro set data_edicao = '2005/09/08' where id in (7,8,9,10);
select nome_livro, autor from livro order by data_edicao desc;

SELECT nome_livro, DATE_FORMAT(data_edicao,'%m/%Y') AS 'Data de Edição' FROM livro l;

select id,autor,data_edicao from livro where data_edicao between '1989/01/01' and '1989/12/31';
alter table livro modify nome_livro varchar(100) not null;

insert into livro values ('Cem Anos de Solidão'); -- -> erro
update livro set data_edicao = '1879/06/03' where id = 5;

select nome_livro, date_format(data_edicao,'%Y') as 'Data de Edição' from livro l order by data_edicao desc;

insert into livro(nome_livro, data_edicao, autor) values('A volta dos que não foram', '1789/00/00', 'Liev Tolstói');
insert into livro(nome_livro, data_edicao, autor) values('Grande visões de um cego', '1968/00/00', 'James Joyce');
insert into livro(nome_livro, data_edicao, autor) values('Poeira em alto mar', '1809/00/00', 'Thomas Mann');
insert into livro(nome_livro, data_edicao, autor) values('Lucidez de um louco', '1709/00/00', 'Gabriel García Márquez');

select nome_livro, data_edicao from livro l where id not in (11,12,13,15);
update livro set ano_lancamento = date_format(data_edicao,'%Y') where id in (11,12,13,15);
update livro set quantidade_pages = 100 where id in(11,12,13,15);

select count(distinct l.id), autor from livro l group by autor;

select count(l.nome_livro) from livro l where l.nome_livro like '%a%';
select count(l.quantidade_pages) as 'Soma de páginas' from livro l where data_edicao > '2005/01/01';

alter table livro add valor float(10,2);

update livro set valor = 35.99 where id in (1,2,9,10,12);
update livro set valor = 12.89 where id in (7,8,9,10);
update livro set valor = 19.70 where id in (3,4,5,6,11,13,14,15) and data_edicao < '2006/01/01';
update livro set valor = 9.99 where id = 3;

select SUM(l.valor)/15 as 'media_de_precos' from livro l;

select nome_livro ,case when date_format(data_edicao,'%Y')>'2015' then 'O livro é de no max de dois anos'
else 'O livro é mais velhor que dois anos' end as 'Idade'
from livro l 
order by data_edicao desc;

from livro where  data_edicao > '2015/01/01' as 'O livro é de no max dois anos' else ;
select date_format(data_edicao,'%Y')>'2000'
from livro;

select count(volume) from livro l; 
select count(distinct l.id), date_format(data_edicao, '%m') from livro l group by date_format(data_edicao, '%m'); -- -> Bruna
select nome_livro , date_format(data_edicao, '%m') as 'Mês da edição' from livro l ; -- -> Palloma

select l.nome_livro, case when l.nome_livro like '%a%' or l.nome_livro like '%e%' or l.nome_livro like '%i%' or l.nome_livro like '%o%' or
l.nome_livro like '%u%' then 'Possui vogal no nome'
else 'Não possui vogal no nome' end as 'Vogal' from livro l order by l.nome_livro;

select l.nome_livro, case when l.nome_livro like '%a%' or l.nome_livro like '%e%' or l.nome_livro like '%i%' or l.nome_livro like '%o%' or
l.nome_livro like '%u%' then count(l.nome_livro)/count(l.nome_livro)
else count(l.nome_livro)/count(l.nome_livro) end as 'Media' from livro l order by l.nome_livro;


select * from livro l;