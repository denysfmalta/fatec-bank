drop database if exists Empresa;
create database Empresa;
use Empresa;

create table marcas (
	marca_id		int 			identity		primary key,
	nome_marca		varchar(50)		not null,			
	origem			varchar(50)		
);

create table produtos (

	prod_id			int 			identity 		primary key,
	nome_prod		varchar(50)		not null,
	qtd_estoque		int				not null 			default 0,
	estoque_mim		int 			not null			default 0,
	data_fabricacao	date            default GETDATE(),
	perecivel		bit,
	valor			decimal(10,2),
	
	marca_id		int		references marcas(marca_id)
);

create table fornecedores (
	forn_id			int 			identity 		primary key,	
	nome_forn		varchar(50)		not null,
	email			varchar(50)		
);

create table produto_fornecedor (
	prod_id			int				not null	references produtos(prod_id),
	forn_id			int				not null	references fornecedores(forn_id),
	
	primary key (prod_id, forn_id)
);

insert into fornecedores values ('Los Pollos Hermanos','frig@pollos.com.mx');
insert into fornecedores values ('Umbrella Corporation','umbrella@umbrella.com.ca');
insert into fornecedores values ('UAC','uac@uac.com.mars.dm');
insert into fornecedores values ('Huey Materiais Escolares','huey@duck.com.us');
insert into fornecedores values ('Dewey Materiais Escolares','dewey@duck.com.us');
insert into fornecedores values ('Louie Materiais Escolares','louie@duck.com.us');
insert into fornecedores values ('New Informática','ni@newinf.com.br');
insert into fornecedores values ('Meio Bit TI','meiobit@bitbit.com.br');
insert into fornecedores values ('Ze Faisca SA','ze@faisca.com.br');
insert into fornecedores values ('Facens','facens@facens.com.br');
insert into fornecedores values ('Linux','linux@linux.br');

insert into marcas (nome_marca, origem) values ('Faber Castel', 'Brasil');
insert into marcas (nome_marca, origem) values ('Labra', 'Brasil');
insert into marcas (nome_marca, origem) values ('TOTVS', 'Brasil');
insert into marcas (nome_marca, origem) values ('Multilaser', 'Brasil');
insert into marcas (nome_marca, origem) values ('ORCACLE', 'EUA');
insert into marcas (nome_marca, origem) values ('IBM', 'EUA');
insert into marcas (nome_marca, origem) values ('Microsoft', 'EUA');
insert into marcas (nome_marca, origem) values ('HP', 'EUA');
insert into marcas (nome_marca, origem) values ('Apple', 'EUA');
insert into marcas (nome_marca, origem) values ('SAP', 'Alemanha');
insert into marcas (nome_marca, origem) values ('Lenovo', 'China');
insert into marcas (nome_marca, origem) values ('ASUS', 'Taiwan');
insert into marcas (nome_marca, origem) values ('AOC', 'Taiwan');
insert into marcas (nome_marca, origem) values ('LG', 'Corea do Sul');

insert into produtos values ('lapis', 4502, 100, '2016-3-3', 0, 002.5, 1);
insert into produtos values ('lapis', 8800, 100, '2015-5-5', 0, 014.0, 2);
insert into produtos values ('borracha', 2907, 100, '2013-7-8', 0, 004.2, 1);
insert into produtos values ('borracha', 5408, 100, '2015-8-2', 0, 002.0, 2);
insert into produtos values ('caderno', 7004, 100, '2016-3-4', 0, 022.5, 1);
insert into produtos values ('caneta', 8030, 100, '2013-2-4', 0, 011.0, 1);
insert into produtos values ('ERP', 0060, 100, '2016-5-7', 0, 937.5, 3);
insert into produtos values ('ERP', 3070, 100, '2014-6-5', 0, 472.0, 4);
insert into produtos values ('ERP', 2083, 100, '2015-8-4', 0, 252.0, 5);
insert into produtos values ('Windows', 5040, 100, '2012-9-2', 0, 532.0, 7);
insert into produtos values ('IOS', 6020, 100, '2014-3-3', 0, 756.5, 9);
insert into produtos values ('teclado', 7030, 100, '2016-5-8', 0, 412.5, 4);
insert into produtos values ('teclado', 0024, 100, '2013-4-7', 0, 172.5, 11);
insert into produtos values ('teclado', 9070, 100, '2015-5-4', 0, 192.0, 8);
insert into produtos values ('mouse', 1303, 100, '2016-7-3', 0, 142.0, 4);
insert into produtos values ('mouse', 3050, 100, '2013-9-2', 0, 122.5, 8);
insert into produtos values ('mouse', 0007, 100, '2012-3-7', 0, 152.0, 7);
insert into produtos values ('Pendrive', 6070, 100, '2014-5-6', 0, 172.0, 4);
insert into produtos values ('CD', 8080, 100, '2015-6-4', 0, 012.5, 4);
insert into produtos values ('Monitor', 9040, 100, '2016-5-2', 0, 332.0, 8);
insert into produtos values ('Monitor', 0001, 100, '2013-3-6', 0, 172.0, 11);
insert into produtos values ('Monitor', 2300, 100, '2015-2-5', 0, 312.5, 14);
insert into produtos values ('Monitor', 6620, 100, '2014-3-3', 0, 272.0, 6);
insert into produtos values ('Joystick', 0063, 100, '2014-5-7', 0, 152.0, 4);
insert into produtos values ('Módulo de memória', 7230, 100, '2013-6-8', 0, 512.5, 6);
insert into produtos values ('Módulo de memória', 9032, 100, '2013-7-8', 0, 612.0, 12);
insert into produtos values ('Processador', 4509, 100, '2016-8-6', 0, 282.5, 6);
insert into produtos values ('Placa de Vídeo', 2408, 100, '2015-3-5', 0, 152.0, 6);
insert into produtos values ('Placa de Vídeo', 0066, 100, '2012-2-3', 0, 612.5, 13);
insert into produtos values ('Fonte de Energia', 9044, 100, '2013-5-2', 0, 112.0, 4);
insert into produtos values ('Fonte de Energia', 4054, 100, '2014-7-3', 0, 012.5, 8);
insert into produtos values ('HD externo', 0400, 100, '2016-8-4', 0, 412.5, 14);
insert into produtos values ('mesa', 0240, 100, '2014-4-8', 0, 632.5, null);
insert into produtos values ('cadeira', 0490, 100, '2012-3-7', 0, 342.0, null);
insert into produtos values ('rack', 0030, 100, '2013-2-6', 0, 262.0, null);
insert into produtos values ('armario', 0404, 100, '2012-5-4', 0, 412.5, null);
insert into produtos values ('pera', 0069, 100, '2014-7-6', 1 , 612.0, null);
insert into produtos values ('maça', 0020, 100, '2015-3-5', 1 , 716.8, null);
insert into produtos values ('banana', 0081, 100, '2016-5-8', 1 , 512.0, null);

insert into produto_fornecedor values (1,1);
insert into produto_fornecedor values (4,1);