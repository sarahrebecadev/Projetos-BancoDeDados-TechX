
-- BANCO DE DADOS DA ACADEMIA

CREATE DATABASE academia;

USE academia;

-- TABELA: PLANO

CREATE TABLE plano (
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    duracao_dias INT NOT NULL
);

-- TABELA: INSTRUTOR

CREATE TABLE instrutor (
    id_instrutor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    telefone VARCHAR(15)
);

-- TABELA: ALUNO

CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE,
    telefone VARCHAR(15),
    email VARCHAR(100),

    id_plano INT NOT NULL,
    id_instrutor INT NOT NULL,

    FOREIGN KEY (id_plano)
        REFERENCES plano(id_plano),

    FOREIGN KEY (id_instrutor)
        REFERENCES instrutor(id_instrutor)
);

