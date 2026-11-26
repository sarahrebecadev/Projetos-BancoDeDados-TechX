// Sprint 13 | Contexto Estoque | MongoDB
// Execute: mongosh "mongodb://localhost:27017" estoque.js

const estoqueDB = db.getSiblingDB("erp_estoque_sprint13");

if (!estoqueDB.getCollectionNames().includes("produtos")) {
  estoqueDB.createCollection("produtos");
}

const produtos = estoqueDB.produtos;
produtos.deleteMany({});

const resultado = produtos.insertMany([
  {
    sku: "CEL-001",
    nome: "Smartphone TechX One",
    categoria: "Eletrônicos",
    preco: 1899.90,
    quantidade_disponivel: 15,
    especificacoes: {
      fabricante: "TechX Mobile",
      memoria_ram: "8 GB",
      armazenamento: "256 GB",
      bateria: "5000 mAh",
      tamanho_tela: "6.5 polegadas",
      conectividade: ["5G", "Wi-Fi", "Bluetooth"]
    },
    tags: ["smartphone", "eletrônicos", "telefonia"]
  },
  {
    sku: "CAM-001",
    nome: "Camiseta TechX Básica",
    categoria: "Vestuário",
    preco: 59.90,
    quantidade_disponivel: 40,
    especificacoes: {
      material: "Algodão",
      tamanho: ["P", "M", "G", "GG"],
      cor: ["Preto", "Branco", "Azul"],
      tipo_modelagem: "Regular"
    },
    tags: ["camiseta", "vestuário", "básico"]
  }
]);

print("Documentos inseridos: " + resultado.insertedCount);
print("Catálogo completo:");
printjson(produtos.find({}, { _id: 0 }).toArray());

print("Produtos da categoria Eletrônicos:");
printjson(produtos.find(
  { categoria: "Eletrônicos" },
  { _id: 0, sku: 1, nome: 1, especificacoes: 1 }
).toArray());
