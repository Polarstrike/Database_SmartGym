-- Impedisce ad un cliente di avere più di due contratti attivi.


DROP TRIGGER IF EXISTS LimiteCentri;

DELIMITER $$

CREATE TRIGGER LimiteCentri
AFTER INSERT ON Contratto FOR EACH ROW
BEGIN

	SELECT COUNT(co.IdCentro) into @nCentri
    FROM contratto co
    where co.CodFiscale = new.CodFiscale
		AND DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH) < current_date;
        
	IF @nCentri > 2 THEN
    
    DELETE FROM Contratto
    where IdContratto = new.IdContratto;
    
    SIGNAL SQLSTATE "45000"
	SET MESSAGE_TEXT = `Limite Centri raggiunto`;
    
    END IF;
	
END$$

DELIMITER ;

