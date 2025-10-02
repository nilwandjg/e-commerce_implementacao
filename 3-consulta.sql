-- Listar todos os clientes
SELECT * FROM cliente;

-- Ver os produtos disponíveis em estoque
SELECT * FROM produto_has_estoque;

-- Mostrar todos os pedidos com status "Finalizado"
SELECT * FROM pedido WHERE status_pedido = 'Finalizado';

-- Mostrar pedidos com nome do cliente e status da entrega
SELECT 
  p.idPedido,
  c.nome AS cliente,
  e.status AS entrega_status
FROM pedido p
JOIN cliente c ON p.cliente_idCliente = c.idCliente
JOIN entrega e ON p.entrega_idEntrega = e.idEntrega;

-- Listar produtos e seus fornecedores
SELECT 
  pr.descricao AS produto,
  f.razao_social AS fornecedor
FROM disponibilizando_produto dp
JOIN produto pr ON dp.produto_idProduto = pr.idProduto
JOIN fornecedor f ON dp.fornecedor_idFornecedor = f.id_fornecedor;

-- Ver quantidade de cada produto em cada estoque
SELECT 
  p.descricao AS produto,
  es.local AS estoque,
  pe.quantidade
FROM produto_has_estoque pe
JOIN produto p ON pe.produto_idProduto = p.idProduto
JOIN estoque es ON pe.estoque_idEstoque = es.idEstoque;

-- Ver tipo e valor de pagamento por pedido
SELECT 
  pg.idPagamento,
  pg.tipo,
  pg.valor,
  pd.descricao AS pedido
FROM pagamento pg
JOIN pedido pd ON pg.pedido_idPedido = pd.idPedido;

-- Total de produtos vendidos por pedido
SELECT 
  pedido_idPedido,
  SUM(CAST(quantidade AS UNSIGNED)) AS total_itens
FROM relacao_produto_pedido
GROUP BY pedido_idPedido;

-- Ver pedidos com mais de 2 itens
SELECT 
  pedido_idPedido,
  SUM(CAST(quantidade AS UNSIGNED)) AS total_itens
FROM relacao_produto_pedido
GROUP BY pedido_idPedido
HAVING total_itens > 2;