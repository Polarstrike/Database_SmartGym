DROP PROCEDURE IF EXISTS nVendite;

DELIMITER $$

CREATE PROCEDURE nVendite()
BEGIN

	SELECT a.IdIntegratore, COUNT(*) AS nVenditeMensili
	FROM acquisto a
    WHERE DATEDIFF(CURRENT_DATE, a.Data) < 32
	GROUP BY a.IdIntegratore;

END $$

DELIMITER ;

call nVendite();