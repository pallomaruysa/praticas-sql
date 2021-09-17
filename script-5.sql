use loja;

select * from cliente; -- oka

desc cliente; -- *** falta atributo de cidade e estado do varchar(2)
## Inicio popula tabela cliente
insert into cliente values(null,'0001','AARONSON FURNITURE'      ,'AARONSON FURNITURE LTD' ,'2015-02-17 23:14:50',     '17.807.928/0001-85', '(21) 8167-6584' ,'QUEIMADOS'             ,'RJ' );
insert into cliente values( null,'0002','LITTLER '                ,'LITTLER  LTDA'         ,'2015-02-17 23:14:50',     '55.643.605/0001-92', '(27) 7990-9502' ,'SERRA'                 ,'ES' );
insert into cliente values( null,'0003','KELSEY  NEIGHBOURHOOD'    ,'KELSEY  NEIGHBOURHOOD' ,'2015-02-17 23:14:50',     '05.202.361/0001-34', '(11) 4206-9703' ,'BRAGANÇA PAULISTA'     ,'SP' );
insert into cliente values( null,'0004','GREAT AMERICAN MUSIC'    ,'GREAT AMERICAN MUSIC'    ,'2015-02-17 23:14:50',     '11.880.735/0001-73', '(75) 7815-7801' ,'SANTO ANTÔNIO DE JESUS','BA' );
insert into cliente values( 5,'0005','LIFE PLAN COUNSELLING'    ,'LIFE PLAN COUNSELLING' ,'2015-02-17 23:14:50',     '75.185.467/0001-52', '(17) 4038-9355' ,'BEBEDOURO'             ,'SP' );
insert into cliente values( null,'0006','PRACTI-PLAN'              ,'PRACTI-PLAN LTDA'     ,'2015-02-17 23:14:50',     '32.518.106/0001-78', '(28) 2267-6159' ,'CACHOEIRO DE ITAPEMIRI','ES' );
insert into cliente values( 7,'0007','SPORTSWEST'              ,'SPORTSWEST LTDA'       ,'2015-02-17 23:14:50',     '83.175.645/0001-92', '(61) 4094-7184' ,'TAGUATINGA'           ,'DF' );
insert into cliente values( null,'0008','HUGHES MARKETS'          ,'HUGHES MARKETS LTDA'   ,'2015-02-17 23:14:50',     '04.728.160/0001-02', '(21) 7984-9809' ,'RIO DE JANEIRO'       ,'RJ' );
insert into cliente values( 9,'0009','AUTO WORKS'              ,'AUTO WORKS LTDA'       ,'2015-02-17 23:14:50',     '08.271.985/0001-00', '(21) 8548-5555' ,'RIO DE JANEIRO'       ,'RJ' );
insert into cliente values( 10,'00010','DAHLKEMPER '           ,'DAHLKEMPER  LTDA'     ,'2015-02-17 23:14:50',   '49.815.047/0001-00','(11) 4519-7670'  ,'SÃO PAULO'             ,'SP' );
## Fim popula tabela clientes

-- alterando atributos da tabela cliente
alter table cliente add column cidade varchar(50);
alter table cliente add column estado varchar(2);
alter table cliente modify estado char(2);

-- testando codigo que retorna a proxima sequencia a ser inserido na table -> tabela cliente
select auto_increment from information_schema.tables where TABLE_NAME ='vendedor' and TABLE_SCHEMA ='loja';

desc vendedor ; -- oka

select * from vendedor;
## Inicio popula tabela Vendedores
insert into vendedor values(null,'0001','CARLOS FERNANDES','CARLOS FERNANDES LTDA',  '(47) 7535-8144',12  );
insert into vendedor values(null,'0002','JÚLIA GOMES','JÚLIA GOMES LTDA',       '(12) 8037-6661',25  );
insert into vendedor (codigo_vendedor, nome, razao_vende, telefone, n_porcvende)values('0003','PALLOMA RUYSA','PALLOMA RUYSA LTDA','(71) 8037-6661',23  );
## Fim popula tabela Vendedores
-- deletando tupla duplicada
delete from vendedor where id = 3;

select * from fornecedor; -- oka
desc fornecedor; --  ** VERIFICAR ANTES DE APLICAR O INSERT
## Inicio popula tabela Fornecedores 
insert into fornecedor values(null , 'DUN RITE LAWN MAINTENANCE'  ,'0001', '(85) 7886-8837' ,'DUN RITE LAWN MAINTENANCE LTDA' );
insert into fornecedor values( 5, 'SEWFRO FABRICS'           ,'0002', '(91) 5171-8483', 'SEWFRO FABRICS LTDA'            );
## Fim popula tabela Fornecedores

desc produto ; 
select * from produto; -- *** VERIFICAR 
## Inicio popula tabela Produtos
insert into produto values(null ,'NOTEBOOK' ,  1 ,'123131','1251.29'  ,'A' ); -- 4
insert into produto values( null ,'SMARTPHONE', 2  , '123223','1242.21'  ,'A');-- 5
insert into produto values( null ,'DESKTOP' , 1 , '1231','1241.21'  ,'A' );-- 4
insert into produto values( null,'TELEVISÃO', 2 , '142123' ,'2564.92'  ,'A' );-- 5
insert into produto values( null,'DRONE'  , 1  , '7684','2325.32'  ,'A');-- 4
## Fim popula tabela Produtos
-- deletando tupla duplicada
delete from fornecedor where id = 6;
update produto set id_fornecedor = 4 where id =11;

desc venda;
select * from venda;
## Inicio popula tabela Vendas  
insert into venda values(1    , '1'  , 1 , 1 , 1 ,  '25141.02'  , 0 , '25141.02'  ,  '2015-01-01' );
insert into venda values(2    , '2'  , 2 , 2 , 2 ,  '12476.58'  , 0 , '12476.58'  ,  '2015-01-02' );
insert into venda values(3    , '3'  , 3 , 1 , 1 ,  '16257.32'  , 0 , '16257.32'  ,  '2015-01-03' );
insert into venda values(4    , '4'  , 4 , 2 , 2 ,  '8704.55',    0 , '8704.55'   ,  '2015-01-04' );
insert into venda values(5    , '5'  , 5 , 1 , 1 ,  '13078.81', 0 , '13078.81'  ,  '2015-01-01' );
insert into venda values(6    , '6'  , 6 , 2 , 2 ,  '6079.19',    0 , '6079.19'   ,  '2015-01-02' );
insert into venda values(7    , '7'  , 7 , 1 , 1 ,  '7451.26',    0 , '7451.26'   ,  '2015-01-03' );
insert into venda values(8    , '8'  , 8 , 2 , 2 ,  '15380.47', 0 , '15380.47'  ,  '2015-01-04' );
insert into venda values(9    , '9'	 , 9 , 1 , 1 ,  '13508.34', 0 , '13508.34'  ,  '2015-01-01' );
insert into venda values(10   , '10' , 1 , 2 , 2 ,  '20315.07', 0 , '20315.07'  ,  '2015-01-02' );
insert into venda values(11   , '11' , 1 , 1 , 1 ,  '8704.55',    0 , '8704.55'   ,  '2015-01-01' );
insert into venda values(12   , '12' , 2 , 2 , 2 ,  '11198.05', 0 , '11198.05'  ,  '2015-01-02' );
insert into venda values(13   , '13' , 3 , 1 , 1 ,  '4967.84',    0 , '4967.84'   ,  '2015-01-03' );
insert into venda values(14   , '14' , 3 , 2 , 2 ,  '7451.26',    0 , '7451.26'   ,  '2015-01-04' );
insert into venda values(15   , '15' , 5 , 1 , 1 ,  '10747.359', 0 , '10747.36'  ,  '2015-01-01' );
insert into venda values(16   , '16' , 6 , 2 , 2 ,  '13502.34', 0 , '13502.34'  ,  '2015-01-02' );
insert into venda values(17   , '17' , 7 , 1 , 1 ,  '22222.99', 0 , '22222.99'  ,  '2015-01-03' );
insert into venda values(18   , '18' , 8 , 2 , 2 ,  '15465.69', 0 , '15465.69'  ,  '2015-01-04' );
insert into venda values(19   , '19' , 9 , 1 , 1 ,  '4650.64',    0 , '4650.64'   ,  '2015-01-01' );
insert into venda values(20   , '20' , 9 , 2 , 2 ,  '6975.96',    0 , '6975.96'   ,  '2015-01-02' );
## Fim popula tabela Vendas;
-- feito para numeros impares também
update venda set id_fornecedor = 5 where id in (2,4,6,8,10,12,14,16,18,20);


desc item_venda;
select * from item_venda;

## Inicio popula tabela Itens Vendas
insert into item_venda values(1 ,1 ,1,'1251.29',1,0);
insert into item_venda values(2 ,1 ,2,'1242.21',2,0);
insert into item_venda values(3 ,1 ,3,'1241.21',3,0);
insert into item_venda values(4 ,1 ,4,'1513.77',4,0);
insert into item_venda values(5 ,1 ,5,'2325.32',5,0);              
insert into item_venda values(6 ,2 ,1,'1251.29',6,0);              
insert into item_venda values(7 ,3 ,3,'1241.21',7,0);              
insert into item_venda values(8 ,4 ,1,'1251.29',1,0);              
insert into item_venda values(9 ,5 ,3,'1241.21',2,0);              
insert into item_venda values(10,6 ,1,'1251.29',3,0);              
insert into item_venda values(11,7 ,2,'1242.21',4,0);              
insert into item_venda values(12,8 ,5,'2325.32',5,0);
insert into item_venda values(13,9 ,2,'1242.21',6,0);
insert into item_venda values(14,10,3,'1241.21',7,0);
insert into item_venda values(15,11,1,'1251.29',1,0);
insert into item_venda values(16,12,1,'1251.29',2,0);
insert into item_venda values(17,13,2,'1242.21',3,0);
insert into item_venda values(18,14,2,'1242.21',4,0);
insert into item_venda values(19,15,3,'1241.21',5,0);
insert into item_venda values(20,16,3,'1241.21',6,0);
insert into item_venda values(21 ,17,4,'1513.77',7,0);
insert into item_venda values(22 ,18,4,'1513.77',1,0);
insert into item_venda values(23 ,19,5,'2325.32',2,0);
insert into item_venda values(24 ,20,5,'2325.32',3,0);
insert into item_venda values(25 ,2 ,2,'1242.21',4,0);
insert into item_venda values(26 ,3 ,4,'1513.77',5,0);
insert into item_venda values(27 ,4 ,2,'1242.21',6,0);
insert into item_venda values(28 ,5 ,4,'1513.77',7,0);
insert into item_venda values(29 ,6 ,5,'2325.32',1,0);
insert into item_venda values(30,7 ,3,'1241.21',2,0);
insert into item_venda values(31,8 ,1,'1251.29',3,0);
insert into item_venda values(32,9 ,4,'1513.77',4,0);
insert into item_venda values(33,10,5,'2325.32',5,0);
insert into item_venda values(34,11,2,'1242.21',6,0);
insert into item_venda values(35,12,2,'1242.21',7,0);
insert into item_venda values(36,13,3,'1241.21',1,0);
insert into item_venda values(37,14,3,'1241.21',2,0);
insert into item_venda values(38,15,4,'1513.77',3,0);
insert into item_venda values(39,16,4,'1513.77',4,0);
insert into item_venda values(40,17,5,'2325.32',5,0);
insert into item_venda values(41,18,5,'2325.32',6,0);
## Fim popula tabela  Itens Vendas

-- retornar a proxima sequencia a ser inserido na table
select AUTO_INCREMENT 
from information_schema.tables 
where TABLE_NAME ='produto' 
and TABLE_SCHEMA ='loja';

-- colocando valor padrao, quando não inserido na tabela
create table t2(b blob default ('abc'), sigla_estado char(2));
select * from t2;
insert t2 (sigla_estado) values ('RS');
insert t2 (sigla_estado, b) values ('BA', 'Palloma');
drop table t2;

create table t3 (situacao boolean default true, nome varchar(5),
	data_cadastro datetime default now()); 
select * from t3;
insert into t3(nome) values('bota');
insert into t3(nome, situacao) values('bota', false);
drop table t3;

-- selecionando todos do id para modificar
select * from item_venda where id_produto =10;
update item_venda set id_produto = 11 where id_produto =5;
