use demo;
 -- Script de revisao muitos para muitos
select * from produto p 

create table produto(
	codigo int not null auto_increment primary key,
	descricao_produto varchar(50)	
);

insert into produto(DESCRICAO_PRODUTO)
             VALUES('Feijao'),
             ('arroz'),
             ('carne de frango'),
             ('macarrao'),
             ('lentilha'),
            ('polvilho'); 

insert into produto(DESCRICAO_PRODUTO)
             VALUES('Feijao carioquinha'),
             ('Feijao branco'),
             ('Feijao marrom');


create table FORNECEDOR(
    CODIGO_FORNECEDOR INT not null auto_increment primary key,
    NOME_FORNECEDOR VARCHAR(100) not null,
    CNPJ VARCHAR(20)
);

-- um produto so pode TER UM E SOMENTE UM FORNECEDOR 

UM PARA MUITOS
FORNECEDOR        ---->     PRODUTO
        1                    N

insert into FORNECEDOR(NOME_FORNECEDOR)
            VALUES('mazer');
          
insert into FORNECEDOR  VALUES(2,'casas bahia', '849.443334-430');
insert into FORNECEDOR  VALUES(3,'pchau', '94.85439-84');
insert into FORNECEDOR  VALUES(4,'terabyte', '843.4939483-48');
insert into FORNECEDOR  VALUES(5,'magalu', '38.3984784-309');
insert into FORNECEDOR  VALUES(-10,'ajuste-base', '0000.00000-00');
insert into produto  VALUES(12,'memoria kingston 16gb',5);


-- MUITOS PARA MUITOS 
-- muitos fornecedores fornecendo muitos produtos
-- muitos produtos sao fornecidos por varios
-- fornecedores
select * from PRODUTO;
select * from fornecedor_produto;
select * from FORNECEDOR;

-- um produto pode TER MAIS DE UM FORNECEDOR 
MUITOS PARA MUITOS

FORNECEDOR        ---->     PRODUTO
        N                    N



create table fornecedor_produto(
    codigo_fornecedor int not null,
    codigo_produto int not null
);


insert into produto(descricao_produto)
values('memoria corsair 16bg'),
('memoria kingston 16gb')

insert into fornecedor_produto(codigo_fornecedor, codigo_produto)
values (3,    10),
       (4,    10),
       (3,    11),
       (5,    12);
       
      
select p.descricao_produto, f.NOME_FORNECEDOR from fornecedor_produto fp 
inner join produto p on p.codigo = fp.codigo_produto
inner join fornecedor f on f.CODIGO_FORNECEDOR = fp.codigo_fornecedor;

-- Criar modelagem de 1 para n com fornecedor e produtos

alter table produto add constraint fk.produto_fornecedor foreign key (CODIGO_FORNECEDOR)
		references fornecedor(CODIGO_FORNECEDOR);
	
alter table produto add column codigo_fornecedor int not null;
alter table produto drop column id_fornecedor;



update produto set codigo_fornecedor = -10 where codigo in(1,2,3,4,5,6,7,8,9);
update produto set codigo_fornecedor = 4 where codigo=10;
update produto set codigo_fornecedor = 3 where codigo=11;

drop table fornecedor_produto;









use demo;
desc produto;
select * from produto;
alter table produto add column preco_produto float(5,2);


















