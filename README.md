# 🗄️ Projetos de Banco de Dados — TechX

> Repositório de atividades práticas de modelagem, implementação, consultas, integridade, desempenho e administração de bancos de dados.

Este repositório reúne entregas organizadas por sprint, acompanhando a evolução dos estudos em bancos de dados relacionais e não relacionais. Os projetos passam da identificação de requisitos e construção de modelos até a implementação de estruturas SQL, consultas, transações, controle de acesso, backup e bancos NoSQL especializados.

## 🎯 Objetivo

Centralizar os projetos de Banco de Dados em uma estrutura clara e fácil de consultar, documentando o que foi desenvolvido em cada etapa e os principais conhecimentos praticados.

## 🗂️ Projetos por sprint

### Sprint 1 — Radar de Dados
**Tema: Sistema de gerenciamento da LARA**

Levantamento inicial de requisitos para um sistema de gerenciamento da Liga Acadêmica de Robótica e Automação (LARA). Inclui definição do cenário, identificação de entidades, atributos, chaves, relacionamentos e proposta de modelo Entidade-Relacionamento.

### Sprint 2 — Modelagem de Dados
**Tema: Banco de dados de uma academia**

Modelagem de um sistema para organizar alunos, planos de assinatura e instrutores, com identificação de entidades, chaves, relacionamentos, cardinalidades e diagramas conceitual e lógico.

### Sprint 3 — Do Conceito à Tabela
**Tema: Implementação e normalização do banco da academia**

Implementação das tabelas, normalização até a Terceira Forma Normal (3FN), restrições de integridade, inserção de dados de exemplo e consultas com `JOIN`.

### Sprint 4 — Banco de Dados PostgreSQL
**Tema: Modelo físico de um sistema de e-commerce**

Implementação de modelo relacional com tipos de dados, índices, transações (`RETURNING`, `SAVEPOINT`, `ROLLBACK`), permissões RBAC e análise de consultas com `EXPLAIN ANALYZE`.

### Sprint 5 — Sistema Acadêmico
**Tema: Banco de dados PostgreSQL para gestão acadêmica**

Construção de banco para alunos, professores, cursos, disciplinas, turmas, matrículas, avaliações, notas e frequência. Inclui dez tabelas relacionadas, integridade, dados de exemplo, índices, consultas, transações, roles e análise de execução.

### Sprint 6 — Backup, Restauração e MongoDB
**Tema: Continuidade do Sistema Acadêmico**

Continuação do domínio acadêmico da Sprint 5, com rotina de backup usando `pg_dump`, documentação de agendamento e restauração, além de introdução à modelagem documental no MongoDB. A cópia externa/off-site e a sincronização automática entre PostgreSQL e MongoDB não fazem parte da implementação.

### Sprint 7 e 8 — Modelagem NoSQL com MongoDB
**Tema: Catálogo de e-commerce orientado a documentos**

Modelagem de uma coleção de produtos no MongoDB, utilizando documentos com arrays e subdocumentos. A entrega inclui:
- Criação do banco e da coleção e inserção de documentos com `insertMany()`;
- Índice simples para preço e índice de texto para título e descrição;
- Consultas com operadores de comparação, busca em arrays e pesquisa textual;
- Consulta com `$elemMatch` para filtrar subdocumentos;
- Análise de execução com `.explain("executionStats")`;
- Reflexão sobre Embedding e Referencing.

**Pasta:** [Sprint 7 e 8 - MongoDB E-commerce](Sprint%207%20e%208%20-%20MongoDB%20E-commerce/)

### Sprint 9 e 12 — Banco de Grafos e Cache
**Tema: Sistema de recomendações com Neo4j e carrinho de compras com Redis**

Modelagem de relacionamentos entre usuários e produtos em um grafo Neo4j, além da definição de cache de carrinho usando Hash no Redis. A entrega inclui:
- Nós `Usuario` e `Produto`, com relacionamentos `AMIGO_DE` e `COMPROU`;
- Consulta Cypher para recomendar produtos comprados por amigos de amigos;
- Consulta de recomendação baseada em compras em comum;
- Padrão de chave Redis `cart:user:{userId}` e estrutura Hash;
- Operações `HSET`, `HGETALL`, `EXPIRE`, `TTL` e invalidação com `DEL`;
- Reflexão sobre bancos de grafos, JOINs relacionais e cache em memória.

**Pasta:** [Sprint 9 e 12 - Grafos e Cache](Sprint%209%20e%2012%20-%20Grafos%20e%20Cache/)

## 🧠 Principais conhecimentos praticados

- Levantamento de requisitos e modelagem conceitual, lógica e física;
- Normalização e integridade referencial;
- SQL, PostgreSQL e MySQL;
- Consultas, subconsultas, agregações e `JOINs`;
- Índices e análise de desempenho;
- Transações e propriedades ACID;
- Controle de acesso com roles e privilégios;
- Backup e restauração;
- MongoDB: documentos, arrays, subdocumentos e índices;
- Neo4j: nós, relacionamentos e consultas Cypher;
- Redis: estruturas Hash, TTL e invalidação de cache.

## 🛠️ Tecnologias e ferramentas

- **MySQL** — atividades de modelagem e implementação relacional;
- **PostgreSQL** — implementação, consultas, transações e administração;
- **MongoDB / mongosh** — modelagem documental;
- **Neo4j / Cypher** — modelagem e consultas em grafos;
- **Redis / redis-cli** — cache em memória;
- **Git e GitHub** — versionamento e organização dos projetos.

## 📁 Estrutura do repositório

```text
Projetos-BancoDeDados-TechX/
├── Sprint 1 - Radar de Dados/
├── Sprint 2 - Modelagem de Dados/
├── Sprint 3 - Modelagem de Dados/
├── Sprint 4/
├── Sprint 5/
├── Sprint 6 - Banco de Dados/
├── Sprint 7 e 8 - MongoDB E-commerce/
│   ├── README.md
│   ├── 01_setup.js
│   ├── 02_insercao_dados.js
│   ├── 03_indices.js
│   └── 04_consultas.js
└── Sprint 9 e 12 - Grafos e Cache/
    ├── README.md
    ├── 01_modelo_grafo.cypher
    ├── 02_consultas_recomendacao.cypher
    └── 03_carrinho_redis.redis
```

## ▶️ Como utilizar

1. Acesse a pasta da sprint desejada.
2. Leia o README específico.
3. Confira os pré-requisitos e a ordem de execução.
4. Execute os scripts em ambiente de teste, utilizando o SGBD correspondente.
5. Registre evidências reais da execução quando solicitadas na atividade.

> **Atenção:** cada tecnologia possui seu próprio terminal e sintaxe. MongoDB utiliza `mongosh`, Neo4j utiliza Neo4j Browser ou `cypher-shell`, e Redis utiliza `redis-cli`.

## 📌 Organização e histórico

As atividades estão reunidas em pastas identificadas por sprint. Os scripts e documentos de cada etapa ficam separados para facilitar a navegação, execução e avaliação.

---

**TechX | Estudos e projetos de Banco de Dados**
