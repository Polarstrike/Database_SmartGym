-- 4 CALCOLO ACCESSI CENTRO
/*
Conteggio clienti attualmente iscritti per ogni centro fitness e numero di accessi nel mese solare precedente a quello attualmente in corso.
*/

DROP PROCEDURE IF EXISTS AnalisiFlussiClienti;
DELIMITER $$
CREATE PROCEDURE AnalisiFlussiClienti()
BEGIN

	SELECT co.IdCentro, count(*) as Iscritti, (SELECT count(*)
												FROM accessi a 
												where a.IdCentro = ce.IdCentro 
												AND year(a.TimestampAccesso) = year(DATE_SUB(current_date, INTERVAL 1 MONTH))
												AND month(a.TimestampAccesso) = month(DATE_SUB(current_date, INTERVAL 1 MONTH))
												) as AccessiMesePrecedente                                                
    FROM contratto co INNER JOIN centro ce on ce.IdCentro = co.IdCentro
	where DATEDIFF(CURRENT_DATE, DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH)) > 0
	group by co.IdCentro;

END $$
DELIMITER ;


call AnalisiFlussiClienti();


