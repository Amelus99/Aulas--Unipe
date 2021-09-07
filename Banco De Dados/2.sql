
select * from assunto;
select * from editora;
select * from livro;


insert into assunto values ('DP','Direito Penal'), ('AH','Anatomia Humana'), ('CB','Contabilidade Básica');

select livro.titulo as 'TITULO LIVRO', livro.valor, assunto.nome from livro, assunto 
where livro.assunto=assunto.sigla and livro.valor>= 200 order by livro.titulo;

select l.valor, l.ano, a.nome, l.titulo from livro l, assunto a where l.assunto=a.sigla;


insert into livro values (10,'Teoria da Computação', 150.00,2018,null,null),
(11,'Como Passar na OAB', 99.00,2019,null,null),(12,'Manual Linux', 210.20,2016,null,null);

select l.titulo,l.ano, a.nome from livro l inner join assunto a ON l.assunto=a.sigla;

select l.titulo,l.ano, a.nome as 'TAB-DIREITA' from livro l left join assunto a ON l.assunto=a.sigla;

select l.titulo,l.ano, a.nome as 'TODAS as Linhas' from livro l right join assunto a ON l.assunto=a.sigla;

select l.titulo, l.ano, a.nome from livro l, assunto a;

select a.nome, e.nome, l.titulo,l.valor from livro l inner join editora e inner join assunto a
ON a.sigla=l.assunto and e.codigo=l.editora;

select a.nome, e.nome from livro l inner join editora e inner join assunto a on
a.sigla=l.assunto and e.codigo=l.editora;


select a.nome, e.nome, l.titulo,l.valor from livro l inner join editora e inner join assunto a
ON a.sigla=l.assunto and e.codigo=l.editora where l.valor >= 120 and e.nome like '%n' order by a.nome asc	;