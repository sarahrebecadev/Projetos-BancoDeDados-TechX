// Sprint 9 e 10 — consultas de recomendação Neo4j

// 1) Recomendar produtos comprados por amigos de amigos.
// A consulta considera exatamente dois saltos de amizade,
// exclui o usuário de origem e também seus amigos diretos.
MATCH (origem:Usuario {id: "U001"})-[:AMIGO_DE]-(amigo:Usuario)
      -[:AMIGO_DE]-(amigoDoAmigo:Usuario)
      -[:COMPROU]->(produto:Produto)
WHERE amigoDoAmigo <> origem
  AND NOT (origem)-[:AMIGO_DE]-(amigoDoAmigo)
  AND NOT (origem)-[:COMPROU]->(produto)
RETURN DISTINCT
  produto.id AS produtoId,
  produto.nome AS produto,
  collect(DISTINCT amigoDoAmigo.nome) AS recomendadoPor
ORDER BY produto;

// 2) Recomendar produtos com base em compras em comum.
// Pessoas que compraram um produto que o usuário também comprou
// podem revelar outros produtos de interesse.
MATCH (origem:Usuario {id: "U001"})-[:COMPROU]->(produtoEmComum:Produto)
      <-[:COMPROU]-(outroUsuario:Usuario)-[:COMPROU]->(recomendado:Produto)
WHERE outroUsuario <> origem
  AND NOT (origem)-[:COMPROU]->(recomendado)
RETURN
  recomendado.id AS produtoId,
  recomendado.nome AS produto,
  count(DISTINCT outroUsuario) AS usuariosComInteresseEmComum,
  collect(DISTINCT produtoEmComum.nome) AS comprasEmComum
ORDER BY usuariosComInteresseEmComum DESC, produto;
