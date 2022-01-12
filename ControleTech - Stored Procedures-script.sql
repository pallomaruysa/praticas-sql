delimiter //
create procedure gerar_salario_total(in vandas_realizadas_em_dinheiro float(11,2),
						 			 in salario float(11,2),
						 			 in porcent_comissao int,
						 			 out salario_total float(11,2))
						 
begin 
	 	declare comissao_total float(11,2) default 0;
	 	declare soma_comissaoTotal_salario float(11,2) default 0;
	 
	 
	 	set comissao_total = vandas_realizadas_em_dinheiro * (porcent_comissao/100);
	 	
	 	set soma_comissaoTotal_salario = comissao_total + salario;
	 
	 	set salario_total = soma_comissaoTotal_salario;
	 	
end //
delimiter ;