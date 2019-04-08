-- ReportUsura

/*
Generazione report relativo allo stato di usura delle apparecchiature di un determinato centro fitness
*/


DROP PROCEDURE IF EXISTS ReportUsura;
DELIMITER $$
CREATE PROCEDURE ReportUsura(IN _Centro INT(11))
BEGIN

SELECT s.IdSala, a.IdApparecchiatura, a.Nome , a.LivelloUsura
FROM centro c INNER JOIN sala s ON s.IdCentro = c.IdCentro
	INNER JOIN apparecchiature a ON a.IdSala = s.IdSala
WHERE a.LivelloUsura > 80
		AND c.IdCentro = _Centro
ORDER BY a.LivelloUsura;

END $$
DELIMITER ;


call ReportUsura(1);