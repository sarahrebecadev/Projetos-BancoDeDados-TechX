// Sprint 7 e 8 — consultas, desafio $elemMatch e bônus explain()
const produtos = db.getSiblingDB("ecommerce_sprint_7_8").produtos;

print("\n1) Produtos com preço entre R$ 100 e R$ 300:");
printjson(produtos.find(
  { preco: { $gt: 100, $lt: 300 } },
  { _id: 0, sku: 1, titulo: 1, preco: 1 }
).toArray());

print("\n2) Produtos que possuem a tag promoção:");
printjson(produtos.find(
  { tags: "promoção" },
  { _id: 0, sku: 1, titulo: 1, tags: 1 }
).toArray());

print("\n3) Busca textual por tecnologia sem fio:");
printjson(produtos.find(
  { $text: { $search: "sem fio" } },
  { _id: 0, sku: 1, titulo: 1, descricao: 1, score: { $meta: "textScore" } }
).sort({ score: { $meta: "textScore" } }).toArray());

print("\n4) Desafio — produto com variação tamanho M e cor Azul no mesmo subdocumento:");
printjson(produtos.find(
  { variacoes: { $elemMatch: { tamanho: "M", cor: "Azul" } } },
  { _id: 0, sku: 1, titulo: 1, variacoes: 1 }
).toArray());

print("\n5) Bônus — estatísticas de execução da consulta por preço:");
printjson(produtos.find(
  { preco: { $gt: 100, $lt: 300 } }
).explain("executionStats"));
