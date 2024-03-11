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



