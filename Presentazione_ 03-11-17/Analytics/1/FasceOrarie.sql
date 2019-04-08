

DROP PROCEDURE IF EXISTS ReportFasceOrarie;
DELIMITER $$
CREATE PROCEDURE ReportFasceOrarie()
BEGIN

	SELECT B.IdCentro, B.IdOrario, B.OraInizio, B.OraInizio, B.AccessiFascia
    FROM (
		SELECT co.IdCentro, count(*)/100 as 2Percent
		FROM contratto co INNER JOIN centro ce on ce.IdCentro = co.IdCentro
		where DATEDIFF(CURRENT_DATE, DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH)) > 0
		group by co.IdCentro
	) as A
    INNER JOIN 
    (
    SELECT o.*, count(*) AS AccessiFascia
    FROM orario o inner join centro ce on ce.IdCentro = o.IdCentro 
	inner join accessi a on ce.IdCentro = a.IdCentro 
    where timestampdiff(DAY,CURRENT_TIMESTAMP, a.TimestampAccesso) <= 365 
    GROUP BY o.IdOrario
    ) as B
		ON A.IdCentro = B.IdCentro
    WHERE AccessiFascia < 2Percent;

END $$
DELIMITER ;


call ReportFasceOrarie();