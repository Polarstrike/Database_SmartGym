SET NAMES latin1; 
SET FOREIGN_KEY_CHECKS = 0; 
BEGIN; 

DROP DATABASE IF EXISTS Fitnessvirtuale;

CREATE DATABASE IF NOT EXISTS FitnessVirtuale; 
COMMIT; 
 
USE FitnessVirtuale; 
 
-- ---------------------------- --  Table structure for `Centro`-- ---------------------------- 
DROP TABLE IF EXISTS Centro; 
CREATE TABLE Centro(
IdCentro int(11) NOT NULL, 
Indirizzo varchar(50) NOT NULL, 
Telefono varchar(50) NOT NULL,
Dimensione int(11) NOT NULL, 
MaxClienti int(11) NOT NULL,

PRIMARY KEY (IdCentro) 
) ; 
 
-- ----------------------------
--  Records of `Centro`        (, "", "", , )
-- ----------------------------

BEGIN;

INSERT INTO Centro VALUES 
(1,"Livorno, Via Amerigo Vespucci 41", "339 483 21 23", 800, 500),
(2, "Livorno, Via Giuseppe Garibaldi 123", "338 929 04 95", 900, 600),
(3, "Pisa, Piazza Carlo Alberto 12", "330 934 84 21", 400 , 250),
(4, "Roma, Via Vittorio Veneto 543", "331 932 43 43", 900, 1300),
(5, "Milano, Piazzale Napoleone Bonaparte 32", "330 934 71 83", 600, 900),
(6, "Torino, Viale della Repubblica 1203", "384 903 94 75", 1200, 1500),
(7, "Pisa, Piazza delle Vettovaglie 12", "392 834 21 34", 500, 900),
(8, "Castiglioncello(LI), Via Aurelia 1342", "394 095 89 89", 600, 900),
(9, "Livorno, Via delle Capanne 392", "398 432 45 32", 700, 900),
(10, "Firenze, Via dell'artigianato 32", "390 749 42 45", 900, 1000)
;
COMMIT;
 

-- ---------------------------- --  Table structure for `Esercizio` -- ---------------------------- 
DROP TABLE IF EXISTS Esercizio; 
CREATE TABLE Esercizio(
IdSessione int(11) NOT NULL, 
IdEsercizio int(11) NOT NULL, 
Nome varchar(50) NOT NULL,
DispendioEnergetico int(11) NOT NULL,
Ripetizioni int(11) NOT NULL,
Conteggio int(11) NOT NULL,
TempoEsecuzione int(11) NOT NULL, 
TempoRecupero int(11) NOT NULL,

PRIMARY KEY (IdEsercizio),
CONSTRAINT FK_Sessione FOREIGN KEY (IdSessione) 
REFERENCES Sessione(IdSessione) ON UPDATE NO ACTION ON DELETE NO ACTION
); 
-- ----------------------------
--  Records of Esercizio        ( , , "", , )
-- ----------------------------

BEGIN;

INSERT INTO Esercizio VALUES 
(1, 1, "Push-up"           ,50 ,3 ,9 ,1 ,90),
(1, 2, "Pull-up"           ,34 ,4 ,8 ,2 ,90),
(1, 3, "Plank"             ,67 ,4 ,3 ,4 ,60),
(1, 4, "Front Lever"	   ,32 ,4 ,5 ,2 ,120),
(1, 5, "Back Lever"		   ,54 ,4 ,3 ,1 ,120),
(1, 6, "Planche"		   ,93 ,3 ,3 ,3 ,120),
(1, 7, "Crunch" 		   ,23 ,3 ,5 ,4 ,30),
(1, 8, "Leg Raises"		   ,43 ,2 ,8 ,4 ,30),
(1, 9, "Dip"			   ,23 ,4 ,5 ,2 ,90),
(1, 10, "L-Sit"	 	       ,12 ,2 ,3 ,1 ,30),
(1, 11, "V-Sit"			   ,34 ,3 ,4 ,2 ,60),
(1, 12, "Handstand"		   ,23 ,3 ,5 ,3 ,60),
(1, 13, "Side PLank"	   ,54 ,4 ,2 ,3 ,20),
(1, 14, "Burpies"		   ,37 ,2 ,3 ,4 ,180),
(1, 15, "Squat"			   ,38 ,3 ,5 ,5 ,60),
(1, 16, "Mountain Climber" ,78 ,3 ,3 ,3 ,30)
;
COMMIT;


-- ---------------------------- --  Table structure for `SchedaAlimentazione` -- ---------------------------- 
DROP TABLE IF EXISTS SchedaAlimentazione; 
CREATE TABLE `fitnessvirtuale`.`schedaalimentazione`(
  `IdSchedaAlimentazione` INT NOT NULL,
  `CodFiscale` VARCHAR(16) NOT NULL,
  `Tutor` VARCHAR(16) NOT NULL,
  `DataInizio` DATE NOT NULL,
  `DataFine` DATE NOT NULL,
  `Intervallo` INT NOT NULL,
  PRIMARY KEY (`IdSchedaAlimentazione`),
CONSTRAINT FK_AlimentazioneCliente FOREIGN KEY (CodFiscale) 
REFERENCES Cliente(CodFiscale) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_AlimentazioneTutor FOREIGN KEY (CodFiscale)
REFERENCES dipendente(CodFiscale) ON UPDATE NO ACTION ON DELETE NO ACTION
);
  -- ----------------------------
--  Records of schedaalimentazione        ( , , "", , )
-- ----------------------------
 
INSERT INTO `fitnessvirtuale`.`schedaalimentazione` (`IdSchedaAlimentazione`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`, `Intervallo`) VALUES ('1','HKXZFP78S67G903R', 'LGGPPD67E19L957X', '2017-10-20', '2017-12-20', '7');
INSERT INTO `fitnessvirtuale`.`schedaalimentazione` (`IdSchedaAlimentazione`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`, `Intervallo`) VALUES ('2','PJYDXH41R47B009D', 'HMZFGM39L67A238Y', '2017-04-12', '2017-07-12', '10');
INSERT INTO `fitnessvirtuale`.`schedaalimentazione` (`IdSchedaAlimentazione`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`, `Intervallo`) VALUES ('3','QWBTZQ64D55H937W', 'LDTVVH55P49C730Y', '2017-05-04', '2017-09-04', '5');
INSERT INTO `fitnessvirtuale`.`schedaalimentazione` (`IdSchedaAlimentazione`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`, `Intervallo`) VALUES ('4','ZGHHHC89S12B817A', 'RSZBTT98P15G418I', '2017-09-30', '2018-01-30', '20');
INSERT INTO `fitnessvirtuale`.`schedaalimentazione` (`IdSchedaAlimentazione`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`, `Intervallo`) VALUES ('5','ZCFCLG47P16C141N', 'RSZBTT98P15G418I', '2017-08-01', '2018-05-01', '30');
INSERT INTO `fitnessvirtuale`.`schedaalimentazione` (`IdSchedaAlimentazione`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`, `Intervallo`) VALUES ('6','KCPMYS42S50B352E', 'FBBFWR51S01D364F', '2017-12-05', '2018-04-05', '10');
INSERT INTO `fitnessvirtuale`.`schedaalimentazione` (`IdSchedaAlimentazione`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`, `Intervallo`) VALUES ('7','QWBTZQ64D55H937W', 'VNACLM64E50B084R', '2016-03-23', '2016-09-23', '7');
INSERT INTO `fitnessvirtuale`.`schedaalimentazione` (`IdSchedaAlimentazione`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`, `Intervallo`) VALUES ('8','KCPMYS42S50B352E', 'FBBFWR51S01D364F', '2016-08-12', '2017-05-12', '15');
INSERT INTO `fitnessvirtuale`.`schedaalimentazione` (`IdSchedaAlimentazione`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`, `Intervallo`) VALUES ('9','ZGHHHC89S12B817A', 'VNACLM64E50B084R', '2016-04-10', '2016-08-10', '10');


-- ---------------------------- --  Table structure for `dieta` -- ---------------------------- 

DROP TABLE IF EXISTS dieta; 
CREATE TABLE `fitnessvirtuale`.`dieta` (
  `IdDieta` INT NOT NULL,
  `IdSchedaAlimentazione` INT NOT NULL,
  `Kcal` INT NOT NULL,
  `NumeroPasti` INT NOT NULL,
  PRIMARY KEY (`IdDieta`),
CONSTRAINT FK_DietaAlimentazione FOREIGN KEY (IdSchedaAlimentazione) 
REFERENCES schedaalimentazione(IdSchedaAlimentazione) ON UPDATE NO ACTION ON DELETE NO ACTION
);

  -- ----------------------------
--  Records of dieta        ( , , "", , )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`dieta` (`IdDieta`, `IdSchedaAlimentazione`, `Kcal`, `NumeroPasti`) VALUES ('1', '2', '2000', '5');
INSERT INTO `fitnessvirtuale`.`dieta` (`IdDieta`, `IdSchedaAlimentazione`, `Kcal`, `NumeroPasti`) VALUES ('2', '1', '1800', '4');
INSERT INTO `fitnessvirtuale`.`dieta` (`IdDieta`, `IdSchedaAlimentazione`, `Kcal`, `NumeroPasti`) VALUES ('3', '1', '2200', '3');
INSERT INTO `fitnessvirtuale`.`dieta` (`IdDieta`, `IdSchedaAlimentazione`, `Kcal`, `NumeroPasti`) VALUES ('4', '3', '2500', '5');
INSERT INTO `fitnessvirtuale`.`dieta` (`IdDieta`, `IdSchedaAlimentazione`, `Kcal`, `NumeroPasti`) VALUES ('5', '2', '2400', '4');
INSERT INTO `fitnessvirtuale`.`dieta` (`IdDieta`, `IdSchedaAlimentazione`, `Kcal`, `NumeroPasti`) VALUES ('6', '4', '2600', '5');
INSERT INTO `fitnessvirtuale`.`dieta` (`IdDieta`, `IdSchedaAlimentazione`, `Kcal`, `NumeroPasti`) VALUES ('7', '2', '2100', '6');
INSERT INTO `fitnessvirtuale`.`dieta` (`IdDieta`, `IdSchedaAlimentazione`, `Kcal`, `NumeroPasti`) VALUES ('8', '1', '1750', '3');
INSERT INTO `fitnessvirtuale`.`dieta` (`IdDieta`, `IdSchedaAlimentazione`, `Kcal`, `NumeroPasti`) VALUES ('9', '5', '1900', '3');
INSERT INTO `fitnessvirtuale`.`dieta` (`IdDieta`, `IdSchedaAlimentazione`, `Kcal`, `NumeroPasti`) VALUES ('10', '4', '1850', '4');
INSERT INTO `fitnessvirtuale`.`dieta` (`IdDieta`, `IdSchedaAlimentazione`, `Kcal`, `NumeroPasti`) VALUES ('11', '3', '2000', '3');



 
 -- ---------------------------- --  Table structure for `StatisticheCliente` -- ---------------------------- 
 

DROP TABLE IF EXISTS statistichecliente;  
 CREATE TABLE `fitnessvirtuale`.`statistichecliente` (
  `IdStatisticheCliente` INT NOT NULL,
  `CodFiscale` VARCHAR(16) NOT NULL,
  `Peso` INT NOT NULL,
  `MassaMagra` INT NOT NULL,
  `MassaGrassa` INT NOT NULL,
  `Acqua` INT NOT NULL,
  `Data` DATE NOT NULL,
  PRIMARY KEY (`IdStatisticheCliente`),
CONSTRAINT FK_Statistiche FOREIGN KEY (CodFiscale) 
REFERENCES Cliente(CodFiscale) ON UPDATE NO ACTION ON DELETE NO ACTION
);
 

   -- ----------------------------
--  Records of statistichecliente        ( , , "", , )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`statistichecliente` (`IdStatisticheCliente`, `CodFiscale`, `Peso`, `MassaMagra`, `MassaGrassa`, `Acqua`, `Data`) VALUES ('1', 'HKXZFP78S67G903R', '80', '12', '15', '30', '2017-07-12');
INSERT INTO `fitnessvirtuale`.`statistichecliente` (`IdStatisticheCliente`, `CodFiscale`, `Peso`, `MassaMagra`, `MassaGrassa`, `Acqua`, `Data`) VALUES ('2', 'PJYDXH41R47B009D', '90', '8', '10', '40', '2017-08-12');
INSERT INTO `fitnessvirtuale`.`statistichecliente` (`IdStatisticheCliente`, `CodFiscale`, `Peso`, `MassaMagra`, `MassaGrassa`, `Acqua`, `Data`) VALUES ('3', 'QWBTZQ64D55H937W', '110', '20', '30', '46', '2017-04-15');
INSERT INTO `fitnessvirtuale`.`statistichecliente` (`IdStatisticheCliente`, `CodFiscale`, `Peso`, `MassaMagra`, `MassaGrassa`, `Acqua`, `Data`) VALUES ('4', 'ZCFCLG47P16C141N', '60', '8', '12', '34', '2017-04-22');
INSERT INTO `fitnessvirtuale`.`statistichecliente` (`IdStatisticheCliente`, `CodFiscale`, `Peso`, `MassaMagra`, `MassaGrassa`, `Acqua`, `Data`) VALUES ('5', 'ZGHHHC89S12B817A', '70', '8', '9',  '54','2017-01-25');
INSERT INTO `fitnessvirtuale`.`statistichecliente` (`IdStatisticheCliente`, `CodFiscale`, `Peso`, `MassaMagra`, `MassaGrassa`, `Acqua`, `Data`) VALUES ('6', 'FFPGGY44B19A537E', '85', '12', '8', '34', '2017-08-21');
INSERT INTO `fitnessvirtuale`.`statistichecliente` (`IdStatisticheCliente`, `CodFiscale`, `Peso`, `MassaMagra`, `MassaGrassa`, `Acqua`, `Data`) VALUES ('7', 'LLVVDC96P70L915J', '91', '7', '12', '45', '2017-01-10');
INSERT INTO `fitnessvirtuale`.`statistichecliente` (`IdStatisticheCliente`, `CodFiscale`, `Peso`, `MassaMagra`, `MassaGrassa`, `Acqua`, `Data`) VALUES ('8', 'RPMPGQ78P26E745O', '82', '5', '7', '50', '2017-05-02');
INSERT INTO `fitnessvirtuale`.`statistichecliente` (`IdStatisticheCliente`, `CodFiscale`, `Peso`, `MassaMagra`, `MassaGrassa`, `Acqua`, `Data`) VALUES ('9', 'SNVGRR39L25L262Y', '98', '10', '13', '43', '2017-05-05');
INSERT INTO `fitnessvirtuale`.`statistichecliente` (`IdStatisticheCliente`, `CodFiscale`, `Peso`, `MassaMagra`, `MassaGrassa`, `Acqua`, `Data`) VALUES ('10', 'CLDLHU67S59I553I', '103', '12', '20', '35', '2016-11-21');

 
 -- ---------------------------- --  Table structure for `Pasto` -- ---------------------------- 
 DROP TABLE IF EXISTS pasto;
 CREATE TABLE `fitnessvirtuale`.`pasto` (
  `IdPasto` INT NOT NULL,
  `IdDieta` INT NOT NULL,
  `Pasto` CHAR(45) NOT NULL,
  PRIMARY KEY (`IdPasto`),
CONSTRAINT FK_DietaPasto FOREIGN KEY (IdDieta) 
REFERENCES Dieta(IdDieta) ON UPDATE NO ACTION ON DELETE NO ACTION
);

    -- ----------------------------
--  Records of pasto        ( , , "", , )
-- ----------------------------
 
 
INSERT INTO `fitnessvirtuale`.`pasto` (`IdPasto`, `IdDieta`, `Pasto`) VALUES ('1', '2', 'carbonara');
INSERT INTO `fitnessvirtuale`.`pasto` (`IdPasto`, `IdDieta`, `Pasto`) VALUES ('2', '1', 'insalata mista');
INSERT INTO `fitnessvirtuale`.`pasto` (`IdPasto`, `IdDieta`, `Pasto`) VALUES ('3', '2', 'pollo');
INSERT INTO `fitnessvirtuale`.`pasto` (`IdPasto`, `IdDieta`, `Pasto`) VALUES ('4', '2', 'minestrone di verdure');
INSERT INTO `fitnessvirtuale`.`pasto` (`IdPasto`, `IdDieta`, `Pasto`) VALUES ('5', '3', 'polpo e patate');
INSERT INTO `fitnessvirtuale`.`pasto` (`IdPasto`, `IdDieta`, `Pasto`) VALUES ('6', '2', 'orata');
INSERT INTO `fitnessvirtuale`.`pasto` (`IdPasto`, `IdDieta`, `Pasto`) VALUES ('7', '1', 'spaghetti alla bolognese');
INSERT INTO `fitnessvirtuale`.`pasto` (`IdPasto`, `IdDieta`, `Pasto`) VALUES ('8', '4', 'frullato proteico');
INSERT INTO `fitnessvirtuale`.`pasto` (`IdPasto`, `IdDieta`, `Pasto`) VALUES ('9', '3', 'uova in camicia');
INSERT INTO `fitnessvirtuale`.`pasto` (`IdPasto`, `IdDieta`, `Pasto`) VALUES ('10', '5', 'cotoletta e patatine');
INSERT INTO `fitnessvirtuale`.`pasto` (`IdPasto`, `IdDieta`, `Pasto`) VALUES ('11', '4', 'affettati misti');



 -- ---------------------------- --  Table structure for `accessi` -- ---------------------------- 
DROP TABLE IF EXISTS accessi;
CREATE TABLE `fitnessvirtuale`.`accessi` (
  `IdAccesso` INT NOT NULL,
  `CodFiscale` VARCHAR(16) NOT NULL,
  `IdArmadietto` INT NOT NULL,
  `IdCentro` INT NOT NULL,
  `TimestampAccesso` TIMESTAMP NOT NULL,
  `OraUscita` TIME NOT NULL,
  PRIMARY KEY (`IdAccesso`),
CONSTRAINT FK_AccessoCliente FOREIGN KEY (CodFiscale) 
REFERENCES Cliente(CodFiscale) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_AccessoArmadietto FOREIGN KEY (IdArmadietto) 
REFERENCES armadietto(IdArmadietto) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_AccessoCentro FOREIGN KEY (IdCentro) 
REFERENCES centro(IdCentro) ON UPDATE NO ACTION ON DELETE NO ACTION
);

    -- ----------------------------
--  Records of accessi        ( , , "", , )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`accessi` (`IdAccesso`, `CodFiscale`, `IdArmadietto` ,`IdCentro`, `TimestampAccesso`, `OraUscita`) VALUES ('1', 'HKXZFP78S67G903R','5', '1', '2016-11-15 10:30:00', '12:35');
INSERT INTO `fitnessvirtuale`.`accessi` (`IdAccesso`, `CodFiscale`, `IdArmadietto`, `IdCentro`, `TimestampAccesso`, `OraUscita`) VALUES ('2', 'PJYDXH41R47B009D','2', '2', '2017-11-02 12:30:00', '14:30');
INSERT INTO `fitnessvirtuale`.`accessi` (`IdAccesso`, `CodFiscale`, `IdArmadietto`, `IdCentro`, `TimestampAccesso`, `OraUscita`) VALUES ('3', 'QWBTZQ64D55H937W','3', '3', '2017-10-23 16:30:00', '19:00');
INSERT INTO `fitnessvirtuale`.`accessi` (`IdAccesso`, `CodFiscale`, `IdArmadietto`, `IdCentro`, `TimestampAccesso`, `OraUscita`) VALUES ('4', 'PJYDXH41R47B009D','5', '1', '2017-11-10 11:00:00', '13:00');
INSERT INTO `fitnessvirtuale`.`accessi` (`IdAccesso`, `CodFiscale`, `IdArmadietto`, `IdCentro`, `TimestampAccesso`, `OraUscita`) VALUES ('5', 'ZGHHHC89S12B817A','1', '3', '2017-10-10 10:00:00', '12:30');
INSERT INTO `fitnessvirtuale`.`accessi` (`IdAccesso`, `CodFiscale`, `IdArmadietto`, `IdCentro`, `TimestampAccesso`, `OraUscita`) VALUES ('6', 'ZCFCLG47P16C141N','1', '1', '2016-12-02 16:30:00', '19:30');
INSERT INTO `fitnessvirtuale`.`accessi` (`IdAccesso`, `CodFiscale`, `IdArmadietto`, `IdCentro`, `TimestampAccesso`, `OraUscita`) VALUES ('7', 'KCPMYS42S50B352E','2', '3', '2017-10-12 15:30:00', '17:00');
INSERT INTO `fitnessvirtuale`.`accessi` (`IdAccesso`, `CodFiscale`, `IdArmadietto`, `IdCentro`, `TimestampAccesso`, `OraUscita`) VALUES ('8', 'QWBTZQ64D55H937W','3', '4', '2017-02-21 15:30:00', '18:30');
INSERT INTO `fitnessvirtuale`.`accessi` (`IdAccesso`, `CodFiscale`, `IdArmadietto`, `IdCentro`, `TimestampAccesso`, `OraUscita`) VALUES ('9', 'FFPGGY44B19A537E','2', '5', '2017-05-05 18:30:00', '20:30');




  -- ---------------------------- --  Table structure for `armadietto` -- ---------------------------- 
 DROP TABLE IF EXISTS armadietto;
 CREATE TABLE `fitnessvirtuale`.`armadietto` (
 `IdArmadietto` INT NOT NULL,
 `IdSpogliatoio` INT NOT NULL,
 `Codice` INT(4) NOT NULL,
 `Stato` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`IdArmadietto`),
CONSTRAINT FK_ArmadiettoSpogliatoio FOREIGN KEY (IdSpogliatoio) 
REFERENCES spogliatoio(IdSpogliatoio) ON UPDATE NO ACTION ON DELETE NO ACTION
);

    -- ----------------------------
--  Records of armadietto        ( , , "", , )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('1', '1',  '8459', 'libero');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('2', '2',  '3741', 'libero');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('3', '3',  '2485', 'occupato');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('4', '1',  '1839', 'libero');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('5', '4',  '9302', 'occupato');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('6', '2',  '8593', 'libero');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('7', '2',  '8123', 'libero');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('8', '1',  '0593', 'occupato');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('9', '4',  '6472', 'occupato');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('10', '3', '9382', 'libero');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('11', '2', '0291', 'libero');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('12', '3', '0000', 'occupato');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('13', '1', '3852', 'libero');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('14', '2', '5830', 'occupato');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('15', '3', '8032', 'occupato');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('16', '1', '1632', 'occupato');
INSERT INTO `fitnessvirtuale`.`armadietto` (`IdArmadietto`, `IdSpogliatoio`,  `Codice`, `Stato`) VALUES ('17', '2', '5473', 'libero');

  -- ---------------------------- --  Table structure for `spogliatoio` -- ---------------------------- 
 DROP TABLE IF EXISTS spogliatoio;
 CREATE TABLE `fitnessvirtuale`.`spogliatoio` (
  `IdSpogliatoio` INT NOT NULL,
  `IdCentro` INT NOT NULL,
  `Capienza` INT NOT NULL,
  `PostiDisponibili` INT NOT NULL,
  `Posizione` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdSpogliatoio`),
CONSTRAINT FK_SpogliatoioCentro FOREIGN KEY (IdCentro) 
REFERENCES Centro(IdCentro) ON UPDATE NO ACTION ON DELETE NO ACTION
);


     -- ----------------------------
--  Records of spogliatoio        ( , , "", , )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`spogliatoio` (`IdSpogliatoio`, `IdCentro`, `Capienza`, `PostiDisponibili`, `Posizione`) VALUES ('1','1', '20', '10', 'nord');
INSERT INTO `fitnessvirtuale`.`spogliatoio` (`IdSpogliatoio`, `IdCentro`, `Capienza`, `PostiDisponibili`, `Posizione`) VALUES ('2','3', '25', '8', 'sud');
INSERT INTO `fitnessvirtuale`.`spogliatoio` (`IdSpogliatoio`, `IdCentro`, `Capienza`, `PostiDisponibili`, `Posizione`) VALUES ('3','1', '18', '8', 'est');
INSERT INTO `fitnessvirtuale`.`spogliatoio` (`IdSpogliatoio`, `IdCentro`,`Capienza`, `PostiDisponibili`, `Posizione`) VALUES ('4','3', '30', '12', 'ovest');
INSERT INTO `fitnessvirtuale`.`spogliatoio` (`IdSpogliatoio`, `IdCentro`,`Capienza`, `PostiDisponibili`, `Posizione`) VALUES ('5','2', '50', '11', 'nord');
INSERT INTO `fitnessvirtuale`.`spogliatoio` (`IdSpogliatoio`, `IdCentro`, `Capienza`, `PostiDisponibili`, `Posizione`) VALUES ('6','1', '30', '0', 'ovest');
INSERT INTO `fitnessvirtuale`.`spogliatoio` (`IdSpogliatoio`, `IdCentro`, `Capienza`, `PostiDisponibili`, `Posizione`) VALUES ('7','4', '12', '1', 'nord');
INSERT INTO `fitnessvirtuale`.`spogliatoio` (`IdSpogliatoio`, `IdCentro`, `Capienza`, `PostiDisponibili`, `Posizione`) VALUES ('8','5', '19', '3', 'est');
INSERT INTO `fitnessvirtuale`.`spogliatoio` (`IdSpogliatoio`, `IdCentro`,`Capienza`, `PostiDisponibili`, `Posizione`) VALUES ('9','3', '31', '29', 'ovest');
INSERT INTO `fitnessvirtuale`.`spogliatoio` (`IdSpogliatoio`, `IdCentro`, `Capienza`, `PostiDisponibili`, `Posizione`) VALUES ('10','4', '15', '1', 'est');



  -- ---------------------------- --  Table structure for `corso` -- ---------------------------- 
 DROP TABLE IF EXISTS corso;
 CREATE TABLE `fitnessvirtuale`.`corso` (
  `IdCorso` INT NOT NULL,
  `IdSala` INT NOT NULL,
  `Disciplina` VARCHAR(45) NOT NULL,
  `Livello` VARCHAR(45) NOT NULL,
  `DataInizio` DATE NOT NULL,
  `DataFine` DATE NOT NULL,
  `MaxIscrizioni` INT NOT NULL,
  PRIMARY KEY (`IdCorso`),
CONSTRAINT FK_CorsoSala FOREIGN KEY (IdSala) 
REFERENCES Sala(IdSala) ON UPDATE NO ACTION ON DELETE NO ACTION
);

     -- ----------------------------
--  Records of corso        ( , , "", , )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`corso` (`IdCorso`, `IdSala`, `Disciplina`, `Livello`, `DataInizio`, `DataFine`, `MaxIscrizioni`) VALUES ('1', '1', 'yoga', 'intermedio', '2017-09-15', '2017-12-15', '30');
INSERT INTO `fitnessvirtuale`.`corso` (`IdCorso`, `IdSala`, `Disciplina`, `Livello`, `DataInizio`, `DataFine`, `MaxIscrizioni`) VALUES ('2', '2', 'pugilato', 'base', '2018-01-15', '2018-05-18', '50');
INSERT INTO `fitnessvirtuale`.`corso` (`IdCorso`, `IdSala`, `Disciplina`, `Livello`, `DataInizio`, `DataFine`, `MaxIscrizioni`) VALUES ('3', '1', 'potenziamento Addominali', 'avanzato', '2017-01-10', '2017-12-20', '40');
INSERT INTO `fitnessvirtuale`.`corso` (`IdCorso`, `IdSala`, `Disciplina`, `Livello`, `DataInizio`, `DataFine`, `MaxIscrizioni`) VALUES ('4', '3', 'potenziamento glutei', 'intermedio', '2017-02-26', '2017-10-17', '30');
INSERT INTO `fitnessvirtuale`.`corso` (`IdCorso`, `IdSala`, `Disciplina`, `Livello`, `DataInizio`, `DataFine`, `MaxIscrizioni`) VALUES ('5', '2', 'squat', 'base', '2018-03-23', '2018-10-30', '20');
INSERT INTO `fitnessvirtuale`.`corso` (`IdCorso`, `IdSala`, `Disciplina`, `Livello`, `DataInizio`, `DataFine`, `MaxIscrizioni`) VALUES ('6', '3', 'judo', 'avanzato', '2017-05-12', '2017-10-23', '15');
INSERT INTO `fitnessvirtuale`.`corso` (`IdCorso`, `IdSala`, `Disciplina`, `Livello`, `DataInizio`, `DataFine`, `MaxIscrizioni`) VALUES ('7', '1', 'karate', 'base', '2018-01-30', '2018-07-23', '30');
INSERT INTO `fitnessvirtuale`.`corso` (`IdCorso`, `IdSala`, `Disciplina`, `Livello`, `DataInizio`, `DataFine`, `MaxIscrizioni`) VALUES ('8', '1', 'karate', 'base', '2017-11-30', '2018-07-23', '30');

  -- ---------------------------- --  Table structure for `calendario` -- ---------------------------- 
 DROP TABLE IF EXISTS calendario;
 CREATE TABLE `fitnessvirtuale`.`calendario` (
  `IdCalendario` INT NOT NULL,
  `IdCorso` INT NOT NULL,
  `Giorno` CHAR(45) NOT NULL,
  `Inizio` TIME NOT NULL,
  `Fine` TIME NOT NULL,
  PRIMARY KEY (`IdCalendario`),
CONSTRAINT FK_CalendarioCorso FOREIGN KEY (IdCorso) 
REFERENCES corso(IdCorso) ON UPDATE NO ACTION ON DELETE NO ACTION
);


     -- ----------------------------
--  Records of calendario        ( , , "", , )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`calendario` (`IdCalendario`, `IdCorso`, `Giorno`, `Inizio`, `Fine`) VALUES ('1', '1', 'Giovedi', '16:00', '18:00');
INSERT INTO `fitnessvirtuale`.`calendario` (`IdCalendario`, `IdCorso`, `Giorno`, `Inizio`, `Fine`) VALUES ('2', '3', 'Venerdi', '14:00', '15:00');
INSERT INTO `fitnessvirtuale`.`calendario` (`IdCalendario`, `IdCorso`, `Giorno`, `Inizio`, `Fine`) VALUES ('3', '2', 'Lunedi', '16:30', '18:00');
INSERT INTO `fitnessvirtuale`.`calendario` (`IdCalendario`, `IdCorso`, `Giorno`, `Inizio`, `Fine`) VALUES ('4', '4', 'Martedi', '15:30', '17:30');
INSERT INTO `fitnessvirtuale`.`calendario` (`IdCalendario`, `IdCorso`, `Giorno`, `Inizio`, `Fine`) VALUES ('5', '3', 'Mercoledi', '17:30', '19:30');
INSERT INTO `fitnessvirtuale`.`calendario` (`IdCalendario`, `IdCorso`, `Giorno`, `Inizio`, `Fine`) VALUES ('6', '3', 'Giovedi', '10:00', '12:00');
INSERT INTO `fitnessvirtuale`.`calendario` (`IdCalendario`, `IdCorso`, `Giorno`, `Inizio`, `Fine`) VALUES ('7', '2', 'venerdi', '16:30', '19:30');
INSERT INTO `fitnessvirtuale`.`calendario` (`IdCalendario`, `IdCorso`, `Giorno`, `Inizio`, `Fine`) VALUES ('8', '5', 'Martedi', '15:00', '16:00');
INSERT INTO `fitnessvirtuale`.`calendario` (`IdCalendario`, `IdCorso`, `Giorno`, `Inizio`, `Fine`) VALUES ('9', '7', 'Giovedi', '14:00', '15:30');
INSERT INTO `fitnessvirtuale`.`calendario` (`IdCalendario`, `IdCorso`, `Giorno`, `Inizio`, `Fine`) VALUES ('10', '3', 'lunedi', '18:00', '20:00');



  -- ---------------------------- --  Table structure for `turno` -- ---------------------------- 
 DROP TABLE IF EXISTS turno;
 CREATE TABLE `fitnessvirtuale`.`turno` (
  `IdTurno` INT NOT NULL,
  `Giorno` VARCHAR(45) NOT NULL,
  `Inizio` TIME NOT NULL,
  `Fine` TIME NOT NULL,
  PRIMARY KEY (`IdTurno`));

     -- ----------------------------
--  Records of turno        ( , , "", , )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`turno` (`IdTurno`, `Giorno`, `Inizio`, `Fine`) VALUES ('1', 'Venerdi'  , '16:30', '19:30');
INSERT INTO `fitnessvirtuale`.`turno` (`IdTurno`, `Giorno`, `Inizio`, `Fine`) VALUES ('2', 'Giovedi'  , '10:30', '16:30');
INSERT INTO `fitnessvirtuale`.`turno` (`IdTurno`, `Giorno`, `Inizio`, `Fine`) VALUES ('3', 'Lunedi'   , '9:00' , '12:30');
INSERT INTO `fitnessvirtuale`.`turno` (`IdTurno`, `Giorno`, `Inizio`, `Fine`) VALUES ('4', 'Martedi'  , '10:30', '13:30');
INSERT INTO `fitnessvirtuale`.`turno` (`IdTurno`, `Giorno`, `Inizio`, `Fine`) VALUES ('5', 'Giovedi'  , '19:30', '23:30');
INSERT INTO `fitnessvirtuale`.`turno` (`IdTurno`, `Giorno`, `Inizio`, `Fine`) VALUES ('6', 'Mercoledi', '18:30', '20:30');
INSERT INTO `fitnessvirtuale`.`turno` (`IdTurno`, `Giorno`, `Inizio`, `Fine`) VALUES ('7', 'Sabato'   , '13:30', '18:30');
INSERT INTO `fitnessvirtuale`.`turno` (`IdTurno`, `Giorno`, `Inizio`, `Fine`) VALUES ('8', 'Lunedi'   , '12:30', '16:30');
INSERT INTO `fitnessvirtuale`.`turno` (`IdTurno`, `Giorno`, `Inizio`, `Fine`) VALUES ('9', 'mercoledi', '10:30', '15:30');
INSERT INTO `fitnessvirtuale`.`turno` (`IdTurno`, `Giorno`, `Inizio`, `Fine`) VALUES ('10', 'Martedi' , '14:30', '19:00');


  -- ---------------------------- --  Table structure for `EsercizioEffettivo` -- ---------------------------- 
 DROP TABLE IF EXISTS EsercizioEffettivo; 
  CREATE TABLE `fitnessvirtuale`.`esercizioeffettivo` (
  `IdEsercizioEffettivo` INT NOT NULL,
  `IdEsercizio` INT NOT NULL,
  `IdApparecchiatura` INT NOT NULL,
  `TempoRecupero` INT NOT NULL,
  `Data` DATE NOT NULL,
  `TempoEsecuzione` INT NOT NULL,
  PRIMARY KEY (`IdEsercizioEffettivo`),
CONSTRAINT FK_EsercizioEffettuato FOREIGN KEY (IdEsercizio) 
REFERENCES esercizio(IdEsercizio) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_EsercizioApparecchiatura FOREIGN KEY (IdApparecchiatura) 
REFERENCES apparecchiature(IdApparecchiatura) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- ----------------------------
--  Records of EsercizioEffettivo        ( , , "", , )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`esercizioeffettivo` (`IdEsercizioEffettivo`, `IdEsercizio`, `IdApparecchiatura`, `TempoRecupero`, `Data`, `TempoEsecuzione`) VALUES ('1', '1', '1', '30', '2017-07-11', '20');
INSERT INTO `fitnessvirtuale`.`esercizioeffettivo` (`IdEsercizioEffettivo`, `IdEsercizio`, `IdApparecchiatura`, `TempoRecupero`, `Data`, `TempoEsecuzione`) VALUES ('2', '3', '2', '120', '2017-06-21', '15');
INSERT INTO `fitnessvirtuale`.`esercizioeffettivo` (`IdEsercizioEffettivo`, `IdEsercizio`, `IdApparecchiatura`, `TempoRecupero`, `Data`, `TempoEsecuzione`) VALUES ('3', '1', '3', '90', '2017-08-11', '30');
INSERT INTO `fitnessvirtuale`.`esercizioeffettivo` (`IdEsercizioEffettivo`, `IdEsercizio`, `IdApparecchiatura`, `TempoRecupero`, `Data`, `TempoEsecuzione`) VALUES ('4', '2', '2', '80', '2016-11-21', '31');
INSERT INTO `fitnessvirtuale`.`esercizioeffettivo` (`IdEsercizioEffettivo`, `IdEsercizio`, `IdApparecchiatura`, `TempoRecupero`, `Data`, `TempoEsecuzione`) VALUES ('5', '2', '4', '100', '2017-04-02', '43');
INSERT INTO `fitnessvirtuale`.`esercizioeffettivo` (`IdEsercizioEffettivo`, `IdEsercizio`, `IdApparecchiatura`, `TempoRecupero`, `Data`, `TempoEsecuzione`) VALUES ('6', '3', '1', '200', '2017-06-15', '10');
INSERT INTO `fitnessvirtuale`.`esercizioeffettivo` (`IdEsercizioEffettivo`, `IdEsercizio`, `IdApparecchiatura`, `TempoRecupero`, `Data`, `TempoEsecuzione`) VALUES ('7', '1', '4', '220', '2017-08-01', '5');
INSERT INTO `fitnessvirtuale`.`esercizioeffettivo` (`IdEsercizioEffettivo`, `IdEsercizio`, `IdApparecchiatura`, `TempoRecupero`, `Data`, `TempoEsecuzione`) VALUES ('8', '4', '2', '20', '2017-03-26', '10');
INSERT INTO `fitnessvirtuale`.`esercizioeffettivo` (`IdEsercizioEffettivo`, `IdEsercizio`, `IdApparecchiatura`, `TempoRecupero`, `Data`, `TempoEsecuzione`) VALUES ('9', '5', '1',  '240', '2017-04-27', '6');
INSERT INTO `fitnessvirtuale`.`esercizioeffettivo` (`IdEsercizioEffettivo`, `IdEsercizio`, `IdApparecchiatura`, `TempoRecupero`, `Data`, `TempoEsecuzione`) VALUES ('10', '4', '3', '80', '2017-05-21', '20');
INSERT INTO `fitnessvirtuale`.`esercizioeffettivo` (`IdEsercizioEffettivo`, `IdEsercizio`, `IdApparecchiatura`, `TempoRecupero`, `Data`, `TempoEsecuzione`) VALUES ('11', '5', '2', '120', '2017-08-10', '15');


  -- ---------------------------- --  Table structure for `regolazioneeffettiva` -- ---------------------------- 
 DROP TABLE IF EXISTS regolazioneeffettiva; 
  CREATE TABLE `fitnessvirtuale`.`regolazioneeffettiva` (
  `IdRegolazioneEffettiva` INT NOT NULL,
  `IdEsercizioEffettivo` INT NOT NULL,
  `Regolazione` VARCHAR(45) NOT NULL,
  `Quantita` INT NOT NULL,
  PRIMARY KEY (`IdRegolazioneEffettiva`),
CONSTRAINT FK_regolazioneEffettuata FOREIGN KEY (IdEsercizioEffettivo) 
REFERENCES esercizioeffettivo(IdEsercizioEffettivo) ON UPDATE NO ACTION ON DELETE NO ACTION
);

       -- ----------------------------
--  Records of regolazioneeffettiva        ( , , "", , )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`regolazioneeffettiva` (`IdRegolazioneEffettiva`, `IdEsercizioEffettivo`, `Regolazione`, `Quantita`) VALUES ('1', '1', 'peso', '40');
INSERT INTO `fitnessvirtuale`.`regolazioneeffettiva` (`IdRegolazioneEffettiva`, `IdEsercizioEffettivo`, `Regolazione`, `Quantita`) VALUES ('2', '1', 'inclinazione', '45');
INSERT INTO `fitnessvirtuale`.`regolazioneeffettiva` (`IdRegolazioneEffettiva`, `IdEsercizioEffettivo`, `Regolazione`, `Quantita`) VALUES ('3', '2', 'altezza', '10');
INSERT INTO `fitnessvirtuale`.`regolazioneeffettiva` (`IdRegolazioneEffettiva`, `IdEsercizioEffettivo`, `Regolazione`, `Quantita`) VALUES ('4', '3', 'peso', '50');
INSERT INTO `fitnessvirtuale`.`regolazioneeffettiva` (`IdRegolazioneEffettiva`, `IdEsercizioEffettivo`, `Regolazione`, `Quantita`) VALUES ('5', '2', 'inclinazione', '20');
INSERT INTO `fitnessvirtuale`.`regolazioneeffettiva` (`IdRegolazioneEffettiva`, `IdEsercizioEffettivo`, `Regolazione`, `Quantita`) VALUES ('6', '4', 'peso', '90');




  -- ---------------------------- --  Table structure for `Conteggio` -- ---------------------------- 
  
 DROP TABLE IF EXISTS conteggio; 
 CREATE TABLE `fitnessvirtuale`.`conteggio` (
  `IdConteggio` INT NOT NULL,
  `IdEsercizioEffettivo` INT NOT NULL,
  `Conteggio` INT NOT NULL,
  `IstanteInizio` TIME NOT NULL,
  `IstanteFine` TIME NOT NULL,
  PRIMARY KEY (`IdConteggio`),
CONSTRAINT FK_ConteggioEffettivo FOREIGN KEY (IdEsercizioEffettivo) 
REFERENCES esercizioeffettivo(IdEsercizioEffettivo) ON UPDATE NO ACTION ON DELETE NO ACTION
);

       -- ----------------------------
--  Records of conteggio        ( , , "", , )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`conteggio` (`IdConteggio`, `IdEsercizioEffettivo`, `Conteggio`, `IstanteInizio`, `IstanteFine`) VALUES ('1', '2', '5', '12:34:32', '12:34:52');
INSERT INTO `fitnessvirtuale`.`conteggio` (`IdConteggio`, `IdEsercizioEffettivo`, `Conteggio`, `IstanteInizio`, `IstanteFine`) VALUES ('2', '1', '3', '10:20:21', '10:20:41');
INSERT INTO `fitnessvirtuale`.`conteggio` (`IdConteggio`, `IdEsercizioEffettivo`, `Conteggio`, `IstanteInizio`, `IstanteFine`) VALUES ('3', '2', '3', '18:40:32', '18:41:02');
INSERT INTO `fitnessvirtuale`.`conteggio` (`IdConteggio`, `IdEsercizioEffettivo`, `Conteggio`, `IstanteInizio`, `IstanteFine`) VALUES ('4', '1', '1', '10:45:32', '10:46:04');
INSERT INTO `fitnessvirtuale`.`conteggio` (`IdConteggio`, `IdEsercizioEffettivo`, `Conteggio`, `IstanteInizio`, `IstanteFine`) VALUES ('5', '3', '6', '12:32:21', '12:32:59');
INSERT INTO `fitnessvirtuale`.`conteggio` (`IdConteggio`, `IdEsercizioEffettivo`, `Conteggio`, `IstanteInizio`, `IstanteFine`) VALUES ('6', '4', '2', '14:32:12', '14:32:43');
INSERT INTO `fitnessvirtuale`.`conteggio` (`IdConteggio`, `IdEsercizioEffettivo`, `Conteggio`, `IstanteInizio`, `IstanteFine`) VALUES ('7', '3', '3', '17:54:32', '17:55:01');
INSERT INTO `fitnessvirtuale`.`conteggio` (`IdConteggio`, `IdEsercizioEffettivo`, `Conteggio`, `IstanteInizio`, `IstanteFine`) VALUES ('8', '3', '5', '19:45:43', '19:46:10');
INSERT INTO `fitnessvirtuale`.`conteggio` (`IdConteggio`, `IdEsercizioEffettivo`, `Conteggio`, `IstanteInizio`, `IstanteFine`) VALUES ('9', '4', '4', '13:32:12', '13:32:50');
INSERT INTO `fitnessvirtuale`.`conteggio` (`IdConteggio`, `IdEsercizioEffettivo`, `Conteggio`, `IstanteInizio`, `IstanteFine`) VALUES ('10', '4', '8', '16:34:12', '16:34:35');


  -- ---------------------------- --  Table structure for `Integratore` -- ---------------------------- 
  
  DROP TABLE IF EXISTS Integratore;
  CREATE TABLE `fitnessvirtuale`.`integratore` (
  `IdIntegratore` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Sostanza` VARCHAR(45) NOT NULL,
  `Quantita` INT NOT NULL,
  `Num_Pezzi` INT NOT NULL,
  `Forma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdIntegratore`));

       -- ----------------------------
--  Records of Integratore        ( , , "", , )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`integratore` (`IdIntegratore`, `Nome`, `Sostanza`, `Quantita`, `Num_Pezzi`, `Forma`) VALUES ('1', 'powerlift', 'omega 3', '5', '10', 'pillole');
INSERT INTO `fitnessvirtuale`.`integratore` (`IdIntegratore`, `Nome`, `Sostanza`, `Quantita`, `Num_Pezzi`, `Forma`) VALUES ('2', 'musclefitness', 'amminoacidi', '3', '20', 'polvere');
INSERT INTO `fitnessvirtuale`.`integratore` (`IdIntegratore`, `Nome`, `Sostanza`, `Quantita`, `Num_Pezzi`, `Forma`) VALUES ('3', 'fitmuscle', 'met', '7', '25', 'polvere');
INSERT INTO `fitnessvirtuale`.`integratore` (`IdIntegratore`, `Nome`, `Sostanza`, `Quantita`, `Num_Pezzi`, `Forma`) VALUES ('4', 'protein', 'siero del latte', '2', '10', 'bevanda');
INSERT INTO `fitnessvirtuale`.`integratore` (`IdIntegratore`, `Nome`, `Sostanza`, `Quantita`, `Num_Pezzi`, `Forma`) VALUES ('5', 'bomba', 'proteine d\'uovo', '4', '20', 'polvere');



  -- ---------------------------- --  Table structure for `Fornitore` -- ---------------------------- 
  
  DROP TABLE IF EXISTS fornitore;
  CREATE TABLE `fitnessvirtuale`.`fornitore` (
  `NomeFornitore` VARCHAR(45) NOT NULL,
  `IdIntegratore` INT NOT NULL,
  `Societa` VARCHAR(45) NOT NULL,
  `IVA` INT NOT NULL,
  `GiorniPagamento` INT NOT NULL,
  `Indirizzo` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`NomeFornitore`),
CONSTRAINT FK_FornitoreIntegratore FOREIGN KEY (IdIntegratore) 
REFERENCES integratore(IdIntegratore) ON UPDATE NO ACTION ON DELETE NO ACTION
);

       -- ----------------------------
--  Records of Fornitore        ( , , "", , )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`fornitore` ( `NomeFornitore`, `IdIntegratore`, `Societa`, `IVA`, `GiorniPagamento`, `Indirizzo`, `Telefono`) VALUES ( 'amazon', '1', 'HDS', '7', '20', 'nord', '3434578239');
INSERT INTO `fitnessvirtuale`.`fornitore` ( `NomeFornitore`, `IdIntegratore`, `Societa`, `IVA`, `GiorniPagamento`, `Indirizzo`, `Telefono`) VALUES ( 'ebay', '1', 'GDE', '7', '10', 'sud', '3332827033');
INSERT INTO `fitnessvirtuale`.`fornitore` ( `NomeFornitore`, `IdIntegratore`, `Societa`, `IVA`, `GiorniPagamento`, `Indirizzo`, `Telefono`) VALUES ( 'droptable','2', 'TYE', '3', '7', 'est', '333293645');
INSERT INTO `fitnessvirtuale`.`fornitore` ( `NomeFornitore`, `IdIntegratore`, `Societa`, `IVA`, `GiorniPagamento`, `Indirizzo`, `Telefono`) VALUES ( 'pointview',  '3','PTV', '4', '5', 'ovest', '3323576893');
INSERT INTO `fitnessvirtuale`.`fornitore` ( `NomeFornitore`, `IdIntegratore`, `Societa`, `IVA`, `GiorniPagamento`, `Indirizzo`, `Telefono`) VALUES ( 'heromarket', '1', 'HMT', '6', '15', 'nord', '3445768594');
INSERT INTO `fitnessvirtuale`.`fornitore` ( `NomeFornitore`, `IdIntegratore`, `Societa`, `IVA`, `GiorniPagamento`, `Indirizzo`, `Telefono`) VALUES ( 'compraQui', '2', 'CMQ', '3', '18', 'est', '3314357546');
INSERT INTO `fitnessvirtuale`.`fornitore` ( `NomeFornitore`, `IdIntegratore`, `Societa`, `IVA`, `GiorniPagamento`, `Indirizzo`, `Telefono`) VALUES ( 'ProvaNoi','4', 'PRN', '7', '19', 'ovest', '3345467548');


 -- ---------------------------- --  Table structure for `ordine` -- ---------------------------- 
  
  DROP TABLE IF EXISTS ordine;
  CREATE TABLE `fitnessvirtuale`.`ordine` (
  `IdOrdine` INT NOT NULL,
  `IdCentro` INT NOT NULL,
  `IdIntegratore` INT NOT NULL,
  `NomeFornitore` VARCHAR(45) NOT NULL,
  `Stato` VARCHAR(45) NOT NULL,
  `DataEvasione` DATE NOT NULL,
  `Quantita` INT NOT NULL,
  `DataConsegna` DATE NOT NULL,
  
  PRIMARY KEY (`IdOrdine`),
  CONSTRAINT FK_Integratore FOREIGN KEY (IdIntegratore) 
REFERENCES Integratore(IdIntegratore) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_NomeFornitore FOREIGN KEY (NomeFornitore) 
REFERENCES fornitore(NomeFornitore) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_OrdineCentro FOREIGN KEY (idCentro) 
REFERENCES centro(IdCentro) ON UPDATE NO ACTION ON DELETE NO ACTION
);

  
         -- ----------------------------
--  Records of ordine        ( , , "", , )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`ordine` (`IdOrdine`, `IdCentro`, `IdIntegratore`, `NomeFornitore`, `Stato`, `DataEvasione`, `Quantita`, `DataConsegna`) VALUES ('1','1','1','amazon', 'Incompleto', '2017-09-12', '3', '2017-09-17');
INSERT INTO `fitnessvirtuale`.`ordine` (`IdOrdine`, `IdCentro`, `IdIntegratore`, `NomeFornitore`, `Stato`, `DataEvasione`, `Quantita`, `DataConsegna`) VALUES ('2','3','2','ebay', 'Evaso', '2017-06-09', '1', '2017-06-11');
INSERT INTO `fitnessvirtuale`.`ordine` (`IdOrdine`, `IdCentro`, `IdIntegratore`, `NomeFornitore`, `Stato`, `DataEvasione`, `Quantita`, `DataConsegna`) VALUES ('3','2','4','droptable', 'Incompleto', '2017-09-04', '2', '2017-09-09');
INSERT INTO `fitnessvirtuale`.`ordine` (`IdOrdine`, `IdCentro`, `IdIntegratore`, `NomeFornitore`, `Stato`, `DataEvasione`, `Quantita`, `DataConsegna`) VALUES ('4','1','2','pointview', 'Evaso', '2017-05-21', '3', '2017-05-28');
INSERT INTO `fitnessvirtuale`.`ordine` (`IdOrdine`, `IdCentro`, `IdIntegratore`, `NomeFornitore`, `Stato`, `DataEvasione`, `Quantita`, `DataConsegna`) VALUES ('5','1','4','ebay', 'Incompleto', '2017-10-20', '10', '2017-10-28');
INSERT INTO `fitnessvirtuale`.`ordine` (`IdOrdine`, `IdCentro`, `IdIntegratore`, `NomeFornitore`, `Stato`, `DataEvasione`, `Quantita`, `DataConsegna`) VALUES ('6','3','5','heromarket', 'Evaso', '2017-02-10', '3', '2017-02-15');
INSERT INTO `fitnessvirtuale`.`ordine` (`IdOrdine`, `IdCentro`, `IdIntegratore`, `NomeFornitore`, `Stato`, `DataEvasione`, `Quantita`, `DataConsegna`) VALUES ('7','5','3','ProvaNoi', 'Evaso', '2017-04-16', '10', '2017-04-20');
INSERT INTO `fitnessvirtuale`.`ordine` (`IdOrdine`, `IdCentro`, `IdIntegratore`, `NomeFornitore`, `Stato`, `DataEvasione`, `Quantita`, `DataConsegna`) VALUES ('8','4','2','droptable', 'Incompleto', '2017-11-20', '11', '2017-11-29');


 -- ---------------------------- --  Table structure for `Integratoremagazzino`	 -- ---------------------------- 
  
  DROP TABLE IF EXISTS Integratoremagazzino;
  CREATE TABLE `fitnessvirtuale`.`integratoremagazzino` (
  `IdIntegratoreMagazzino` INT NOT NULL,
  `IdIntegratore` INT NOT NULL,
  `Quantita` INT NOT NULL,
  PRIMARY KEY (`IdIntegratoreMagazzino`),
CONSTRAINT FK_MagazzinoIntegratore FOREIGN KEY (IdIntegratore) 
REFERENCES integratore(IdIntegratore) ON UPDATE NO ACTION ON DELETE NO ACTION
);
  
  
         -- ----------------------------
--  Records of integratoremagazzino        ( , , "", , )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('1', '1', '30');
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('2', '1', '39');
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('3', '2', '10');
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('4', '3', '10');
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('5', '3', '13');
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('6', '2', '16');
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('7', '4', '13');
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('8', '4', '16');
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('9', '5', '35');
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('10', '5', '32');
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('11', '6', '2');
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('12', '3', '13');
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('13', '1', '4');
INSERT INTO `fitnessvirtuale`.`integratoremagazzino` (`IdIntegratoreMagazzino`, `IdIntegratore`, `Quantita`) VALUES ('14', '6', '6');


 -- ---------------------------- --  Table structure for `Utente`-- ---------------------------- 
  
  DROP TABLE IF EXISTS utente;
  CREATE TABLE `fitnessvirtuale`.`utente` (
  `Username` VARCHAR(20) NOT NULL,
  `pin` VARCHAR(45) NOT NULL,
  `Karma` INT NOT NULL,
  PRIMARY KEY (`Username`));  
  
         -- ----------------------------
--  Records of utente        ( , , "", , )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`utente` (`Username`, `pin`, `Karma`) VALUES ('DonKiwi', '7394', '1000');
INSERT INTO `fitnessvirtuale`.`utente` (`Username`, `pin`, `Karma`) VALUES ('Globster', '7459', '1234');
INSERT INTO `fitnessvirtuale`.`utente` (`Username`, `pin`, `Karma`) VALUES ('Wrathhog', '3753', '1238');
INSERT INTO `fitnessvirtuale`.`utente` (`Username`, `pin`, `Karma`) VALUES ('BearGills', '9993', '530');
INSERT INTO `fitnessvirtuale`.`utente` (`Username`, `pin`, `Karma`) VALUES ('ActionVillain', '3852', '3942');
INSERT INTO `fitnessvirtuale`.`utente` (`Username`, `pin`, `Karma`) VALUES ('ExoticBoar', '3123', '9003');
INSERT INTO `fitnessvirtuale`.`utente` (`Username`, `pin`, `Karma`) VALUES ('TrustyKhajiit', '3291', '13');
INSERT INTO `fitnessvirtuale`.`utente` (`Username`, `pin`, `Karma`) VALUES ('MeanBronco', '3482', '1230');
INSERT INTO `fitnessvirtuale`.`utente` (`Username`, `pin`, `Karma`) VALUES ('NeedyValkyrie', '1342', '10339');
INSERT INTO `fitnessvirtuale`.`utente` (`Username`, `pin`, `Karma`) VALUES ('SpotlessManatee', '4215', '4278');



 -- ---------------------------- --  Table structure for `interesse` -- ---------------------------- 
  
  DROP TABLE IF EXISTS interesse;
  CREATE TABLE `fitnessvirtuale`.`interesse` (
  `IdInteresse` INT NOT NULL,
  `Username` VARCHAR(20) NOT NULL,
  `ambito` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdInteresse`),
  CONSTRAINT FK_UsernameInteresse FOREIGN KEY (Username) 
REFERENCES utente(Username) ON UPDATE NO ACTION ON DELETE NO ACTION
);
  
         -- ----------------------------
--  Records of interesse        ( , , "", , )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`interesse` (`IdInteresse`, `Username`, `ambito`) VALUES ('1', 'DonKiwi', 'acquagym');
INSERT INTO `fitnessvirtuale`.`interesse` (`IdInteresse`, `Username`, `ambito`) VALUES ('2', 'Wrathhog', 'nuoto');
INSERT INTO `fitnessvirtuale`.`interesse` (`IdInteresse`, `Username`, `ambito`) VALUES ('3', 'BearGills', 'powerlifting');
INSERT INTO `fitnessvirtuale`.`interesse` (`IdInteresse`, `Username`, `ambito`) VALUES ('4', 'MeanBronco', 'massa');
INSERT INTO `fitnessvirtuale`.`interesse` (`IdInteresse`, `Username`, `ambito`) VALUES ('5', 'SpotlessManatee', 'resistenza');
INSERT INTO `fitnessvirtuale`.`interesse` (`IdInteresse`, `Username`, `ambito`) VALUES ('6', 'NeedyValkyrie', 'dieta');
INSERT INTO `fitnessvirtuale`.`interesse` (`IdInteresse`, `Username`, `ambito`) VALUES ('7', 'NeedyValkyrie', 'vegan');
INSERT INTO `fitnessvirtuale`.`interesse` (`IdInteresse`, `Username`, `ambito`) VALUES ('8', 'Globster', 'vegetariano');
INSERT INTO `fitnessvirtuale`.`interesse` (`IdInteresse`, `Username`, `ambito`) VALUES ('9', 'Globster', 'glutei');
INSERT INTO `fitnessvirtuale`.`interesse` (`IdInteresse`, `Username`, `ambito`) VALUES ('10', 'TrustyKhajiit', 'calisthenics');
INSERT INTO `fitnessvirtuale`.`interesse` (`IdInteresse`, `Username`, `ambito`) VALUES ('11', 'TrustyKhajiit', 'crossfit');

 
 
-- ---------------------------- --  Table structure for `Sala` -- ---------------------------- 
DROP TABLE IF EXISTS `Sala`; 
CREATE TABLE `Sala`(
`IdCentro` int(11) NOT NULL, 
`IdSala` int(11) NOT NULL, 
`Nome` varchar(50) NOT NULL,

PRIMARY KEY (`IdSala`),
CONSTRAINT FK_Centro FOREIGN KEY (IdCentro) 
REFERENCES Centro(IdCentro) ON UPDATE NO ACTION ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 
-- ----------------------------
--  Records of `Sala`		(, , "")
-- ----------------------------

BEGIN;

INSERT INTO `Sala` VALUES 
(1, 1, "StarShine"),
(1, 2, "Sunset"),
(1, 3, "Moonlight"),
(2, 4, "Splash"),
(2, 5, "Flash"),
(3, 6, "Charmender"),
(3, 7, "Squirtle"),
(3, 8, "Bulbasaur")
;
COMMIT;

-- ---------------------------- --  Table structure for `Apparecchiature` -- ---------------------------- 
DROP TABLE IF EXISTS `Apparecchiature`; 
CREATE TABLE `Apparecchiature`(
`IdSala` int(11) NOT NULL, 
`IdApparecchiatura` int(11) NOT NULL, 
`Nome` varchar(50) NOT NULL,
`Tipologia` varchar(50) NOT NULL,
`Consumo` int(11) NOT NULL,
`LivelloUsura` int(11) NOT NULL,
PRIMARY KEY (`IdApparecchiatura`),
CONSTRAINT FK_Sala FOREIGN KEY (IdSala) 
REFERENCES Sala(IdSala) ON UPDATE NO ACTION ON DELETE NO ACTION
); 
-- ----------------------------
--  Records of `Sala`		(, , "", "", , )
-- ----------------------------

BEGIN;

INSERT INTO `Apparecchiature` VALUES 
(1,1 , "Panca", "Muscolo", 3, 70),
(1,2 , "Panca", "Muscolo", 4, 82),
(1,3 , "TapisRoulant", "Corsa", 5, 31),
(2,4 , "Pressa", "Corsa", 6, 29),
(2,5 , "LatMachine", "Muscolo", 1, 75),
(3,6 , "TapisRoulant", "Corsa", 2, 98),
(4,7 , "Pressa", "Muscolo", 2, 12),
(4,8 , "LatMachine", "Muscolo", 3, 0),
(5,9 , "Pressa", "Muscolo", 4, 0)
;
COMMIT;

-- ---------------------------- --  Table structure for `Cliente` -- ---------------------------- 
DROP TABLE IF EXISTS `Cliente`; 
CREATE TABLE `Cliente`(
`CodFiscale` VARCHAR(16) NOT NULL, 
`Nome` varchar(50) NOT NULL,
`Cognome` varchar(50) NOT NULL,
`DataNascita` date NOT NULL,
`Indirizzo` varchar(50) NOT NULL,
`Documento` varchar(50) NOT NULL,
`Prefettura` varchar(50) NOT NULL,
`Scopo` varchar(50) NOT NULL,
unique(Documento),
PRIMARY KEY (`CodFiscale`)
) ;
-- ----------------------------
--  Records of `Cliente`		(, , "", "", , )
-- ----------------------------

BEGIN;

INSERT INTO `Cliente` VALUES 
('HKXZFP78S67G903R', 'Gatti', 'Tommaso', '1993-02-17', 'Est 63', '23rc234', 'LI', "Potenziamento muscolare"),
('PJYDXH41R47B009D', 'Cani', 'Maria', '1925-11-28', 'Est 13', 'c2534c5636', 'LI', "Potenziamento muscolare"),
('QWBTZQ64D55H937W', 'Bove', 'Maddalena', '1962-08-15', 'Est 1534', 'c23523c5412', 'LI', "Potenziamento muscolare"),
('ZGHHHC89S12B817A', 'Tigri', 'Romeo', '1954-03-05', 'Est 253', 'sdsdfg', 'LI', "Potenziamento muscolare"),
('ZCFCLG47P16C141N', 'Cavalli', 'Roberto', '1948-07-30', 'Est 958', 'sg5434ct', 'LI', "Potenziamento muscolare"),
('KCPMYS42S50B352E', 'Fagiani', 'Matilde', '2008-12-13', 'Nord 42', '2345363c', 'LI', "Potenziamento muscolare"),
('FFPGGY44B19A537E', 'Gufi', 'Epidonio', '1928-05-18', 'Nord 32', 'cg4yc54', 'LI', "Potenziamento muscolare"),
('LLVVDC96P70L915J', 'Gallina', 'Ultima', '1921-05-23', 'Nord 12', 'cetgrgc4', 'LI', "Potenziamento muscolare"),
('RPMPGQ78P26E745O', 'Nutrie', 'Lorella', '1988-06-30', 'Nord 412', 'cgeryh54c', 'LI', "Potenziamento muscolare"),
('SNVGRR39L25L262Y', 'Facoceri', 'Osvaldo', '1966-11-06', 'Nord 122', 'cdh4tyhrt', 'PI', "Potenziamento muscolare"),
('CLDLHU67S59I553I', 'Faraona', 'Elettra', '1940-12-14', 'Nord 56', 'chcrhrtch', 'PI', 'Dimagrimento'),
('ZRDRSI29A59F167X', 'Orata', 'Marcello', '1971-01-27', 'Nord 754', '34645', 'PI', 'Dimagrimento'),
('MCFPBB76H69H538C', 'Cinghiali', 'Maria Rita', '1975-09-13', 'Ovest 32', '34634vyj', 'PI', 'Dimagrimento'),
('KGIMGH36C18F317Z', 'Leprotti', 'Elena', '2003-10-22', 'Ovest 12', 'xerxt35t', 'PI', 'Dimagrimento'),
('KKSCFZ77L02I827N', 'Ricci', 'Egisto', '1942-09-15', 'Ovest 88', 'x34453gf', 'PI', 'Dimagrimento'),
('DHVWMM43L50C934D', 'Pappagalli', 'Norina', '1926-03-03', 'Ovest 12', 'x3y45uhj67', 'PI', 'Dimagrimento'),
('DTBCMP94E66D862T', 'Cervi', 'Luigi', '1993-05-17', 'Ovest 11', 'xhxgwxx23', 'MI', 'Ricreativo'),
('MBNPJB89H41F307Y', 'Galletti', 'Daniele', '2006-05-10', 'Ovest 33', 'xgw545xg', 'MI', 'Ricreativo'),
('BHGZCT64S16L326X', 'Faina', 'Gabriele', '2009-07-02', 'Ovest 40', 'x47c5c5', 'MI',  'Ricreativo'),
('CRNHGH48S03L347Q', 'Giaguaro', 'Vivetta', '1935-07-01', 'Ovest 20', '1234c234c', 'MI',  'Ricreativo'),
('NXSVNB41S58B506Q', 'Ratto', 'Sabina', '1987-06-10', 'Sud 1', 'c125463c62', 'MI', 'Ricreativo'),
('BJVFZP54H49I659O', 'Lepre', 'Edoardo', '1968-10-17', 'Sud 33', 'ergh5b756', 'MI', 'Ricreativo'),
('GNLYTU68B49Z211N', 'Capra', 'Renzo', '1982-04-23', 'Sud 92', '45by654b65', 'TO', 'Ricreativo'),
('LMNSCW90D63E209W', 'Muli', 'Antonella', '1974-12-25', 'Sud 122', 'b45767979', 'TO', 'Ricreativo'),
('GBCLLS44B41E731R', 'Sorci', 'Ampelia', '1935-05-29', 'Sud 94', 'efgvtv3532', 'TO',  'Ricreativo')
;
COMMIT;

-- ---------------------------- --  Table structure for `Dipendente` -- ---------------------------- 
DROP TABLE IF EXISTS `Dipendente`; 
CREATE TABLE `Dipendente`(
`CodFiscale` VARCHAR(16) NOT NULL, 
`Nome` varchar(50) NOT NULL,
`Cognome` varchar(50) NOT NULL,
`Tipologia` varchar(50) NOT NULL,
`DataNascita` date NOT NULL,
`Indirizzo` varchar(50) NOT NULL,
`Documento` varchar(50) NOT NULL,
`Prefettura` varchar(50) NOT NULL,
PRIMARY KEY (`CodFiscale`)
) ;
-- ----------------------------
--  Records of `Dipendente`		(, , "", "", )
-- ----------------------------

BEGIN;

INSERT INTO `Dipendente` VALUES 
('HMZFGM39L67A238Y', 'Rossi', 'Mario', 'tutor', '1993-02-17', 'Moon 21', 'adsdasda', 'Moon'),
('LGGPPD67E19L957X', 'Verdi', 'Luigi', 'nutrizionista', '1925-11-28', 'Moon 12', '2rt23vt', 'Moon'),
('LDTVVH55P49C730Y', 'Gialli', 'Franco', 'impiegato', '1962-08-15', 'Moon 32', 'vr34r34r', 'Moon'),
('RSZBTT98P15G418I', 'Turchesi', 'Viola', 'tutor', '1954-03-05', 'Moon 43', 'v364ert', 'Moon'),
('FBBFWR51S01D364F', 'Neri', 'Marta', 'tutor', '1948-07-30', 'Moon 16', '323efrww', 'Moon'),
('VNACLM64E50B084R', 'Bianchi', 'Ada', 'impiegato', '2008-12-13', 'Jupiter 54', 'c2424', 'Jupiter'),
('SHSMSG47M56B726U', 'Rosi', 'Alvaro', 'tutor', '1928-05-18', 'Jupiter 67', '242ccfs', 'Jupiter'),
('KJYTSH65S59M144A', 'Gialli', 'Margherita', 'impiegato', '1921-05-23', 'Jupiter 87', '2c42wsdd', 'Jupiter'),
('ZNRLSN29P29D760R', 'Arancioni', 'Ugo', 'nutrizionista', '1988-06-30', 'Jupiter 123', '23d242', 'Jupiter'),
('RNKTFN41R59D048J', 'Celesti', 'Clelia', 'tutor', '1966-11-06', 'Mars 56', 'wecrw23', 'Mars'),
('GNICYQ65P14F254Q', 'Marroni', 'Osvaldo', 'nutrizionista', '1940-12-14', 'Mars 61', 'cserw22', 'Mars'),
('RSKWMR44H25E443Y', 'Grigi', 'Ettore', 'impiegato', '1971-01-27', 'Mars 67', 'wcr3etg45', 'Mars'),
('JRQDNH43H28F047V', 'Blu', 'Fabiola', 'tutor', '1975-09-13', 'Mars 74', 'cfretg543', 'Mars'),
('CWNRTF58A56I718O', 'Indachi', 'Loredana', 'impiegato', '2003-10-22', 'Mars 85', 'wccr34', 'Mars'),
('PMHTZA86L46B519C', 'Ciani', 'Gualtiero', 'impiegato', '1942-09-15', 'Mars 321', 'wcrwcer5', 'Mars'),
('QNGKLS94L50G855O', 'Verdolini', 'Maria Paola', 'tutor', '1926-03-03', 'Saturn 667', '57b55b7', 'Saturn'),
('ZNNSPF76R58G751J', 'Amaranti', 'Adevane', 'impiegato', '1993-05-17', 'Saturn 321', 'dfgv346', 'Saturn'),
('VGWMEO65E41B627L', 'Terra di Siena', 'Bruciata', 'nutrizionista', '2006-05-10', 'Saturn 118', 'n785675', 'Saturn'),
('PQMSML30B65C245E', 'Rossi', 'Lorella', 'tutor', '2009-07-02', 'Saturn 534', 'b5753', 'Saturn'),
('QJFDYT70S26A484Q', 'Acquamarina', 'Dario', 'nutrizionista', '1935-07-01', 'Saturn 334', 'b6757b8', 'Saturn')
;
COMMIT;


-- ---------------------------- --  Table structure for `Contratto` -- ---------------------------- 
DROP TABLE IF EXISTS `Contratto`; 
CREATE TABLE `Contratto`(
`IdContratto` int(11) NOT NULL, 
`CodFiscale` varchar(16) NOT NULL, 
`IdCentro` int(11) NOT NULL,
`Tipo` varchar(50) NOT NULL,
`DataInizio` date NOT NULL,
`Durata` int(11) NOT NULL, -- mesi 
`Pagamento` varchar(50) NOT NULL,
PRIMARY KEY (`IdContratto`),
CONSTRAINT FK_ContrattoCliente FOREIGN KEY (CodFiscale) 
REFERENCES cliente(CodFiscale) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_ContrattoCentro FOREIGN KEY (IdCentro) 
REFERENCES centro(IdCentro) ON UPDATE NO ACTION ON DELETE NO ACTION
);  
-- ----------------------------
--  Records of `Contratto`		(, , "", "", )
-- ----------------------------

BEGIN;

INSERT INTO `Contratto` VALUES 

('1', 'HKXZFP78S67G903R', '1', "1", '2015-01-12', '12', 'Rate'),
('2', 'PJYDXH41R47B009D', '2', "1", '2017-12-01', '12', 'Rate'),
('3', 'QWBTZQ64D55H937W', '3', "1", '2016-12-04', '12', 'Rate'),
('4', 'PJYDXH41R47B009D', '1', "1", '2016-12-04', '12', 'Rate'),
('5', 'ZGHHHC89S12B817A', '1', "1", '2016-12-07', '12', 'Rate'),
('6', 'ZCFCLG47P16C141N', '1', "1", '2016-12-14', '12', 'Rate'),
('7', 'KCPMYS42S50B352E', '2', "1", '2016-12-10', '12', 'Rate'),
('8', 'ZCFCLG47P16C141N', '2', "4", '2016-12-12', '12', 'Rate'),
('9', 'KCPMYS42S50B352E', '4', "4", '2017-09-16', '12', 'Rate'),
('10', 'FFPGGY44B19A537E', '5', "4", '2017-06-10', '12', 'Rate'),
('11', 'QWBTZQ64D55H937W', '6', "4", '2017-01-01', '12', 'Rate'),
('12', 'LLVVDC96P70L915J', '7', "4", '2017-02-26', '12', 'Rate'),
('13', 'RPMPGQ78P26E745O', '7', "4", '2017-04-05', '12', 'Rate'),
('14', 'LLVVDC96P70L915J', '8', "5", '2017-09-05', '12', 'Rate'),
('15', 'ZGHHHC89S12B817A', '9', "5", '2017-09-04', '12', 'Rate'),
('16', 'SNVGRR39L25L262Y', '9', "5", '2017-01-01', '24', 'Contanti'),
('17', 'RPMPGQ78P26E745O', '9', "5", '2017-05-05', '24', 'Contanti'),
('18', 'ZCFCLG47P16C141N', '10', "3", '2016-01-05', '24', 'Contanti'),
('19', 'FFPGGY44B19A537E', '4', "3", '2017-04-09', '24', 'Contanti'),
('20', 'CLDLHU67S59I553I', '4', "3", '2017-09-01', '24', 'Contanti'),
('21', 'CLDLHU67S59I553I', '5', "3", '2017-01-01', '6', 'Contanti'),
('22', 'ZRDRSI29A59F167X', '6', "3", '2014-01-04', '6', 'Contanti'),
('23', 'SNVGRR39L25L262Y', '7', "2", '2017-05-19', '6', 'Contanti'),
('24', 'ZRDRSI29A59F167X', '8', "2", '2017-06-12', '6', 'Contanti'),
('25', 'CLDLHU67S59I553I', '3', "2", '2017-08-21', '6', 'Contanti'),
('26', 'CLDLHU67S59I553I', '3', "2", '2017-08-21', '1', 'Contanti')
;



-- ---------------------------- --  Table structure for `TipoContratto` -- ---------------------------- 

DROP TABLE IF EXISTS `tipocontratto`; 
CREATE TABLE `tipocontratto` (
  `IdTipoContratto` INT(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Prezzo` int(11) NOT NULL,
  `IngressiFitness` VARCHAR(45) NOT NULL,
  `DimensionePiscina` INT NOT NULL,
  `IngressiPiscina` INT NOT NULL,
  `Corsi` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdTipoContratto`)
  ); 

-- ----------------------------
--  Records of `TipoContratto`		(, , "", "", )
-- ----------------------------


BEGIN;

INSERT INTO `TipoContratto` VALUES 

(1, "Silver", 20, 10, 40, 10, "?"),
(2, "Gold", 30, 20, 100, 20, "?"),
(3, "Platinum", 50, 31, 500, 31, "?"),
(4, "UltimateMuscle", 40, 31, 0, 0, "?"),
(5, "FishMan", 40,  5, 500, 31, "?")
;
COMMIT;

-- ---------------------------- --  Table structure for `Piscina` -- ---------------------------- 

DROP TABLE IF EXISTS `Piscina`; 
CREATE TABLE `Piscina` (
  `IdPiscina` INT(11) NOT NULL,
  `IdCentro` INT(11) not null,
  `Nome` VARCHAR(45) NOT NULL,
  `Dimensione` INT(11) NOT NULL,
  PRIMARY KEY (`IdPiscina`),
  CONSTRAINT FK_CentroPisc FOREIGN KEY (IdCentro) 
REFERENCES Centro(IdCentro) ON UPDATE NO ACTION ON DELETE NO ACTION
  ) ; 

-- ----------------------------
--  Records of `Piscina`		(, , "", "", )
-- ----------------------------

BEGIN;

INSERT INTO `Piscina` VALUES 

(1, 1, "Relax", 300),
(2, 1, "Fun", 20),
(3, 1, "Speed", 100),
(4, 2, "Swim", 200),
(5, 3, "Olimpic", 499)
;
COMMIT;

-- ---------------------------- --  Table structure for `AttivitaAcquatica` -- ---------------------------- 

DROP TABLE IF EXISTS `AttivitaAcquatica`; 
CREATE TABLE `AttivitaAcquatica` (
  `IdAttivita` INT(11) not null,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdAttivita`)
  ) ; 

-- ----------------------------
--  Records of `AttivitaAcquatica`		(, , "", "", )
-- ----------------------------

BEGIN;

INSERT INTO `AttivitaAcquatica` VALUES 

(1,"Nuoto libero"),
(2,"Corso di nuoto"),
(3,"Corso di sub"),
(4,"Corso di tuffi"),
(5,"Acqua Gim"),
(6,"Riabilitazione"),
(7,"Scivoli ")
;
COMMIT;

-- ---------------------------- --  Table structure for `Scopo` -- ---------------------------- 

DROP TABLE IF EXISTS `Scopo`; 
CREATE TABLE `Scopo` (
  `CodFiscale` varchar(16) not null,
  `Muscolo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CodFiscale`, `Muscolo`),
  CONSTRAINT FK_ScopoCliente FOREIGN KEY (CodFiscale) 
REFERENCES cliente(CodFiscale) ON UPDATE NO ACTION ON DELETE NO ACTION
  ); 

-- ----------------------------
--  Records of `Scopo`		(, , "", "", )
-- ----------------------------

BEGIN;

INSERT INTO `Scopo` VALUES 

("HKXZFP78S67G903R", "Addominali"),
("PJYDXH41R47B009D", "Pettorali"),
("QWBTZQ64D55H937W", "Addominali")
;
COMMIT;


-- ---------------------------- --  Table structure for `Rata` -- ---------------------------- 


DROP TABLE IF EXISTS `Rata`; 
CREATE TABLE `Rata` (
  `IdRata` INT(11) not null,
  `IdContratto` INT(11) not null,
  `Importo` INT(11) not null,
  `Scadenza` date not null,
  `Stato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdRata`),
    CONSTRAINT FK_Rate FOREIGN KEY (IdContratto) 
REFERENCES Contratto(IdContratto) ON UPDATE NO ACTION ON DELETE NO ACTION
  ); 

-- ----------------------------
--  Records of `Rata`		(, , "", "", )
-- ----------------------------

BEGIN;

INSERT INTO `Rata` VALUES 

(1,1, 200, "2017-03-12", "Non ancora dovuto"),
(2,1, 300, "2017-05-12",  "Non ancora dovuto")
;
COMMIT;



-- ---------------------------- --  Table structure for `schedaallenamento` -- ---------------------------- 

DROP TABLE IF EXISTS `schedaallenamento`; 
CREATE TABLE `fitnessvirtuale`.`schedaallenamento` (
  `IdSchedaAllenamento` INT NOT NULL,
  `CodFiscale` VARCHAR(16) NOT NULL,
  `Tutor` VARCHAR(16) NOT NULL,
  `DataInizio` DATE NOT NULL,
  `DataFine` DATE NOT NULL,
  PRIMARY KEY (`IdSchedaAllenamento`),
   CONSTRAINT FK_SchedaAllenamentoCliente FOREIGN KEY (CodFiscale) 
REFERENCES Cliente(CodFiscale) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_SchedaAllenamentoTutor FOREIGN KEY (Tutor) 
REFERENCES dipendente(CodFiscale) ON UPDATE NO ACTION ON DELETE NO ACTION
  ); 


-- ----------------------------
--  Records of `schedaallenamento`		(, , "", "", )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`schedaallenamento` (`IdSchedaAllenamento`, `CodFiscale`, `Tutor`,`DataInizio`, `DataFine`) VALUES ('1','HKXZFP78S67G903R','HMZFGM39L67A238Y', '2017-05-10', '2017-07-12');
INSERT INTO `fitnessvirtuale`.`schedaallenamento` (`IdSchedaAllenamento`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`) VALUES ('2','PJYDXH41R47B009D','LGGPPD67E19L957X', '2017-08-12', '2017-10-09');
INSERT INTO `fitnessvirtuale`.`schedaallenamento` (`IdSchedaAllenamento`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`) VALUES ('3','QWBTZQ64D55H937W','RSZBTT98P15G418I', '2017-11-10', '2018-01-10');
INSERT INTO `fitnessvirtuale`.`schedaallenamento` (`IdSchedaAllenamento`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`) VALUES ('4','ZGHHHC89S12B817A','FBBFWR51S01D364F', '2016-10-10', '2017-02-15');
INSERT INTO `fitnessvirtuale`.`schedaallenamento` (`IdSchedaAllenamento`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`) VALUES ('5','ZCFCLG47P16C141N','HMZFGM39L67A238Y', '2017-02-10', '2017-05-24');
INSERT INTO `fitnessvirtuale`.`schedaallenamento` (`IdSchedaAllenamento`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`) VALUES ('6','KCPMYS42S50B352E','FBBFWR51S01D364F', '2017-07-02', '2017-09-10');
INSERT INTO `fitnessvirtuale`.`schedaallenamento` (`IdSchedaAllenamento`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`) VALUES ('7','ZGHHHC89S12B817A','ZNRLSN29P29D760R', '2015-05-10', '2015-11-15');
INSERT INTO `fitnessvirtuale`.`schedaallenamento` (`IdSchedaAllenamento`, `CodFiscale`, `Tutor`, `DataInizio`, `DataFine`) VALUES ('8','ZCFCLG47P16C141N','LDTVVH55P49C730Y', '2016-07-10', '2016-08-13');




-- ---------------------------- --  Table structure for `post` -- ---------------------------- 

DROP TABLE IF EXISTS `post`; 
CREATE TABLE `fitnessvirtuale`.`post` (
  `IdPost` INT NOT NULL,
  `IdThread` INT NOT NULL,  
  `IdLink` INT NOT NULL,
  `Username` VARCHAR(20) NOT NULL,
  `Testo` VARCHAR(45) NOT NULL,
  `Timestamp` TIMESTAMP NOT NULL,
  
  PRIMARY KEY (`IdPost`),
  CONSTRAINT FK_PostUsername FOREIGN KEY (Username) 
REFERENCES utente(Username) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT FK_PostThread FOREIGN KEY (IdThread) 
REFERENCES thread(IdThread) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT FK_Postlink FOREIGN KEY (IdLink) 
REFERENCES link(IdLink) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- ----------------------------
--  Records of `post`		(, , "", "", )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`post` (`IdPost`, `IdThread`, `IdLink`, `Username`, `Testo`, `Timestamp`) VALUES ('1','1','1', 'DonKiwi', 'ciao', '2017-07-21 12:32:00');
INSERT INTO `fitnessvirtuale`.`post` (`IdPost`, `IdThread`, `IdLink`, `Username`, `Testo`, `Timestamp`) VALUES ('2','3','2', 'Wrathhog', 'grande', '2017-07-19 12:30:00');
INSERT INTO `fitnessvirtuale`.`post` (`IdPost`, `IdThread`, `IdLink`, `Username`, `Testo`, `Timestamp`) VALUES ('3','2','3', 'TrustyKhajiit', 'wow', '2017-03-10 15:00:00');
INSERT INTO `fitnessvirtuale`.`post` (`IdPost`, `IdThread`, `IdLink`, `Username`, `Testo`, `Timestamp`) VALUES ('4','2','5', 'MeanBronco', 'muscle-up', '2017-07-05 23:12:00');
INSERT INTO `fitnessvirtuale`.`post` (`IdPost`, `IdThread`, `IdLink`, `Username`, `Testo`, `Timestamp`) VALUES ('5','5','3', 'NeedyValkyrie', 'prova', '2016-07-07 09:32:00');
INSERT INTO `fitnessvirtuale`.`post` (`IdPost`, `IdThread`, `IdLink`, `Username`, `Testo`, `Timestamp`) VALUES ('6','4','4', 'TrustyKhajiit', 'helloguys', '2017-07-24 12:32:00');




-- ---------------------------- --  Table structure for `Thread` -- ---------------------------- 

DROP TABLE IF EXISTS `thread`; 
CREATE TABLE `fitnessvirtuale`.`thread` (
  `IdThread` INT NOT NULL,
  `IdAreaForum` INT NOT NULL,
  `Nome` CHAR(45) NOT NULL,
  PRIMARY KEY (`IdThread`),
  CONSTRAINT FK_ThreadAreaForum FOREIGN KEY (IdAreaForum) 
REFERENCES areaforum(IdAreaForum) ON UPDATE NO ACTION ON DELETE NO ACTION
);



-- ----------------------------
--  Records of `thread`		(, , "", "", )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`thread` (`IdThread`, `IdAreaForum`, `Nome`) VALUES ('1','1', 'workout');
INSERT INTO `fitnessvirtuale`.`thread` (`IdThread`, `IdAreaForum`, `Nome`) VALUES ('2','3', 'fitness');
INSERT INTO `fitnessvirtuale`.`thread` (`IdThread`, `IdAreaForum`, `Nome`) VALUES ('3','4', 'street workout');
INSERT INTO `fitnessvirtuale`.`thread` (`IdThread`, `IdAreaForum`, `Nome`) VALUES ('4','2', 'stretching');
INSERT INTO `fitnessvirtuale`.`thread` (`IdThread`, `IdAreaForum`, `Nome`) VALUES ('5','1', 'massa muscolare');
INSERT INTO `fitnessvirtuale`.`thread` (`IdThread`, `IdAreaForum`, `Nome`) VALUES ('6','4', 'definizione');
INSERT INTO `fitnessvirtuale`.`thread` (`IdThread`, `IdAreaForum`, `Nome`) VALUES ('7','5', 'resistenza');
INSERT INTO `fitnessvirtuale`.`thread` (`IdThread`, `IdAreaForum`, `Nome`) VALUES ('8 ','3', 'forza');
INSERT INTO `fitnessvirtuale`.`thread` (`IdThread`, `IdAreaForum`, `Nome`) VALUES ('9','2', 'cardio');

-- ---------------------------- --  Table structure for `areaforum` -- ---------------------------- 

DROP TABLE IF EXISTS `areaforum`; 
CREATE TABLE `fitnessvirtuale`.`areaforum` (
  `IdAreaForum` INT NOT NULL,
  `Nome` CHAR(45) NOT NULL,
  PRIMARY KEY (`IdAreaForum`));

-- ----------------------------
--  Records of `areaforum`		(, , "", "", )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`areaforum` (`IdAreaForum`, `Nome`) VALUES ('1', 'boh');
INSERT INTO `fitnessvirtuale`.`areaforum` (`IdAreaForum`, `Nome`) VALUES ('2', 'prova');
INSERT INTO `fitnessvirtuale`.`areaforum` (`IdAreaForum`, `Nome`) VALUES ('3', 'non saprei');
INSERT INTO `fitnessvirtuale`.`areaforum` (`IdAreaForum`, `Nome`) VALUES ('4', 'ritenta');
INSERT INTO `fitnessvirtuale`.`areaforum` (`IdAreaForum`, `Nome`) VALUES ('5', 'muscoli');
INSERT INTO `fitnessvirtuale`.`areaforum` (`IdAreaForum`, `Nome`) VALUES ('6', 'glutei');
INSERT INTO `fitnessvirtuale`.`areaforum` (`IdAreaForum`, `Nome`) VALUES ('7', 'faq');


-- ---------------------------- --  Table structure for `link` -- ---------------------------- 

DROP TABLE IF EXISTS `link`; 
CREATE TABLE `fitnessvirtuale`.`link` (
  `IdLink` INT NOT NULL,
  `URL` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`IdLink`));

-- ----------------------------
--  Records of `link`		(, , "", "", )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`link` (`IdLink`, `URL`) VALUES ('1', 'https://www.youtube.com/watch?v=mBa6q-6DJjo');
INSERT INTO `fitnessvirtuale`.`link` (`IdLink`, `URL`) VALUES ('2', 'https://www.youtube.com/watch?v=mBa6q-7LJjo');
INSERT INTO `fitnessvirtuale`.`link` (`IdLink`, `URL`) VALUES ('3', 'https://www.youtube.com/watch?v=mBa6q-1DJjo');
INSERT INTO `fitnessvirtuale`.`link` (`IdLink`, `URL`) VALUES ('4', 'https://www.youtube.com/watch?v=mBa6q-7DJro');
INSERT INTO `fitnessvirtuale`.`link` (`IdLink`, `URL`) VALUES ('5', 'https://www.youtube.com/watch?v=mBa6q-7DJjp');
INSERT INTO `fitnessvirtuale`.`link` (`IdLink`, `URL`) VALUES ('6', 'https://www.youtube.com/watch?v=mBa6q-7DJeo');
INSERT INTO `fitnessvirtuale`.`link` (`IdLink`, `URL`) VALUES ('7', 'https://www.youtube.com/watch?v=mLa6q-7DJjo');
INSERT INTO `fitnessvirtuale`.`link` (`IdLink`, `URL`) VALUES ('8', 'https://www.youtube.com/watch?v=mBa6q-7DPjo');
INSERT INTO `fitnessvirtuale`.`link` (`IdLink`, `URL`) VALUES ('9', 'https://www.youtube.com/watch?v=mBa6q-7VJjo');

-- ---------------------------- --  Table structure for `risposta` -- ---------------------------- 

DROP TABLE IF EXISTS `risposta`; 
CREATE TABLE `fitnessvirtuale`.`risposta` (
  `IdRisposta` INT NOT NULL,
  `Username` VARCHAR(20) NOT NULL,
  `IdPost` INT NOT NULL,
  `IdLink` INT NOT NULL, 
  `Testo` VARCHAR(45) NOT NULL,
  `sommaVoti` INT NOT NULL,
  PRIMARY KEY (`IdRisposta`),
  CONSTRAINT FK_RispostaUsername FOREIGN KEY (Username) 
REFERENCES utente(Username) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT FK_RispostaPost FOREIGN KEY (IdPost) 
REFERENCES post(IdPost) ON UPDATE NO ACTION ON DELETE NO ACTION,
 CONSTRAINT FK_RispostaLink FOREIGN KEY (IdLink) 
REFERENCES link(IdLink) ON UPDATE NO ACTION ON DELETE NO ACTION
);


-- ----------------------------
--  Records of `risposta`		(, , "", "", )
-- ----------------------------


INSERT INTO `fitnessvirtuale`.`risposta` (`IdRisposta`, `Username`,`IdPost`, `IdLink`, `Testo`, `sommaVoti`) VALUES ('1', 'DonKiwi','1', '2', 'salve', '6');
INSERT INTO `fitnessvirtuale`.`risposta` (`IdRisposta`, `Username`,`IdPost`, `IdLink`, `Testo`, `sommaVoti`) VALUES ('2', 'Wrathhog','3', '1', 'però', '34');
INSERT INTO `fitnessvirtuale`.`risposta` (`IdRisposta`, `Username`,`IdPost`, `IdLink`, `Testo`, `sommaVoti`) VALUES ('3', 'DonKiwi','4', '1', 'wow', '100');
INSERT INTO `fitnessvirtuale`.`risposta` (`IdRisposta`, `Username`,`IdPost`, `IdLink`, `Testo`, `sommaVoti`) VALUES ('4', 'TrustyKhajiit','3','3', 'ammirevole', '58');
INSERT INTO `fitnessvirtuale`.`risposta` (`IdRisposta`, `Username`,`IdPost`, `IdLink`, `Testo`, `sommaVoti`) VALUES ('5', 'MeanBronco','5', '4', 'riprova', '10');
INSERT INTO `fitnessvirtuale`.`risposta` (`IdRisposta`, `Username`,`IdPost`, `IdLink`, `Testo`, `sommaVoti`) VALUES ('6', 'NeedyValkyrie','2', '3', 'grandissimo', '12');



-- ---------------------------- --  Table structure for `sfida` -- ---------------------------- 

DROP TABLE IF EXISTS `sfida`; 
CREATE TABLE `fitnessvirtuale`.`sfida` (
  `IdSfida` INT NOT NULL,
  `DataLancio` DATE NOT NULL,
  `DataInizio` DATE NOT NULL,
  `DataFine` DATE NOT NULL,
  `Scopo` VARCHAR(45) NOT NULL,
  `Proponente` VARCHAR(20) NOT NULL,
  `Thread` INT NOT NULL,
  `IdSchedaAllenamento` INT NOT NULL,
  `IdSchedaAlimentazione` INT NOT NULL,
  PRIMARY KEY (`IdSfida`),
  CONSTRAINT FK_SfidaAllenamento FOREIGN KEY (IdSchedaAllenamento) 
REFERENCES schedaallenamento(IdSchedaAllenamento) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT FK_sfidaAlimentazione FOREIGN KEY (IdSchedaAlimentazione) 
REFERENCES schedaalimentazione(IdSchedaAlimentazione) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_sfidaThread FOREIGN KEY (Thread) 
REFERENCES thread(IdThread) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_sfidaProponente FOREIGN KEY (Proponente) 
REFERENCES utente(Username) ON UPDATE NO ACTION ON DELETE NO ACTION
);



-- ----------------------------
--  Records of `sfida`		(, , "", "", )
-- ----------------------------


INSERT INTO `fitnessvirtuale`.`sfida` (`IdSfida`, `DataLancio`, `DataInizio`, `DataFine`, `Scopo`, `Proponente`, `Thread`, `IdSchedaAllenamento`, `IdSchedaAlimentazione`) VALUES ('1', '2017-02-20', '2017-03-20', '2017-04-20', '50 flessioni', 'DonKiwi', '1', '2', '1');
INSERT INTO `fitnessvirtuale`.`sfida` (`IdSfida`, `DataLancio`, `DataInizio`, `DataFine`, `Scopo`, `Proponente`, `Thread`, `IdSchedaAllenamento`, `IdSchedaAlimentazione`) VALUES ('2', '2017-03-10', '2017-03-22', '2017-04-22', 'tonoficazione muscolare', 'Wrathhog', '2', '3', '2');
INSERT INTO `fitnessvirtuale`.`sfida` (`IdSfida`, `DataLancio`, `DataInizio`, `DataFine`, `Scopo`, `Proponente`, `Thread`, `IdSchedaAllenamento`, `IdSchedaAlimentazione`) VALUES ('3', '2017-06-20', '2017-07-10', '2017-10-20', 'Massa', 'TrustyKhajiit', '3', '1', '1');
INSERT INTO `fitnessvirtuale`.`sfida` (`IdSfida`, `DataLancio`, `DataInizio`, `DataFine`, `Scopo`, `Proponente`, `Thread`, `IdSchedaAllenamento`, `IdSchedaAlimentazione`) VALUES ('4', '2016-11-20', '2016-12-20', '2017-01-15', 'Dimagrire ', 'MeanBronco', '4', '2', '4');




-- ---------------------------- --  Table structure for `Cerchia` -- ---------------------------- 


DROP TABLE IF EXISTS `Cerchia`; 
CREATE TABLE `fitnessvirtuale`.`cerchia` (
  `IdCerchia` INT NOT NULL,
  `IdInteresse` INT NOT NULL, 
  `Username` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`IdCerchia`),
  CONSTRAINT FK_username FOREIGN KEY (Username) 
REFERENCES utente(Username) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_CerchiaInteresse FOREIGN KEY (IdInteresse) 
REFERENCES interesse(IdInteresse) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- ----------------------------
--  Records of `Cerchia`		(, , "", "", )
-- ----------------------------


INSERT INTO `fitnessvirtuale`.`cerchia` (`IdCerchia`, `IdInteresse`, `Username`) VALUES ('1','2', 'DonKiwi');
INSERT INTO `fitnessvirtuale`.`cerchia` (`IdCerchia`, `IdInteresse`, `Username`) VALUES ('2','4', 'Wrathhog');
INSERT INTO `fitnessvirtuale`.`cerchia` (`IdCerchia`, `IdInteresse`, `Username`) VALUES ('3','1', 'TrustyKhajiit');
INSERT INTO `fitnessvirtuale`.`cerchia` (`IdCerchia`, `IdInteresse`, `Username`) VALUES ('4','3', 'Wrathhog');
INSERT INTO `fitnessvirtuale`.`cerchia` (`IdCerchia`, `IdInteresse`, `Username`) VALUES ('5','5', 'MeanBronco');
INSERT INTO `fitnessvirtuale`.`cerchia` (`IdCerchia`, `IdInteresse`, `Username`) VALUES ('6','2', 'DonKiwi');
INSERT INTO `fitnessvirtuale`.`cerchia` (`IdCerchia`, `IdInteresse`, `Username`) VALUES ('7','3', 'MeanBronco');
INSERT INTO `fitnessvirtuale`.`cerchia` (`IdCerchia`, `IdInteresse`, `Username`) VALUES ('8','1', 'TrustyKhajiit');
INSERT INTO `fitnessvirtuale`.`cerchia` (`IdCerchia`, `IdInteresse`, `Username`) VALUES ('9','4', 'NeedyValkyrie');


-- ---------------------------- --  Table structure for `attrezzatura` -- ---------------------------- 

DROP TABLE IF EXISTS `attrezzatura`; 
CREATE TABLE `fitnessvirtuale`.`attrezzatura` (
  `IdAttrezzatura` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdAttrezzatura`));


-- ----------------------------
--  Records of `attrezzatura`		(, , "", "", )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`attrezzatura` (`IdAttrezzatura`, `Nome`) VALUES ('1', 'lat machine');
INSERT INTO `fitnessvirtuale`.`attrezzatura` (`IdAttrezzatura`, `Nome`) VALUES ('2', 'pressa');
INSERT INTO `fitnessvirtuale`.`attrezzatura` (`IdAttrezzatura`, `Nome`) VALUES ('3', 'panca');
INSERT INTO `fitnessvirtuale`.`attrezzatura` (`IdAttrezzatura`, `Nome`) VALUES ('4', 'parallele');
INSERT INTO `fitnessvirtuale`.`attrezzatura` (`IdAttrezzatura`, `Nome`) VALUES ('5', 'sbarra');
INSERT INTO `fitnessvirtuale`.`attrezzatura` (`IdAttrezzatura`, `Nome`) VALUES ('6', 'manubri');
INSERT INTO `fitnessvirtuale`.`attrezzatura` (`IdAttrezzatura`, `Nome`) VALUES ('7', 'bilancere');
INSERT INTO `fitnessvirtuale`.`attrezzatura` (`IdAttrezzatura`, `Nome`) VALUES ('8', 'tapisroulant');


-- ---------------------------- --  Table structure for `Orario` -- ---------------------------- 

DROP TABLE IF EXISTS `Orario`; 
CREATE TABLE `fitnessvirtuale`.`orario` (
  `IdOrario` INT NOT NULL,
  `OraInizio` TIME NOT NULL,
  `OraFine` TIME NOT NULL,
  `IdCentro` INT NULL,
  PRIMARY KEY (`IdOrario`),
  CONSTRAINT FK_OrarioCentro FOREIGN KEY (IdCentro) 
REFERENCES Centro(IdCentro) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- ----------------------------
--  Records of `Orario`		(, , "", "", )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`orario` (`IdOrario`, `OraInizio`, `OraFine`, `IdCentro`) VALUES ('1', '08:30', '22:30', '1');
INSERT INTO `fitnessvirtuale`.`orario` (`IdOrario`, `OraInizio`, `OraFine`, `IdCentro`) VALUES ('2', '09:30', '20:30', '2');
INSERT INTO `fitnessvirtuale`.`orario` (`IdOrario`, `OraInizio`, `OraFine`, `IdCentro`) VALUES ('3', '10:30', '22:30', '3');
INSERT INTO `fitnessvirtuale`.`orario` (`IdOrario`, `OraInizio`, `OraFine`, `IdCentro`) VALUES ('4', '12:30', '21:30', '1');




-- ---------------------------- --  Table structure for `iscrizioni` -- ---------------------------- 

DROP TABLE IF EXISTS `iscrizioni`; 
CREATE TABLE `fitnessvirtuale`.`iscrizioni` (
  `IdCorso` INT NOT NULL,
  `CodFiscale` VARCHAR(16) NOT NULL,
  `DataIscrizione` DATE NOT NULL,
  CONSTRAINT FK_IscrizioniClienti FOREIGN KEY (CodFiscale) 
REFERENCES cliente(CodFiscale) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_IscrizioniCorso FOREIGN KEY (IdCorso) 
REFERENCES corso(IdCorso) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- ----------------------------
--  Records of `iscrizioniarmadietto`		(, , "", "", )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`iscrizioni` (`IdCorso`, `CodFiscale`, `DataIscrizione`) VALUES ('1', 'HKXZFP78S67G903R', '2017-09-13');
INSERT INTO `fitnessvirtuale`.`iscrizioni` (`IdCorso`, `CodFiscale`, `DataIscrizione`) VALUES ('2', 'PJYDXH41R47B009D', '2017-10-21');
INSERT INTO `fitnessvirtuale`.`iscrizioni` (`IdCorso`, `CodFiscale`, `DataIscrizione`) VALUES ('3', 'QWBTZQ64D55H937W', '2017-11-08');
INSERT INTO `fitnessvirtuale`.`iscrizioni` (`IdCorso`, `CodFiscale`, `DataIscrizione`) VALUES ('4', 'ZGHHHC89S12B817A', '2017-11-13');
INSERT INTO `fitnessvirtuale`.`iscrizioni` (`IdCorso`, `CodFiscale`, `DataIscrizione`) VALUES ('5', 'ZCFCLG47P16C141N', '2017-11-30');
INSERT INTO `fitnessvirtuale`.`iscrizioni` (`IdCorso`, `CodFiscale`, `DataIscrizione`) VALUES ('8', 'ZCFCLG47P16C141N', '2017-09-10');



-- ---------------------------- --  Table structure for `impiego` -- ---------------------------- 

DROP TABLE IF EXISTS `impiego`; 
CREATE TABLE `fitnessvirtuale`.`impiego` (
  `IdCentro` INT NOT NULL,
  `CodFiscale` VARCHAR(16) NOT NULL,
  `Attivita` VARCHAR(45) NOT NULL,
  CONSTRAINT FK_ImpiegoDipendente FOREIGN KEY ( CodFiscale) 
REFERENCES dipendente( CodFiscale) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_ImpiegoCentro FOREIGN KEY (IdCentro) 
REFERENCES Centro(IdCentro) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- ----------------------------
--  Records of `impiego`		(, , "", "", )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`impiego` (`IdCentro`, `CodFiscale`, `Attivita`) VALUES ('1', 'LGGPPD67E19L957X', 'nutrizionista');
INSERT INTO `fitnessvirtuale`.`impiego` (`IdCentro`, `CodFiscale`, `Attivita`) VALUES ('2', 'LDTVVH55P49C730Y', 'personal trainer');
INSERT INTO `fitnessvirtuale`.`impiego` (`IdCentro`, `CodFiscale`, `Attivita`) VALUES ('3', 'RSZBTT98P15G418I', 'personal trainer');
INSERT INTO `fitnessvirtuale`.`impiego` (`IdCentro`, `CodFiscale`, `Attivita`) VALUES ('2', 'FBBFWR51S01D364F', 'dietologo');
INSERT INTO `fitnessvirtuale`.`impiego` (`IdCentro`, `CodFiscale`, `Attivita`) VALUES ('3', 'VNACLM64E50B084R', 'responsabile');
INSERT INTO `fitnessvirtuale`.`impiego` (`IdCentro`, `CodFiscale`, `Attivita`) VALUES ('4', 'SHSMSG47M56B726U', 'responsabile');


-- ---------------------------- --  Table structure for `Sessione` -- ---------------------------- 

DROP TABLE IF EXISTS `Sessione`; 
CREATE TABLE `fitnessvirtuale`.`sessione` (
  `IdSessione` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`IdSessione`));

-- ----------------------------
--  Records of `Sessione`		(, , "", "", )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`sessione` (`IdSessione`) VALUES ('1');
INSERT INTO `fitnessvirtuale`.`sessione` (`IdSessione`) VALUES ('2');
INSERT INTO `fitnessvirtuale`.`sessione` (`IdSessione`) VALUES ('3');
INSERT INTO `fitnessvirtuale`.`sessione` (`IdSessione`) VALUES ('4');
INSERT INTO `fitnessvirtuale`.`sessione` (`IdSessione`) VALUES ('5');
INSERT INTO `fitnessvirtuale`.`sessione` (`IdSessione`) VALUES ('6');
INSERT INTO `fitnessvirtuale`.`sessione` (`IdSessione`) VALUES ('7');
INSERT INTO `fitnessvirtuale`.`sessione` (`IdSessione`) VALUES ('8');




-- ---------------------------- --  Table structure for `SetupEsercizio` -- ---------------------------- 

DROP TABLE IF EXISTS `SetupEsercizio`; 
CREATE TABLE `fitnessvirtuale`.`setupesercizio` (
  `IdSetupEsercizio` INT NOT NULL AUTO_INCREMENT,
  `Regolazione` VARCHAR(45) NOT NULL,
  `IdEsercizio` INT NOT NULL,
  `IdAttrezzatura` INT NOT NULL,
  `Quantita` INT NOT NULL,
  PRIMARY KEY (`IdSetupEsercizio`),
CONSTRAINT FK_SetupEsercizi FOREIGN KEY (IdEsercizio) 
REFERENCES esercizio(IdEsercizio) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_SetupAttrezzatura FOREIGN KEY (IdAttrezzatura) 
REFERENCES attrezzatura(IdAttrezzatura) ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- ----------------------------
--  Records of `SetupEsercizio`		(, , "", "", )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`setupesercizio` (`IdSetupEsercizio`, `Regolazione`, `IdEsercizio`, `IdAttrezzatura`, `Quantita`) VALUES ('1', 'peso', '2', '1', '20');
INSERT INTO `fitnessvirtuale`.`setupesercizio` (`IdSetupEsercizio`, `Regolazione`, `IdEsercizio`, `IdAttrezzatura`, `Quantita`) VALUES ('2', 'peso', '1', '3', '10');
INSERT INTO `fitnessvirtuale`.`setupesercizio` (`IdSetupEsercizio`, `Regolazione`, `IdEsercizio`, `IdAttrezzatura`, `Quantita`) VALUES ('3', 'peso', '3', '2', '30');
INSERT INTO `fitnessvirtuale`.`setupesercizio` (`IdSetupEsercizio`, `Regolazione`, `IdEsercizio`, `IdAttrezzatura`, `Quantita`) VALUES ('4', 'peso', '5', '4', '50');
INSERT INTO `fitnessvirtuale`.`setupesercizio` (`IdSetupEsercizio`, `Regolazione`, `IdEsercizio`, `IdAttrezzatura`, `Quantita`) VALUES ('5', 'boh', '4', '2', '10');



-- ---------------------------- --  Table structure for `insegnamento` -- ---------------------------- 

DROP TABLE IF EXISTS `insegnamento`; 
CREATE TABLE `fitnessvirtuale`.`insegnamento` (
  `IdCorso` INT NOT NULL,
  `CodFiscale` VARCHAR(16) NOT NULL,
CONSTRAINT FK_InsegnamentoCorso FOREIGN KEY (IdCorso) 
REFERENCES corso(IdCorso) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_InsegnamentoCliente FOREIGN KEY (CodFiscale) 
REFERENCES Cliente(CodFiscale) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- ----------------------------
--  Records of `insegnamento`		(, , "", "", )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`insegnamento` (`IdCorso`, `CodFiscale`) VALUES ('1', 'HKXZFP78S67G903R');
INSERT INTO `fitnessvirtuale`.`insegnamento` (`IdCorso`, `CodFiscale`) VALUES ('2', 'PJYDXH41R47B009D');
INSERT INTO `fitnessvirtuale`.`insegnamento` (`IdCorso`, `CodFiscale`) VALUES ('3', 'QWBTZQ64D55H937W');
INSERT INTO `fitnessvirtuale`.`insegnamento` (`IdCorso`, `CodFiscale`) VALUES ('2', 'QWBTZQ64D55H937W');
INSERT INTO `fitnessvirtuale`.`insegnamento` (`IdCorso`, `CodFiscale`) VALUES ('4', 'ZGHHHC89S12B817A');
INSERT INTO `fitnessvirtuale`.`insegnamento` (`IdCorso`, `CodFiscale`) VALUES ('6', 'ZGHHHC89S12B817A');
INSERT INTO `fitnessvirtuale`.`insegnamento` (`IdCorso`, `CodFiscale`) VALUES ('5', 'KCPMYS42S50B352E');
INSERT INTO `fitnessvirtuale`.`insegnamento` (`IdCorso`, `CodFiscale`) VALUES ('7', 'ZCFCLG47P16C141N');


-- ---------------------------- --  Table structure for `orariolavoro` -- ---------------------------- 

DROP TABLE IF EXISTS `orariolavoro`; 
CREATE TABLE `fitnessvirtuale`.`orariolavoro` (
  `CodFiscale` VARCHAR(16) NOT NULL,
  `IdTurno` INT NOT NULL,
  `IdCentro` INT NOT NULL,
CONSTRAINT FK_OrarioDipendente FOREIGN KEY (CodFiscale) 
REFERENCES dipendente(CodFiscale) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_OrarioTurno FOREIGN KEY (IdTurno) 
REFERENCES turno(IdTurno) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_OrarioLavoroCentro FOREIGN KEY (IdCentro) 
REFERENCES Centro(IdCentro) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- ----------------------------
--  Records of `orariolavoro`		(, , "", "", )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`orariolavoro` (`CodFiscale`, `IdTurno`, `IdCentro`) VALUES ('LGGPPD67E19L957X', '2', '2');
INSERT INTO `fitnessvirtuale`.`orariolavoro` (`CodFiscale`, `IdTurno`, `IdCentro`) VALUES ('HMZFGM39L67A238Y', '1', '1');
INSERT INTO `fitnessvirtuale`.`orariolavoro` (`CodFiscale`, `IdTurno`, `IdCentro`) VALUES ('LDTVVH55P49C730Y', '3', '2');
INSERT INTO `fitnessvirtuale`.`orariolavoro` (`CodFiscale`, `IdTurno`, `IdCentro`) VALUES ('LDTVVH55P49C730Y', '1', '3');
INSERT INTO `fitnessvirtuale`.`orariolavoro` (`CodFiscale`, `IdTurno`, `IdCentro`) VALUES ('RSZBTT98P15G418I', '4', '5');
INSERT INTO `fitnessvirtuale`.`orariolavoro` (`CodFiscale`, `IdTurno`, `IdCentro`) VALUES ('VNACLM64E50B084R', '3', '3');
INSERT INTO `fitnessvirtuale`.`orariolavoro` (`CodFiscale`, `IdTurno`, `IdCentro`) VALUES ('FBBFWR51S01D364F', '2', '1');
INSERT INTO `fitnessvirtuale`.`orariolavoro` (`CodFiscale`, `IdTurno`, `IdCentro`) VALUES ('VNACLM64E50B084R', '5', '4');



-- ---------------------------- --  Table structure for `giacenza` -- ---------------------------- 

DROP TABLE IF EXISTS `giacenza`; 
CREATE TABLE `fitnessvirtuale`.`giacenza` (
  `IdGiacenza` INT NOT NULL,
  `IdIntegratore` INT NOT NULL,
  `IdCentro` INT NOT NULL,
  `IdOrdine` INT NOT NULL,
  `Quantita` INT NOT NULL,
  `DataScadenza` DATE NOT NULL,
  PRIMARY KEY (`IdGiacenza`),
  CONSTRAINT FK_GiacenzaIntegratori FOREIGN KEY (IdIntegratore) 
  REFERENCES integratore(IdIntegratore) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT FK_GiacenzaCentro FOREIGN KEY (IdCentro) 
  REFERENCES centro(IdCentro) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT FK_GiacenzaOrdine FOREIGN KEY (IdOrdine) 
  REFERENCES ordine(IdOrdine) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- ----------------------------
--  Records of `giacenza`		(, , "", "", )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`giacenza` (`IdGiacenza`, `IdIntegratore`, `IdCentro`, `IdOrdine`, `Quantita`, `DataScadenza`) VALUES ('1','1', '2', '2', '4', '2017-10-12');
INSERT INTO `fitnessvirtuale`.`giacenza` (`IdGiacenza`, `IdIntegratore`, `IdCentro`, `IdOrdine`, `Quantita`, `DataScadenza`) VALUES ('2','2', '1', '1', '5', '2017-12-11');
INSERT INTO `fitnessvirtuale`.`giacenza` (`IdGiacenza`, `IdIntegratore`, `IdCentro`, `IdOrdine`, `Quantita`, `DataScadenza`) VALUES ('3','3', '4', '2', '6', '2017-11-23');
INSERT INTO `fitnessvirtuale`.`giacenza` (`IdGiacenza`, `IdIntegratore`, `IdCentro`, `IdOrdine`, `Quantita`, `DataScadenza`) VALUES ('4','2', '3', '3', '5', '2018-10-02');
INSERT INTO `fitnessvirtuale`.`giacenza` (`IdGiacenza`, `IdIntegratore`, `IdCentro`, `IdOrdine`, `Quantita`, `DataScadenza`) VALUES ('5','5', '1', '4', '6', '2017-10-05');
INSERT INTO `fitnessvirtuale`.`giacenza` (`IdGiacenza`, `IdIntegratore`, `IdCentro`, `IdOrdine`, `Quantita`, `DataScadenza`) VALUES ('6','4', '5', '3', '2', '2017-11-17');
INSERT INTO `fitnessvirtuale`.`giacenza` (`IdGiacenza`, `IdIntegratore`, `IdCentro`, `IdOrdine`, `Quantita`, `DataScadenza`) VALUES ('7','2', '5', '5', '10', '2017-11-14');
INSERT INTO `fitnessvirtuale`.`giacenza` (`IdGiacenza`, `IdIntegratore`, `IdCentro`, `IdOrdine`, `Quantita`, `DataScadenza`) VALUES ('8','1', '3', '3', '20', '2017-10-17');




-- ---------------------------- --  Table structure for `acquisto` -- ---------------------------- 

DROP TABLE IF EXISTS `acquisto`; 
CREATE TABLE `fitnessvirtuale`.`acquisto` (
  `IdIntegratore` INT NOT NULL,
  `CodFiscale` VARCHAR(16) NOT NULL,
  `IdCentro` INT NOT NULL,
  `Data` DATE NOT NULL,
  `Quantita` INT NOT NULL,
  CONSTRAINT FK_acquistoIntegratore FOREIGN KEY (IdIntegratore) 
  REFERENCES integratore(IdIntegratore) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT FK_acquistoCentro FOREIGN KEY (IdCentro) 
  REFERENCES centro(IdCentro) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT FK_acquistoCliente FOREIGN KEY (CodFiscale) 
  REFERENCES cliente(CodFiscale) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- ----------------------------
--  Records of `acquisto`		(, , "", "", )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`acquisto` (`IdIntegratore`, `CodFiscale`, `IdCentro`, `Data`, `Quantita`) VALUES ('1', 'HKXZFP78S67G903R', '2', '2017-09-02', '6');
INSERT INTO `fitnessvirtuale`.`acquisto` (`IdIntegratore`, `CodFiscale`, `IdCentro`, `Data`, `Quantita`) VALUES ('2', 'PJYDXH41R47B009D', '1', '2017-08-24', '10');
INSERT INTO `fitnessvirtuale`.`acquisto` (`IdIntegratore`, `CodFiscale`, `IdCentro`, `Data`, `Quantita`) VALUES ('3', 'QWBTZQ64D55H937W', '4', '2017-08-27', '15');
INSERT INTO `fitnessvirtuale`.`acquisto` (`IdIntegratore`, `CodFiscale`, `IdCentro`, `Data`, `Quantita`) VALUES ('4', 'ZGHHHC89S12B817A', '3', '2017-08-29', '2');
INSERT INTO `fitnessvirtuale`.`acquisto` (`IdIntegratore`, `CodFiscale`, `IdCentro`, `Data`, `Quantita`) VALUES ('3', 'ZCFCLG47P16C141N', '2', '2017-09-10', '12');


-- ---------------------------- --  Table structure for `commercializzati` -- ---------------------------- 

DROP TABLE IF EXISTS `commercializzati`; 
CREATE TABLE `fitnessvirtuale`.`commercializzati` (
  `IdIntegratore` INT NOT NULL,
  `NomeFornitore` VARCHAR(45) NOT NULL,
  `Prezzo` VARCHAR(10) NOT NULL,
   CONSTRAINT FK_IntegratoriCommercializzati FOREIGN KEY (IdIntegratore) 
  REFERENCES integratore(IdIntegratore) ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT FK_FornitoriCommercializzati FOREIGN KEY (NomeFornitore) 
  REFERENCES fornitore(NomeFornitore) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- ----------------------------
--  Records of `commercializzati`		(, , "", "", )
-- ----------------------------
INSERT INTO `fitnessvirtuale`.`commercializzati` (`IdIntegratore`, `NomeFornitore`, `Prezzo`) VALUES ('1', 'ebay', '20€');
INSERT INTO `fitnessvirtuale`.`commercializzati` (`IdIntegratore`, `NomeFornitore`, `Prezzo`) VALUES ('3', 'amazon', '13€');
INSERT INTO `fitnessvirtuale`.`commercializzati` (`IdIntegratore`, `NomeFornitore`, `Prezzo`) VALUES ('2', 'CompraQui', '15€');
INSERT INTO `fitnessvirtuale`.`commercializzati` (`IdIntegratore`, `NomeFornitore`, `Prezzo`) VALUES ('4', 'droptable', '20€');
INSERT INTO `fitnessvirtuale`.`commercializzati` (`IdIntegratore`, `NomeFornitore`, `Prezzo`) VALUES ('5', 'amazon', '50€');



-- ---------------------------- --  Table structure for `richiestaamicizia` -- ---------------------------- 

DROP TABLE IF EXISTS `richiestaamicizia`;
CREATE TABLE `fitnessvirtuale`.`richiestaamicizia` (
  `Mittente` VARCHAR(45) NOT NULL,
  `Destinatario` VARCHAR(45) NOT NULL,
  `Stato` VARCHAR(45) NOT NULL,
  CONSTRAINT FK_RichiestaMittente FOREIGN KEY (Mittente) 
  REFERENCES utente(Username) ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT FK_RichiestaDestinatario FOREIGN KEY (Destinatario) 
  REFERENCES utente(Username) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- ----------------------------
--  Records of `richiestaamicizia`		(, , "", "", )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`richiestaamicizia` (`Mittente`, `Destinatario`, `Stato`) VALUES ('DonKiwi', 'Wrathhog', 'Accettata');
INSERT INTO `fitnessvirtuale`.`richiestaamicizia` (`Mittente`, `Destinatario`, `Stato`) VALUES ('Wrathhog', 'TrustyKhajiit', 'Non Accettata');
INSERT INTO `fitnessvirtuale`.`richiestaamicizia` (`Mittente`, `Destinatario`, `Stato`) VALUES ('DonKiwi', 'MeanBronco', 'Accettata');
INSERT INTO `fitnessvirtuale`.`richiestaamicizia` (`Mittente`, `Destinatario`, `Stato`) VALUES ('TrustyKhajiit', 'DonKiwi', 'Non Accettata');
INSERT INTO `fitnessvirtuale`.`richiestaamicizia` (`Mittente`, `Destinatario`, `Stato`) VALUES ('MeanBronco', 'NeedyValkyrie', 'Accettata');



-- ---------------------------- --  Table structure for `partecipante` -- ---------------------------- 

DROP TABLE IF EXISTS `partecipante`;
CREATE TABLE `fitnessvirtuale`.`partecipante` (
  `IdSfida` INT NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdSfida`, `Username`),
  CONSTRAINT FK_PartecipanteSfida FOREIGN KEY (IdSfida) 
  REFERENCES sfida(IdSfida) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT FK_PartecipanteUsername FOREIGN KEY (Username) 
  REFERENCES utente(Username) ON UPDATE NO ACTION ON DELETE NO ACTION
);


-- ----------------------------
--  Records of `partecipante`		(, , "", "", )
-- ----------------------------


INSERT INTO `fitnessvirtuale`.`partecipante` (`IdSfida`, `Username`) VALUES ('1', 'DonKiwi');
INSERT INTO `fitnessvirtuale`.`partecipante` (`IdSfida`, `Username`) VALUES ('2', 'Wrathhog');
INSERT INTO `fitnessvirtuale`.`partecipante` (`IdSfida`, `Username`) VALUES ('3', 'TrustyKhajiit');
INSERT INTO `fitnessvirtuale`.`partecipante` (`IdSfida`, `Username`) VALUES ('2', 'MeanBronco');
INSERT INTO `fitnessvirtuale`.`partecipante` (`IdSfida`, `Username`) VALUES ('1', 'NeedyValkyrie');




-- ---------------------------- --  Table structure for `valutazione` -- ---------------------------- 


DROP TABLE IF EXISTS `valutazione`;
CREATE TABLE `fitnessvirtuale`.`valutazione` (
  `IdValutazione` INT NOT NULL,
  `IdRisposta` INT NOT NULL,
  `Username` VARCHAR(20) NOT NULL,
  `Voto` INT NOT NULL,
  PRIMARY KEY (`IdValutazione`),
   CONSTRAINT FK_ValutazioneRisposta FOREIGN KEY (IdRisposta) 
  REFERENCES Risposta(IdRisposta) ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT FK_ValutazioneUsername FOREIGN KEY (Username) 
  REFERENCES utente(Username) ON UPDATE NO ACTION ON DELETE NO ACTION
);


-- ----------------------------
--  Records of `valutazione`		(, , "", "", )
-- ----------------------------

INSERT INTO `fitnessvirtuale`.`valutazione` (`IdValutazione`, `IdRisposta`, `Username`, `Voto`) VALUES ('1', '3', 'DonKiwi', '3');
INSERT INTO `fitnessvirtuale`.`valutazione` (`IdValutazione`, `IdRisposta`, `Username`, `Voto`) VALUES ('2', '1', 'Wrathhog', '1');
INSERT INTO `fitnessvirtuale`.`valutazione` (`IdValutazione`, `IdRisposta`, `Username`, `Voto`) VALUES ('3', '2', 'MeanBronco', '4');
INSERT INTO `fitnessvirtuale`.`valutazione` (`IdValutazione`, `IdRisposta`, `Username`, `Voto`) VALUES ('4', '1', 'NeedyValkyrie', '5');
INSERT INTO `fitnessvirtuale`.`valutazione` (`IdValutazione`, `IdRisposta`, `Username`, `Voto`) VALUES ('5', '4', 'TrustyKhajiit', '2');
INSERT INTO `fitnessvirtuale`.`valutazione` (`IdValutazione`, `IdRisposta`, `Username`, `Voto`) VALUES ('6', '2', 'TrustyKhajiit', '4');

drop table if exists Score;
  CREATE TABLE IF NOT EXISTS Score(
		`Anno` INT(11) NOT NULL,
		`Mese` INT(11) NOT NULL,
		`CodFiscale` VARCHAR(45) NOT NULL,
        `Punteggio` INT(11) NOT NULL,
        PRIMARY KEY(`Anno`, `Mese`, `CodFiscale`)
	) ENGINE=InnoDB DEFAULT CHARSET=latin1;


