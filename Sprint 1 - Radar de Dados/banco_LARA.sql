-- Sprint 1 - Radar de Dados
-- Modelo inicial do banco de dados da LARA (liga de robotica e automação)

CREATE TABLE membro (
    id_membro INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT,
    curso TEXT,
    periodo TEXT,
    cargo TEXT
);

CREATE TABLE projeto (
    id_projeto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    data_inicio TEXT,
    status TEXT
);

CREATE TABLE competicao (
    id_competicao INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    local TEXT,
    data TEXT,
    modalidade TEXT
);

CREATE TABLE membro_projeto (
    id_membro INTEGER NOT NULL,
    id_projeto INTEGER NOT NULL,
    PRIMARY KEY (id_membro, id_projeto),
    FOREIGN KEY (id_membro) REFERENCES membro(id_membro),
    FOREIGN KEY (id_projeto) REFERENCES projeto(id_projeto)
);

CREATE TABLE projeto_competicao (
    id_projeto INTEGER NOT NULL,
    id_competicao INTEGER NOT NULL,
    PRIMARY KEY (id_projeto, id_competicao),
    FOREIGN KEY (id_projeto) REFERENCES projeto(id_projeto),
    FOREIGN KEY (id_competicao) REFERENCES competicao(id_competicao)
);

-- Exemplos de dados
INSERT INTO membro (nome, email, curso, periodo, cargo)
VALUES ('Sarah Rebeca', 'sarah.rebeca@email.com', 'Engenharia da Computação', '2º', 'Presidente');

INSERT INTO projeto (nome, descricao, data_inicio, status)
VALUES ('Robô Autônomo', 'Projeto voltado à robótica autônoma', '22/08/2026', 'Em desenvolvimento');

INSERT INTO competicao (nome, local, data, modalidade)
VALUES ('FIRA NACIONAL', 'São Luís - MA', '01/11/2026', 'Carro Autônomo');

INSERT INTO membro_projeto (id_membro, id_projeto)
VALUES (1, 1);

INSERT INTO projeto_competicao (id_projeto, id_competicao)
VALUES (1, 1);