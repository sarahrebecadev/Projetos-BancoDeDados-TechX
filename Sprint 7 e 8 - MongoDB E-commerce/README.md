# Sprint 7 e 8 — Modelagem NoSQL com MongoDB

## Objetivo

Modelar um catálogo de e-commerce utilizando MongoDB, explorando documentos, arrays, subdocumentos, índices e consultas. O exemplo utiliza dados fictícios e uma base independente das atividades anteriores.

## Organização

| Arquivo | Conteúdo |
|---|---|
| `01_setup.js` | Seleção do banco e criação da coleção |
| `02_insercao_dados.js` | Inserção de produtos com arrays e subdocumentos |
| `03_indices.js` | Índice simples e índice de texto |
| `04_consultas.js` | Filtros, busca textual, `$elemMatch` e `explain()` |

## Modelo documental

A coleção `produtos` utiliza:
- **Arrays:** `tags` e `variacoes`;
- **Subdocumentos:** `fabricante` e objetos de variação;
- **Campos consultáveis:** `preco`, `categoria`, `titulo` e `descricao`.

Cada produto mantém no próprio documento as informações que costumam ser consultadas em conjunto, como fabricante e variações disponíveis.

## Como executar

**Pré-requisitos:** MongoDB em execução e `mongosh` instalado.

Na raiz do repositório, execute os arquivos na ordem:

```bash
mongosh "mongodb://localhost:27017" "Sprint 7 e 8 - MongoDB E-commerce/01_setup.js"
mongosh "mongodb://localhost:27017" "Sprint 7 e 8 - MongoDB E-commerce/02_insercao_dados.js"
mongosh "mongodb://localhost:27017" "Sprint 7 e 8 - MongoDB E-commerce/03_indices.js"
mongosh "mongodb://localhost:27017" "Sprint 7 e 8 - MongoDB E-commerce/04_consultas.js"
```

Os comandos também podem ser copiados e executados diretamente no terminal `mongosh`. A inserção limpa previamente os documentos da coleção de demonstração para que a execução repetida produza resultados previsíveis.

## Consultas desenvolvidas

1. Comparação de preços com `$gt` e `$lt`;
2. Busca de um valor dentro do array `tags`;
3. Busca textual usando o índice de texto;
4. Filtro de subdocumentos em array com `$elemMatch`;
5. Análise de execução com `.explain("executionStats")`.

## Índices

- `preco_1`: índice crescente para filtros e ordenações por preço;
- Índice de texto em `titulo` e `descricao`: permite pesquisas com `$text`.

O MongoDB permite somente um índice de texto por coleção. Por isso, os dois campos textuais são cobertos pelo mesmo índice.

## Reflexão — Embedding x Referencing

**Embedding** consiste em incorporar dados relacionados dentro do próprio documento, por meio de subdocumentos ou arrays. É indicado quando as informações são normalmente lidas juntas, possuem tamanho controlado e não precisam ser compartilhadas ou atualizadas de forma independente. No e-commerce, fabricante e variações de um produto podem ser incorporados ao documento do produto.

**Referencing** consiste em armazenar o identificador de outro documento ou coleção, mantendo os dados separados. É indicado quando os dados são compartilhados por muitos registros, mudam frequentemente ou podem crescer sem limite previsível. Por exemplo, pedidos podem referenciar clientes e produtos por seus IDs, evitando duplicar os cadastros completos em cada pedido.

A decisão depende dos padrões de leitura e atualização, do crescimento dos dados e da necessidade de evitar duplicação. O limite máximo de um documento BSON é 16 MB, portanto arrays que crescem indefinidamente devem ser evitados.

## Observação sobre evidências

Os scripts demonstram as operações solicitadas. Para comprovar a execução no ambiente local, a equipe deve executar os arquivos e registrar as saídas do terminal, especialmente o resultado de `explain("executionStats")`. O plano pode variar conforme a versão do MongoDB e os dados disponíveis.
