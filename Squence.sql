create sequence seq_cliente
start with 1
increment by 1
maxvalue 1000
minvalue 1
nocache
cycle;

drop sequence seq_cliente
----------------
create table cliente (
id number,
nome varchar2(100),
constraint pk_cliente primary key(id)
);

create table cliente2 (
id number generated always as identity,
nome varchar2(100),
constraint pk_cliente2 primary key(id)
);

drop table cliente

CREATE or replace trigger trg_cliente
BEFORE INSERT ON cliente
FOR EACH ROW
    BEGIN
        :new.id := seq_cliente.nextval;
    END;
    
insert into cliente2 (nome) values ('Teste');

select * from cliente2

delete from cliente
delete from cliente2
