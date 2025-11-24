-- =========================================================
-- ARQUIVO: schema.sql
-- DESCRIÇÃO: Esquema de banco de dados simples para uma Loja Virtual.
-- UTILIZAÇÃO: Executar em um SGBD (MySQL, PostgreSQL, etc.) para criar as tabelas.
-- =========================================================

-- 1. Tabela Clientes
-- Armazena informações básicas dos clientes.
CREATE TABLE clientes (
    -- Chave Primária (identificador único para cada cliente)
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- 2. Tabela Produtos
-- Armazena detalhes dos produtos disponíveis para venda.
CREATE TABLE produtos (
    -- Chave Primária (identificador único para cada produto)
    produto_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0
);

-- 3. Tabela Pedidos
-- Armazena os pedidos feitos, relacionando Clientes e Produtos.
CREATE TABLE pedidos (
    -- Chave Primária (identificador único para cada pedido)
    pedido_id INT PRIMARY KEY,
    
    -- Chave Estrangeira: Referencia a tabela 'clientes'
    cliente_id INT NOT NULL,
    
    -- Chave Estrangeira: Referencia a tabela 'produtos'
    produto_id INT NOT NULL,
    
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quantidade INT NOT NULL,
    
    -- Define a chave estrangeira para o cliente
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    
    -- Define a chave estrangeira para o produto
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- Exemplo de Comandos de Inserção de Dados (Opcional)
INSERT INTO clientes (cliente_id, nome, email) VALUES
(1, 'Ana Silva', 'ana.silva@email.com'),
(2, 'Bruno Costa', 'bruno.costa@email.com');

INSERT INTO produtos (produto_id, nome, descricao, preco, estoque) VALUES
(101, 'Smartphone X', 'Celular de última geração.', 1500.00, 50),
(102, 'Fones de Ouvido Y', 'Fones sem fio de alta fidelidade.', 250.50, 120);

INSERT INTO pedidos (pedido_id, cliente_id, produto_id, quantidade) VALUES
(1001, 1, 101, 1), -- Ana comprou 1 Smartphone X
(1002, 2, 102, 2); -- Bruno comprou 2 Fones Y