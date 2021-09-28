-- Criar database
create database projeto02;

-- Selecionar database
use projeto02;

-- Criar tabela Usuário
create table usuario (
    id int not null auto_increment,
    nome varchar(150),
    imagem varchar(300),
    nome_usuario varchar(50),
    data_cadastro date,
    PRIMARY key (id)
);

-- Criar tabela Cartão
create table cartao (
    id int not null auto_increment ,
    numero bigint(16),
    cvv int(3),
    data_expiracao date,
    nome_usuario varchar(50),
    valido tinyint(1),
    data_cadastro date,
    PRIMARY key (id)
);

-- Criar tabela Transação
create table transacao (
    id int not null auto_increment,
    id_usuario int,
    id_cartao int,
    valor dec(10,2),
    data_cadastro date,
    PRIMARY key (id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_cartao) REFERENCES cartao(id)
);

--Insere dados ao Usuário
insert into usuario 
    (nome, imagem, nome_usuario, data_cadastro)
values  
    ('Flávio Silva', 'IMG/flavio', 'flavioxe', '2021-09-24' ),
	('Juliana Kaori', 'IMG/juliana', 'ju.kaori', '2021-09-25' ),
	('Gioavnni Shiroma', 'IMG/giovanni', 'gioshiroma','2021-09-26' ),
	('Leonardo Rodrigues', 'IMG/leonardo', 'leo.galvez', '2021-09-27' );
	('Marcelo Correa', 'IMG/marcelo', 'correa.marcelo', '2021-09-28' );

--Insere dados ao Cartão
insert into 
    cartao (numero, cvv, data_expiracao, nome_usuario, valido, data_cadastro)
values  
    ('1234567812345678', '123', '2026-09-01', 'ju.kaori', '1', '2021-09-01' ),
	('1234123412341234', '321', '2026-08-01', 'correa.marcelo', '0', '2021-09-02' ),
	('9999999999999999', '456', '2026-07-01', 'flavioxe', '1', '2021-09-03' ),
	('0000000000000000', '987', '2026-06-01', 'gioshiroma', '0', '2021-09-04' );

--Insere dados à Transação
insert into 
    transacao (id_usuario, id_cartao, valor, data_cadastro)
values  
    ('1', '1', '500.00', '2021-09-10' ),
	('2', '2', '35.50', '2021-09-11' ),
	('3', '3', '2500.99','2021-09-12' ),
	('4', '4', '10.99', '2021-09-13' );

-- Query que retorna todos os usuários cadastrados em ordem alfabética
select * from usuario order by nome asc;

-- Query que retorna apenas os cartões válidos em ordem crescente da data de cadastro
select * from cartao where valido = 1 order by data_cadastro asc;

-- Query que retorna todas as transações cadastradas em ordem decrescente da data de cadastro, contendo os dados do usuário e cartão, não apenas seus IDs.
select 
    transacao.id_usuario, 
    transacao.id_cartao, 
    transacao.valor, 
    transacao.data_cadastro,
    usuario.nome, 
    usuario.imagem, 
    usuario.nome_usuario, 
    usuario.data_cadastro data_cadastro_usuario,
    cartao.numero, 
    cartao.cvv, 
    cartao.data_expiracao, 
    cartao.valido, 
    cartao.data_cadastro data_cadastro_cartao
from transacao transacao
inner join usuario usuario
on transacao.id_usuario = usuario.id 
inner join cartao cartao 
on transacao.id_cartao = cartao.id
order by transacao.data_cadastro desc;