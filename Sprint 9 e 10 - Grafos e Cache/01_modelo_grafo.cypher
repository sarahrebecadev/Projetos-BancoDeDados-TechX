// Sprint 9 e 10 — modelo de grafo para recomendações
// Execute em uma base Neo4j de testes.

// Restrições de unicidade.
CREATE CONSTRAINT usuario_id_unico IF NOT EXISTS
FOR (u:Usuario) REQUIRE u.id IS UNIQUE;

CREATE CONSTRAINT produto_id_unico IF NOT EXISTS
FOR (p:Produto) REQUIRE p.id IS UNIQUE;

// Nós de usuários.
MERGE (u1:Usuario {id: "U001"})
  SET u1.nome = "Ana", u1.interesses = ["tecnologia", "jogos"];

MERGE (u2:Usuario {id: "U002"})
  SET u2.nome = "Bruno", u2.interesses = ["tecnologia", "áudio"];

MERGE (u3:Usuario {id: "U003"})
  SET u3.nome = "Carla", u3.interesses = ["jogos", "periféricos"];

MERGE (u4:Usuario {id: "U004"})
  SET u4.nome = "Diego", u4.interesses = ["tecnologia", "periféricos"];

MERGE (u5:Usuario {id: "U005"})
  SET u5.nome = "Eva", u5.interesses = ["áudio", "música"];

// Nós de produtos.
MERGE (p1:Produto {id: "P100"})
  SET p1.nome = "Teclado Mecânico", p1.categoria = "Periféricos";

MERGE (p2:Produto {id: "P200"})
  SET p2.nome = "Mouse Gamer", p2.categoria = "Periféricos";

MERGE (p3:Produto {id: "P300"})
  SET p3.nome = "Fone Bluetooth", p3.categoria = "Áudio";

MERGE (p4:Produto {id: "P400"})
  SET p4.nome = "Monitor Full HD", p4.categoria = "Monitores";

// Relacionamentos de amizade.
// O MERGE sem direção cria a relação na direção indicada pelo padrão.
MATCH (a:Usuario {id: "U001"}), (b:Usuario {id: "U002"})
MERGE (a)-[:AMIGO_DE]-(b);

MATCH (a:Usuario {id: "U002"}), (b:Usuario {id: "U003"})
MERGE (a)-[:AMIGO_DE]-(b);

MATCH (a:Usuario {id: "U003"}), (b:Usuario {id: "U004"})
MERGE (a)-[:AMIGO_DE]-(b);

MATCH (a:Usuario {id: "U004"}), (b:Usuario {id: "U005"})
MERGE (a)-[:AMIGO_DE]-(b);

// Compras dos usuários.
MATCH (u:Usuario {id: "U001"}), (p:Produto {id: "P100"})
MERGE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {id: "U002"}), (p:Produto {id: "P100"})
MERGE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {id: "U002"}), (p:Produto {id: "P200"})
MERGE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {id: "U003"}), (p:Produto {id: "P200"})
MERGE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {id: "U003"}), (p:Produto {id: "P300"})
MERGE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {id: "U004"}), (p:Produto {id: "P200"})
MERGE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {id: "U004"}), (p:Produto {id: "P400"})
MERGE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {id: "U005"}), (p:Produto {id: "P300"})
MERGE (u)-[:COMPROU]->(p);

MATCH (u:Usuario {id: "U005"}), (p:Produto {id: "P400"})
MERGE (u)-[:COMPROU]->(p);
