-- 8 INTEGRATORI

/*
Alla richiesta di un cliente di un integratore che non è ne presente in magazzino ne è stato ordinato, viene effettuato l'ordine.
*/

DROP TRIGGER IF EXISTS CheckIntegratore; 
DELIMITER $$ 
CREATE TRIGGER CheckIntegratore
BEFORE INSERT ON Acquisto FOR EACH ROW 
BEGIN 
 -- nome integratore, centro in cui sto acquistando
	SELECT DISTINCT a.nome, a.centro into @nome, @Centro
    FROM acquisto a inner join integratore i on i.IdIntegratore = a.IdIntegratore
	WHERE a.IdIntegratore = new.IdIntegratore;

-- conto integratori in magazzino
	SELECT count(*) INTO @nPresenti
    FROM giacenza g
    where g.IdIntegratore = new.IdIntegratore
		AND g.Centro = @Centro;
        
	IF @nPresenti = 0 THEN
			
            SELECT count(*) INTO @nOrdinati
			FROM ordine o inner join integratore i on i.IdIntegratore = o.IdIntegratore
			where o.IdIntegratore = new.IdIntegratore
				AND o.stato = "incompleto";
            
            IF @nOrdinati = 0 THEN -- allora ordino
            
				SELECT f.Nome INTO @Fornitore
                FROM fornitore f inner join commercializzati c on f.nome=c.nome
					inner join integratore i on i.IdIntegratore = c.IdIntegratore
				where i.IdIntegratore = new.IdIntegratore
					AND c.prezzo = (select MIN(c1.prezzo)
									from commercializzati c1 inner join integratore i1
										on i1.IdIntegratore = c1.IdIntegratore
									where c1.IdIntegratore = new.IdIntegratore);
                                    
				SELECT o.IdOrdine INTO @Ordine
				FROM ordine o
                WHERE o.stato = "incompleto";
                
				INSERT INTO Ordine
				VALUES (@Ordine, new.IdIntegratore, @Nome, "incompleto", 30, @Centro, NULL, @Centro);
				
						SIGNAL SQLSTATE '45000' 
						SET MESSAGE_TEXT = "L'integratore non era presente in magazzino. È stato ordinato. ";								
            END IF;
    END IF;
END$$ 

DELIMITER ;





