-- Impedisce l'inserimento di valutazioni inappropriate, cioè fuori dal range prestabilito 0 - 5


DROP TRIGGER IF EXISTS LimiteVoto;

DELIMITER $$

CREATE TRIGGER LimiteVoto
AFTER INSERT ON Valutazione FOR EACH ROW
BEGIN

	IF ((new.Voto > 5) OR (new.Voto < 0))  THEN
    
    DELETE FROM Valutazione
    where IdValutazione = new.IdValutazione;
    
    SIGNAL SQLSTATE "45000"
	SET MESSAGE_TEXT = `Voto fuori dal range`;
    
    END IF;
	
END$$

DELIMITER ;


