
DROP PROCEDURE IF EXISTS ReportDimensionamento;
DELIMITER $$
CREATE PROCEDURE ReportDimensionamento(IN _Centro INT(11))
BEGIN
-- conteggio iscritti a _Centro
	SELECT count(*) INTO @nIscritti
    FROM contratto co INNER JOIN centro ce on ce.IdCentro = co.IdCentro
 	where DATEDIFF(CURRENT_DATE, DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH)) > 0
		and co.IdCentro = 1
	group by co.IdCentro;
    
    SELECT (((SUM(e.TempoEsecuzione) *SUM(e.Conteggio)) + (SUM(e.TempoRecupero)*SUM(e.Ripetizioni)))
			- ((SUM(ee.TempoEsecuzione) *SUM(ec.Conteggio)) + (SUM(ee.TempoRecupero)*SUM(e.Ripetizioni))))
              /@nIscritti into @Ritardo
    FROM esercizio e inner join esercizioeffettivo ee on e.IdEsercizio=ee.IdEsercizio 
		inner join conteggio ec on ee.IdEsercizioEffettivo=ec.IdEsercizioEffettivo
		inner join apparecchiature a on a.IdApparecchiatura=ee.IdApparecchiatura
        inner join sala s on s.IdSala=a.IdSala
		WHERE s.IdCentro = _Centro
			AND DATEDIFF(CURRENT_DATE, ee.Data) <= 365;
        
        IF @Ritardo < 600 THEN		
			SELECT @Ritardo as RitardoAnnuale, "Centro fitness SOTTODIMENSIONATO" as Responso;
		ELSE
			SELECT @Ritardo as RitardoAnnuale, "Centro fitness ADEGUATO" as Responso;
        END IF;

END $$
DELIMITER ;


call ReportDimensionamento(1);