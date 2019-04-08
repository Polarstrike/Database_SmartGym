
DROP PROCEDURE IF EXISTS ReportScadenzaIntegratori;
DELIMITER $$
CREATE PROCEDURE ReportScadenzaIntegratori()
BEGIN
	SELECT g.*, DATEDIFF(g.DataScadenza, CURRENT_DATE) AS GiorniMancanti
	FROM giacenza g
    WHERE DATEDIFF(g.DataScadenza, CURRENT_DATE) BETWEEN 0 AND 62;

END $$
DELIMITER ;



call ReportScadenzaIntegratori();