# 📁 Esquema Básico de Modelagem de Banco de Dados

Este repositório contém arquivos fundamentais para iniciar projetos de **modelagem de dados**, focando em conceitos básicos de **SQL**, como criação de tabelas, **chaves primárias** (`PRIMARY KEY`) e **chaves estrangeiras** (`FOREIGN KEY`).

---

## 🎯 Objetivo

Fornecer um ponto de partida simples e claro para a modelagem de bancos de dados relacionais, utilizando um exemplo prático de uma **Loja Virtual**.

---

## 📂 Estrutura do Repositório

| Arquivo | Descrição |
| :--- | :--- |
| `schema.sql` | Contém o código SQL (`CREATE TABLE`) para criar as tabelas do esquema de exemplo. |
| `README.md` | O arquivo de documentação do projeto. |

---

## 🛠️ Como Usar o `schema.sql`

O arquivo `schema.sql` pode ser executado em qualquer **Sistema de Gerenciamento de Banco de Dados Relacional (SGBD)** que utilize sintaxe SQL padrão (como **PostgreSQL**, **MySQL**, **SQLite**, **SQL Server**, etc.) para criar o esquema.

1.  **Crie um Banco de Dados:** Antes de tudo, crie um novo banco de dados vazio no seu SGBD.
    ```sql
    -- Exemplo para a maioria dos SGBDs
    CREATE DATABASE loja_virtual;
    ```
2.  **Conecte-se:** Conecte sua ferramenta SQL (ou linha de comando) a este novo banco de dados (`loja_virtual`).
3.  **Execute o Arquivo:** Carregue e execute o conteúdo do arquivo `schema.sql`.

---

## 🛒 O Esquema Exemplo (`schema.sql`)

O esquema modela um relacionamento simples de **Loja Virtual** com três tabelas principais, ilustrando o uso de Chaves Primárias e Estrangeiras para garantir a integridade referencial:

1.  **`clientes`**: Armazena informações dos usuários.
2.  **`produtos`**: Armazena os itens disponíveis para venda.
3.  **`pedidos`**: Armazena os pedidos feitos pelos clientes, **relacionando** `clientes` e `produtos`.

### Código de Exemplo (`schema.sql`)

```sql
--
-- 1. Tabela: clientes
-- Armazena as informações dos usuários (clientes).
-- Define 'id_cliente' como CHAVE PRIMÁRIA.
--
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

--
-- 2. Tabela: produtos
-- Armazena os itens disponíveis para compra.
-- Define 'id_produto' como CHAVE PRIMÁRIA.
--
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

--
-- 3. Tabela: pedidos
-- Armazena os pedidos feitos.
-- 'id_cliente' e 'id_produto' são CHAVES ESTRANGEIRAS,
-- ligando a tabela 'pedidos' às tabelas 'clientes' e 'produtos'.
--
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    quantidade INT NOTADES NULL,
    
    -- Coluna para a chave estrangeira do cliente
    id_cliente INT,
    
    -- Coluna para a chave estrangeira do produto
    id_produto INT,

    -- Definição da Chave Estrangeira que aponta para a tabela 'clientes'
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    
    -- Definição da Chave Estrangeira que aponta para a tabela 'produtos'
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
