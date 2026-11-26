# 🏋️ Desafio Sprint 3 - Do Conceito à Tabela

## 📌 Cenário

O projeto consiste em um sistema de gerenciamento de uma academia.

O banco de dados tem como objetivo organizar informações sobre:

- Alunos;
- Planos de assinatura;
- Instrutores.

---

## 🎯 Objetivo

A partir do modelo conceitual desenvolvido na Sprint 2, foi desenvolvido o modelo lógico do banco de dados, aplicando normalização até a Terceira Forma Normal (3FN).

Também foram implementadas restrições de integridade utilizando:

- PRIMARY KEY;
- FOREIGN KEY;
- NOT NULL;
- UNIQUE;
- CHECK.

---

# 🗂️ Modelo Lógico

O banco possui três tabelas principais:

### ALUNO

- id_aluno (PK)
- nome
- cpf (UNIQUE)
- data_nascimento
- telefone
- email (UNIQUE)
- id_plano (FK)
- id_instrutor (FK)

### PLANO

- id_plano (PK)
- nome (UNIQUE)
- valor
- duracao_dias

### INSTRUTOR

- id_instrutor (PK)
- nome
- especialidade
- telefone

---

# 🔗 Relacionamentos

## Plano → Aluno

Um plano pode estar associado a vários alunos.

Cardinalidade:

**1:N**

## Instrutor → Aluno

Um instrutor pode acompanhar vários alunos.

Cardinalidade:

**1:N**

---

# 📐 Normalização

## 1FN - Primeira Forma Normal

Todos os atributos possuem valores atômicos.

Não existem grupos repetitivos ou múltiplos valores armazenados em uma mesma coluna.

---

## 2FN - Segunda Forma Normal

Todas as tabelas possuem chaves primárias simples.

Os atributos não-chave dependem integralmente da chave primária da respectiva tabela.

Dessa forma, não existem dependências parciais.

---

## 3FN - Terceira Forma Normal

As informações relacionadas aos planos e instrutores foram separadas da tabela ALUNO.

Os dados do plano dependem exclusivamente de `id_plano`.

Os dados do instrutor dependem exclusivamente de `id_instrutor`.

Assim, evitamos dependências transitivas e reduzimos a duplicação de informações.

---

# 🔐 Integridade dos dados

Foram utilizadas as seguintes restrições:

### PRIMARY KEY

Identifica unicamente cada registro.

### FOREIGN KEY

Garante a integridade dos relacionamentos entre as tabelas.

### NOT NULL

Garante o preenchimento dos campos obrigatórios.

### UNIQUE

Impede duplicidade de CPF, e-mail e nome do plano.

### CHECK

Garante que o valor e a duração dos planos sejam maiores que zero.

---

# 🧪 Dados

Foram inseridos:

- 3 planos;
- 3 instrutores;
- 3 alunos.

Totalizando 9 registros inseridos.

---

# 🔎 Consultas

O projeto possui duas consultas utilizando JOIN.

### Consulta 1

Exibe os alunos e seus respectivos planos.

### Consulta 2

Exibe os alunos, seus planos e seus respectivos instrutores.

---

# 💻 Tecnologia

- MySQL
- SQL
- GitHub