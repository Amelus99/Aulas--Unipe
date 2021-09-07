create database testes;
use testes;

create table cliente (
id_cliente int,
nome varchar(70),
endereço varchar (70),
cidade varchar(20),
cep varchar(40),
telefone varchar (15),
desconto char(5),
cod_estado int,
primary key (id_cliente),
foreign key (cod_estado) references estado(cod_estado)
);

insert into cliente(id_cliente, nome) values (100,'Pedro cezar');


create table estado(
cod_estado int,
nome varchar (10),
primary key (cod_estado)
);

create table produto (
cod_produto varchar (25),
nome varchar (30),
preco char (20),
cod_ue_produto int,
primary key (cod_produto),
foreign key (cod_ue_produto) references ue_produto(cod_ue_produto)
);

insert into produto (cod_produto, nome) value (150, 'notebook');

create table ue_produto(
cod_ue_produto int,
descricao varchar (200),
primary key (cod_ue_produto)
);

insert into ue_produto (cod_ue_produto, descricao) value (199, 'Notebook acer core i7 8GB RAM');

create table pedido (
id_pedido int,
tipo varchar(20),
id_cliente int,
data_entrada date,
valor_total varchar (20),
desconto varchar (5),
data_embarque date,
primary key (id_pedido),
foreign key (id_cliente) references cliente (id_cliente)
);

insert into pedido (id_pedido) value (250);

create table item (
id_pedido int,
cod_produto varchar (25),
quantidade varchar(10),
valor_unitario varchar (10),
valor_total varchar (20),
primary key (id_pedido, cod_produto),
foreign key (id_pedido) references pedido (id_pedido),
foreign key (cod_produto) references produto (cod_produto)
);

select p.id_pedido, c.id_cliente, c.nome, r.cod_produto, r.nome, u.descricao 
from pedido p, cliente c, produto r, ue_produto u;
select*from produto order by nome, preco desc;