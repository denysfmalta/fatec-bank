drop database if exists PetShop3;  -- Remove o banco de dados, caso exista
create database PetShop3;          -- Cria o banco de dados
use PetShop3;                      -- Seleciona o banco para os próximos comandos

create table Especies (
    id                integer             primary key identity,
    nome            varchar(50)            unique  not null,
    alimentacao        varchar(20)
);

create table Animais (
    id                integer             primary key identity,
    nome            varchar(50)         not null,
    data_nasc        date                 not null,
    peso            decimal(10,2)        check (peso > 0),
    cor                varchar(50),

    especie_id        int                    references Especies(id)
);


insert into Especies (nome, alimentacao) values ('gato'			, 'carnívoro');
insert into Especies (nome, alimentacao) values ('cachorro'		, 'carnívoro');
insert into Especies (nome, alimentacao) values ('morcego'		, 'onívoro');
insert into Especies (nome, alimentacao) values ('rato'			, 'onívoro');
insert into Especies (nome, alimentacao) values ('ramister'		, 'herbívoro');
insert into Especies (nome, alimentacao) values ('baleia'			, 'carnívoro');
insert into Especies (nome, alimentacao) values ('sardinha'		, 'herbívoro');
insert into Especies (nome, alimentacao) values ('bacalhau'		, 'herbívoro');
insert into Especies (nome, alimentacao) values ('tubarão'		, 'carnívoro');
insert into Especies (nome, alimentacao) values ('lambari'		, 'herbívoro');
insert into Especies (nome, alimentacao) values ('corvina'		, 'herbívoro');
insert into Especies (nome, alimentacao) values ('iguana'			, 'herbívoro');
insert into Especies (nome, alimentacao) values ('camaleão'		, 'herbívoro');
insert into Especies (nome, alimentacao) values ('lagarto'		, 'herbívoro');
insert into Especies (nome, alimentacao) values ('cobra'			, 'carnívoro');
insert into Especies (nome, alimentacao) values ('cacatua'		, 'herbívoro');
insert into Especies (nome, alimentacao) values ('pardal'			, 'onívoro');
insert into Especies (nome, alimentacao) values ('bentevi'		, 'herbívoro');
insert into Especies (nome, alimentacao) values ('canario'		, 'herbívoro');

insert into Especies (nome, alimentacao) values ('virus'			, null);
insert into Especies (nome, alimentacao) values ('bactéria'		, null);

insert into Especies (nome) values ('barata');
insert into Especies (nome) values ('carcará');
insert into Especies (nome) values ('polvo');
insert into Especies (nome) values ('nautilus');



insert into Animais values ('ágata'		, '2015-4-9', 13.9, 'branco' , 1);
insert into Animais values ('félix'		, '2016-6-6', 14.3, 'preto'  , 1);
insert into Animais values ('tom'			, '2013-2-8', 11.2, 'azul'   , 1);
insert into Animais values ('garfield'	, '2015-7-6', 17.1, 'laranja', 1);
insert into Animais values ('frajola'		, '2013-8-1', 13.7, 'preto'  , 1);
insert into Animais values ('manda-chuva'	, '2012-2-3', 12.3, 'amarelo', 1);
insert into Animais values ('snowball'	, '2014-4-6', 13.2, 'preto'  , 1);
insert into Animais values ('ágata'		, '2015-8-3', 11.9, 'azul' 	 , 1);
insert into Animais values ('ágata'		, '2016-3-4', 18.6, 'roxo'  , 1);
insert into Animais values ('gato de botas', '2012-12-10', 11.6, 'amarelo', 1);


insert into Animais values ('bola de pelo', '2020-04-06', 11.6, 'amarelo', 2);
insert into Animais values ('milu'		, '2013-2-4', 17.9, 'branco'  , 2);
insert into Animais values ('pluto'		, '2012-1-3', 12.3, 'amarelo' , 2);
insert into Animais values ('pateta'		, '2015-5-1', 17.7, 'preto'   , 2);
insert into Animais values ('snoopy'		, '2013-7-2', 18.2, 'branco'  , 2);
insert into Animais values ('bidu'		, '2012-9-8', 12.4, 'azul'    , 2);
insert into Animais values ('dum dum'		, '2015-4-6', 11.2, 'laranja' , 2);
insert into Animais values ('muttley'		, '2011-2-3', 14.3, 'laranja' , 2);
insert into Animais values ('scooby'		, '2012-1-2', 19.9, 'marrom'  , 2);
insert into Animais values ('rufus'		, '2014-4-5', 19.7, 'branco'  , 2);
insert into Animais values ('costelinha'	, '2016-5-2', 13.4, 'branco'  , 2);
insert into Animais values ('coragem'		, '2013-7-8', 12.2, 'vermelho', 2);
insert into Animais values ('jake'		, '2012-2-7', 11.6, 'vermelho', 2);
insert into Animais values ('k900'		, '2012-11-25', 11.6, 'amarelo', 2);
insert into Animais values ('gato de botas', '2012-11-25', 11.6, 'amarelo', 2);


insert into Animais values ('jerry'		, '2010-2-4', 06.6, 'laranja', 4);
insert into Animais values ('ligeirinho'	, '2011-5-3', 04.4, 'amarelo', 4);
insert into Animais values ('mikey'		, '2012-7-1', 02.2, 'preto'  , 4);
insert into Animais values ('minie'		, '2013-9-3', 03.2, 'preta'  , 4);
insert into Animais values ('topo gigio'	, '2016-6-8', 05.5, 'amarelo', 4);

insert into Animais values ('bafo de onça', '2016-6-8', 05.5, 'amarelo', null);
insert into Animais values ('susan murphy', '2016-6-8', 05.5, 'amarelo', null);
insert into Animais values ('insectosauro', '2016-6-8', 05.5, 'amarelo', null);
insert into Animais values ('gallaxhar'   , '2016-6-8', 05.5, 'amarelo', null);
insert into Animais values ('hathaway'    , '2016-6-8', 05.5, 'amarelo', null);

insert into Animais values ('tutubarão'	, '2010-2-6', 101.9 , 'branca' , 9);
insert into Animais values ('prof. pardal', '2012-4-4', 1.7   , 'amarelo', 17);
insert into Animais values ('mobie'		, '2014-5-2', 5069.4, 'branca' , 6);
insert into Animais values ('batman'		, '2013-7-1', 96.1  , 'preto'  , 3);   

	
--SQL BASE
--UPDATE Animais SET;
SELECT * FROM Animais;

--Altere o nome do Pateta para Goofy;​
SELECT * FROM Animais WHERE nome = 'Goofy';

UPDATE Animais 
SET nome = 'Goofy' 
WHERE nome = 'Pateta';

--Altere o peso do Garfield para 10 kilogramas;​
UPDATE Animais 
SET peso = 10 
WHERE nome = 'Garfield';

SELECT * FROM Animais WHERE nome = 'Garfield';

--Altere a cor de todos os gatos para laranja;​
SELECT * FROM 
Animais JOIN Especies ON
Animais.id = Especies.id WHERE
Especies.nome = 'gato';

UPDATE Animais 
SET cor = 'laranja' 
FROM Animais JOIN Especies 
ON Animais.id = Especies.id 
WHERE Especies.nome = 'gato';

--Crie um campo altura para os animais;​
SELECT * FROM Animais;
ALTER TABLE Animais ADD altura DECIMAL(5,2);
--ALTER TABLE Animais ADD COLUMN altura DECIMAL(5,2); MySQL

--Crie um campo observação para os animais;​
SELECT * FROM Animais;
ALTER TABLE animais ADD observacao TEXT;

--Remova todos os animais que pesam mais que 200 kilogramas.​
SELECT * FROM Animais WHERE peso > 200;
DELETE FROM Animais WHERE peso > 200;

--Remova todos os animais que o nome inicie com a letra ‘C’.​
SELECT * FROM Animais WHERE nome LIKE 'C%';
DELETE FROM animais WHERE nome LIKE 'C%';

--Remova o campo cor dos animais;​
SELECT * FROM Animais;
ALTER TABLE Animais DROP COLUMN cor;

--Aumente o tamanho do campo nome dos animais para 80 caracteres;​
ALTER TABLE Animais ALTER COLUMN nome varchar(80);
SELECT * FROM INFORMATION_SCHEMA.COLUMNS;

--Remova todos os gatos e cachorros.​
SELECT * FROM Animais join Especies ON
Animais.id = Especies.id WHERE
Especies.nome in ('gato', 'cachorro');

DELETE Animais FROM Animais INNER JOIN Especies ON
Animais.id = Especies.id WHERE 
Especies.nome in ('gato', 'cachorro');

--Remova o campo data de nascimento dos animais​
SELECT * FROM Animais;
ALTER TABLE Animais DROP COLUMN data_nasc;

--Remova a tabela especies.​
SELECT * FROM Especies;
DROP TABLE Especies;

--Remova todos os animais.
SELECT * FROM Animais;
DROP TABLE Animais;



--SQL BASE


--Altere o nome do Pateta para Goofy;​

--Altere o peso do Garfield para 10 kilogramas;​

--Altere a cor de todos os gatos para laranja;​

--Crie um campo altura para os animais;​

--Crie um campo observação para os animais;​

--Remova todos os animais que pesam mais que 200 kilogramas.​

--Remova todos os animais que o nome inicie com a letra ‘C’.​

--Remova o campo cor dos animais;​

--Aumente o tamanho do campo nome dos animais para 80 caracteres;​

--Remova todos os gatos e cachorros.​

--Remova o campo data de nascimento dos animais​

--Remova a tabela especies.​

--Remova todos os animais.



