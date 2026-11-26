# Sprint 13 — Arquitetura com Persistência Poliglota

## 1. Arquitetura e limites dos contextos

A proposta divide um ERP de comércio eletrônico em três contextos delimitados. Cada contexto possui responsabilidades e necessidades próprias, utilizando a tecnologia de armazenamento mais adequada.

| Contexto | Responsabilidade | SGBD | Justificativa |
|---|---|---|---|
| Vendas | Sessões e carrinhos ativos | Redis (chave-valor) | Dados temporários, atualizações frequentes, baixa latência e expiração automática por TTL. |
| Estoque | Catálogo, especificações e disponibilidade | MongoDB (documentos) | Produtos de categorias diferentes possuem atributos distintos; documentos permitem esquema flexível. |
| Financeiro | Faturas, cobranças e registros financeiros | PostgreSQL (relacional) | Transações ACID, integridade referencial, restrições e agregações confiáveis. |

### Vendas — Redis

Limite: gerencia o estado temporário do carrinho e da sessão. Não é o registro definitivo do pedido ou do pagamento.

Entidades/conceitos: Carrinho, ItemCarrinho e SessaoVenda. A chave segue o padrão cart:session:{sessionId}, usando Hash com produto e quantidade. O TTL expira carrinhos abandonados.

### Estoque — MongoDB

Limite: mantém catálogo, especificações e quantidade disponível, sendo a fonte responsável pela informação de estoque.

Entidades/conceitos: Produto, Especificacoes e MovimentacaoEstoque. Um celular pode possuir memória, bateria e tela; uma camiseta pode possuir tecido, tamanho e cor. O MongoDB armazena essas estruturas distintas sem exigir os mesmos campos para todos os produtos. Operações críticas devem controlar concorrência e consistência.

### Financeiro — PostgreSQL

Limite: registra faturas, pagamentos e movimentações financeiras, sendo a fonte oficial dos dados financeiros.

Entidades/conceitos: Cliente, Fatura e TransacaoFinanceira. O PostgreSQL oferece transações ACID, chaves estrangeiras, restrições e consultas agregadas. O saldo no script é didático; sistemas reais exigem modelagem contábil e trilha de auditoria apropriadas.

## 2. Scripts e execução

Estrutura:

```text
Sprint 13/
├── README.md
├── financeiro/
│   ├── README.md
│   └── financeiro.sql
├── estoque/
│   ├── README.md
│   └── estoque.js
└── vendas/
    ├── README.md
    └── carrinho.redis
```

### Financeiro — PostgreSQL

Requer PostgreSQL e psql. Execute a partir de uma conexão com permissão para criar bancos:

```bash
psql -U postgres -d postgres -f "Sprint 13/financeiro/financeiro.sql"
```

O script cria clientes e faturas, insere dois registros, calcula o total faturado e demonstra um débito condicionado ao saldo.

### Estoque — MongoDB

Requer MongoDB ativo e mongosh:

```bash
mongosh "mongodb://localhost:27017" "Sprint 13/estoque/estoque.js"
```

O script insere um celular e uma camiseta com especificações diferentes na coleção produtos.

### Vendas — Redis

Requer Redis ativo e redis-cli:

```bash
redis-cli < "Sprint 13/vendas/carrinho.redis"
```

O script cria uma sessão de carrinho, adiciona e consulta itens e define TTL de 30 minutos.

## 3. Integração assíncrona

Em produção, os contextos podem se comunicar por eventos publicados em um broker de mensagens, como RabbitMQ ou Apache Kafka, evitando dependência de uma única transação distribuída.

1. O serviço de Vendas recebe a solicitação de finalização e valida os dados do carrinho. Redis é apenas o estado temporário.
2. Vendas publica PedidoCriado ou EstoqueReservaSolicitada, com o identificador do pedido e os itens.
3. Estoque consome o evento, verifica disponibilidade no MongoDB, registra a reserva com controle de concorrência e publica EstoqueReservado ou EstoqueIndisponivel.
4. Após a confirmação necessária, o Financeiro recebe o evento, registra a fatura/transação no PostgreSQL em uma transação ACID e publica o resultado.
5. Vendas acompanha os eventos, atualiza o status do pedido e remove o carrinho temporário após a confirmação e persistência do pedido.

Uma implementação robusta deve considerar padrão Outbox, consumidores idempotentes, retentativas, filas de mensagens não processadas (DLQ), identificadores de correlação e ações compensatórias. Se o pagamento falhar após a reserva, por exemplo, pode ser publicado um evento para liberar o estoque reservado.

## 4. Reflexão — Polyglot Persistence

Polyglot Persistence, ou Persistência Poliglota, é a estratégia de utilizar diferentes tecnologias de armazenamento em uma mesma aplicação, escolhendo cada banco conforme as características dos dados e das operações.

Um ERP ou e-commerce possui necessidades distintas. O Financeiro precisa de transações consistentes e integridade; o Estoque pode se beneficiar da flexibilidade documental para produtos heterogêneos; e Vendas precisa de baixa latência para sessões e carrinhos temporários.

Forçar todos esses casos em uma única tecnologia pode gerar modelos complexos, operações inadequadas e gargalos. A persistência poliglota permite escolher a ferramenta mais apropriada para cada contexto, mas aumenta a responsabilidade de integração, monitoramento, segurança e consistência eventual.

## 5. Observação sobre CAP

O teorema CAP descreve uma escolha entre consistência e disponibilidade quando ocorre uma partição de rede em um sistema distribuído. Não significa que cada banco seja simplesmente CP ou AP em qualquer configuração. A decisão depende da arquitetura e das garantias configuradas.

Nesta proposta, o Financeiro prioriza consistência transacional. O carrinho no Redis prioriza baixa latência e disponibilidade do estado temporário, mas a confirmação final deve validar novamente preço e estoque em serviços duráveis.

## 6. Validação e evidências

Os scripts foram preparados para execução nos respectivos SGBDs. Para concluir a comprovação, execute cada arquivo e registre capturas de tela reais:
- PostgreSQL: tabelas, duas faturas, soma faturada e transação;
- MongoDB: documentos com especificações diferentes;
- Redis: carrinho consultado e TTL configurado.

As evidências devem corresponder a execuções reais no ambiente da equipe.
