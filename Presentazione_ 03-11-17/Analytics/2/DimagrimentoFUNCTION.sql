

DROP FUNCTION IF EXISTS PunteggioDimagrimento;
DELIMITER $$
CREATE FUNCTION PunteggioDimagrimento(_Cliente VARCHAR (45))
RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE PUNTEGGIO INT(11) DEFAULT 0;
		SET PUNTEGGIO = 
           50 + (10*
       
       ( 
      (  SELECT sc1.MassaGrassa
         from statistichecliente sc1
         where sc1.CodFiscale=_Cliente
			AND year(sc1.data) = year(DATE_SUB(current_date, INTERVAL 1 MONTH))
			AND month(sc1.data) = month(DATE_SUB(current_date, INTERVAL 1 MONTH))
		)
			+
            
       ( 
        SELECT sc0.Peso
         from statistichecliente sc0
         where sc0.CodFiscale=_Cliente
			AND year(sc0.data) = year(DATE_SUB(current_date, INTERVAL 1 MONTH))
			AND month(sc0.data) = month(DATE_SUB(current_date, INTERVAL 1 MONTH))
		
      )
      -
         
		(
        SELECT sc2.MassaGrassa
         from statistichecliente sc2
         where sc2.CodFiscale=_Cliente
			AND year(sc2.data) = year(current_date)
			AND month(sc2.data) = month(current_date)
		)
			+
		
        (SELECT sc3.Peso
         from statistichecliente sc3
         where sc3.CodFiscale=_Cliente
			AND year(sc3.data) = year(current_date)
			AND month(sc3.data) = month(current_date)
        )
        )
        )
     ;
     RETURN(PUNTEGGIO);
END $$
DELIMITER ;

select punteggiodimagrimento("CLDLHU67S59I553I") as PunteggioDimagrimento;