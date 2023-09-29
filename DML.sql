--DML

--INSERT
--UPDATE
--DELETE
--COMMIT
--ROLLBACK

----Corrigindo um erro na tabela
ALTER TABLE T_SIP_PROJETO RENAME COLUMN dt_inciio TO dt_inicio

--------------INSERT EXEPMLO--------------
INSERT INTO NomeTabela
(NomeColuna, NomeColuna2)
    values
    (Valor,Valo2)

--------------UPDATE EXEPMLO--------------
UPDATE NomeTabela
    SET NomeColuna = valor,
    NomeColuna2 = valor2,
        WHERE condição

--------------DELETE EXEPMLO--------------

DELETE FROM NomeTabela
    WHERE condição

------------------------------------------

--DAta no Oracle
TO_DATE('22/09/2023 22:20:12','DD/MM/YYYY HH24:MI:SS')
--Ou
TO_DATE('22-09:23 22-20/12','DD-MM:YY HH24-MI/SS')
--Ou
TO_DATE('22/FEV/2023 22:20:12','DD/MON/YYYY HH24:MI:SS')

--------------INSERT PRATICO--------------

INSERT INTO T_SIP_DEPTO (CD_DEPTO,NM_DEPTO,SG_DEPTO)
    VALUES (1,'FINANCEIRO','FIN');
COMMIT; --Manda sua alteração para o banco


---- Sem as colunas, é preciso escrever na ordem que as colunas estão na Tabela
INSERT INTO T_SIP_DEPTO
    VALUES (2,'RECURSOS HUMANO','RH');
COMMIT;

---
INSERT INTO T_SIP_DEPTO
    VALUES (4,'MARKETING','MKT');
ROLLBACK; --Volta até o ultimo commit, toda vez que vc usa o DDl, ele commita automaticamente

---
INSERT INTO T_SIP_PROJETO 
    VALUES (1,'FIAP 01'
    ,TO_DATE('01/01/2000','DD/MM/YYYY')
    ,TO_DATE('22/09/2023','DD/MM/YYYY')
    );
COMMIT;

---
INSERT INTO T_SIP_FUNCIONARIO 
    VALUES (12345
    ,1
    ,'MARIA DA SLVA'
    ,TO_DATE('02/05/1965','DD/MM/YYYY')
    ,TO_DATE('02/05/1990','DD/MM/YYYY')
    ,4856.52
    );
COMMIT;

---Inserindo no T_SIP_PROJETO, como não estou passando a dt_termino, sou OBRIGADO a passar as colunas
INSERT INTO T_SIP_PROJETO (CD_PROJETO, NM_PROJETO, DT_INICIO)
    VALUES (2,'FIAP 02'
    ,TO_DATE('02/02/2002','DD/MM/YYYY')
    );
COMMIT;

---
INSERT INTO T_SIP_PROJETO (CD_PROJETO, NM_PROJETO, DT_INICIO)
    VALUES (3,'FIAP 03'
    ,TO_DATE('03/03/2003','DD/MM/YYYY')
    );
COMMIT;

--- Passando os dados de uma tabela para outra
CREATE TABLE T_SIP_COPY_PROJETO AS
SELECT * FROM T_SIP_PROJETO WHERE 1=2; --Assim estou puxando apenas as colunas, pois nunca 1 sera igual a 2, porem assim, nao crio nenhuma Primary Key ou Foregin key ou Unique, apenas os Checks,

INSERT INTO T_SIP_COPY_PROJETO
(SELECT * FROM T_SIP_PROJETO WHERE DT_TERMINO IS NOT NULL) --Pegando todos os dados da tabela T_SIP_PROJETO aonde o dt_termino tenha data


--------------UPDATE PRATICO--------------
--- SEMPRE use o WHERE no update
UPDATE T_SIP_FUNCIONARIO
    SET NM_FUNCIONARIO = 'MARIA DA SILVA CORREIA'
        ,DT_NASCIMENTO = TO_DATE('01/02/1988','DD/MM/YYYY')
    WHERE NR_MATRICULA = 12345;
COMMIT;

---Atualizar o Salario com Dissidio de 5%
UPDATE T_SIP_FUNCIONARIO
    SET VL_SALARIO = VL_SALARIO * 1.05
    WHERE NR_MATRICULA = 12345;
COMMIT;

--- Update com SUBSELECT
UPDATE T_SIP_PROJETO
    SET DT_TERMINO = (SELECT DT_TERMINO 
                        FROM T_SIP_COPY_PROJETO
                        WHERE CD_PROJETO = 1)
WHERE DT_TERMINO IS NULL;
COMMIT;

--------------DELETE PRATICO--------------
DELETE FROM T_SIP_FUNCIONARIO
WHERE CD_DEPTO = 1
ROLLBACK;













