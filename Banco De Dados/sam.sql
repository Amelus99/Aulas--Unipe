create database sam;
use sam;

-- Criação das tabelas

create table editora (
codigo int,
nome varchar(50),
primary key (codigo)
);

create table assunto(
sigla varchar (2),
nome varchar(25),
primary key (sigla)
);

create table livro (
codigo int not null,
titulo varchar(40),
valor decimal(5,2),
ano int,
assunto varchar(2),
editora int,
foreign key (assunto) references assunto (sigla),
foreign key (editora) references editora (codigo)
);


-- Visualização das tabelas

/*
select*from editora;
select*from assunto;
select*from livro;

describe editora;
describe assunto;
describe livro;
*/

-- Inserção de dados da tabela editora

insert into editora (codigo, nome) 
value (1, 'Pearson');
insert into editora (codigo, nome)
 value (2, 'Saraiva');
insert into editora (codigo, nome) 
value (3, 'Bookman');
insert into editora (codigo, nome) 
value (4, 'Unipê');

-- Inserção de dados da tabela assunto

insert into assunto (sigla, nome) 
value ('BD', 'Banco de Dados');
insert into assunto (sigla, nome) 
value ('GP', 'Gerência de Projetos');
insert into assunto (sigla, nome) 
value ('RC', 'Rede de Computadores');
insert into assunto (sigla, nome) 
value ('ES', 'Engenharia de Software');
insert into assunto (sigla, nome) 
value ('PR', 'Programação');

-- Inserção de dados da tabela livro

insert into livro (codigo, titulo, valor, ano, assunto, editora) 
value (1, 'MySQL', 100.00, 2014, 'BD', 1);
insert into livro (codigo, titulo, valor, ano, assunto, editora) 
value (2, 'Introdução ao PMBOK', 88.00, 2014, 'GP', 2);
insert into livro (codigo, titulo, valor, ano, assunto, editora) 
value (3, 'JAVA', 75.00, 2014, 'BD', 2);
insert into livro (codigo, titulo, valor, ano, assunto, editora) 
value (4, 'Engenharia de Software', 120.00, 2013, 'BD', 3);
insert into livro (codigo, titulo, valor, ano, assunto, editora) 
value (5, 'Python', 65.00, 2015, 'BD', 4);
insert into livro (codigo, titulo, valor, ano, assunto, editora) 
value (6, 'Oracle', 150.00, 2016, 'BD', 4);
insert into livro (codigo, titulo, valor, ano, assunto, editora) 
value (7, 'Redes de Computadores', 99.00, 2016, 'BD', 1);

-- Alteração de dados

set sql_safe_updates = 0;
set foreign_key_checks = 0;

create view v_minhaVisao as select a.nome, SUM(l.valor) as 'Total' from livro l inner join assunto a
on a.sigla = l.assunto group by l.assunto;