DROP TRIGGER IF EXISTS RIDONDANZA_Stato;
 
DELIMITER $$ 
 
CREATE TRIGGER RIDONDANZA_Stato
AFTER UPDATE ON Accessi FOR EACH ROW 
BEGIN 

	IF new.OraUscita IS NOT NULL THEN
		
        UPDATE Armadietto
        SET Stato = "libero"
        WHERE IdArmadietto = new.IdArmadietto;
    
    END IF;

END$$ 
DELIMITER ; 


