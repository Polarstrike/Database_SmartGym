
DROP PROCEDURE IF EXISTS Promozioni;
DELIMITER $$
CREATE PROCEDURE Promozioni(IN _Centro INT(11))
BEGIN

	SELECT g.IdGiacenza, g.IdIntegratore, g.DataScadenza, 
		(c.Prezzo / o.Quantita) AS PrezzoOfferta
	FROM giacenza g inner join integratore i on i.IdIntegratore=g.IdIntegratore
		inner join ordine o on g.IdOrdine=o.IdOrdine
		inner join fornitore f on f.NomeFornitore = o.NomeFornitore
		inner join commercializzati c on c.IdIntegratore=i.IdIntegratore
    WHERE 	g.IdCentro=_Centro AND 
	(
	DATEDIFF(g.DataScadenza, CURRENT_DATE) BETWEEN 0 AND 31 OR 
    DATEDIFF(DATE_ADD(o.DataConsegna, INTERVAL f.GiorniPagamento DAY), CURRENT_DATE) 
		BETWEEN 0 AND 31
    );

END $$
DELIMITER ;



call Promozioni(1);