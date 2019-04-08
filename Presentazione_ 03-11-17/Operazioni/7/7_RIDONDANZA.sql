-- 7 VALUTAZIONI


/*
Dopo l’inserimento di una valutazione viene aggiornata la credibilità dell’utente che ha risposto ad una domanda, effettuando una media matematica tra la somma dei voti e il numero di valutazioni ricevute. 
Dopo l'inserimento di una valutazione di una risposta, viene aggiornata la c
*/
DROP TRIGGER IF EXISTS CalcoloCredibilitaRidondanza; 
DELIMITER $$ 
CREATE TRIGGER CalcoloCredibilitaRidondanza
AFTER INSERT ON Valutazione FOR EACH ROW 
BEGIN 
 
	SELECT DISTINCT R.Username, R.sommaVoti INTO @nome, @sommaVoti 
	FROM Risposta R   
	WHERE R.IdRisposta=NEW.IdRisposta; 
    
    SELECT COUNT(*) INTO @nPost
    FROM Utente u inner join Post p
		on p.Username = u.Username
	where p.Username = @Nome;
    
	UPDATE Utente
		SET Credibilita= (@nPost * @sommaVoti) / 100
	WHERE Nickname = @nome; 
 
END$$ 
DELIMITER ; 

-- 100 * nPost * sommaVoti)

