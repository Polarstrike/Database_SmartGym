-- 5 contratti in scadenza
/*
Elencare i contratti in scadenza entro due settimane di modo tale che l'azienda possa contattare il cliente per il rinnovo. 
*/



DROP PROCEDURE IF EXISTS CheckContratti;
DELIMITER $$
CREATE PROCEDURE CheckContratti()
BEGIN

	SELECT co.IdContratto, co.CodFiscale, cl.Nome, cl.Cognome, cl.Indirizzo,
		DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH) as Scadenza, tc.Nome as Suggerito
	FROM contratto co INNER JOIN cliente cl on cl.CodFiscale = co.CodFiscale
		INNER JOIN tipocontratto tc on tc.IdTipoContratto = co.Tipo
	WHERE DATEDIFF(DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH), CURRENT_DATE)
		BETWEEN 0 AND 30;

END $$
DELIMITER ;


call CheckContratti();








