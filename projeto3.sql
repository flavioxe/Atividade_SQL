-- Criar database
create database hashtag_finder;

-- Selecionar database
use hashtag_finder;

-- -- -- -- -- -- -- INÍCIO TABELA DE BUSCAS

-- Criar tabela de hastags buscadas
create table buscas (
  id_busca int not null auto_increment,
  squad int not null,
  hashtag varchar(140),
  data_hashtag date,
  hora_hashtag time,
  primary key (id_busca)
);

-- inserir dados em "buscas"
insert into hashtag_finder.buscas
    (squad, hashtag, data_hashtag, hora_hashtag)
values
    (52, 'solar', '2021-08-10', '19:13:01'),
    (52, 'copo', '2021-08-10', '13:13:13'),
    (52, 'lady gaga', '2021-08-10', '01:20:21'),
    (52, 'teste', '2021-08-10', '20:42:13');

-- Alterar dados da tabela "buscas"
update hashtag_finder.buscas
set hora_hashtag='01:01:01'
where id_busca=2 and hashtag='solar';

-- Mostrar os dados da tabela "buscas"
select * from hashtag_finder.buscas;

-- Apagar registro da tabela "buscas"
delete from hashtag_finder.buscas where id_busca=4 and hashtag='teste';

-- -- -- -- -- -- -- INÍCIO TABELA DE GRUPOS

-- Criar tabela "grupo"
create table grupo (
  id_grupo int not null auto_increment,
  squad int not null,
  nome varchar(300),
  descricao varchar(1000),
  github varchar(300),
  email varchar(300),
  linkedin varchar(300),
  imagem varchar(300),
  primary key (id_grupo)
);

-- Inserir dados na tabela "grupo"
insert into hashtag_finder.grupo
    (squad, nome, descricao, github, email, linkedin, imagem)
values
    (52, 'Flávio', 'Arquiteto e Urbanista apaixonado por tecnologia, atualmente me dedicando ao desenvolvimento web.', 'https://github.com/', 'email@email.com', 'https://www.linkedin.com/', '#');
    (52, 'Juliana', 'De arquiteta para desenvolvedora Front-End em construção. Entusiasta do design gráfico e da tecnologia, gosto de desenvolver aplicações responsivas e atraentes.', 'https://github.com/', 'email@email.com', 'https://www.linkedin.com/', '#');
    (52, 'Giovanni', 'Estudante | Desenvolvedor Front-End Jr.', 'https://github.com/', 'email@email.com', 'https://www.linkedin.com/', '#');
    (52, 'Marcelo', 'Cada sonho que vc deixa para trás, é um pedaço do seu futuro que deixa de existir.', 'https://github.com/', 'email@email.com', 'https://www.linkedin.com/', '#');
    (52, 'Leonardo', 'Amante da tecnologia, estudioso e curioso, adoro me adaptar a novos desafios e conquistas. Pronto, apto e engajado para ingressar na área que tanto almejo.', 'https://github.com/', 'email@email.com', 'https://www.linkedin.com/', '#');

-- Aletrar dados da tabela "grupo"
update hashtag_finder.grupo
set  nome='Flávio Mendonça'
where id_grupo=1;

-- Mostrar dados da tabela "grupo"
select * from hashtag_finder.equipe;

-- Apagar dados da tabela "grupo"
delete from hashtag_finder.equipe where id_grupo=2;

-- -- -- -- -- -- -- INÍCIO TABELA DE LOGIN

-- Criar a tabela "login"
create table login (
  id_login int not null auto_increment,
  email varchar(250),
  senha char(10),
  primary key (id_login)
);

-- Inserir dados na tabela "login"
insert into hashtag_finder.login
    (email, senha)
values
    ('newtab@academy.com', '123456');

-- Alterar dados na tabela "login"
update hashtag_finder.login
set senha='654321'
where id_login=1 and email = 'newtab@academy.com';

-- Mostrar dados da tabela "login"
select * from hashtag_finder.login;

-- Apagar dados da tabela "login"
delete from hashtag_finder.login where id_login=1;

-- -- -- -- -- -- -- INÍCIO TABELA DO ABOUT

-- Criar tabela "about"
create table about (
  id_about int not null auto_increment,
  squad int not null,
  sobre varchar(1000),
  primary key (id_projeto)
);

-- Inserir dados na tabela "about"
insert into hashtag_finder.about
    (squad, sobre)
values
    (52, 'O objetivo do projeto é desenvolver uma página web responsiva para visualização de mensagens e imagens com integração com a API do Twitter, contendo funcionalidades com login e autenticação para visualização do histórico de pesquisa. Realizado em squad ecom foco na realidade do mercado de trabalho, utilizamos ferramentas como ClickUp, metodologias ágeis - Scrum e Kanban, Adobe XD, assim como ferramentas e bibliotecas como HTML, CSS, JavaScript e ReactJS.');

-- Alterar dados na tabela "about"
update hashtag_finder.about
set sobre='teste'
where id_about=1;

-- Mostrar dados da tabela "about"
select * from hashtag_finder.about;

-- Apagar dados da tabela "about"
delete from hashtag_finder.about where id_about=1;

-- -- -- -- -- -- -- INÍCIO TABELA DOS RESULTADOS DAS BUSCAS

-- Criar tabela com os tweets resultados da busca com hashtag
create table resultados_busca (
  id_resultado int not null auto_increment,
  id_busca int not null,
  usuario varchar(50),
  foto varchar(300),
  texto varchar(140),
  data_tweet date,
  hora_tweet time,
  link varchar(300),
  primary key (id_resultado),
  foreign key (id_busca) references buscas (id_busca)
);

-- Criar índice da tabela "resultados_busca"
create index resultados_busca
on resultados_busca 
    (id_resultado, id_busca, data_tweet, hora_tweet);

-- Inserir dados na tabela "resultados_busca"
insert into hashtag_finder.resultados_busca
    (usuario, foto, texto, data_tweet, hora_tweet)
values
    ('user1', '#', 'Lorem ipsum dolor', '2021-08-10', '13:13:13'),
    ('user2', '#', 'Lorem ipsum dolor', '2021-08-10', '13:13:13'),
    ('user3', '#', 'Lorem ipsum dolor', '2021-08-10', '13:13:14'),
    ('user4', '#', 'Lorem ipsum dolor', '2021-08-10', '13:13:15');

-- Alterar dados na tabela "resultados_busca"
update hashtag_finder.resultados_busca
set texto='Lorem ipsum dolor sit amet.' 
where id_resultado=3 and usuario = 'user3';

-- Mostrar dados na tabela "resultados_busca"
select * from hashtag_finder.resultados_busca;

-- Apagar dados da tabela "resultados_busca"
delete from hashtag_finder.resultados_busca where id_resultado=2;
