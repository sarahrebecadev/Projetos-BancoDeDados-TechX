# 🗄️ Projetos de Banco de Dados — TechX

> Repositório de atividades práticas de modelagem, implementação, consultas, integridade, desempenho e administração de bancos de dados.

Este repositório reúne entregas organizadas por sprint, acompanhando a evolução dos estudos em bancos de dados relacionais e não relacionais. Os projetos passam da identificação de requisitos e construção de modelos até a implementação de estruturas SQL, consultas, transações, controle de acesso e rotinas de backup.

## 🎯 Objetivo

Centralizar os projetos de Banco de Dados em uma estrutura clara e fácil de consultar, documentando o que foi desenvolvido em cada etapa e os principais conhecimentos praticados.

## 🗂️ Projetos por sprint

### Sprint 1 — Radar de Dados
**Tema: Sistema de gerenciamento da LARA**

Levantamento inicial de requisitos para um sistema de gerenciamento da Liga Acadêmica de Robótica e Automação (LARA).

Atividades realizadas:
- Definição do cenário e dos objetivos do sistema;
- Identificação das entidades principais: membros, projetos e competições;
- Levantamento de atributos e chaves primárias;
- Definição dos relacionamentos e cardinalidades;
- Construção de uma proposta de modelo Entidade-Relacionamento.

**Arquivo principal:** `banco_LARA.sql`, acompanhado da documentação do cenário e da modelagem.

### Sprint 2 — Modelagem de Dados
**Tema: Banco de dados de uma academia**

Desenvolvimento da modelagem de um sistema para organizar alunos, planos de assinatura e instrutores.

Atividades realizadas:
- Identificação das entidades e seus atributos;
- Definição das chaves primárias e estrangeiras;
- Estabelecimento dos relacionamentos entre alunos, planos e instrutores;
- Elaboração dos diagramas conceitual e lógico;
- Criação do script SQL da atividade.

**Arquivos de destaque:** `Academia.sql` e os diagramas disponibilizados na pasta.

### Sprint 3 — Do Conceito à Tabela
**Tema: Implementação e normalização do banco da academia**

Continuação do cenário da Sprint 2, avançando da modelagem para a estrutura relacional.

Atividades realizadas:
- Implementação das tabelas de alunos, planos e instrutores;
- Aplicação de normalização até a Terceira Forma Normal (3FN);
- Uso de `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE` e `CHECK`;
- Inserção de dados de exemplo;
- Elaboração de consultas com `JOIN`.

**Arquivo principal:** `Sprint3.sql`, acompanhado da documentação e do diagrama.

### Sprint 4 — Banco de Dados PostgreSQL
**Tema: Modelo físico de um sistema de e-commerce**

Implementação de um modelo físico relacional para um cenário de e-commerce, com foco em integridade, transações, permissões e desempenho.

Atividades realizadas:
- Definição de tipos de dados adequados;
- Criação de índices para apoiar filtros, relacionamentos e ordenações;
- Demonstração de transações e recursos como `RETURNING`, `SAVEPOINT` e `ROLLBACK`;
- Organização de permissões por funções e usuários (RBAC);
- Análise de consultas com `EXPLAIN ANALYZE`.

**Arquivos principais:** scripts de schema, índices, permissões, transações e análise de execução.

### Sprint 5 — Sistema Acadêmico
**Tema: Banco de dados PostgreSQL para gestão acadêmica**

Construção de um banco de dados para organizar informações de alunos, professores, cursos, disciplinas, turmas, matrículas, avaliações, notas e frequência.

Atividades realizadas:
- Criação de dez tabelas relacionadas;
- Definição de chaves, relacionamentos e restrições de integridade;
- Inserção de dados de exemplo;
- Aplicação de índices;
- Desenvolvimento de consultas com filtros, agrupamentos, funções agregadas, subconsultas e diferentes tipos de `JOIN`;
- Demonstração de transações;
- Configuração de roles, usuários e privilégios;
- Preparação de consultas para análise com `EXPLAIN ANALYZE`.

**Arquivos principais:** `01_ddl.sql` até `07_explain.sql`.

### Sprint 6 — Backup, Restauração e MongoDB
**Tema: Continuidade do Sistema Acadêmico**

Continuação do domínio acadêmico da Sprint 5, acrescentando práticas de proteção de dados e uma demonstração de modelagem documental com MongoDB.

Atividades realizadas:
- Organização dos scripts PostgreSQL da Sprint 5 para continuidade do exercício;
- Preparação de rotina de backup com `pg_dump`;
- Documentação de agendamento e retenção de backups;
- Elaboração de roteiro e script para teste de restauração;
- Criação de uma estrutura demonstrativa no MongoDB;
- Inserção e consulta de documentos;
- Demonstração de referências, dados embutidos, índices e análise de consultas;
- Documentação das diferenças entre o modelo relacional e o documental.

**Importante:** o backup local e os roteiros estão preparados para execução no ambiente configurado. A cópia externa/off-site e a sincronização automática entre PostgreSQL e MongoDB não fazem parte desta implementação.

## 🧠 Principais conhecimentos praticados

- Levantamento de requisitos e modelagem de dados;
- Modelos conceitual, lógico e físico;
- Entidades, atributos, relacionamentos e cardinalidades;
- Normalização e integridade referencial;
- SQL e PostgreSQL;
- Criação e manipulação de tabelas e registros;
- Consultas, subconsultas, agregações e `JOINs`;
- Índices e análise de desempenho;
- Transações e propriedades ACID;
- Controle de acesso com roles e privilégios;
- Backup e restauração;
- Introdução ao MongoDB e modelagem documental.

## 🛠️ Tecnologias e ferramentas

- **SQL**
- **MySQL** — utilizado nas atividades iniciais de modelagem e implementação;
- **PostgreSQL** — utilizado nas entregas de implementação, consultas, transações e administração;
- **MongoDB / mongosh** — utilizado na atividade de modelagem documental;
- **Git e GitHub** — versionamento e organização dos projetos.

## 📁 Estrutura do repositório

```text
Projetos-BancoDeDados-TechX/
├── Sprint 1 - Radar de Dados/
├── Sprint 2 - Modelagem de Dados/
├── Sprint 3 - Modelagem de Dados/
├── Sprint 4/
├── Sprint 5/
└── Sprint 6 - Banco de Dados/
```

Cada pasta contém os scripts, diagramas e documentos relacionados à respectiva entrega.

## ▶️ Como utilizar

1. Escolha a pasta da sprint que deseja consultar.
2. Leia o README específico, quando disponível.
3. Verifique os scripts SQL e os diagramas correspondentes.
4. Utilize o SGBD indicado na documentação daquela atividade.
5. Execute os scripts na ordem recomendada e em um banco de testes.

> **Atenção:** algumas atividades utilizam MySQL e outras PostgreSQL. Verifique o SGBD indicado antes de executar os scripts, pois a sintaxe e os recursos podem variar.

## 📌 Organização e histórico

Os projetos foram reunidos neste repositório em pastas identificadas por sprint, mantendo os arquivos e documentos das entregas. Os repositórios originais foram preservados, de modo que os links anteriormente compartilhados continuem disponíveis.

---

**TechX | Estudos e projetos de Banco de Dados**
