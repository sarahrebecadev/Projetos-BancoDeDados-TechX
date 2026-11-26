# Contexto Estoque — MongoDB

O MongoDB foi escolhido pela flexibilidade do modelo documental. Produtos de categorias diferentes podem ter conjuntos distintos de especificações.

O arquivo estoque.js cria/seleciona a base erp_estoque_sprint13, prepara a coleção produtos e insere um celular e uma camiseta com atributos diferentes.

Execute com MongoDB ativo:

```bash
mongosh "mongodb://localhost:27017" "Sprint 13/estoque/estoque.js"
```
