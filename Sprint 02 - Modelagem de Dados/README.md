# 🏋️ Desafio Sprint 1 - Radar de Dados

## Cenário

O cenário escolhido para este desafio foi uma academia.

O sistema tem como objetivo organizar informações sobre alunos,
planos de assinatura e instrutores.

## Requisitos

O sistema deverá:

- Cadastrar alunos;
- Cadastrar instrutores;
- Cadastrar planos;
- Associar alunos aos planos;
- Associar alunos aos instrutores;
- Armazenar informações dos alunos;
- Armazenar informações dos instrutores;
- Armazenar informações dos planos.

## Entidades

### Aluno

- id_aluno (PK)
- nome
- cpf
- data_nascimento
- telefone
- email
- id_plano (FK)
- id_instrutor (FK)

### Plano

- id_plano (PK)
- nome
- valor
- duracao_dias

### Instrutor

- id_instrutor (PK)
- nome
- especialidade
- telefone

## Relacionamentos

### Plano → Aluno

Um plano pode estar associado a vários alunos,
enquanto cada aluno está associado a um plano.

**Cardinalidade: 1:N**

### Instrutor → Aluno

Um instrutor pode acompanhar vários alunos,
enquanto cada aluno está associado a um instrutor.

**Cardinalidade: 1:N**

## Tecnologias

- SQL
- MySQL

## Arquivos

- `Academia.sql` - código de criação e inserção dos dados.
- `diagrama-logico.png` - modelo conceitual.
- `Modelo-conceitual.png` - modelo lógico.