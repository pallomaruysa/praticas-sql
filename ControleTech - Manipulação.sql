INSERT INTO cliente(nome, cpf) values('Tarcísio', 123456789);
INSERT INTO cliente(nome, cpf) values('Fernanda', 987654321);
INSERT INTO cliente(nome, cpf) values('Fernanda', 432987651);
INSERT INTO cliente(nome, cpf) values('Maria', 123789654);
INSERT INTO cliente(nome, cpf) values('Wesley', 231789699);
INSERT INTO cliente(nome, cpf) values('Palloma', 221189699);
INSERT INTO cliente(nome, cpf) values('Eunice', 441189699);

SELECT * FROM cliente;

INSERT INTO funcionario(nome, cpf, rg) values('Carlos', 223769659, 113769659);
INSERT INTO funcionario(nome, cpf, rg) values('Paula', 343789651, 443769659);
INSERT INTO funcionario(nome, cpf, rg) values('Tereza', 563783654, 553769659);
INSERT INTO funcionario(nome, cpf, rg) values('Lailla', 875564555, 957447454);

SELECT * FROM funcionario;

insert into pedido values(null, 123789654);
insert into pedido values(null, 987654321);
insert into pedido values(null, 123456789);

SELECT * FROM pedido;

INSERT INTO produto(nome, descricao, preco, fornecedor, quantidade) values('Notebook', 'branco', 3500, 'DELL', 10);
INSERT INTO produto(nome, descricao, preco, fornecedor, quantidade) values('SMART TV', 'preta', 2800, 'Samsung', 5);
INSERT INTO produto(nome, descricao, preco, fornecedor, quantidade) values('Fone', 'cinza', 400, 'JBL', 2);

SELECT * FROM produto;

INSERT INTO setor(nome) values ('RH');
INSERT INTO setor(nome) values ('Tecnologia');
INSERT INTO setor(nome) values ('Administração');
INSERT INTO setor(nome) values ('Vendas');

SELECT * FROM setor;

update funcionario set codigo_setor=1 where codigo=1;
update funcionario set codigo_setor=2 where codigo=2;
update funcionario set codigo_setor=3 where codigo=3;
update funcionario set codigo_setor=4 where codigo=4;

SELECT * FROM funcionario;


SELECT DISTINCT cpf FROM cliente;

SELECT * FROM produto limit 2;

DELETE FROM produto where codigo = 1;
DELETE FROM produto where codigo = 2;

INSERT INTO produto values(1, 'Notebook', 'preto', 8500, 'DELL', 10);
INSERT INTO produto values(2, 'SMART TV', 'azul turquesa', 2700, 'Samsung', 5);
INSERT INTO produto values(null,'Fone', 'branco', 200, 'Xiaomi', 19);

SELECT * FROM produto;

SELECT CONCAT ("Olá, Seja Bem-Vindo ao Sistema de Controle de Estoque ", nome) FROM cliente;

ALTER TABLE pedido ADD prazo int(11);

INSERT INTO pedido(prazo) values(10);
INSERT INTO pedido(prazo) values(15);
INSERT INTO pedido(prazo) values(6);

update pedido set prazo=34 where num_pedido=1;
update pedido set prazo=7 where num_pedido=2;
update pedido set prazo=25 where num_pedido=3;

update pedido set cpf_cliente=123789654 where num_pedido=4;
update pedido set cpf_cliente=987654321 where num_pedido=5;
update pedido set cpf_cliente=123456789 where num_pedido=6;

SELECT * FROM pedido;
SELECT * FROM funcionario f ;

select 	f.nome,
		case when s.nome = "Tecnologia" then 'Tem um salário alto'
		when s.nome = "Vendas" then 'Tem um salário baixo'
		else 'Tem um salário normal' end as 'Qualidade salarial'
from setor s 
inner join  funcionario f 
on f.codigo_setor = s.codigo ;

select f.nome, s.nome from setor s inner join  funcionario f on f.codigo_setor = s.codigo ;

select c.nome, p.num_pedido from pedido p inner join cliente c on c.cpf = p.cpf_cliente order by p.num_pedido;


SELECT nome, cpf FROM cliente ORDER BY codigo ASC;
SELECT nome, cpf FROM cliente ORDER BY codigo desc;

SELECT nome, quantidade FROM produto ORDER BY fornecedor DESC;


SELECT cliente.nome, pedido.num_pedido FROM cliente LEFT JOIN pedido ON pedido.cpf_cliente = cliente.nome; 

SELECT cliente.nome, pedido.num_pedido FROM cliente RIGHT JOIN pedido ON pedido.cpf_cliente = cliente.nome;


SELECT  nome FROM cliente UNION SELECT num_pedido FROM pedido;

SELECT nome FROM cliente UNION ALL SELECT num_pedido FROM pedido;

SELECT 	f.nome as 'Nome',
		s.codigo as 'Código do Setor'
FROM funcionario f 
FULL OUTER JOIN setor s 
ON s.codigo = f.codigo_setor;

SELECT cliente.nome, pedido.num_pedido FROM cliente LEFT JOIN pedido ON pedido.cpf_cliente = cliente.nome
union all
SELECT cliente.nome, pedido.num_pedido FROM cliente RIGHT JOIN pedido ON pedido.cpf_cliente = cliente.nome;

INSERT INTO funcionario(nome, cpf, rg, codigo_setor) values('Luana', 1234, 5623, 1);
INSERT INTO funcionario(nome, cpf, rg, codigo_setor) values('Taila', 4567, 5845, 2);
INSERT INTO funcionario(nome, cpf, rg, codigo_setor) values('Eunice', 9785, 2456, 3);

SELECT * FROM funcionario order by codigo_setor ;

SELECT MIN(nome) FROM funcionario;

SELECT MAX(nome) FROM funcionario;

SELECT  COUNT(*) FROM cliente;
SELECT  COUNT(*) FROM funcionario;

ALTER TABLE funcionario ADD salario float(11,2);

UPDATE funcionario SET salario = 3500 WHERE codigo_setor = 1;
UPDATE funcionario SET salario = 10000 WHERE codigo_setor = 2;
UPDATE funcionario SET salario = 2400 WHERE codigo_setor = 3;
UPDATE funcionario SET salario = 1900 WHERE codigo_setor = 4;

select * from funcionario ;

SELECT AVG(salario) FROM funcionario;

SELECT SUM(salario) FROM funcionario;

SELECT UPPER(nome) FROM cliente;

SELECT LOWER(nome) FROM funcionario;

SELECT LENGTH(nome) FROM funcionario;

SELECT SUBSTR(nome, 1, 2) FROM cliente;

SELECT RPAD(nome, 8, '#') FROM funcionario f ;

SELECT LPAD(nome, 5, '#') FROM funcionario f ;

select * from funcionario;

SELECT COUNT(*) as 'Contagem de Salarios' FROM funcionario GROUP BY codigo_setor HAVING AVG (salario) >= 1500;

SELECT nome FROM funcionario WHERE nome LIKE 'L%';

SELECT nome FROM cliente WHERE nome LIKE '_E%';

SELECT nome FROM funcionario WHERE nome LIKE '__A%';

SELECT nome FROM cliente c WHERE nome LIKE '%a';

SELECT nome,cpf,salario FROM funcionario WHERE NOT (salario>2000 AND codigo_setor = 3);
select * from setor;

SELECT nome,cpf, salario FROM funcionario WHERE salario<1500 OR salario>2000;

select  codigo as 'Código do funcionario',
		nome as 'Nome',
		codigo_setor as 'Código do setor',
		concat('R$ ', format(salario,2))'Salário'
from funcionario order by codigo;

CREATE TRIGGER visualizar
AFTER INSERT ON cliente for each row 
insert into exemplo_trigger_tb (descricao) values ('Novo cliente inserido');

CREATE TRIGGER acionar
AFTER insert ON produto for each row 
insert into exemplo_trigger_tb (descricao) values ('Um produto foi inserido');
INSERT INTO produto values(null,'mesa', 'madeira', 180, 'Madereira LDTA', 9);

SELECT * FROM exemplo_trigger_tb;

create view exibicao 
as select rg as r, cpf as c 
from funcionario where codigo = 1;

create view amostra
as select nome as fama 
from produto 
where codigo = 3;

select r,c from exibicao;
select fama from amostra;
-- -------------------------- TESTANDO Stored Procedures ------------------------------------------------------------------
delimiter //
create procedure exemplo()
begin select 'Usando o Stored Procedures' as test;
end //
delimiter ;

call exemplo();
drop procedure exemplo;

-- -------------------------- TESTANDO Stored Procedures ------------------------------------------------------------------
ALTER TABLE funcionario ADD salario_total float(11,2);
ALTER TABLE funcionario ADD venda_total float(11,2);
ALTER TABLE funcionario ADD porcent_comissao int;

select * from funcionario f order by codigo_setor ;

UPDATE funcionario SET venda_total = 3900 WHERE codigo_setor = 4;
UPDATE funcionario SET porcent_comissao = 10 WHERE codigo_setor = 4;

call gerar_salario_total('3900.00', '1900.00', 10, @a);
call gerar_salario_total('800.00', '1900.00', 10, @a);
select @a;

update funcionario set salario_total = @a WHERE codigo_setor = 4;
insert into funcionario values (null, 'Mael', 344234543, 653345234, 4, '1900.00', '800.00', 10, @a);

drop procedure gerar_salario_total;

truncate cliente;
truncate produto;
truncate pedido;
truncate setor;
truncate funcionario;

SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM pedido;
SELECT * FROM setor;
SELECT * FROM funcionario;