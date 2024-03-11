create database lojaLegal;
use lojaLegal;

create table caixa(
	dia	date,
	saldo_inicial decimal(10,2),
	saldo_final decimal(10,2)
);

create table vendas(
	id int primary key,
	dia date,
	valor decimal(10,2)
);

insert into caixa values ('2023-05-30', 100, 100);
select * from caixa;
GO;

CREATE TRIGGER atualizaCaixa
ON vendas
FOR INSERT
AS
BEGIN
	DECLARE @valor decimal(10,2), @dia date
	SELECT @dia = dia, @valor = valor FROM INSERTED
	UPDATE caixa SET saldo_final = saldo_final + @valor
	WHERE dia = @dia;
END

insert into vendas values (3, '2023-05-30', 20);


select * from vendas;
select * from caixa;

insert into vendas values (2, '2023-05-30', 20);

CREATE TRIGGER ImpedirDeleteSemWhere
BEFORE DELETE ON vendas
FOR EACH ROW
BEGIN
    DECLARE rowCount INT;
    SELECT COUNT(*) INTO rowCount FROM vendas;
    IF rowCount <= 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é permitido executar DELETE sem cláusula WHERE.';
    END IF;
END;
Go;

CREATE TRIGGER deleteSemWhere ON vendas
FOR UPDATE, DELETE AS 
BEGIN   
    DECLARE 
        @Linhas_Alteradas INT = @@ROWCOUNT,
        @Linhas_Tabela INT = (
		SELECT SUM(row_count) 
		FROM sys.dm_db_partition_stats 
		WHERE [object_id] = OBJECT_ID('vendas') AND (index_id <= 1)
		)
 
    IF (@Linhas_Alteradas >= @Linhas_Tabela)
    BEGIN 
        ROLLBACK TRANSACTION; 
        RAISERROR ('Operações de DELETE e/ou UPDATE 
		sem cláusula WHERE não são permitidas 
		na tabela "vendas"', 15, 1); 
        RETURN;
    END   
END; 
GO

delete from vendas;

