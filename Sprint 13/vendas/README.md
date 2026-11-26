# Contexto Vendas — Redis

O Redis foi escolhido para manter sessões e carrinhos temporários com baixa latência. O carrinho utiliza Hash e expiração automática.

O arquivo carrinho.redis adiciona produtos, recupera o carrinho, configura TTL de 30 minutos e demonstra a renovação da expiração.

Execute com Redis ativo:

```bash
redis-cli < "Sprint 13/vendas/carrinho.redis"
```

A chave de exemplo é cart:session:abc123. O pedido definitivo deve ser persistido em um serviço/banco durável.
