DELIMITER $$
CREATE TRIGGER tInsert_req after insert on requisicao
for each row
begin
insert into log values(USER(), "Inserção", "requisicao", curdate());
end $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER tupdate_req after update on requisicao
for each row
begin
insert into log values(USER(), "Atualização", "requisicao", curdate());
end $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER tInsert_equipamento after insert on equipamento
for each row
begin
insert into log values(USER(), "Inserção", "equipamento", curdate());
end $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER tupdate_equipamento after update on equipamento
for each row
begin
insert into log values(USER(), "Atualização", "equipamento", curdate());
end $$
DELIMITER ;