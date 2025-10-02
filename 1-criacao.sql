

CREATE SCHEMA IF NOT EXISTS `ecomm_desafio` DEFAULT CHARACTER SET utf8 ;
USE `ecomm_desafio`;

-- cliente
CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `identificacao` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`));


-- entrega
CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`entrega` (
  `idEntrega` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  `codigoRastreio` VARCHAR(45) NULL,
  PRIMARY KEY (`idEntrega`));


-- pedido
CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`pedido` (
  `idPedido` INT NOT NULL,
  `status_pedido` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  `cliente_idCliente` INT NOT NULL,
  `frete` FLOAT NULL,
  `entrega_idEntrega` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `cliente_idCliente`, `entrega_idEntrega`),
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `ecomm_desafio`.`cliente` (`idCliente`),
  CONSTRAINT `fk_Pedido_Entrega1`
    FOREIGN KEY (`entrega_idEntrega`)
    REFERENCES `ecomm_desafio`.`entrega` (`idEntrega`));


-- produto
CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`produto` (
  `idProduto` INT NOT NULL,
  `categoria` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduto`));


-- fornecedor
CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`fornecedor` (
  `id_fornecedor` INT NOT NULL,
  `razao_social` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  PRIMARY KEY (`id_fornecedor`));


-- disponibilizando_produto
CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`disponibilizando_produto` (
  `fornecedor_idFornecedor` INT NOT NULL,
  `produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`fornecedor_idFornecedor`, `produto_idProduto`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor`
    FOREIGN KEY (`fornecedor_idFornecedor`)
    REFERENCES `ecomm_desafio`.`fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1`
    FOREIGN KEY (`produto_idProduto`)
    REFERENCES `ecomm_desafio`.`produto` (`idProduto`));


-- estoque
CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`estoque` (
  `idEstoque` INT NOT NULL,
  `local` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstoque`));


-- produto_has_estoque
CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`produto_has_estoque` (
  `produto_idProduto` INT NOT NULL,
  `estoque_idEstoque` INT NOT NULL,
  `quantidade` INT NULL,
  PRIMARY KEY (`produto_idProduto`, `estoque_idEstoque`),
  CONSTRAINT `fk_Produto_has_Estoque_Produto1`
    FOREIGN KEY (`produto_idProduto`)
    REFERENCES `ecomm_desafio`.`produto` (`idProduto`),
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1`
    FOREIGN KEY (`estoque_idEstoque`)
    REFERENCES `ecomm_desafio`.`estoque` (`idEstoque`));


-- relacao_produto_pedido
CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`relacao_produto_pedido` (
  `Produto_idProduto` INT NOT NULL,
  `pedido_idPedido` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `pedido_idPedido`),
  CONSTRAINT `fk_Produto_has_Pedido_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `ecomm_desafio`.`produto` (`idProduto`),
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1`
    FOREIGN KEY (`pedido_idPedido`)
    REFERENCES `ecomm_desafio`.`pedido` (`idPedido`));


-- terceiro_vendedor

CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`terceiro_vendedor` (
  `id_terceiro_vendedor` INT NOT NULL,
  `razao_social` VARCHAR(45) NULL,
  `local` VARCHAR(45) NULL,
  PRIMARY KEY (`id_terceiro_vendedor`));


-- produtor_por_vendedor

CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`produtor_por_vendedor` (
  `Terceiro_vendedor_idterceiro_vendedor` INT NOT NULL,
  `produto_idProduto` INT NOT NULL,
  `quantidade` INT NULL,
  PRIMARY KEY (`Terceiro_vendedor_idterceiro_vendedor`, `produto_idProduto`),
  CONSTRAINT `fk_Terceiro_Vendedor_has_Produto_Terceiro_Vendedor1`
    FOREIGN KEY (`Terceiro_vendedor_idterceiro_vendedor`)
    REFERENCES `ecomm_desafio`.`terceiro_vendedor` (`id_terceiro_vendedor`),
  CONSTRAINT `fk_Terceiro_Vendedor_has_Produto_Produto1`
    FOREIGN KEY (`produto_idProduto`)
    REFERENCES `ecomm_desafio`.`produto` (`idProduto`));



-- pessoa_juridica
CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`pessoa_juridica` (
  `idPessoaJuridica` INT NOT NULL,
  `cliente_idCliente` INT NOT NULL,
  `cnpj` VARCHAR(45) NULL,
  PRIMARY KEY (`idPessoaJuridica`, `cliente_idCliente`),
  CONSTRAINT `fk_Pessoa_Juridica_Cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `ecomm_desafio`.`cliente` (`idCliente`));


-- pessoa_fisica
CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`pessoa_fisica` (
  `idPessoaFisica` INT NOT NULL,
  `cliente_idCliente` INT NOT NULL,
  `cpf` VARCHAR(45) NULL,
  PRIMARY KEY (`idPessoaFisica`, `cliente_idCliente`),
  CONSTRAINT `fk_pessoa_fisica_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `ecomm_desafio`.`cliente` (`idCliente`));


--  pagamento
CREATE TABLE IF NOT EXISTS `ecomm_desafio`.`pagamento` (
  `idPagamento` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NULL,
  `pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`idPagamento`, `pedido_idPedido`),
  CONSTRAINT `fk_Pagamento_Pedido1`
    FOREIGN KEY (`pedido_idPedido`)
    REFERENCES `ecomm_desafio`.`pedido` (`idPedido`));