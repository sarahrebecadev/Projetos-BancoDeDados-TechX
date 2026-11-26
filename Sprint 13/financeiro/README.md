# Contexto Financeiro — PostgreSQL

O PostgreSQL foi escolhido por oferecer transações ACID, integridade referencial, restrições e consultas agregadas confiáveis.

O arquivo financeiro.sql cria clientes e faturas, insere dois registros, calcula o total faturado e demonstra um débito condicionado ao saldo disponível.

Execute a partir de uma conexão com permissão para criar bancos:

```bash
psql -U postgres -d postgres -f "Sprint 13/financeiro/financeiro.sql"
```

Se o saldo for insuficiente, a exceção interrompe o bloco e impede a gravação do débito.
