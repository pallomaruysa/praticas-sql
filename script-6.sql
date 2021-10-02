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

# USAR SEMPRE
select p.descricao as 'Produto', f.nome as 'Fornecedor'
from produto p 
inner join fornecedor f on f.id = p.id_fornecedor
where f.id =5;

# Evitar escrever query com ligação entre tabelas no WHERE -> CLAUSULA DE CONDICAO
select codigo_produto as 'Cod.Interno', descricao as 'Produto', valor as 'Preço Unitário',
f.nome as 'Fornecedor' f.telefone as 'Contato fornec', 
from produto p, fornecedor f,
where p.id_fornecedor = f.id 
and p.id_fornecedor is not null;


select codigo_produto as 'Cod.Interno', descricao as 'Produto', valor as 'Preço Unitário',
f.nome as 'Fornecedor' f.telefone as 'Contato fornec', 
from produto p 
inner join fornecedor f on p.id_fornecedor = f.id 
-- where f.nome = 'arezzo' -> evitar condicao com string | varchar | texto
where 1=1; -- f.id =1 --> query sendo restrita a fornecedor
and valor>1000;

#usando o IN apresenta somente os valores que estao dentro do parenteses
select * from cliente c where id in(1,2);

#usando operador < ESSA query apresenta todos os valores menores que a restricao
select * from cliente c where id <5;

#usando operador <= ESSA query apresenta todos os valores menores iguais que a restricao
select * from cliente c where id <=5;

#usando o NOT IN apresenta menos todo os valores menos os que estao na restricao
select * from cliente c where id not in(2,4);

#subconsultas
select c.nome, c.data_cadastro
from cliente c 
where id in (select id_cliente from venda v where id);

select id_cliente, codigo_venda, id_fornecedor 
from venda v order by id_cliente asc;
select id, nome from cliente c ;

#apresenta somente os id de clientes que possuem venda "compra"
select  c.id, c.nome, c.data_cadastro from cliente c where id in (select id_cliente from venda v where id);

select id_cliente from venda v; -- order by id_cliente asc;
select id, nome from cliente;

# subconsulta dentro do select 
select (select c.nome from cliente c where c.id = v.id_cliente) as 'Nome Cliente', v.* from venda v;

#Mesmo processo com inner join
select c.nome, v.* from venda v  inner join cliente c on c.id = v.id_cliente;

-- apresentar a quantidade de vendas por cliente 
select c.id, c.nome, count(codigo_venda) as 'Quantidade de compras'
from venda v 
inner join cliente c on c.id = v.id_cliente 
group by c.id, v.id_cliente 
order by c.nome;

select     c.id as 'Codigo cliente',
        c.nome as 'Nome cliente',
        count(codigo_venda) as 'Qtd compras',
        f.id as 'Codigo Fornecedor',
        f.nome as 'Nome fornecedor'
from     venda v 
inner join fornecedor f on v.id_fornecedor = f.id
inner join cliente c on c.id = v.id_cliente 
group by c.id, v.id_fornecedor 
order by id_cliente, id_fornecedor;
-- --------------------------------------------------------------
# apresenta SOMENTE os id de clientes que NAO possuem venda "compra"
select c.id, c.nome, c.data_cadastro from cliente c where id not in (select id_cliente
from venva v where id);

select codigo_produto as 'Cod.Interno', descricao as 'Produto', valor as 'Preco unitario', 
f.nome as 'Forncedor', f.telefone 'Contato fornec' from produto p inner join fornecedor f on 
p.id_fornecedor = f.id;

-- ------------------------------------
use loja;

select * from fornecedor;

-- apresenta todos os produtos que não possuem fornecedor
select * from produto p where id_fornecedor is null

-- apresenta todos os produtos que possuem e/ou não possuem fornecedor
select * from produto p
left join fornecedor f on f.id = p.id_fornecedor


-- apresenta todos os produtos que possuem fornecedor
select * from produto p where id_fornecedor is not null 

-- apresenta somente os produtos que possuem fornecedor vinculado
select * from produto p
inner join fornecedor f on f.id = p.id_fornecedor

-- ----------------------------------------------------
-- UCASE - UPPERCASE - TUDO EM MAIUSCULO
-- LCASE - lowercase - tudo em minusculo
select  nome, UCASE(nome) 'as', lCASE(nome)'ds' 
from cliente;

--                 ALICIO                alicio
select UCASE('alicio') 'as', lCASE('ALICIO')'ds';


