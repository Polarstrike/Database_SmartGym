

DROP PROCEDURE IF EXISTS ReportCorsi;
DELIMITER $$
CREATE PROCEDURE ReportCorsi()
BEGIN

SELECT co1.Disciplina, s.IdCentro, 
		100* (SUM(F.Iscritti) / SUM(co1.MaxIscrizioni)) as PercentualeIscritti
FROM corso co1 inner join 
	(SELECT co.IdCorso, count(*) AS Iscritti
	FROM corso co inner join iscrizioni i on i.IdCorso = co.IdCorso
	GROUP BY co.IdCorso) 
	as F on F.IdCorso=co1.IdCorso inner join Sala s on s.IdSala=co1.IdSala
GROUP BY co1.Disciplina, s.IdCentro;

END $$
DELIMITER ;


call ReportCorsi();