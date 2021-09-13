use agenda_contatos;

create table pessoa(
	id int not null auto_increment primary key,
	nome varchar(20),
	sobrenome varchar(50),
	idade int,
	sexo char
);

create table contato(
	id int not null auto_increment primary key,
	id_pessoa int not null,
	email varchar(50),
	telefone varchar(10),
	celular varchar(10),
	data_cadastro date
);

create table endereco(
	id int not null auto_increment primary key,
	id_pessoa int not null,
	nome_rua varchar(50),
	numero int,
	bairro varchar(50),
	cidade varchar(50),
	estado varchar(20),
	cep varchar(10),
	ponto_referencia varchar(50),
	observacao varchar(100)
);

create table formacao(
	id int not null auto_increment primary key,
	id_pessoa int not null,
	fundamental int,
	ensino_medio int,
	tecnico int,
	graduacao int
);

-- adicionando FK com restricao
alter table contato add constraint fk_contato_pessoa foreign key (id_pessoa) references pessoa(id);
alter table endereco add constraint fk_endereco_pessoa foreign key (id_pessoa) references pessoa(id);
alter table formacao add constraint fk_formacao_pessoa foreign key (id_pessoa) references pessoa(id);

-- inserindo dados na tabela PESSOA
desc pessoa;
select * from pessoa;
insert into pessoa(nome, sobrenome, idade, sexo) values('Giovanna', 'Santana', 22, 'F'),('Palloma', 'Soares', 18, 'F'),('Isabel', 'V-O', 27, 'F'),('Alicio', 'Cunha', 37, 'M');

-- inserindo dados na tabela CONTATO
desc contato;
select * from contato;
insert into contato (email, telefone, celular, data_cadastro, id_pessoa) 
					values('giovanna@gmail.com', '3384-0938', '99321-9051', now(), 1),
					('palloma@gmail.com', '3384-0938', '99321-9342', now(), 2),
					('isabel@gmail.com', '3345-0938', '94561-9051', now(), 3),
					('alicio@gmail.com', '3384-2348', '98761-9051', now(), 4);

-- alterando o id
update contato set id_pessoa = 4 where id = 4;

-- inserindo dados na tabela ENDERECO
desc endereco;
select * from endereco;
insert into endereco(nome_rua, numero, bairro, cidade, estado, cep, ponto_referencia, observacao, id_pessoa)
					values('rua A', 558, 'bairro A', 'Salvador', 'BA', '45678-000', 'p A', 'Obs A', 1),
					('rua B', 556, 'bairro B', 'Feira de Santana', 'BA', '45678-040', 'p B', 'Obs B', 2),
					('rua C', 532, 'bairro C', 'Jequie', 'BA', '45678-678', 'p C', 'Obs C', 3),
					('rua D', 567, 'bairro D', 'Porto Seguro', 'BA', '45678-056', 'p D', 'Obs D', 4);

-- inserindo dados na tabela FORMACAO
desc formacao;
select * from formacao;
insert into formacao(fundamental, ensino_medio, tecnico, graduacao, id_pessoa) 
					values (1, 2, 0, 4, 1),
					(1, 2, 0, 0, 2),
					(1, 0, 0, 0, 3),
					(1, 2, 3, 4, 4);
-- editando formacao
update formacao set tecnico = 0 where id = 1;
				