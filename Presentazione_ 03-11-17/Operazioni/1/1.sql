

DROP TRIGGER IF EXISTS AssegnaArmadietto;
DELIMITER $$  
CREATE TRIGGER AssegnaArmadietto
AFTER INSERT ON Accessi FOR EACH ROW 
BEGIN 

	SELECT a.IdArmadietto, a.IdSpogliatoio into @Armadietto, @Spogliatoio
    FROM armadietto a inner join spogliatoio s on s.IdSpogliatoio = a.IdSpogliatoio
		inner join centro ce on ce.IdCentro = s.IdCentro
    where a.IdArmadietto IN (SELECT a1.IdArmadietto
							 FROM accessi a1
							 WHERE a1.OraUscita is not null AND
								a1.TimestampAccesso = 	(SELECT MAX(a2.TimestampAccesso)
														 FROM accessi a2
                                                         WHERE a1.IdArmadietto = a2.IdArmadietto)
							)
		OR 0 = (
				SELECT COUNT(*)
				FROM accessi a3
				WHERE 	a3.IdArmadietto = a.IdArmadietto
				)
                
		AND s.IdCentro = new.IdCentro
	LIMIT 1 ;
    
    UPDATE Armadietto
	set stato = "occupato"
	where a.IdArmadietto = @Armadietto;
    
    UPDATE Armadietto
    set Armadietto = @Armadietto;
    
END$$ 
DELIMITER ; 

/*
àrmadietto libero

accesso.orauscita  null
non ci sono accessi relativi a quell armadietto
 */