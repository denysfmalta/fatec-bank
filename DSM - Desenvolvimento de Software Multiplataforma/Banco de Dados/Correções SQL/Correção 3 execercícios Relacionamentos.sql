/*
Exercício 1 - Crie um banco de dados para armazenar dados de Animais e Espécies. 
Um animal tem seu nome, data_nasc e peso. Uma espécie tem um nome e uma descrição. 

Tabela Especies: (Espécie, Descrição) (Gato, Anda em cima do telhado), 
(Cachorro, Seu melhor amigo) e (Morcego, Dorme de cabeça para baixo) 
Tabela Animais: (Animal, Espécie) (Agata, Gato), (Zé Groselha, Morcego), (Costelinha, Cachorro), 
(Bidu, Cachorro), (Garfield, Gato), (Espiga, Cachorro), (Sabugo, Cachorro) e (Escobar, Morcego). 
(A data de nascimento e o peso dos animais devem ser inventados por você) 

    Selecione todos os gatos 
    Selecione todos os cachorros 
    Selecione todos os morcegos 
    Selecione apenas o nome do animal e a descrição da espécie. 
    Selecione todos os animais que tenha ‘a’ em algum lugar de seu nome. 
    Ordene os animais do mais novo para o mais velho. 
    Ordene os animais do mais pesado para o mais leve.
*/


create database Animais_Relacionamento;  -- Cria o banco
use Animais_Relacionamento;              -- Seleciona o banco para os próximos comandos

create table Especies (
	id_especie			int			   primary key   identity,
    nome_especie		varchar(60),
	descricao_especie	varchar(200)
);

create table Animais (
	id_animais			int			   primary key   identity,
    nome_animais		varchar(60),
    data_nasc_animais	date,
    peso_animais		decimal(6,3),    
    especie_id			int			   foreign key	 references		Especies(id_especie)
);
    
insert into Especies values 
		('Gato'    , 'Anda em cima do telhado'),
		('Cachorro', 'Seu melhor amigo'),
		('Morcego' , 'Dorme de cabeça para baixo');

insert into Animais values 
		('Ágata'      , '2021-04-12', 12, 1),
		('Zé groselha', '1998-09-20', 22, 3),
		('Costelinha' , '2001-09-11', 14, 2),
		('Bidu'       , '1960-10-16', 21, 2),
		('Garfield'   , '1981-04-05', 16, 1),
		('Espiga'     , '2012-03-22', 33, 2),
		('Sabugo'     , '1999-01-03', 05, 2),
		('Escobar'    , '2010-10-10', 14, 3);

-- 1 - Selecione todos os gatos 
-- 2 - Selecione todos os cachorros 
-- 3 - Selecione todos os morcegos 
-- 4 - Selecione apenas o nome do animal e a descrição da espécie. 
-- 5 - Selecione todos os animais que tenha ‘a’ em algum lugar de seu nome. 
-- 6 - Ordene os animais do mais novo para o mais velho. 
-- 7 - Ordene os animais do mais pesado para o mais leve.
        

        
/*
Exercício 2 - Crie um banco de dados para registrar dados de Produtos e Marcas. 
Um produto deve ter, id, nome, preço de custo, preço de venda, data de validade e marca. 
Uma marca deve ter, id, nome, site oficial e telefone. 

Aplique as restrições:  
    O preço de venda sempre deve ser maior que o preço de custo 
    Nenhum campo pode ficar vazio 
    Caso não for passado uma data no cadastro o dia de hoje será o default 

Tabela Marcas: (Marca, Site) 
(Faber Castel, www.fabercastel.com.br), (Labra, www.labra.com.br) e (Mercurio, www.mercurio.com.br): 
Os telefones devems ser inventados por você. 

Tabela Produtos: (produto, preço de custo, preço de venda, marca) 
(Lápis, 21.00, 33.00, Faber Castel), (Caneta, 56.20, 60.00, Faber Castel), 
(Borracha, 23.50, 40.80, Faber Castel), (Caderno, 77.90, 80.35, Faber Castel),
(Lápis, 23.25, 18.70, Labra), (Borracha, 8.00, 9.00, Labra), (Caderno, 22.36, 25.35, Mercurio), 
(Caderno, 12.00, 13.00, Labra). 
As datas de validade devem ser inventadas por você. 

    Selecione todos os produtos da Faber Castel. 
    Selecione todos os produtos da Labra. 
    Selecione todos os produtos da Mercurio. 
    Selecione todos os produtos e ordene por validade mostrando qual vence primeiro. 
    Selecione todos os Lápis ordenando do mais caro para o mais barato no preço de venda. 
    Selecione todos os Cadernos ordenando do mais barato para o mais caro no preço de custo. 
    Selecione apenas o preço de venda e ordene do mais caro para o mais barato.  
*/
create database Empresa_Relacionamento;          -- Cria o banco
use Empresa_Relacionamento;                      -- Seleciona o banco para os próximos comandos

create table Marcas (
	id_marcas			int				primary key		identity,
    nome_marcas			varchar(40)		not null,
	site_marcas			varchar(40)		not null,
	telefone_marcas		varchar(40)		not null
);

create table Produtos (
	id_produtos			int				primary key		identity,
    nome_produtos		varchar(40)		not null,
    custo_produtos		decimal(8,2)	not null,
    venda_produtos		decimal(8,2)	not null,
	validade_produtos 	date			not null		default			getdate(),
	marca_id			int				not null		foreign key		references		Marcas(id_marcas),

	check(venda_produtos > custo_produtos) 
);

insert into Marcas values 
	('Faber Castel', 'www.fabercastel.com', '116547-6354'),
	('Labra'       , 'www.labra.com'	  , '156587-9854'),
	('Mercúrio'    , 'www.mercurio.com'	  , '436747-6864');
    
    
insert into Produtos values
	('Lápis'   , 21.00, 33.00, '2022-07-25', 1),
	('Caneta'  , 56.20, 60.00, '2026-12-12', 1),
	('Borracha', 23.50, 40.80, '2022-05-24', 1),
	('Caderno' , 77.00, 80.35, '2022-06-02', 1),
	('Lápis'   , 23.25, 18.70, '2023-10-21', 2),
	('Borracha',  8.00,  9.00, '2022-01-15', 2),
	('Caderno' , 22.36, 25.25, '2025-04-01', 3),
	('Caderno' , 12.00, 13.00, '2022-03-12', 2);
    

-- 1 - Selecione todos os produtos da Faber Castel. 
-- 2 - Selecione todos os produtos da Labra. 
-- 3 - Selecione todos os produtos da Mercurio. 
-- 4 - Selecione todos os produtos e ordene por validade mostrando qual vence primeiro. 
-- 5 - Selecione todos os Lápis ordenando do mais caro para o mais barato no preço de venda. 
-- 6 - Selecione todos os Cadernos ordenando do mais barato para o mais caro no preço de custo. 
-- 7 - Selecione apenas o preço de venda e ordene do mais caro para o mais barato.  

/*
Exercício 3 - Crie um banco de dados para registrar dados de Filmes e Categorias. 
Um filme tem seu título, sinopse, estudio e categoria. 
Uma categoria deve ter nome e público alvo. 

Aplique as restrições que julgar corretas para o contexto da modelagem. 

    Selecione todos os filmes da categoria Infantil. 
    Selecione todos os filmes da categoria Baseado em Literatura. 
    Selecione todos os filmes da categoria Ficção Ciêntifica. 
    Selecione todos os filmes do estudio Paramond. 
    Selecione todos os filmes do estudio Universal. 
    Selecione todos os filmes do estudio Fox. 
    Selecione todos os filmes que tem ou a palavra ‘morte’ ou ‘morre’ na sinopse. 
*/

create database Filmes_Relacionamento;          -- Cria o banco
use Filmes_Relacionamento;                      -- Seleciona o banco para os próximos comandos

create table Categorias (
	id_categorias			int				primary key		identity,
    nome_categorias			varchar(30)		not null		unique,
	publico_categorias		varchar(80)		not null
);

create table Estudios (
	id_estudios			int				primary key		identity,
    nome_estudios		varchar(20)		not null		unique
);

create table Filmes (
	id_filmes			int				primary key		identity,
    titulo_filmes		varchar(40)		not null,
	sinopse_filmes		varchar(200),
    
    categorias_id		int				foreign key		references		Categorias(id_categorias),
    estudios_id			int				foreign key		references		Estudios(id_estudios)
);

insert into Categorias values
	('Infantil'              , 'Crianças até 7 anos'),
	('Documentario'          , 'Pessoas a partir de 12 anos'),
	('Gore'                  , 'Adultos a partir de 21'),
	('Cursos Ditáticos'      , 'Estudantes do Ensino Médio'),
	('Ficção Ciêntifica'     , 'Pessoas a partir de 14 anos'),
    ('Baseado em Literatura' , 'Pessoas a partir de 10 anos');

insert into Estudios values
	('Paramond'),
   	('Universal'),
   	('Fox');
    
insert into Filmes values 
	('Velozes e Furiosos'    , 'Gente com pressa no trânsito'  , 1 ,2),
	('The Matrix'            , 'Pessoas desviam de balas'      , 5 ,2),
	('O Sétimo Selo'         , 'A morte joga xadrez'           , 3 ,3),
	('Metrópole'             , 'Automação industrial'          , 5 ,1),
	('Laranja Mecânica'      , null                            , 6 ,2),
	('O Alto da Compadecida' , 'Morre todo mundo'              , 6 ,1),
	('O Senhor dos Anéis'    , 'Criaturas lutam contra um anel', 6 ,3),
	('Get Back'              , 'Sobre os Beatles'              , 2 ,2);
	   
-- 1 -Selecione todos os filmes da categoria Infantil. 
-- 2 -Selecione todos os filmes da categoria Baseado em Literatura. 
-- 3 -Selecione todos os filmes da categoria Ficção Ciêntifica. 
-- 4 -Selecione todos os filmes do estudio Paramond. 
-- 5 -Selecione todos os filmes do estudio Universal. 
-- 6 -Selecione todos os filmes do estudio Fox. 
-- 7 -Selecione todos os filmes que tem ou a palavra ‘morte’ ou ‘morre’ na sinopse. 
        
    
