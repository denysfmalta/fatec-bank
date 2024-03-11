create function hello()
returns varchar(30) AS
begin
	return('Hello SQL')
end
GO;

select dbo.hello() AS nome;
GO;

create function hello2(@nome varchar(30))
returns varchar(30) AS
begin
	return concat('Hello ', @nome)
end
GO;

select dbo.hello2('Marcio') AS nome;
GO;

create function soma(@a int, @b int)
returns int AS
begin
	return @a + @b 
end
GO;

select dbo.hello2('Márcio') AS nome, dbo.soma(2,2) AS soma;
GO;

CREATE DATABASE ProdutosLegais;
USE ProdutosLegais;

CREATE TABLE produtos(
	id int primary key identity,
	nome varchar(30),
	preco_custo decimal(9,2),
	preco_venda decimal(9,2)
);

INSERT INTO produtos values
			('borracha', 10, 12),
			('caderno', 20, 27),
			('caneta', 1, 5),
			('ERP', 200, 350);
GO;

CREATE FUNCTION lucro(@produto_id int)
RETURNS decimal(9,2) AS
BEGIN
	DECLARE @custo AS decimal(9,2), @venda AS decimal(9,2), @lucro AS decimal(9,2);
	SET @custo = (SELECT preco_custo FROM produtos WHERE id = @produto_id);
	SET @venda = (SELECT preco_venda FROM produtos WHERE id = @produto_id);
	SET @lucro = @custo + @venda;

	RETURN @lucro;
END
GO;

SELECT dbo.lucro(1) AS 'Lucro Borracha', 
	   dbo.lucro(2) AS 'Lucro Caderno',
	   dbo.lucro(3) AS 'Lucro Caneta', 
	   dbo.lucro(4) AS 'Lucro ERP';

declare @lucro_prod int;
set @lucro_prod = dbo.lucro(2);
print @lucro_prod;


SELECT UPPER('Fatec Franca SP');
SELECT LOWER('Fatec Franca SP');
SELECT LEN('Fatec Franca SP');
SELECT DATALENGTH(1234);
SELECT TRIM('  Fatec Franca SP     ');
SELECT REVERSE('Fatec Franca SP');
SELECT ROUND(5.1234,3);
SELECT DIFFERENCE('Teste', 'Teste');
SELECT LEFT('Fatec Franca', 3);
SELECT RIGHT('Fatec Franca', 3);
SELECT REPLACE('Fatec Franca SP', 'Franca', 'São Paulo');
SELECT REPLICATE('Fatec Franca SP', 5);
SELECT SPACE(10); --????
SELECT STUFF('Fatec Franca', 1, 5, 'Unifran');
SELECT SUBSTRING('Fatec Franca', 1, 3);
SELECT UNICODE('Atlanta');

