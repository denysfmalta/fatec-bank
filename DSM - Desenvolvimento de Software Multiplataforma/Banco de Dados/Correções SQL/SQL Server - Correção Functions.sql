use Aula;
drop database Universidade;

create database Universidade;
use Universidade;

create table Alunos (
	ra			int				primary key,
	nome		varchar(60)		not null,
	email		varchar(80),
	endereco	varchar(200)
);

create table Areas (
	id			int 			primary key 	identity,
	nome		varchar(60)		not null		unique,
	descricao	varchar(200)
);

create table Cursos (
	id			int 			primary key 	identity,
	nome		varchar(60)		not null,
	carga_h		int,

	area_id		int,

	foreign key (area_id) references Areas(id)
);

create table Matriculas (
	id			int				primary key		identity,
	data		date			not null,	
	status		int				not null,  --  1=Ativo, 2=Concluído -1=Trancado -2=Jubilado
	aluno_ra	int,
	curso_id	int,

	foreign key (aluno_ra) references Alunos(ra),
	foreign key (curso_id) references Cursos(id)
);


create table Professores (
	id			int 			primary key 	identity,
	nome		varchar(60)		not null,
	titulacao	varchar(20)

);

create table Disciplinas (
	id			int 			primary key 	identity,
	nome		varchar(60)		not null,
	carga_h		int,
	curso_id	int,

	foreign key (curso_id) references Cursos(id)
);


create table Matricula_Disciplina (
	matr_id		int,
	disc_id		int,

	data		date,
	situacao	int,	-- 0=Reprovado, 1=Aprovado

	foreign key (matr_id) references Matriculas(id),
	foreign key (disc_id) references Disciplinas(id)
);

create table Prof_Disciplina (
	id			int 			primary key 	identity,

	ano			int,
	semestre	int,

	prof_id		int,
	disc_id		int,

	foreign key (prof_id) references Professores(id),
	foreign key (disc_id) references Disciplinas(id)
);
GO;


--1 – Crie uma função que ao inserir um aluno 
--deve ter seu endereço gerado automaticamente no 
--seguinte formato: nome.sobrenome@dominio.com​

declare @nome_completo AS varchar(30), @primeiro_nome AS varchar(30)
set @primeiro_nome = (SELECT SUBSTRING('Marcio Maestrelo Funes', 1, CHARINDEX(' ', 'Marcio Maestrelo Funes' + ' ') - 1));
print @primeiro_nome
Go;

create function criaEmailAluno(
	@primeiro_nome AS varchar(30), 
	@ultimo_nome AS varchar(30)
)
returns varchar(80) AS
begin
	DECLARE @end_email AS varchar(30);
			
	set @end_email  = concat(@primeiro_nome, '.', @ultimo_nome, '@universidade.com.br');
	
	return @end_email;
end
GO;

declare @email varchar(80)
set @email = dbo.criaEmailAluno('ana', 'braga');

insert into Alunos values (
			 1234, 
			'Ana Maria Braga', 
			 @email, 
			'Rua Globo 123');​

select * from Alunos;
Go;

Select  Nome, 
'Primeiro nome' = Left(Nome, CharIndex(' ', Nome) - 1),
'Último nome'   = Reverse(Left(Reverse(Nome), CharIndex(' ', Reverse(Nome)) - 1))
From Alunos

create function criaEmailAlunoTop(
	@nomeCompleto AS varchar(30)
)
returns varchar(80) AS
begin
	DECLARE @primeiro_nome AS varchar(30), @ultimo_nome AS varchar(30), @end_email AS varchar(30);
	set @primeiro_nome = Left(@nomeCompleto, CharIndex(' ', @nomeCompleto) - 1);
	set @ultimo_nome = Reverse(Left(Reverse(@nomeCompleto), CharIndex(' ', Reverse(@nomeCompleto)) - 1));
	set @end_email  = concat(@primeiro_nome, '.', @ultimo_nome, '@universidade.com.br');
	
	return @end_email;
end

--3- Crie uma função que recebe o nome de um curso 
--e sua área, em seguida retorna o id do curso.​

CREATE FUNCTION ObterIdCurso(
	@nomeCurso varchar(60), 
	@nomeArea varchar(60)
)
RETURNS int AS
BEGIN
    DECLARE @cursoId int

    SELECT @cursoId = C.id
    FROM Cursos C INNER JOIN Areas A 
	ON C.area_id = A.id
    WHERE C.nome = @nomeCurso AND A.nome = @nomeArea

    RETURN @cursoId
END

-- Inserir áreas
INSERT INTO Areas (nome, descricao)
VALUES ('Ciências Exatas', 'Área que engloba disciplinas como Matemática, Física e Química');

INSERT INTO Areas (nome, descricao)
VALUES ('Ciências Humanas', 'Área que engloba disciplinas como História, Sociologia e Filosofia');

-- Inserir cursos
INSERT INTO Cursos (nome, carga_h, area_id)
VALUES ('Engenharia de Software', 360, (SELECT id FROM Areas WHERE nome = 'Ciências Exatas'));

INSERT INTO Cursos (nome, carga_h, area_id)
VALUES ('Ciências Sociais', 300, (SELECT id FROM Areas WHERE nome = 'Ciências Humanas'));

select * from Cursos;
select * from Areas;

select dbo.ObterIdCurso('Engenharia de Software', 'Ciências Exatas');

DECLARE @nomeCurso varchar(60) = 'Engenharia de Software'
DECLARE @nomeArea varchar(60) = 'Ciências Exatas'
DECLARE @cursoId int
SELECT @cursoId = dbo.ObterIdCurso(@nomeCurso, @nomeArea)
PRINT @cursoId
​

--3 - Crie uma procedure que recebe os dados do aluno 
--e de um curso e faz sua matrícula. Caso o aluno já esteja 
--matriculado em um curso, essa matrícula não pode ser realizada.
CREATE PROCEDURE RealizarMatricula
    @ra int,
    @nomeAluno varchar(60),
    @email varchar(80),
    @endereco varchar(200),
    @nomeCurso varchar(60)
AS
BEGIN
    -- Verificar se o aluno já está matriculado em algum curso
    IF EXISTS (SELECT 1 FROM Matriculas WHERE aluno_ra = @ra)
    BEGIN
        RAISERROR('O aluno já está matriculado em um curso.', 16, 1)
        RETURN
    END

    -- Inserir o aluno na tabela Alunos
    INSERT INTO Alunos (ra, nome, email, endereco)
    VALUES (@ra, @nomeAluno, @email, @endereco)

    -- Obter o ID do curso
    DECLARE @cursoId int
    SELECT @cursoId = id FROM Cursos WHERE nome = @nomeCurso

    -- Inserir a matrícula na tabela Matriculas
    INSERT INTO Matriculas (data, status, aluno_ra, curso_id)
    VALUES (GETDATE(), 1, @ra, @cursoId)

    PRINT 'Matrícula realizada com sucesso.'
END

DECLARE @email varchar(80)
SET @email = dbo.criaEmailAluno('silvio', 'santos');

EXEC RealizarMatricula	22, 'Silvio Santos',
                        @email, 'Rua do SBT 34', 
						'Engenharia de Software';

select * from 
Matriculas inner join Alunos on
Matriculas.aluno_ra = Alunos.ra;

--Backup
BACKUP DATABASE 
Universidade 
TO  DISK = 
'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Universidade.bak' 
WITH FORMAT 

--Backup MySQL
--mysqldump -u root -p root > C:\MySQLBackup\Universidade.sql



