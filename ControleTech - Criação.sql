CREATE DATABASE ControleTech;

DROP DATABASE ControleTech;
drop table pedido;

USE ControleTech;
CREATE TABLE cliente(
	codigo int primary key not null auto_increment,
    nome varchar(20) not null,
	cpf int(11) unique not null
);
CREATE TABLE produto(
	codigo int primary key not null auto_increment,
    nome varchar(20) not null,
    descricao varchar(45) not null,
    preco numeric(9,2) not null,
    fornecedor varchar(20) not null,
    quantidade int(11) not null
);
CREATE TABLE pedido(
	num_pedido int primary key not null auto_increment,
    cpf_cliente int(11),
    foreign key (cpf_cliente) references cliente(cpf)
);
CREATE TABLE setor(
	codigo int primary key not null auto_increment,
    nome varchar(45) not null
);
CREATE TABLE funcionario(
	codigo int primary key not null auto_increment,
    nome varchar(45) not null,
    cpf int(11) unique not null,
    rg int(11) unique not null,
    codigo_setor int(11),
    foreign key (codigo_setor) references setor(codigo)
);

CREATE TABLE exemplo_trigger_tb(
 descricao varchar(45)
);

drop schema ControleTech