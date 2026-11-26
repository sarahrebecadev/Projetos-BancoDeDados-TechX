// Sprint 7 e 8 — configuração do catálogo de e-commerce
// Execute com: mongosh "mongodb://localhost:27017" 01_setup.js

const ecommerceDB = db.getSiblingDB("ecommerce_sprint_7_8");

if (!ecommerceDB.getCollectionNames().includes("produtos")) {
  ecommerceDB.createCollection("produtos");
}

print("Banco selecionado: " + ecommerceDB.getName());
print("Coleção pronta: produtos");
