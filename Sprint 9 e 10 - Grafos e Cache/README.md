# Sprint 9 e 10 — Banco de Grafos e Cache com Redis

## Objetivo

Construir um modelo de grafo para recomendações de produtos e definir uma estratégia de cache em memória para carrinhos de compras. A entrega utiliza **Neo4j com Cypher** e **Redis**.

## Organização

| Arquivo | Conteúdo |
|---|---|
| `01_modelo_grafo.cypher` | Restrições, nós e relacionamentos |
| `02_consultas_recomendacao.cypher` | Recomendação de amigos de amigos e produtos relacionados |
| `03_carrinho_redis.redis` | Inclusão, leitura, expiração e invalidação do carrinho |

## Parte 1 — Modelo de grafo

### Nós
- `Usuario`: representa uma pessoa que utiliza a plataforma;
- `Produto`: representa um item disponível no e-commerce.

### Relacionamentos
- `AMIGO_DE`: conecta usuários que possuem amizade;
- `COMPROU`: conecta um usuário a um produto adquirido.

Os identificadores `id` são únicos e possuem restrições no Neo4j. Os dados utilizados são fictícios.

## Parte 2 — Consultas de recomendação

A primeira consulta encontra produtos comprados por usuários que estão a dois relacionamentos de amizade do usuário de origem, excluindo o próprio usuário e seus amigos diretos.

A segunda consulta recomenda produtos comprados por pessoas que também compraram um produto em comum com o usuário de origem, excluindo itens que ele já comprou.

## Parte 3 — Estrutura de cache do carrinho

**Padrão de chave:** `cart:user:{userId}`

Exemplo: `cart:user:1001`

**Estrutura Redis:** Hash. Cada campo representa um produto (`produto:{productId}`) e seu valor representa a quantidade.

Exemplo conceitual:

```text
cart:user:1001
  produto:501 -> 2
  produto:702 -> 1
```

Operações incluídas:
- `HSET`: adiciona ou atualiza a quantidade de um produto;
- `HGETALL`: lê o carrinho completo;
- `EXPIRE`: define expiração de 24 horas para carrinhos abandonados;
- `DEL`: invalida a chave após a confirmação do checkout.

A aplicação deve renovar o TTL quando o carrinho for atualizado, conforme a política de abandono adotada.

## Como executar

### Neo4j

**Pré-requisito:** instância Neo4j ativa e acesso ao Neo4j Browser ou `cypher-shell`.

Na raiz do repositório:

```bash
cypher-shell -u neo4j -f "Sprint 9 e 10 - Grafos e Cache/01_modelo_grafo.cypher"
cypher-shell -u neo4j -f "Sprint 9 e 10 - Grafos e Cache/02_consultas_recomendacao.cypher"
```

Informe a senha quando solicitada. No Neo4j Browser, também é possível abrir cada arquivo e executar os comandos por blocos.

### Redis

**Pré-requisito:** servidor Redis ativo e `redis-cli` instalado.

```bash
redis-cli < "Sprint 9 e 10 - Grafos e Cache/03_carrinho_redis.redis"
```

Os comandos de demonstração usam a chave `cart:user:1001`. O script inclui a operação de checkout com `DEL`, portanto a chave será removida ao final da execução. Para observar o carrinho antes da invalidação, execute os comandos por blocos ou comente temporariamente a linha `DEL`.

## Reflexão — Grafo x SQL e Redis x banco principal

Um banco de grafos como o Neo4j representa entidades como nós e suas conexões como relacionamentos. Para perguntas como “amigos de amigos”, o banco percorre as relações diretamente, tornando a navegação por múltiplos saltos natural. Em um modelo relacional, seria necessário combinar tabelas repetidamente com JOINs, o que pode tornar consultas de profundidade variável mais trabalhosas. Isso não significa que grafos sejam sempre mais rápidos: a vantagem depende do tipo de consulta e da estrutura dos dados.

O Redis mantém dados principalmente em memória, oferecendo operações de leitura e escrita com baixa latência. Para carrinhos frequentemente alterados, um Hash permite atualizar a quantidade de um item sem regravar um objeto inteiro e o TTL remove carrinhos abandonados automaticamente. Isso reduz a carga do banco principal, mas exige uma estratégia para persistência, recuperação e sincronização dos dados importantes. O checkout deve validar os itens e registrar o pedido no banco principal antes de invalidar o cache do carrinho.

## Observação sobre evidências

Os arquivos contêm comandos executáveis e dados de demonstração. A equipe deve executar os scripts nos ambientes Neo4j e Redis e registrar as saídas reais para comprovar a execução.
