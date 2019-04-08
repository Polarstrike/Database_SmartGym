-- 2 TROVA CORSO
/*
Data IdCentro e Disciplina, se esiste un corso a cui è possibile iscriversi ne visualizza la data di inizio
*/

DROP PROCEDURE IF EXISTS TrovaCorso;
DELIMITER $$
CREATE PROCEDURE TrovaCorso(IN _Disciplina VARCHAR(45), IN _Centro INT(11))
BEGIN

	SELECT co.IdCorso, co.Disciplina, co.DataInizio
	FROM corso co inner join iscrizioni i on i.IdCorso = co.IdCorso
		inner join sala s on co.IdSala = s.IdSala inner join centro ce on ce.IdCentro=s.IdCentro
	where co.Disciplina = _Disciplina
		AND ce.IdCentro = _Centro
        AND co.DataInizio > current_date 
		AND co.MaxIscrizioni > (SELECT COUNT(*) as num
								FROM corso co1 inner join iscrizioni i1 
									ON i1.IdCorso = co1.IdCorso
								WHERE co1.IdCorso = co.IdCorso
                                );
END $$
DELIMITER ;




set @disc = "karate";
set @centro = 1;
call TrovaCorso(@disc , @centro);




