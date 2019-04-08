-- 7 VALUTAZIONI


/*
Dopo l’inserimento di una valutazione viene aggiornata la credibilità dell’utente che ha risposto ad una domanda, effettuando una media matematica tra la somma dei voti e il numero di valutazioni ricevute. 
Dopo l'inserimento di una valutazione di una risposta, viene aggiornata la c
*/
DROP TRIGGER IF EXISTS CalcoloCredibilita; 
DELIMITER $$ 
CREATE TRIGGER CalcoloCredibilita
AFTER INSERT ON Valutazione FOR EACH ROW 
BEGIN 
 
	SELECT DISTINCT R.Username INTO @nome 
	FROM Risposta R   
	WHERE R.IdRisposta=NEW.IdRisposta; 
 
	SELECT SUM(V.Voto) INTO @sommaVoti 
	FROM Valutazione V inner join Risposta R  
		on R.IdRisposta=V.IdRisposta 
	WHERE R.Username= @nome;                    
    
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

