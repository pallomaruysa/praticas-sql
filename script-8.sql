delimiter $$

create procedure gerar_comissao(in data_inicial date,     -- parametro de entrada

                                in data_final date    ,    -- parametro de entrada

                                out total_processado int) -- parametro de saida

    begin        

        

        declare venda         int default 0;

        declare total_venda float(10,2) default 0;

        declare vendedor     int default 0;

        declare    vl_comissao float(5,2) default 0;

        declare    valor_total_comissao float(10,2) default 0;

        declare aux         int default 0;

        declare fimloop     int default 0;

        

        -- declaro que o query é cursor "vai virar um laco de repeticao"

        declare buscar_pedido cursor for

        select     codigo_venda,

                total,

                id_vendedor

        from     venda v 

        where     data_venda between data_inicial and data_final

        and v.total > 0;

    



        -- Faço aqui um tratamento para o banco não 

        -- executar o loop quando ele terminar

        -- evitando que retorne qualquer erro

        declare 

        continue handler -- --> manipulador

        for sqlstate '02000' 

        set fimloop  = 1;    

        

        -- cursor É USADO PARA PERCORRER UMA LISTA igual ao for do java

        open buscar_pedido;    

            ## inicio do loop

            vendas: loop

            

            

            -- Aqui verifico que se o loop terminou

            -- e saio do loop

            if fimloop  = 1 then 

              leave  vendas;

            end if;

            

            -- atribuir o retorno do select para as variaveis abaixo

            fetch buscar_pedido into venda, total_venda, vendedor;

    

            -- busco o valor do percentual de cada vendedor

            select     n_porcvende

            into    vl_comissao 

            from     vendedor

            where     id = vendedor;

            

            if(vl_comissao > 0 ) then

                -- calcula a comissao do vendedor em cima do total buscado

                set valor_total_comissao = ((total_venda * vl_comissao) / 100);

                    

                update     venda 

                set     vl_comissao = valor_total_comissao

                where     codigo_venda = venda;

                

                commit;

            

            elseif (vl_comissao = 0 ) then

            

                update     venda 

                set     vl_comissao = 0

                where     codigo_venda = venda;

                commit;

        

            else 

                set vl_comissao = 1;

                set valor_total_comissao = ((total_venda * vl_comissao) / 100);

    

                update     venda 

                set     vl_comissao = valor_total_comissao

                where     codigo_venda = venda;

                commit;            

            

            end if;

                set vl_comissao = 0;

                -- utilizo a variável aux para contar a quantidade

                set  aux      = aux +1 ;

        end loop vendas;

                -- atribuo o total de vendas para a variável de

                -- saída

        set total_processado = aux;

        -- fecho o cursor

        close buscar_pedido;        

    end$$

delimiter ;