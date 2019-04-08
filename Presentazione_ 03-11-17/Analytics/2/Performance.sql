
DROP EVENT IF EXISTS ScorePerformance;

DELIMITER $$

CREATE EVENT ScorePerformance
ON SCHEDULE EVERY 1 MONTH
STARTS "2017-11-01"
DO
BEGIN

    INSERT INTO Score
		SELECT year(CURRENT_DATE), MONTH(CURRENT_DATE), cl.CodFiscale, 
			PunteggioDimagrimento(cl.CodFiscale)
        FROM cliente cl inner join statistichecliente sc
			on cl.CodFiscale=sc.CodFiscale
		where cl.Scopo = "Dimagrimento";
        
    INSERT INTO Score
		SELECT year(CURRENT_DATE), MONTH(CURRENT_DATE), cl.CodFiscale, 
			PunteggioMuscolo(cl.CodFiscale)
        FROM cliente cl inner join statistichecliente sc
			on cl.CodFiscale=sc.CodFiscale
		where cl.Scopo = "Potenziamento Muscolare";

    INSERT INTO Score
		SELECT year(CURRENT_DATE), MONTH(CURRENT_DATE), cl.CodFiscale, 
			PunteggioRicreativo(cl.CodFiscale)
        FROM cliente cl inner join statistichecliente sc
			on cl.CodFiscale=sc.CodFiscale
		where cl.Scopo = "Ricreativo";
        
END $$
DELIMITER ;


