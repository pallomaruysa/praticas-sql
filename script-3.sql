use loja;

-- adicionando fk em item_venda -> produto
alter table item_venda add constraint fk_item_venda_produto foreign key (id_produto)
		references produto(id);
	
-- removendo FK de uma tabela
alter table item_venda drop constraint item_venda_ibfk_1;
	
		
-- adicionando fk em venda -> cliente
alter table venda add constraint fk_venda_cliente foreign key (id_cliente)
		references cliente(id);
		
-- adicionando fk em venda -> fornecedor
alter table venda add constraint fk_venda_fornecedor foreign key (id_fornecedor)
		references fornecedor(id);

-- adicionando fk em venda -> vendedor
alter table venda add constraint fk_venda_vendedor foreign key (id_vendedor)
		references vendedor(id);