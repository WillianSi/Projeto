-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.22 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para banco_supermercado
DROP DATABASE IF EXISTS `banco_supermercado`;
CREATE DATABASE IF NOT EXISTS `banco_supermercado` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banco_supermercado`;

-- Copiando estrutura para tabela banco_supermercado.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `cpfCliente` varchar(14) NOT NULL,
  `nomeCliente` varchar(200) NOT NULL,
  `telCliente` varchar(19) NOT NULL,
  `ufCliente` varchar(2) NOT NULL,
  `cepCliente` varchar(10) NOT NULL,
  `cidadeCliente` varchar(100) NOT NULL,
  `bairroCliente` varchar(100) NOT NULL,
  `enderecoCliente` varchar(100) NOT NULL,
  `idCliente` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela banco_supermercado.cliente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`cpfCliente`, `nomeCliente`, `telCliente`, `ufCliente`, `cepCliente`, `cidadeCliente`, `bairroCliente`, `enderecoCliente`, `idCliente`) VALUES
	('060.999.123-01', 'Lorena Alcântara de Farias', '+55 (35) 98224-4559', 'MG', '30110-009', 'Belo Horizonte', 'Floresta Alta', 'Av. Contorno, 1827', 1),
	('101.555.246-29', 'Cristiano Rodrigues Alexandre da Silva', '+55 (35) 99855-0011', 'MG', '31741-565', 'Belo Horizonte', 'Heliópolis', 'Rua Ademar Dias Duarte, 0022', 2),
	('066.939.223-21', 'Ana melo', '+55 (35) 99909-0910', 'RJ', '30770-130', 'Rio de Janeiro', 'Caiçaras', 'Rua Adolfo Monteiro de Castro,0001', 4);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para procedure banco_supermercado.consultaSenha
DROP PROCEDURE IF EXISTS `consultaSenha`;
DELIMITER //
CREATE PROCEDURE `consultaSenha`(usuario varchar(100), senha varchar(100))
BEGIN
Select * from usuarios where usuarios.nome = usuario and usuarios.senha = senha;
END//
DELIMITER ;

-- Copiando estrutura para procedure banco_supermercado.deletaCliente
DROP PROCEDURE IF EXISTS `deletaCliente`;
DELIMITER //
CREATE PROCEDURE `deletaCliente`(cpfremove varchar(14))
BEGIN
DELETE FROM `banco_supermercado`.`cliente`
WHERE cpfCliente = cpfremove;
END//
DELIMITER ;

-- Copiando estrutura para procedure banco_supermercado.insereCliente
DROP PROCEDURE IF EXISTS `insereCliente`;
DELIMITER //
CREATE PROCEDURE `insereCliente`(cpfC varchar(14),nomeC varchar(200),telC varchar(19),ufC varchar(2),cepC varchar(10),cidadeC varchar(100),bairroC varchar(100),enderecoC varchar(100))
BEGIN
INSERT INTO `banco_supermercado`.`cliente`
(`cpfCliente`,
`nomeCliente`,
`telCliente`,
`ufCliente`,
`cepCliente`,
`cidadeCliente`,
`bairroCliente`,
`enderecoCliente`)
VALUES
(cpfC,
nomeC ,
telC,
ufC,
cepC,
cidadeC,
bairroC,
enderecoC);
END//
DELIMITER ;

-- Copiando estrutura para procedure banco_supermercado.insere_user
DROP PROCEDURE IF EXISTS `insere_user`;
DELIMITER //
CREATE PROCEDURE `insere_user`(in nome varchar(100), in senha varchar(100))
BEGIN
INSERT INTO `usuarios`
(`nome`,
`senha`)
VALUES
(nome,
senha);
END//
DELIMITER ;

-- Copiando estrutura para procedure banco_supermercado.listaClientes
DROP PROCEDURE IF EXISTS `listaClientes`;
DELIMITER //
CREATE PROCEDURE `listaClientes`()
BEGIN
select * from cliente;
END//
DELIMITER ;

-- Copiando estrutura para procedure banco_supermercado.updateCliente
DROP PROCEDURE IF EXISTS `updateCliente`;
DELIMITER //
CREATE PROCEDURE `updateCliente`(nomeC varchar(200), telC varchar(19), ufC varchar(2), cepC varchar(10), cidadeC varchar(100), bairroC varchar(100), enderecoC varchar(100),cpf varchar(14),id int)
BEGIN
UPDATE `banco_supermercado`.`cliente`
SET
`nomeCliente` = nomeC,
`telCliente` = telC,
`ufCliente` = ufC,
`cepCliente` = cepC,
`cidadeCliente` = cidadeC,
`bairroCliente` = bairroC,
`enderecoCliente` = enderecoC
WHERE `idCliente` = id;
END//
DELIMITER ;

-- Copiando estrutura para tabela banco_supermercado.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela banco_supermercado.usuarios: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`idusuario`, `nome`, `senha`) VALUES
	(2, 'adm', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
	(3, 'carlos', 'b90e903c8df7c27d9ae36ecc389ae338ba3f39265feaac668f69a3cf5321f9fd'),
	(5, 'maria', 'f8638b979b2f4f793ddb6dbd197e0ee25a7a6ea32b0ae22f5e3c5d119d839e75'),
	(6, 'Marcos', 'abdcb58157a7f3b40a914257be7d618d2fc09630559711b6c71a39d500b8ced2'),
	(7, 'Maria', '18beb4813723e788a1d79bcbf80802538ec813aa19ded2e9c21cbf08bed6bee3'),
	(8, 'Rafael', 'c340e4845bc4f9cf9f28d6bcd2e31e689fa783f0bbe83e88b0572d1be42f61d8');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
