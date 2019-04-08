-- 1 Assegnamento armadietto

/*
All'accesso di un cliente in una palestra gli viene assegnato un armadietto libero.
*/


DROP TRIGGER IF EXISTS AssegnaArmadiettoRidondanza;
DELIMITER $$ 
CREATE TRIGGER AssegnaArmadiettoRidondanza
AFTER INSERT ON Accessi FOR EACH ROW 
BEGIN 

	SELECT a.IdArmadietto, a.IdSpogliatoio into @Armadietto, @Spogliatoio
    FROM armadietto a inner join spogliatoio s on s.IdSpogliatoio = a.IdSpogliatoio
		inner join centro ce on ce.IdCentro = s.IdCentro
    where a.stato = "libero"
		AND s.IdCentro = new.IdCentro
	LIMIT 1 ;
    
    UPDATE Armadietto
	set stato = "occupato", Armadietto = @Armadietto
	where a.IdArmadietto = @Armadietto;
    
END$$ 
DELIMITER ; 





	







