SET NAMES latin1;
SET FOREIGN_KEY_CHECKS = 0;

USE `progetto2016`;

-- ----------------------------
--  Table structure for `ACCOUNT`  `
-- ----------------------------
DROP TABLE IF EXISTS `ACCOUNT`;
CREATE TABLE `ACCOUNT` (
	`Nickname` char(20) NOT NULL,
    `Password` char(20) NOT NULL,
    `Nome` char(20) NOT NULL,
    `Cognome` char(20) NOT NULL,
    `Citta` char(20) NOT NULL,
    `Mail` char(40) NOT NULL,
    `Question` char(50) NOT NULL,
    `Answer` char(20) NOT NULL,
  
  PRIMARY KEY (`Nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `PROFILO`
-- ----------------------------
DROP TABLE IF EXISTS `PROFILO`;
CREATE TABLE `PROFILO` (
	`Nickname` char(20) NOT NULL,
    `Preferenza` char(20) NOT NULL,
    `Rating` int(1),
    
  PRIMARY KEY (`Nickname`,`Preferenza`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `SCHEDE`
-- ----------------------------
DROP TABLE IF EXISTS `SCHEDE`;
CREATE TABLE `SCHEDE` (
	`Nickname` char(20) NOT NULL,
    `CodiceScheda` int(6) NOT NULL,
    `DimAcquisto` int(3) NOT NULL,
    `DataAcquisto` date NOT NULL,
    `Collocazione` char(5) NOT NULL,
    `DimVaso` int(2),
    
  PRIMARY KEY (`Nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

