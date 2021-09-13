use loja;

create table cliente(
id int not null auto_increment,
codigo_cliente varchar(10),
nome varchar(100),
razao_social varchar(100),
data_cadastro date,
cnpj varchar(20),
telefone varchar(20),
primary key(id));



create table fornecedor(
id int not null auto_increment,
codigo_fornecedor varchar(10),
nome varchar(100),
razao_social varchar(100),
telefone varchar(20),
primary key(id));


create table vendedor(
id int not null auto_increment,
codigo_vendedor varchar(10),
nome varchar(100),
razao_vende varchar(100),
telefone varchar(20),
n_porcvende float(10,2),
primary key(id));


create table produto(
id int not null auto_increment,
codigo_produto varchar(20),
descricao varchar(100),
valor float(10,2),
situacao varchar(1),
id_fornecedor int,
primary key(id));


create table venda(
id int not null auto_increment,
codigo_venda varchar(10),
id_cliente int not null,
id_fornecedor int not null,
id_vendedor int not null,
valor float(10,2),
desconto float(10,2),
total float(10,2),
data_venda date,
primary key(id));


create table item_venda(
id int not null auto_increment,
codigo_item_venda int not null,
id_produto int not null,
valor float(10,2),
qtde int,
desconto float(10,2),
primary key(id));

-- insercao de registros
insert into cliente(nome) values ('Palloma');
insert into cliente(nome, data_cadastro) values ('Ruysa', now());
insert into cliente(nome, data_cadastro, telefone) values ('Alicio', now(), '(41)9 9843 8437');
insert into cliente(nome, data_cadastro, telefone) values ('Palloma', now(), '(41)9 9843 8437');
insert into cliente(nome, data_cadastro, razao_social, telefone) values ('Palloma', now(), 'Programadora Show de Bola', '(41)9 9843 8437');

-- pesquisar o conteudo da tabela
select * FROM produto;

-- atualizar um registro -> usar o id
update cliente set nome = 'Moon' where id = 1;
update cliente set id = 4 where id = 5;

-- excluir um registro -> usar o id
delete from cliente where id = 4;

-- deleta tabela
drop table produto;

-- zerar chaves estrangeiras
set foreign_key_checks=0;

-- remover todas as insercoes
truncate(nome_schema);

-- restabelecer as chaves estrangeiras como 1
set foreign_key_checks=1;