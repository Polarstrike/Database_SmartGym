SET NAMES latin1;
SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS `Garden`;
BEGIN;
CREATE DATABASE `Garden`;
COMMIT;

USE `Garden`;

-- ----------------------------
--  Table structure for `Pianta`		Verified  
-- ----------------------------

DROP TABLE IF EXISTS `Pianta`;
CREATE TABLE `Pianta` (
  `Codice`			int(4),
  
  `Nome` 				char(30) NOT NULL,
  `Genere` 			char(30) NOT NULL,
  `Cultivar` 			char(30) NOT NULL,
  
  `MaxDim` 			float(5) NOT NULL,
  `GrowIndex` 		float(5) NOT NULL,
  `RadIndex` 			float(5) NOT NULL,
  `AerIndex` 			float(5) NOT NULL,
  
  `Manutenzione` 	float(5) NOT NULL,
  `Dioica` 				bool,									/* 1=DIOICA    							0=NON DIOICA					*/
  `Sempreverde` 	bool,									/* 1=SEMPREVERDE				0=FOGLIAME CADUCO		*/
  `Infestante` 			bool,									/* 1=INFESTANTE						0=NON INFESTANTE		*/
  
  
  PRIMARY KEY (`Codice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;  
  
-- ---------------------------- 
--  Table structure for `Periodo`	Verified
-- ----------------------------

  DROP TABLE IF EXISTS `Periodo`;
  CREATE TABLE `Periodo` (
  `Codice`					int(4)	 NOT NULL,
			
  `Frutt1Begin` 			int(2) NOT NULL,				/*	Numero mese................es 3=MARZO	*/
  `Frutt1End` 				int(2) NOT NULL,
  `Frutt2Begin` 			int(2), 
  `Frutt2End` 				int(2),
  `Frutt3Begin` 			int(2),
  `Frutt3End` 				int(2),
                        
  `VegetativoBegin` 	int(2) NOT NULL,				/*	Numero mese................es 3=MARZO	*/
  `VegetativoEnd`		int(2) NOT NULL,
  `RiposoBegin` 			int(2) NOT NULL,
  `RiposoEnd` 			int(2) NOT NULL,

  PRIMARY KEY (`Codice`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
  
-- ----------------------------
--  Table structure for `LuceTemp`	Verified
-- ----------------------------

  DROP TABLE IF EXISTS `LuceTemp`;
  CREATE TABLE `LuceTemp` (
  `Codice`			int(4),
  
  `Modalita`		int(1) NOT NULL,					/* 0=OMBRA , 1=MEZZ'OMBRA, 2=PIENO SOLO	*/
  `OreLuceVeg` 	int(2),	
  `OreLuceRip`	int(2),
  `LuceDiretta` 	bool NOT NULL,					/* 0=LUCE INDIRETTA		1=LUCE DIRETTA			*/
  `TempMin` 		int(2) NOT NULL,
  `TempMax` 		int(2),
  
  PRIMARY KEY (`Codice`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
-- ----------------------------
--  Table structure for `Terreno`	******
-- ----------------------------

DROP TABLE IF EXISTS `Terreno`;
  CREATE TABLE `Terreno` (
  `Codice`				int(4),
  
  `PH` 					int(2) NOT NULL,

  `Consistenza` 		char(10) NOT NULL,
  `Tipologia` 			char(10) NOT NULL,
  
  PRIMARY KEY (`Codice`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1; 
  
  -- ----------------------------
--  Table structure for `Elementi`
-- ---------------------------- 

DROP TABLE IF EXISTS `Elementi`;
  CREATE TABLE `Elementi` (
    `Codice` 					INT(4),
    
    `Elemento` 				VARCHAR(30) NOT NULL,
    `Percententuale`		INT(3) NOT NULL,
    
    PRIMARY KEY (`Codice`,`Elemento`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1; 
  
-- ----------------------------
--  Table structure for `CONFLITTI`
-- ---------------------------- 
/*

  DROP TABLE IF EXISTS `Conflitti`;
  CREATE TABLE `Conflitti` (
  `Pianta1` char(20) NOT NULL,
  `Genere1` char(20) NOT NULL,
  `Cultivar1` char(20) NOT NULL,
  `Pianta2` char(20) NOT NULL,
  `Genere2` char(20) NOT NULL,
  `Cultivar2` char(20) NOT NULL,
  `ElemConflitto1` char(30) NOT NULL,
  `ElemConflitto2` char(30),
  `DistMinima` int(3),
  
  PRIMARY KEY (`Pianta1`,`Genere1`,`Cultivar1`, `Pianta2`, `Genere2`, `Cultivar2`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;  */
  
-- ----------------------------
--  Table structure for `Irrigazione`	Verified
-- ----------------------------

  DROP TABLE IF EXISTS `Irrigazione`;
CREATE TABLE `Irrigazione` (
  `Codice`			int(4),

  `PeriodicitaVeg` 			int(2) NOT NULL,			--  ESPRESSA IN GIORNI				
  `FabbisognoVeg` 		int(1) NOT NULL,			-- 	0=BASSO  1=MEDIO  2=ALTO	
  `PeriodicitaRip`			int(2) NOT NULL,			--  TEMPO PROSSIMA IRRIGAZIONE ( gg )	
  `FabbisognoRip` 			int(1) NOT NULL,			-- 	0=BASSO  1=MEDIO  2=ALTO	
 
  PRIMARY KEY(`Codice`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
-- ----------------------------
--  Table structure for `Concimazione`  Verified
-- ----------------------------
  
    DROP TABLE IF EXISTS `Concimazione`;
CREATE TABLE `Concimazione` (
  `CodiceConcimazione` 		int(6) 		NOT NULL,		-- IDENTIFICATORE UNIVOCO DI CONCIMAZIONE
  `CodicePianta`						int(4)			NOT NULL,		-- CODICE PIANTA

  `Modalita`							bool			NOT NULL,		-- 0=DISCIOGLIERE  1=NEBULIZZARE 
  `Data`									date			NOT NULL,	 	-- QUANDO CONCIMARE
  `Prossimo` 		  					int(3),								-- PROSSIMA CONCIMAZIONE	( gg )  NULL = LAST

  PRIMARY KEY(`CodiceConcimazione`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
  -- ----------------------------
--  Table structure for `ElementiConcimazione`  Verified
-- ----------------------------
  
    DROP TABLE IF EXISTS `ElementiConcimazione`;
CREATE TABLE `ElementiConcimazione` (
  `Codice` 				int(6) 		NOT NULL,		-- IDENTIFICATORE UNIVOCO DI CONCIMAZIONE
 
  `Elemento` 			char(30) 	NOT NULL,		-- ELEMENTI DA IMPIEGARE
  `Peso` 				float(3) 		NOT NULL,		-- QUANTITA DI CONCIME ( Kg )			
  
  PRIMARY KEY(`Codice`,`Elemento`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
-- ----------------------------
--  Table structure for `Potatura` Verified
-- ----------------------------

	DROP TABLE IF EXISTS `Potatura`;
CREATE TABLE `Potatura` (
	`NomePianta` 		char(30) 		NOT NULL,		--  PRIMARY KEY
    `Genere` 				char(30) 		NOT NULL,		--  PRIMARY KEY		/* LA CULTIVAR NON FA DIFFERENZA	*/ 
    `CodicePotatura`	int(6)				NOT NULL	AUTO_INCREMENT,
    
    `Scopo`					char(30)		NOT NULL,
    `Tipologia`				char(30)		NOT NULL,
	`InizioPeriodo`			DATE		NOT NULL,
    `FinePeriodo`				DATE		NOT NULL,
    
	PRIMARY KEY(`CodicePotatura`,`NomePianta`,`Genere`)
	-- UNIQUE(`NomePianta`,`Genere`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
-- ----------------------------
--  Table structure for `Rinvaso` Verified
-- ----------------------------

	DROP TABLE IF EXISTS `Rinvaso`;
CREATE TABLE `Rinvaso` (
	`NomePianta` 		char(30) 		NOT NULL,											--  PRIMARY KEY
    `Genere` 				char(30) 		NOT NULL,											--  PRIMARY KEY		/* LA CULTIVAR NON FA DIFFERENZA	*/
	`CodiceRinvaso`		int(6)				NOT NULL	AUTO_INCREMENT,
    
	`InizioPeriodo`		DATE			NOT NULL,
    `FinePeriodo`			DATE			NOT NULL,
    `Capienza`			int(2)			NOT NULL,												-- CAPIENZA NUOVO VASO ( lt )
    
      PRIMARY KEY(`CodiceRinvaso`,`NomePianta`,`Genere`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  



  