#use cenarioc;
create user funcionario identified by '123456';

grant update, select on cenarioc.requisicao to funcionario;
grant update, select on cenarioc.equipamento to funcionario;

#privilégios de utentes
create user utente identified by '132465';

grant select on cenarioc.requisicao to utente;
grant select on cenarioc.equipamento to utente;

#privilégios de responsavel do departamento
create user responsável_do_departamento identified by '051997';

grant update(aprovacao) on cenarioc.requisicao_utente to responsável_do_departamento;

show grants for current_user;

