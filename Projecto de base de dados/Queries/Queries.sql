/*Gerir o cadastro dos equipamentos existentes no CPR; os equipamentos
estão agrupados por categorias (fotografia, informática, multimédia,
cinema, etc.)*/
create view v_categorias_equipamento as
select categoria.descCategoria as Categoria, equipamento.descEquipamento as Equipamento, equipamento.idEquipamento as ID, estado.descEstado as Estado 
from categoria, equipamento, estado
where categoria.idCategoria = equipamento.idCategoria and equipamento.idEstado = estado.idEstado order by descCategoria, descEquipamento;

select * from v_categorias_equipamento;

/*Manter informação sobre as requisições de equipamento, designadamente
a identificação de quem efetuou a requisição, o curso e departamento a
que está afeto, entre outras;*/
create view v_utente_req as
select requisicao_utente.idRequisicao, utente.nome,  utente.idUtente, estatuto.descEstatuto, curso.descCurso, departamento.descDepartamento 
from utente, curso, departamento, requisicao_utente, estatuto 
where utente.idUtente = requisicao_utente.idUtente and utente.idCurso = curso.idcurso and curso.codDepartamento = departamento.iddepartamento 
and utente.idEstatuto = estatuto.idEstatuto 
order by requisicao_utente.idRequisicao;
drop view v_utente_req;
select * from v_utente_req;
select * from v_utente_req where nome like "Diogo%";
select * from v_utente_req where descCurso like "Design%";
select * from v_utente_req where descEstatuto like "Estudante";

/*Perceber a situação em que se escontra cada equipamento num dado
memento, como por exeCALL `cenarioc`.`p_acessibilidade`();
mplo avariado, em manutenção, requisitado, etc;*/
create view v_estado_equipamentos as 
select equipamento.idEquipamento, equipamento.descEquipamento, estado.descEstado, categoria.descCategoria from equipamento, estado, categoria
where equipamento.idEstado = estado.idEstado and equipamento.idCategoria = categoria.idCategoria
group by equipamento.descEquipamento
order by equipamento.idEquipamento;

select * from v_estado_equipamentos;
select * from v_estado_equipamentos where descEstado like "Disponivel";
select * from v_estado_equipamentos where descEstado like "Requisitado";
select * from v_estado_equipamentos where descEstado like "Manutenção" or descEstado like "Avariado";

drop view v_estado_equipamentos;

/*Detalhes de cada Requisicao Aprovada*/
create view v_detalhes_requisicao as 
select requisicao.idRequisicao, equipamento.descEquipamento, utente.nome, requisicao_utente.aprovacao, estado from utente, requisicao_utente, requisicao, lista_equipamento, equipamento
where utente.idUtente = requisicao_utente.idUtente and requisicao_utente.idRequisicao = requisicao.idRequisicao and requisicao.idRequisicao = lista_equipamento.idRequisicao and 
lista_equipamento.idEquipamento = equipamento.idEquipamento order by requisicao.idRequisicao;

select idRequisicao, descEquipamento, nome from v_detalhes_requisicao;
select idRequisicao, descEquipamento, nome from v_detalhes_requisicao where aprovacao = "Aprovada";
select idRequisicao, descEquipamento,nome from v_detalhes_requisicao where aprovacao = "Em Espera";
select idRequisicao, descEquipamento,nome, estado from v_detalhes_requisicao where descEquipamento = (select descEquipamento from v_detalhes_requisicao where aprovacao = "Em Espera");

/*numero de requisiçoes*/
create view v_mais_req as
select equipamento.idEquipamento, equipamento.descEquipamento, count(lista_equipamento.idEquipamento) as numero from equipamento, lista_equipamento, requisicao_utente, requisicao
where equipamento.idEquipamento = lista_equipamento.idEquipamento and lista_equipamento.idRequisicao = requisicao.idRequisicao and requisicao_utente.idRequisicao = requisicao.idRequisicao 
and requisicao_utente.aprovacao like "Aprovada" group by equipamento.descEquipamento order by count(lista_equipamento.idEquipamento) desc, equipamento.descEquipamento;

select * from v_mais_req;


/*Estado das requisiçoes*/
create view v_estado_req as
select requisicao.idRequisicao, requisicao.estado, utente.nome from utente, requisicao_utente, requisicao
where requisicao_utente.idUtente = utente.idUtente and requisicao.idRequisicao = requisicao_utente.idRequisicao;

select * from v_estado_req where estado like "Entregue";
select * from v_estado_req where estado like "Em Curso";
select * from v_estado_req where estado like "Atrasada";


/*Requisiçoes data...*/
create view v_data_req as
select requisicao.idRequisicao, equipamento.descEquipamento, requisicao.data_levantamento, requisicao.data_entrega, nome from equipamento, requisicao, lista_equipamento, utente, requisicao_utente
where utente.idUtente = requisicao_utente.idUtente and requisicao_utente.idRequisicao = requisicao.idRequisicao and requisicao.idRequisicao = lista_equipamento.idRequisicao and 
lista_equipamento.idEquipamento = equipamento.idEquipamento order by requisicao.idRequisicao;

select idRequisicao, descEquipamento, data_levantamento, data_entrega, nome from v_data_req where data_levantamento between '2018-01-22' and '2018-01-26';
select idRequisicao, descEquipamento, data_levantamento, data_entrega, nome from v_data_req where data_levantamento < '2018-01-22';


/*disponibilidade dos equipamentos de acordo com o estatuto*/
select * from acessibilidade;



