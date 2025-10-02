-- cliente
INSERT INTO cliente (idCliente, nome, identificacao, endereco, telefone) VALUES
(1, 'Ana Souza', '12345678900', 'Rua das Flores, 100', '11999990000'),
(2, 'Carlos Lima', '98765432100', 'Av. Brasil, 200', '11988880000');

-- entrega
INSERT INTO entrega (idEntrega, status, codigoRastreio) VALUES
(1, 'Em trânsito', 'BR123456789'),
(2, 'Entregue', 'BR987654321');

-- pedido
INSERT INTO pedido (idPedido, status_pedido, descricao, cliente_idCliente, frete, entrega_idEntrega) VALUES
(1, 'Processando', 'Pedido de eletrônicos', 1, 25.50, 1),
(2, 'Finalizado', 'Pedido de roupas', 2, 15.00, 2);

-- produto
INSERT INTO produto (idProduto, categoria, descricao, valor) VALUES
(1, 'Eletrônicos', 'Fone de ouvido Bluetooth', '199.90'),
(2, 'Vestuário', 'Camiseta básica', '49.90');

-- fornecedor
INSERT INTO fornecedor (id_fornecedor, razao_social, cnpj) VALUES
(1, 'Tech Distribuidora', '12345678000199'),
(2, 'Moda Brasil Ltda', '98765432000188');

-- disponibilizando_produto
INSERT INTO disponibilizando_produto (fornecedor_idFornecedor, produto_idProduto) VALUES
(1, 1),
(2, 2);

-- estoque
INSERT INTO estoque (idEstoque, local) VALUES
(1, 'Centro SP'),
(2, 'Zona Norte');

-- produto_has_estoque
INSERT INTO produto_has_estoque (produto_idProduto, estoque_idEstoque, quantidade) VALUES
(1, 1, 50),
(2, 2, 100);

-- relacao_produto_pedido
INSERT INTO relacao_produto_pedido (Produto_idProduto, pedido_idPedido, quantidade) VALUES
(1, 1, '2'),
(2, 2, '3');

-- terceiro_vendedor
INSERT INTO terceiro_vendedor (id_terceiro_vendedor, razao_social, local) VALUES
(1, 'Vendas Online ME', 'São Paulo'),
(2, 'Loja do João', 'Campinas');

-- produtor_por_vendedor
INSERT INTO produtor_por_vendedor (Terceiro_vendedor_idterceiro_vendedor, produto_idProduto, quantidade) VALUES
(1, 1, 10),
(2, 2, 20);

-- pessoa_juridica
INSERT INTO pessoa_juridica (idPessoaJuridica, cliente_idCliente, cnpj) VALUES
(1, 1, '11222333000155');

-- pessoa_fisica
INSERT INTO pessoa_fisica (idPessoaFisica, cliente_idCliente, cpf) VALUES
(1, 2, '98765432100');

-- pagamento
INSERT INTO pagamento (idPagamento, tipo, valor, pedido_idPedido) VALUES
(1, 'Cartão de crédito', '199.90', 1),
(2, 'Pix', '149.70', 2);