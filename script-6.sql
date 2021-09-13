-- consultar TUDO dentro de uma tabele FULL SCAN
select * from produto;


-- consulta apressentacao somente alguns campos
select descricao, codigo_produto, valor from produto;

-- ordenacao da instrucao | query | consulta -> por padrao é asc => ascendente
select descricao, codigo_produto, valor from produto  order by descricao desc;
select descricao, codigo_produto, valor from produto  order by codigo_produto desc;
select descricao, codigo_produto, valor from produto  order by valor desc;

-- ordenacao da instrucao usando o index da coluna da table
select * from produto order by 3; -- desc

-- ordenacao da instrucao usando o index da coluna da query
select descricao, codigo_produto, valor from produto order by 3 desc;

-- query | consulta com filtro | restricao | condicao -> CLAUSULA WHERE
select descricao, codigo_produto, valor
from produto; 
# por id
-- where id = 10;
# por descricao
-- where descricao = 'sapato social com bico fino'

# query com filtro de LIKE informando um pecado da string
 -- query filtrando qq registro que possui em qq lugar da STRING
select descricao, codigo_produto, valor from produto where descricao like '%no%';

 -- query filtrando qq registro que inicia com descricao SA
select descricao, codigo_produto, valor from produto where descricao like 'sa%';

 -- query filtrando qq registro que termina com descricao NE
select descricao, codigo_produto, valor from produto where descricao like '%ne';

# contar total de linhas da tabela
select count(id) from item_venda;
select count(*) from item_venda;

#aliases nas colunas -->  apelidos | alias
select count(*) as 'Total' from item_venda;
select  id as 'Código do produto',
		descricao as 'Descrição',
		codigo_produto as 'Código interno',
		valor 'Valor'
from produto order by id desc;

#funcao de formatacao -> ter essa saida R$ FUNCAO FORMAT | CONCAT
select  id as 'Código do produto',
		descricao as 'Descrição',
		codigo_produto as 'Código interno',
		concat('R$ ', format(valor,2))'Valor'
from produto order by id desc;

# max - pega o maior valor de uma coluna 
select max(valor) from produto;

# max - pega o maior valor de uma coluna 
select min(valor) from produto;

#funcao de somatorio SUM de uma coluna
select sum(valor) from produto;

#somar duas colunas com o operador +
select max(valor) + min(valor) from produto;

# juncoes de tabelas JOINS
select * from produto;
select * from fornecedor;

# INNER JOIN -> juncao OBRIGATORIA
select * from produto p 
inner join fornecedor f on f.id = p.id_fornecedor;

select p.descricao as 'Produto', f.nome as 'Fornecedor'
from produto p 
inner join fornecedor f on f.id = p.id_fornecedor
where f.id =5;