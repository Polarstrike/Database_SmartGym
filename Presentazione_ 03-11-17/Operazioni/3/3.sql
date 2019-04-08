-- 3 Percentuale diffusione tipologie contratto tra quelli in corso di validita
/*
Per ogni tipologia di contratto restituisce la percentuale che copre dei contratti attualmente validi.
*/

DROP PROCEDURE IF EXISTS PercentualeContratto;
DELIMITER $$
CREATE PROCEDURE PercentualeContratto()
BEGIN

	SELECT count(*) INTO @nContratti
    FROM contratto co
    where DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH) > current_date;

	SELECT tc.IdTipoContratto, tc.Nome, (100* (COUNT(*) / @nContratti)) as PercentualeIscritti 
    FROM contratto co inner join tipocontratto tc on tc.IdTipoContratto = co.tipo
    where DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH) > current_date
	GROUP BY tc.IdTipoContratto;

END $$
DELIMITER ;




call PercentualeContratto();





