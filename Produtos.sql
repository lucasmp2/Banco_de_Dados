-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/06/2026 às 02:15
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `produtos`
--
CREATE DATABASE IF NOT EXISTS `produtos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `produtos`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `categoria`, `descricao`) VALUES
(1, 'Esportes', 'Artigos e equipamentos esportivos'),
(2, 'Papelaria', 'Materiais para escritório e estudos'),
(3, 'Jardinagem', 'Produtos para jardinagem e cultivo'),
(4, 'Pet Shop', 'Produtos para animais de estimação'),
(5, 'Ferramentas', 'Ferramentas para manutenção e reparos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens`
--

CREATE TABLE `itens` (
  `idproduto` int(11) NOT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  `nomeproduto` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `qtde` int(11) NOT NULL,
  `datacadastro` date NOT NULL,
  `ativo` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itens`
--

INSERT INTO `itens` (`idproduto`, `idcategoria`, `nomeproduto`, `preco`, `qtde`, `datacadastro`, `ativo`) VALUES
(1, 1, 'Bola de Futebol', 89.90, 8, '2026-04-10', b'1'),
(2, 1, 'Raquete de Tênis', 249.90, 3, '2026-04-15', b'1'),
(3, 1, 'Caneleira', 39.90, 12, '2026-05-01', b'1'),
(4, 2, 'Caderno Universitário', 24.90, 15, '2026-03-20', b'1'),
(5, 2, 'Caneta Azul', 2.50, 50, '2026-04-05', b'1'),
(6, 2, 'Marca Texto', 5.90, 20, '2026-05-12', b'1'),
(7, 3, 'Vaso de Cerâmica', 35.90, 7, '2026-02-18', b'1'),
(8, 3, 'Adubo Orgânico', 18.50, 10, '2026-03-25', b'1'),
(9, 3, 'Regador', 29.90, 5, '2026-04-28', b'1'),
(10, 4, 'Ração Premium', 129.90, 6, '2026-01-30', b'1'),
(11, 4, 'Coleira Ajustável', 22.90, 14, '2026-03-10', b'1'),
(12, 4, 'Brinquedo para Cães', 17.90, 9, '2026-05-05', b'1'),
(13, 5, 'Martelo', 45.90, 11, '2026-02-22', b'1'),
(14, 5, 'Chave de Fenda', 19.90, 18, '2026-04-17', b'1'),
(15, 5, 'Furadeira', 299.90, 2, '2026-05-20', b'1');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Índices de tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `itens_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
