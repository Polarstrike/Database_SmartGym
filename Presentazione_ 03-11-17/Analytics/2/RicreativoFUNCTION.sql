

DROP FUNCTION IF EXISTS PunteggioRicreativo;
DELIMITER $$
CREATE FUNCTION PunteggioRicreativo(_Cliente VARCHAR (45))
RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE PUNTEGGIO INT(11) DEFAULT 0;
		SET PUNTEGGIO = 
           100 - (10* (PunteggioDimagrimento(_Cliente) + PunteggioMuscolo(_Cliente) +
	(
       ( 
        SELECT sc0.Peso
         from statistichecliente sc0
         where sc0.CodFiscale=_Cliente
			AND year(sc0.data) = year(DATE_SUB(current_date, INTERVAL 1 MONTH))
			AND month(sc0.data) = month(DATE_SUB(current_date, INTERVAL 1 MONTH))
		)
        -
        (SELECT sc3.Peso
         from statistichecliente sc3
         where sc3.CodFiscale=_Cliente
			AND year(sc3.data) = year(current_date)
			AND month(s3.data) = month(current_date)
        )
      )
	)
)
;     
     RETURN(PUNTEGGIO);
	
END $$

DELIMITER ;



