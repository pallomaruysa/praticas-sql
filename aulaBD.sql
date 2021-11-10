create database  SenaiTechBasic;

use SenaiTechBasic;

create table tb_setor(
codigo int(11) primary key not null auto_increment,
nome varchar(45) not null
);

create table tb_funcionario(
codigo int (11) primary key not null auto_increment,
nome varchar (45) not null,
sobrenome varchar (45) not null,
cpf int(11) unique not null,
rg int(11) unique not null,
codigo_setor int (11),

foreign key (codigo_setor) references tb_setor(codigo)
);

create table tb_dependentes(
codigo int (11) primary key not null auto_increment,
nome varchar(45) not null,
sobrenome varchar(45) not null,
idade int (5) not null,
rg int(11) unique not null,
cpf int (11) unique not null,
codigo_funcionario int(11),

foreign key (codigo_funcionario) references tb_funcionario(codigo)
);

create table tb_telefone_funcionario(
codigo int(11) primary key not null auto_increment,
codigo_area int (45) not null,
numero varchar (45) not null,
codigo_funcionario int (11),

foreign key(codigo_funcionario) references tb_funcionario(codigo)
);

create table tb_clientes(
codigo int (11) primary key not null auto_increment,
nome varchar (45) not null,
sobrenome varchar (45) not null,
cpf int (11) unique not null,
rg int (11) unique not null
);

create table tb_pedidos(
nr_pedido int (11) primary key not null auto_increment,
codigo_cliente int (11) not null,

foreign key (codigo_cliente) references tb_clientes(codigo)
);

create table tb_emails(
codigo int(11) primary key not null auto_increment,
email varchar(45) not null,
codigo_cliente int (11),

foreign key(codigo_cliente) references tb_clientes(codigo)
);

create table tb_enderecos(
codigo int(11) primary key not null auto_increment,
logradouro varchar(45) not null,
bairro varchar(45) not null,
estado varchar(45) not null,
cep int(11) not null
);

create table tb_aux_cliante_endereco(
codigo_cliente int(11) not null,
codigo_endereco int(11) not null,

foreign key(codigo_cliente) references tb_clientes(codigo),
foreign key(codigo_endereco) references tb_enderecos(codigo)
);

create table tb_aux_funcionario_endereco(
codigo_funcionario int(11) not null,
codigo_endereco int(11) not null,

foreign key(codigo_funcionario) references tb_funcionario(codigo),
foreign key(codigo_endereco) references tb_enderecos(codigo)
);

create table tb_atendimento_funcionario_cliente(
data_atendimento date not null,
codigo_funcionario int(11) not null,
codigo_cliente int(11) not null,

foreign key (codigo_funcionario) references tb_funcionario(codigo),
foreign key (codigo_cliente) references tb_clientes(codigo)
);

create table produtos(
codigo int(11) not null auto_increment primary key,
nome varchar(45) not null,
descricao varchar(100),
preco float(10,2) not null,
id_fornecedor int not null,
qtde int not null
);

insert into produtos(nome, descricao, preco, id_fornecedor, qtde) values ('carro', 'fiat uno 2020', 20000.00, 132321, 2);
insert into produtos(nome, descricao, preco, id_fornecedor, qtde) values ('televisao', 'smart 50 polegadas', 3500.00, 65251, 100);
insert into produtos(nome, descricao, preco, id_fornecedor, qtde) values ('mesa', 'vidro', 500.00, 98574, 40);
insert into produtos(nome, descricao, preco, id_fornecedor, qtde) values ('estojo', 'meninas super poderosas', 30.00, 89754, 500);
insert into produtos(nome, descricao, preco, id_fornecedor, qtde) values ('notbook', 'dell i7', 7000.00, 743549, 69);

select * from produtos;
select * from tb_dependentes td ;
select * from tb_funcionario tf ;
select * from tb_setor ts ;

desc tb_dependentes ;

-- SETOR

insert into tb_setor(nome)
values('Informatica'), ('RH'), ('ADM');

-- FUNCIONARIO
insert into tb_funcionario(nome, sobrenome, cpf, rg) 
values ("Palloma Ruysa", "Cardoso dos Santos Soares", 444342244, 432234345);

insert into tb_funcionario(nome, sobrenome, cpf, rg) 
values ("Luan", "Cardoso", 5452525, 2599285);

insert into tb_funcionario(nome, sobrenome, cpf, rg) 
values("Ruy", "Soares", 5899857, 5220096);

update tb_funcionario set codigo_setor = 3 where codigo = 2;

-- DEPENDENTES
insert into tb_dependentes (nome, sobrenome,idade , rg, cpf, codigo_funcionario) 
values ("Maya Miranda", "Cardoso", 19, 9438483, 4838838, 1);
insert into tb_dependentes (nome, sobrenome,idade , rg, cpf, codigo_funcionario) 
values ("Maxmillian Miguel", "Cardoso", 23, 893473984, 34839843, 1);
insert into tb_dependentes (nome, sobrenome,idade , rg, cpf, codigo_funcionario) 
values ("Mael Marcos", "Cardoso", 27, 834593804, 438439438, 1);

insert into tb_dependentes (nome, sobrenome,idade , rg, cpf, codigo_funcionario) 
values ("Moon Maya", "dos Santos", 17, 483839434, 39843343, 3);
insert into tb_dependentes (nome, sobrenome,idade , rg, cpf, codigo_funcionario) 
values ("Lua Nova ", "dos Santos",13, 444342244, 432234345, 3);

insert into tb_dependentes (nome, sobrenome,idade , rg, cpf, codigo_funcionario) 
values ("Douglas Raphael", "dos Santos",21, 984394387, 493473343, 5);

update tb_funcionario set sobrenome = "Soares" where codigo =3;
update tb_funcionario set sobrenome = "dos Santos" where codigo =5;
update tb_funcionario set sobrenome = "Cardoso" where codigo =1;
update tb_dependentes set sobrenome = "Soares" where codigo in(4,5);

delete from tb_funcionario where codigo=2; 

insert into tb_funcionario(nome, sobrenome, cpf, rg, codigo_setor) 
values ("Luan", "Cardoso", 5452525, 2599285, 3);

select * from tb_dependentes td ;
select * from tb_funcionario tf ;
select * from tb_setor ts ;

drop table tb_dependentes;


alter table tb_funcionario add column salario float(10,2) not null;
alter table tb_funcionario add column comissao float(10,2) not null;


update tb_funcionario set salario = '10000.00' where codigo = 1;
update tb_funcionario set salario = '4000.00' where codigo = 5;
update tb_funcionario set salario = '2500.00' where codigo = 3;


update tb_funcionario set comissao = 23 where codigo = 1;
update tb_funcionario set comissao = 19 where codigo = 5;
update tb_funcionario set comissao = 13 where codigo = 3;

select * from tb_funcionario tf ;

-- testando distinct 
insert into tb_funcionario(nome, sobrenome, cpf, rg, codigo_setor, salario,comissao) 
values("Ruy", "Soares", 9384343, 4348373, 2, '999.00', 13);
select distinct nome from tb_funcionario tf;


-- Testando tipo float(7,4) para 999.00005
alter table tb_funcionario drop column comissao;
alter table tb_funcionario add column comissao float(7,4) not null;
update tb_funcionario set salario = '999.00005' where codigo = 3;
update tb_funcionario set salario = '10.0050' where codigo = 3;

select * from tb_funcionario tf ;

-- apelidando a coluna
select  nome as 'apelido da tabela', 
		sobrenome as 'apelido da tabela',
		codigo_setor as 'Setor Cadastrado'
from tb_funcionario tf ;

-- -----------------------------------------------
select format((((5+5)*2)/codigo),2) as 'Formula Matemática', codigo 
from tb_funcionario tf
order by codigo;


select * from tb_enderecos te;
desc tb_enderecos;

insert into tb_enderecos(logradouro, bairro, estado, cep) values("Aman", "Candeal", "BA", 43434);
insert into tb_enderecos(logradouro, bairro, estado, cep) values("Jonas Abel", "Candeal", "BA", 456754);
insert into tb_enderecos(logradouro, bairro, estado, cep) values("Vianna Algusta", "Brotas", "BA", 654333);
insert into tb_enderecos(logradouro, bairro, estado, cep) values("Baus Antigos", "Candeias", "BA", 45543);
insert into tb_enderecos(logradouro, bairro, estado, cep) values("Alvedo Andre", "Iatigara", "BA", 544233);
insert into tb_enderecos(logradouro, bairro, estado, cep) values("Joana Agelica", "Lapa", "BA", 53432);
insert into tb_enderecos(logradouro, bairro, estado, cep) values("Pituaban", "Mussurunga", "BA", 44534);



insert into tb_funcionario(nome, sobrenome, cpf, rg, codigo_setor, salario,comissao) 
values("Ruy", "Soares", 9384343, 4348373, 2, '999.00', 13);









