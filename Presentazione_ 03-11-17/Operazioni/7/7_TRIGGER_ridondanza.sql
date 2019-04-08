-- 7 trigger

DROP TRIGGER IF EXISTS RIDONDANZAsommaVoto; 
DELIMITER $$  
CREATE TRIGGER RIDONDANZAsommaVoto
AFTER INSERT ON Valutazione FOR EACH ROW 
BEGIN 
	UPDATE Risposta
		SET sommaVoto = sommaVoto + new.Voto
	WHERE IdRisposta = NEW.IdRisposta;
 
END$$ 
DELIMITER ; 





