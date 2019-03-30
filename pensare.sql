# Host: localhost  (Version 5.6.37)
# Date: 2017-11-30 11:01:43
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "asosciarkits"
#

DROP TABLE IF EXISTS `asosciarkits`;
CREATE TABLE `asosciarkits` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nomebolsista` varchar(255) DEFAULT NULL,
  `idbolsista` varchar(255) DEFAULT NULL,
  `idkit` varchar(255) DEFAULT NULL,
  `ano` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "bolsista"
#

DROP TABLE IF EXISTS `bolsista`;
CREATE TABLE `bolsista` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "contagem"
#

DROP TABLE IF EXISTS `contagem`;
CREATE TABLE `contagem` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nomedapeca` varchar(255) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `cor` varchar(255) DEFAULT NULL,
  `imagem` longblob,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "kits"
#

DROP TABLE IF EXISTS `kits`;
CREATE TABLE `kits` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `tombo` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "organizacao"
#

DROP TABLE IF EXISTS `organizacao`;
CREATE TABLE `organizacao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `idkit` varchar(255) DEFAULT NULL,
  `nomepeca` varchar(255) DEFAULT NULL,
  `qtd` int(11) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
