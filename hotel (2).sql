-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12/08/2026 às 21:16
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codcliente` int(11) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codcliente`, `cliente`, `email`, `cpf`) VALUES
(1, 'João', 'guilherme@email.com', '123.456.789-19'),
(2, 'Molon', 'molon@gmail.com', '321.644.987-48'),
(3, 'Lucas', 'lucas@gmail.com', '741.852.963-19'),
(4, 'Pedro', 'pedro@gmail.com', '147.258.369-67'),
(5, 'Raphael', 'raphael@gmail.com', '573.918.264-58'),
(6, 'Kaique', 'kaiquecarmosilva148@gmail.com', '761.928.642-74');

-- --------------------------------------------------------

--
-- Estrutura para tabela `hospedagem`
--

CREATE TABLE `hospedagem` (
  `codhospedagem` int(11) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date DEFAULT NULL,
  `horaentrada` time NOT NULL,
  `horasaida` time DEFAULT NULL,
  `totalhospedagem` decimal(7,2) NOT NULL,
  `codcli` int(11) DEFAULT NULL,
  `codquart` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `hospedagem`
--

INSERT INTO `hospedagem` (`codhospedagem`, `dataentrada`, `datasaida`, `horaentrada`, `horasaida`, `totalhospedagem`, `codcli`, `codquart`) VALUES
(1, '2026-08-03', NULL, '15:05:47', NULL, 0.00, 6, 1),
(2, '2026-08-02', NULL, '11:05:47', NULL, 0.00, 2, 3),
(3, '2026-08-03', '0000-00-00', '11:39:21', NULL, 0.00, 3, 6),
(4, '2026-08-04', NULL, '12:20:09', NULL, 0.00, 1, 5),
(6, '2026-08-07', NULL, '10:41:23', NULL, 0.00, 5, 8),
(7, '2026-08-05', NULL, '15:16:45', NULL, 0.00, 4, 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `quarto`
--

CREATE TABLE `quarto` (
  `codquarto` int(11) NOT NULL,
  `quarto` varchar(255) NOT NULL,
  `andar` varchar(255) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quarto`
--

INSERT INTO `quarto` (`codquarto`, `quarto`, `andar`, `tipo`) VALUES
(1, '11', '1º andar', 'Familia + Cama Solteiro'),
(2, '12', '1º andar', 'Casal'),
(3, '13', '1º andar', 'Familia + Cama Solteiro'),
(4, '14', '1º andar', 'Familia + 2 camas Solteiro'),
(5, '21', '2º andar', 'Familia + Cama Solteiro'),
(6, '22', '2º andar', 'Familia + 2 camas solteiro'),
(7, '23', '2º andar', 'Mega Familia'),
(8, '24', '2º andar', 'Suite Presidencial'),
(9, '31', '3º andar', 'Familia + cama solteiro'),
(10, '32', '3º andar', 'Familia + cama solteiro'),
(11, '33', '3º andar', 'Mega familia'),
(12, '31', '3º andar', 'Suite Presidencial');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `codservico` int(11) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `qtde` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`codservico`, `servico`, `valor`, `qtde`, `tipo`) VALUES
(1, 'Coca-Cola', 5.00, 100, 'Bebida'),
(2, 'Coca-Cola 2L', 20.00, 400, 'Bebida'),
(3, 'Coca-Cola 600', 8.00, 755, 'Bebida'),
(4, 'Cerveja Lata - Skol', 10.50, 945, 'Bebida'),
(5, 'Cerveja Lata - Amstel', 12.90, 453, 'Bebida'),
(6, 'Cerveja Lata - Amstel ultra', 15.00, 259, 'Bebida'),
(7, 'Almoço - Buffet completo', 59.50, 354, 'Alimentação'),
(8, 'Pão de Queijo', 5.50, 150, 'Alimentação'),
(9, 'Pão na chapa', 10.50, 200, 'Alimentação'),
(10, 'Massagem 30 min', 150.50, 5, 'Massagem'),
(11, 'Suco de Laranja 500ml', 14.20, 90, 'Bebida'),
(12, 'Suco de Maracujá', 14.20, 90, 'Bebida');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicoshospedagem`
--

CREATE TABLE `servicoshospedagem` (
  `codhospedagem` int(11) DEFAULT NULL,
  `codservico` int(11) DEFAULT NULL,
  `datacompra` date NOT NULL,
  `horacompra` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicoshospedagem`
--

INSERT INTO `servicoshospedagem` (`codhospedagem`, `codservico`, `datacompra`, `horacompra`) VALUES
(2, 7, '2026-08-02', '12:16:10'),
(2, 6, '2026-08-03', '19:16:58'),
(2, 5, '2026-08-10', '16:46:47'),
(2, 9, '2026-08-10', '16:47:16'),
(1, 7, '2026-08-11', '11:47:46'),
(1, 2, '2026-08-09', '18:48:24'),
(1, 12, '2026-08-11', '19:48:43'),
(1, 7, '2026-08-10', '16:49:36'),
(3, 10, '2026-08-09', '09:50:00'),
(3, 7, '2026-08-08', '12:10:22'),
(3, 7, '2026-08-10', '12:00:52'),
(3, 3, '2026-08-11', '18:51:12'),
(4, 7, '2026-08-08', '11:51:37'),
(4, 7, '2026-08-09', '12:52:02'),
(4, 7, '2026-08-11', '11:55:56'),
(4, 4, '2026-08-09', '16:57:25'),
(6, 9, '2026-08-10', '08:58:26'),
(6, 6, '2026-08-12', '17:29:22'),
(6, 7, '2026-08-10', '11:01:48'),
(6, 3, '2026-08-12', '11:02:10'),
(7, 12, '2026-08-10', '16:02:29'),
(7, 9, '2026-08-09', '18:02:46'),
(7, 7, '2026-08-12', '12:04:03'),
(7, 4, '2026-08-11', '17:04:19');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD PRIMARY KEY (`codhospedagem`),
  ADD KEY `codcli` (`codcli`),
  ADD KEY `codquart` (`codquart`);

--
-- Índices de tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`codquarto`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`codservico`);

--
-- Índices de tabela `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD KEY `codhospedagem` (`codhospedagem`),
  ADD KEY `codservico` (`codservico`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  MODIFY `codhospedagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `codquarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `codservico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`codcli`) REFERENCES `cliente` (`codcliente`),
  ADD CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`codquart`) REFERENCES `quarto` (`codquarto`);

--
-- Restrições para tabelas `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD CONSTRAINT `servicoshospedagem_ibfk_1` FOREIGN KEY (`codhospedagem`) REFERENCES `hospedagem` (`codhospedagem`),
  ADD CONSTRAINT `servicoshospedagem_ibfk_2` FOREIGN KEY (`codservico`) REFERENCES `servico` (`codservico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
