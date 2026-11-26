// Sprint 7 e 8 — criação dos índices
const produtos = db.getSiblingDB("ecommerce_sprint_7_8").produtos;

// Índice simples para consultas e ordenações por preço.
print("Índice simples:");
printjson(produtos.createIndex({ preco: 1 }));

// Um único índice de texto cobre título e descrição.
print("Índice de texto:");
printjson(produtos.createIndex(
  { titulo: "text", descricao: "text" },
  { name: "texto_titulo_descricao", default_language: "portuguese" }
));

print("Índices disponíveis:");
printjson(produtos.getIndexes());
