use Empresa;
GO;

CREATE PROCEDURE seleciona_produto2 AS
SELECT * FROM produtos

EXEC seleciona_produto2;
GO;

CREATE PROCEDURE estoqueBaixo 
@estoque int 
AS
	SELECT produtos.*, marcas.nome_marca
	FROM produtos LEFT JOIN marcas
	ON marcas.marca_id = produtos.prod_id
	WHERE qtd_estoque < @estoque

EXEC estoqueBaixo 100;

DECLARE @estoqueMinimo int 
SET @estoqueMinimo = 100;
EXEC estoqueBaixo @estoqueMinimo;

CREATE TABLE Lucro(
	id identity
	nomeProduto
);


GO;

CREATE PROCEDURE novoLapis
	@nomeProduto varchar(50),
	@qtdEstoque int,
	@data_fabricacao date,
	@perecivel bit,
	@valor decimal(10,2)
AS
	DECLARE @estoqueMin AS int, 
			@lucro AS decimal(10,2), 
			@minhaMarca AS int;
	SET @estoqueMin = 50;
	SET @lucro = @valor + 10;
	SET @minhaMarca = (SELECT marcas.marca_id 
					   FROM marcas 
					   WHERE marcas.nome_marca = 'Faber Castel');
	INSERT INTO produtos
	VALUES (@nomeProduto, 
			@qtdEstoque, 
			@estoqueMin, 
			@data_fabricacao, 
			@perecivel, 
			@valor, 
			@minhaMarca);

	INSERT INTO Lucro
	VALUES (@nomeProduto, 
		    @lucro);

CREATE TABLE Lucro (
	lucro_id		int identity primary key,
	nome_produto	varchar(50)		not null,			
	lucro_produto	decimal(10,2)		
);

EXEC novoLapis 'Lápis X', 10, '2016-03-03', 0, 10.5;

EXEC novoProduto 'Borracha Y', 30, '2023-01-01', 0, 20.5;

SELECT * FROM produtos 
WHERE produtos.nome_prod LIKE 'Lápis X';
SELECT * FROM Lucro;


EXEC sp_rename 'novoLapis', 'sp_novoLapis';
EXEC sp_helptext novoLapis;
EXEC sp_monitor;
EXEC sp_server_info;
EXEC sp_helpdb;
EXEC sp_datatype_info;
EXEC sp_helplanguage;
EXEC sp_helpindex Produtos;
EXEC sp_helpconstraint Produtos;
EXEC sp_depends Produtos;
EXEC sp_who;
EXEC sp_who2;
EXEC sp_tables;
EXEC sp_databases;
EXEC sp_rename 'Produtos', 'Produtos1';

exec novoLapis