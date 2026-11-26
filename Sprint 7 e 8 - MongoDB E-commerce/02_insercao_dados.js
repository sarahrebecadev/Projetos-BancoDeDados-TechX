// Sprint 7 e 8 — inserção de documentos
// Os dados são fictícios. A limpeza permite repetir o exercício sem duplicar registros.

const dbEcommerce = db.getSiblingDB("ecommerce_sprint_7_8");
const produtos = dbEcommerce.produtos;

produtos.deleteMany({});

const resultado = produtos.insertMany([
  {
    sku: "TEC-001",
    titulo: "Teclado Mecânico Compacto",
    descricao: "Teclado mecânico para jogos e produtividade com iluminação RGB.",
    categoria: "Periféricos",
    preco: 249.90,
    estoque: 18,
    tags: ["eletrônicos", "teclado", "promoção"],
    fabricante: {
      nome: "TechNova",
      pais: "Brasil"
    },
    variacoes: [
      { tamanho: " compacto", cor: "Preto", estoque: 8 },
      { tamanho: "compacto", cor: "Azul", estoque: 10 }
    ]
  },
  {
    sku: "MOU-002",
    titulo: "Mouse Óptico Sem Fio",
    descricao: "Mouse sem fio ergonômico com sensor de alta precisão.",
    categoria: "Periféricos",
    preco: 89.90,
    estoque: 42,
    tags: ["eletrônicos", "mouse", "sem fio"],
    fabricante: {
      nome: "Nexa",
      pais: "Coreia do Sul"
    },
    variacoes: [
      { tamanho: "M", cor: "Azul", estoque: 12 },
      { tamanho: "M", cor: "Preto", estoque: 30 }
    ]
  },
  {
    sku: "MON-003",
    titulo: "Monitor LED 24 polegadas",
    descricao: "Monitor Full HD indicado para estudo, trabalho e entretenimento.",
    categoria: "Monitores",
    preco: 799.90,
    estoque: 9,
    tags: ["eletrônicos", "monitor", "full hd"],
    fabricante: {
      nome: "VisionTech",
      pais: "Japão"
    },
    variacoes: [
      { tamanho: "24", cor: "Preto", estoque: 9 }
    ]
  },
  {
    sku: "FON-004",
    titulo: "Fone Bluetooth",
    descricao: "Fone de ouvido Bluetooth com microfone integrado e bateria recarregável.",
    categoria: "Áudio",
    preco: 159.90,
    estoque: 25,
    tags: ["áudio", "bluetooth", "promoção"],
    fabricante: {
      nome: "SomMais",
      pais: "Brasil"
    },
    variacoes: [
      { tamanho: "Único", cor: "Azul", estoque: 10 },
      { tamanho: "Único", cor: "Branco", estoque: 15 }
    ]
  },
  {
    sku: "WEB-005",
    titulo: "Webcam HD",
    descricao: "Câmera HD para videoconferências, aulas e reuniões online.",
    categoria: "Acessórios",
    preco: 119.90,
    estoque: 14,
    tags: ["câmera", "vídeo", "home office"],
    fabricante: {
      nome: "Pixel",
      pais: "Estados Unidos"
    },
    variacoes: [
      { tamanho: "Único", cor: "Preto", estoque: 14 }
    ]
  }
]);

print("Documentos inseridos: " + resultado.insertedCount);
printjson(produtos.find({}, { _id: 0, sku: 1, titulo: 1 }).toArray());
