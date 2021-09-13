create table fornecedor(
	id int not null auto_increment,
	nome varchar(100),
	primary key(id)
);

create table produto(
	id int not null auto_increment,
	descricao varchar(100),
	id_fornecedor int,
	primary key(id)
);

insert into produto(descricao) values('scarpin');
insert into produto(descricao) values('sapato');
insert into produto(descricao) values('tenis');
insert into produto(descricao) values('bota');
insert into produto(descricao) values('sapato social');
insert into produto(descricao) values('sapato social com bico fino');

select * from produto;

insert into fornecedor (nome) values('arezzo');
insert into fornecedor (nome) values('mizuno');
insert into fornecedor (nome) values('capodarte s/a');

select * from fornecedor;

alter table produto add constraint fk_produto_fornecedor foreign key (id_fornecedor)
		references fornecedor(id);

-- com o IN na clausula where posso atualizar mais de um registro
	-- update produto set id_fornecedor = 3 where id in (4, 5);
update produto set id_fornecedor = 3 where id = 5;

-- altera o atributo para colocar como obrigatorio
alter table produto modify id_fornecedor int not null;

-- adicionando atributos do fornecedor
alter table fornecedor add column codigo_fornecedor varchar(10);
alter table fornecedor add column razao_social varchar(100);
alter table fornecedor add column telefone varchar(20);

-- removendo atributos
alter table fornecedor drop column razao_vende;

-- adicionando atributos do produto
alter table produto add column codigo_produto varchar(20);
alter table produto add column valor float(10,2);
alter table produto add column situacao varchar(1);

desc produto;
