-- Criar database
create database projeto01;

-- Selecionar database
use projeto01;

-- Criar tabela
create table transacao (
    id int not null auto_increment primary key,
    tipo varchar(15),
    nome varchar(150),
    valor dec(10,2),
    data_cadastro date
);

-- Insere dados à transação
insert into transacao (
        id, tipo, nome, valor, data_cadastro
    )
    values
    ('Venda', 'Boné', 25.50 , '2021-09-28'),
    ('Compra', 'Short', -55.00 , '2021-09-28'),
    ('Venda', 'Camisa', 30.90 , '2021-09-28'),
    ('Compra', 'Calça', -99.99 , '2021-09-28');

-- Query que retorna todas as transações cadastradas em ordem crescente da data de cadastro
select * from transacao order by data_cadastro asc;

-- Query que retorna saldo de todas as transações
select sum(valor) as valor from transacao;

-- Query que exclui todas as transações
delete from transacao;
