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