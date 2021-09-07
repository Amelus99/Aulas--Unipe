create database sistema_bancario;
use sistema_bancario;

-- Criação das tabelas

create table banco (
codigo int not null,
nome varchar(45) not null,
primary key (codigo)
);
create table agencia (
cod_banco int not null,
numero_agencia char(10),
endereco varchar(45),
primary key (numero_agencia),
foreign key (cod_banco) references banco (codigo)
);
create table cliente (
cpf char(12) not null,
nome varchar(45) not null,
sexo varchar (1),
endereco varchar (70) not null,
primary key (cpf),
check (sexo in ('M', 'F'))
);
create table conta (
numero_conta varchar(7),
saldo decimal(20,3),
tipo_conta char(6),
num_agencia char(10),
primary key (numero_conta),
foreign key (num_agencia) references agencia(numero_agencia)
);
create table historico (
cpf_cliente char(12) not null,
num_conta varchar(7),
data_inicio date not null,
foreign key (cpf_cliente) references cliente (cpf),
foreign key (num_conta) references conta (numero_conta)
);
create table telefone_cliente (
cpf_cli char(12) not null,
telefone varchar(15),
foreign key (cpf_cli) references cliente (cpf)
);

-- Visualização das tabelas

/*
select*from banco;
select*from agencia;
select*from cliente;
select*from conta;
select*from historico;
select*from telefone_cliente;

describe banco;
describe agencia;
describe cliente;
describe conta;
describe historico;
describe telefone_cliente;
*/


-- Informações da tabela banco

insert into banco (codigo, nome) value (1, 'Banco do Brasil');
insert into banco (codigo, nome) value (4, 'CEF');

-- Informações da tabela agencia

insert into agencia (numero_agencia, endereco, cod_banco) 
value (322, 'Av. Walfredo Macedo Brandão, 1139', 4);
insert into agencia (numero_agencia, endereco, cod_banco) 
value (1253, 'R. Bancário Sérgio Guerra, 17', 1);

-- Informações da tabela cliente

insert into cliente (cpf, nome, sexo, endereco)
value ( '111222333-44', 'Bruna Andrade', 'F', 'Rua José Firmino Ferreira, 1050');
insert into cliente (cpf, nome, sexo, endereco)
value ( '666777888-99', 'Radegondes Silva', 'M', 'Av. Epitácio Pessoa, 1008');
insert into cliente (cpf, nome, sexo, endereco)
value ( '555444777-33', 'Miguel Xavier', 'M', 'Rua Bancário Sérgio Guerra, 640');

-- Informações da tabela conta

insert into conta (numero_conta, saldo, tipo_conta, num_agencia) 
value ('11765-2', 22745.05, 2, 322);
insert into conta (numero_conta, saldo, tipo_conta, num_agencia) 
value ('21010-7', 3100.96, 1, 1253);

-- Informações da tabela historico

insert into historico (cpf_cliente, num_conta, data_inicio) 
value ('111222333-44', '11765-2', '2015-12-22');
insert into historico (cpf_cliente, num_conta, data_inicio) 
value ('666777888-99', '11765-2', '2016-10-05');
insert into historico (cpf_cliente, num_conta, data_inicio) 
value ('555444777-33', '21010-7', '2012-08-29');

-- Informações da tabela telefone_cliente

insert into telefone_cliente (cpf_cli, telefone)
value ('111222333-44', '(83)3222-1234');
insert into telefone_cliente (cpf_cli, telefone)
value ('666777888-99', '(83)99443-9999');
insert into telefone_cliente (cpf_cli, telefone)
value ('666777888-99', '(83)3233-2267');

-- Inserção e Alteração e Deleção de dados

set sql_safe_updates = 0;
set foreign_key_checks = 0;
alter table cliente add column país char(3) default 'BRA' not null; -- questão 4
alter table cliente add column email varchar(40); -- questão 5
delete from conta where numero_conta = '86340-2'; -- questão 6
update agencia set numero_agencia = 6342 where cod_banco = 0562; -- questão 7
alter table conta modify numero_conta char(7); -- quetsão 8
update cliente set email = 'radegondes.silva@gmail.com' where cpf = '666777888-99'; -- questâo 9
update conta set saldo = saldo*1.1 where numero_conta = '23584-7'; -- questão 10
update cliente set nome = 'Bruna Fernandes' where cpf = '111222333-44'; -- questão 11
update conta set tipo_conta = 3 where saldo >10000; -- questão 12