use loja;

select * from venda;

drop procedure gerar_comissao;
alter table venda add column vl_comissao float(5,2);

desc venda;

call gerar_comissao('2015-01-01','2015-05-30' ,@a);
select @a;

select * from vendedor v ;

INSERT INTO loja.vendedor
(codigo_vendedor, id, nome, razao_vende, telefone, n_porcvende)
VALUES('0001', 1, 'CARLOS FERNANDES', 'CARLOS FERNANDES LTDA', '(47) 7535-8144', 12.0);
