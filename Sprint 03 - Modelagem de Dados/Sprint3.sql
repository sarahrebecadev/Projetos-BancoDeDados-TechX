-- DESAFIO SPRINT 3 - DO CONCEITO À TABELA
-- BANCO DE DADOS: ACADEMIA
-- SGBD: MYSQL

CREATE DATABASE IF NOT EXISTS academia;

USE academia;

-- TABELA PLANO

CREATE TABLE plano (
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    valor DECIMAL(10,2) NOT NULL,
    duracao_dias INT NOT NULL,

    CONSTRAINT chk_plano_valor
        CHECK (valor > 0),

    CONSTRAINT chk_plano_duracao
        CHECK (duracao_dias > 0)
);


-- TABELA INSTRUTOR

CREATE TABLE instrutor (
    id_instrutor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL
);


-- TABELA ALUNO

CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    id_plano INT NOT NULL,
    id_instrutor INT NOT NULL,

    CONSTRAINT fk_aluno_plano
        FOREIGN KEY (id_plano)
        REFERENCES plano(id_plano),

    CONSTRAINT fk_aluno_instrutor
        FOREIGN KEY (id_instrutor)
        REFERENCES instrutor(id_instrutor)
);


-- INSERTS - PLANO

INSERT INTO plano (nome, valor, duracao_dias)
VALUES ('Plano Básico', 89.90, 30);

INSERT INTO plano (nome, valor, duracao_dias)
VALUES ('Plano Premium', 149.90, 30);

INSERT INTO plano (nome, valor, duracao_dias)
VALUES ('Plano Anual', 999.90, 365);


-- INSERTS - INSTRUTOR

INSERT INTO instrutor (nome, especialidade, telefone)
VALUES ('Carlos Silva', 'Musculação', '989991111');

INSERT INTO instrutor (nome, especialidade, telefone)
VALUES ('Mariana Santos', 'Funcional', '989992222');

INSERT INTO instrutor (nome, especialidade, telefone)
VALUES ('João Oliveira', 'Crossfit', '989993333');


-- INSERTS - ALUNO

INSERT INTO aluno
(nome, cpf, data_nascimento, telefone, email, id_plano, id_instrutor)
VALUES
('Ana Beatriz', '111.111.111-11', '2002-05-10',
 '989994444', 'ana@email.com', 1, 1);

INSERT INTO aluno
(nome, cpf, data_nascimento, telefone, email, id_plano, id_instrutor)
VALUES
('Lucas Mendes', '222.222.222-22', '2000-08-20',
 '989995555', 'lucas@email.com', 2, 2);

INSERT INTO aluno
(nome, cpf, data_nascimento, telefone, email, id_plano, id_instrutor)
VALUES
('Julia Costa', '333.333.333-33', '2003-11-15',
 '989996666', 'julia@email.com', 3, 3);


-- SELECT 1
-- ALUNOS E PLANOS

SELECT
    a.id_aluno,
    a.nome AS aluno,
    a.email,
    p.nome AS plano,
    p.valor,
    p.duracao_dias
FROM aluno a
INNER JOIN plano p
    ON a.id_plano = p.id_plano;


-- SELECT 2
-- ALUNOS, PLANOS E INSTRUTORES


SELECT
    a.id_aluno,
    a.nome AS aluno,
    p.nome AS plano,
    i.nome AS instrutor,
    i.especialidade
FROM aluno a
INNER JOIN plano p
    ON a.id_plano = p.id_plano
INNER JOIN instrutor i
    ON a.id_instrutor = i.id_instrutor;