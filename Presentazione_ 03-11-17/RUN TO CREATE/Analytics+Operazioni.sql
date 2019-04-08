DROP PROCEDURE IF EXISTS ReportFasceOrarie;

DELIMITER $$

CREATE PROCEDURE ReportFasceOrarie()
BEGIN

	SELECT B.IdCentro, B.IdOrario, B.OraInizio, B.OraInizio, B.AccessiFascia
    FROM (
		SELECT co.IdCentro, count(*)/100 as 2Percent
		FROM contratto co INNER JOIN centro ce on ce.IdCentro = co.IdCentro
		where DATEDIFF(CURRENT_DATE, DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH)) > 0
		group by co.IdCentro
	) as A
    INNER JOIN 
    (
    SELECT o.*, count(*) AS AccessiFascia
    FROM orario o inner join centro ce on ce.IdCentro = o.IdCentro 
	inner join accessi a on ce.IdCentro = a.IdCentro 
    where timestampdiff(DAY,CURRENT_TIMESTAMP, a.TimestampAccesso) <= 365 
    GROUP BY o.IdOrario
    ) as B
		ON A.IdCentro = B.IdCentro
    WHERE AccessiFascia < 2Percent;

END $$
DELIMITER ;







DROP PROCEDURE IF EXISTS ReportDimensionamento;

DELIMITER $$

CREATE PROCEDURE ReportDimensionamento(IN _Centro INT(11))
BEGIN
-- conteggio iscritti a _Centro
	SELECT count(*) INTO @nIscritti
    FROM contratto co INNER JOIN centro ce on ce.IdCentro = co.IdCentro
 	where DATEDIFF(CURRENT_DATE, DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH)) > 0
		and co.IdCentro = 1
	group by co.IdCentro;
    
    
    SELECT (((SUM(e.TempoEsecuzione) *SUM(e.Conteggio)) + (SUM(e.TempoRecupero)*SUM(e.Ripetizioni)))
							- ((SUM(ee.TempoEsecuzione) *SUM(ec.Conteggio)) + (SUM(ee.TempoRecupero)*SUM(e.Ripetizioni))))/@nIscritti into @Ritardo
    FROM esercizio e inner join esercizioeffettivo ee on e.IdEsercizio=ee.IdEsercizio 
		inner join conteggio ec on ee.IdEsercizioEffettivo=ec.IdEsercizioEffettivo
		inner join apparecchiature a on a.IdApparecchiatura=ee.IdApparecchiatura
        inner join sala s on s.IdSala=a.IdSala
		WHERE s.IdCentro = _Centro
			AND DATEDIFF(CURRENT_DATE, ee.Data) <= 365;
        
        IF @Ritardo < 600 THEN		
			SELECT @Ritardo as RitardoAnnuale, "Centro fitness SOTTODIMENSIONATO" as Responso;
            
		ELSE
			select @Ritardo as RitardoAnnuale, "Centro fitness ADEGUATO" as Responso;
        
        END IF;

END $$
DELIMITER ;


 


DROP PROCEDURE IF EXISTS ReportCorsi;

DELIMITER $$

CREATE PROCEDURE ReportCorsi()
BEGIN


SELECT co1.Disciplina, s.IdCentro, 100* (SUM(F.Iscritti) / SUM(co1.MaxIscrizioni)) as PercentualeIscritti
FROM corso co1 inner join (SELECT co.IdCorso, count(*) AS Iscritti
							FROM corso co inner join iscrizioni i on i.IdCorso = co.IdCorso
							GROUP BY co.IdCorso) 
	as F on F.IdCorso=co1.IdCorso 
    inner join Sala s on s.IdSala=co1.IdSala
GROUP BY co1.Disciplina, s.IdCentro;


END $$
DELIMITER ;




DROP FUNCTION IF EXISTS PunteggioRicreativo;

DELIMITER $$

CREATE FUNCTION PunteggioRicreativo(_Cliente VARCHAR (45))
RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE PUNTEGGIO INT(11) DEFAULT 0;
		SET PUNTEGGIO = 
           100 - (10* (PunteggioDimagrimento(_Cliente) + PunteggioMuscolo(_Cliente) +
	(
       ( 
        SELECT sc0.Peso
         from statistichecliente sc0
         where sc0.CodFiscale=_Cliente
			AND year(sc0.data) = year(DATE_SUB(current_date, INTERVAL 1 MONTH))
			AND month(sc0.data) = month(DATE_SUB(current_date, INTERVAL 1 MONTH))
		)
        -
        (SELECT sc3.Peso
         from statistichecliente sc3
         where sc3.CodFiscale=_Cliente
			AND year(sc3.data) = year(current_date)
			AND month(s3.data) = month(current_date)
        )
      )
	)
)
;     
     
     RETURN(PUNTEGGIO);
        
        
END $$

DELIMITER ;



DROP FUNCTION IF EXISTS PunteggioDimagrimento;

DELIMITER $$

CREATE FUNCTION PunteggioDimagrimento(_Cliente VARCHAR (45))
RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE PUNTEGGIO INT(11) DEFAULT 0;
		SET PUNTEGGIO = 
           50 + (10*
       
       ( 
      (  SELECT sc1.MassaGrassa
         from statistichecliente sc1
         where sc1.CodFiscale=_Cliente
			AND year(sc1.data) = year(DATE_SUB(current_date, INTERVAL 1 MONTH))
			AND month(sc1.data) = month(DATE_SUB(current_date, INTERVAL 1 MONTH))
		)
			+
            
       ( 
        SELECT sc0.Peso
         from statistichecliente sc0
         where sc0.CodFiscale=_Cliente
			AND year(sc0.data) = year(DATE_SUB(current_date, INTERVAL 1 MONTH))
			AND month(sc0.data) = month(DATE_SUB(current_date, INTERVAL 1 MONTH))
		
      )
      -
         
		(
        SELECT sc2.MassaGrassa
         from statistichecliente sc2
         where sc2.CodFiscale=_Cliente
			AND year(sc2.data) = year(current_date)
			AND month(sc2.data) = month(current_date)
		)
			+
		
        (SELECT sc3.Peso
         from statistichecliente sc3
         where sc3.CodFiscale=_Cliente
			AND year(sc3.data) = year(current_date)
			AND month(sc3.data) = month(current_date)
        )
        )
        )
     ;
     
     RETURN(PUNTEGGIO);
        
        
END $$

DELIMITER ;





DROP FUNCTION IF EXISTS PunteggioMuscolo;

DELIMITER $$

CREATE FUNCTION PunteggioMuscolo(_Cliente VARCHAR (45))
RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE PUNTEGGIO INT(11) DEFAULT 0;
		SET PUNTEGGIO = 
           50 + (10*
       
       ( 
      (  SELECT sc1.MassaMagra
         from statistichecliente sc1
         where sc1.CodFiscale=_Cliente
			AND year(sc1.data) = year(DATE_SUB(current_date, INTERVAL 1 MONTH))
			AND month(sc1.data) = month(DATE_SUB(current_date, INTERVAL 1 MONTH))
		)
			+
            
       ( 
        SELECT sc0.Peso
         from statistichecliente sc0
         where sc0.CodFiscale=_Cliente
			AND year(sc0.data) = year(DATE_SUB(current_date, INTERVAL 1 MONTH))
			AND month(sc0.data) = month(DATE_SUB(current_date, INTERVAL 1 MONTH))
		
      )
      -
         
		(
        SELECT sc2.MassaMagra
         from statistichecliente sc2
         where sc2.CodFiscale=_Cliente
			AND year(sc2.data) = year(current_date)
			AND month(sc2.data) = month(current_date)
		)
			+
		
        (SELECT sc3.Peso
         from statistichecliente sc3
         where sc3.CodFiscale=_Cliente
			AND year(sc3.data) = year(current_date)
			AND month(s3.data) = month(current_date)
        )
        )
        )
     ;
     
     RETURN(PUNTEGGIO);
        
        
END $$

DELIMITER ;



DROP EVENT IF EXISTS ScorePerformance;

DELIMITER $$

CREATE EVENT ScorePerformance
ON SCHEDULE EVERY 1 MONTH
STARTS "2017-11-01"
DO
BEGIN

	
    INSERT INTO Score
		SELECT year(CURRENT_DATE), MONTH(CURRENT_DATE), cl.CodFiscale, PunteggioDimagrimento(cl.CodFiscale)
        FROM cliente cl inner join statistichecliente sc
			on cl.CodFiscale=sc.CodFiscale
		where cl.Scopo = "Dimagrimento";
        
    INSERT INTO Score
		SELECT year(CURRENT_DATE), MONTH(CURRENT_DATE), cl.CodFiscale, PunteggioMuscolo(cl.CodFiscale)
        FROM cliente cl inner join statistichecliente sc
			on cl.CodFiscale=sc.CodFiscale
		where cl.Scopo = "Potenziamento Muscolare";

    INSERT INTO Score
		SELECT year(CURRENT_DATE), MONTH(CURRENT_DATE), cl.CodFiscale, PunteggioRicreativo(cl.CodFiscale)
        FROM cliente cl inner join statistichecliente sc
			on cl.CodFiscale=sc.CodFiscale
		where cl.Scopo = "Ricreativo";
        
END $$
DELIMITER ;




DROP PROCEDURE IF EXISTS Promozioni;

DELIMITER $$

CREATE PROCEDURE Promozioni(IN _Centro INT(11))
BEGIN

	SELECT g.IdGiacenza, g.IdIntegratore, g.DataScadenza, (c.Prezzo / o.Quantita) AS PrezzoOfferta
	FROM giacenza g inner join integratore i on i.IdIntegratore=g.IdIntegratore
		inner join ordine o on g.IdOrdine=o.IdOrdine
		inner join fornitore f on f.NomeFornitore = o.NomeFornitore
		inner join commercializzati c on c.IdIntegratore=i.IdIntegratore
    WHERE 	g.IdCentro=_Centro AND 
	(
		DATEDIFF(g.DataScadenza, CURRENT_DATE) BETWEEN 0 AND 31
		OR DATEDIFF(DATE_ADD(o.DataConsegna, INTERVAL f.GiorniPagamento DAY), CURRENT_DATE) BETWEEN 0 AND 31
    );

END $$

DELIMITER ;




DROP PROCEDURE IF EXISTS ReportScadenzaIntegratori;

DELIMITER $$

CREATE PROCEDURE ReportScadenzaIntegratori()
BEGIN
	SELECT g.*, DATEDIFF(g.DataScadenza, CURRENT_DATE) AS GiorniMancanti
	FROM giacenza g
    WHERE DATEDIFF(g.DataScadenza, CURRENT_DATE) BETWEEN 0 AND 62;

END $$

DELIMITER ;




DROP PROCEDURE IF EXISTS nVendite;

DELIMITER $$

CREATE PROCEDURE nVendite()
BEGIN

	SELECT a.IdIntegratore, COUNT(*) AS nVenditeMensili
	FROM acquisto a
    WHERE DATEDIFF(CURRENT_DATE, a.Data) < 32
	GROUP BY a.IdIntegratore;

END $$

DELIMITER ;









-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--   OPERAZIONI

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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


-- 4 TROVA CORSO
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

-- 3 Percentuale diffusione tipologie contratto tra quelli in corso di validita
/*
Per ogni tipologia di contratto restituisce la percentuale che copre dei contratti attualmente validi.
*/

DROP PROCEDURE IF EXISTS PercentualeContratto;

DELIMITER $$
CREATE PROCEDURE PercentualeContratto()
BEGIN

	SELECT count(*) INTO @nContratti
    FROM contratto co
    where DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH) > current_date;




	SELECT tc.IdTipoContratto, tc.Nome, (100* (COUNT(*) / @nContratti)) as PercentualeIscritti 
    FROM contratto co inner join tipocontratto tc on tc.IdTipoContratto = co.tipo
    where DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH) > current_date
	GROUP BY tc.IdTipoContratto;


END $$
DELIMITER ;


-- 4 CALCOLO ACCESSI CENTRO
/*
Conteggio clienti attualmente iscritti per ogni centro fitness e numero di accessi nel mese solare precedente a quello attualmente in corso.
*/

DROP PROCEDURE IF EXISTS AnalisiFlussiClienti;

DELIMITER $$
CREATE PROCEDURE AnalisiFlussiClienti()
BEGIN

	SELECT co.IdCentro, count(*) as Iscritti, (SELECT count(*)
												FROM accessi a 
												where a.IdCentro = ce.IdCentro 
												AND year(a.TimestampAccesso) = year(DATE_SUB(current_date, INTERVAL 1 MONTH))
												AND month(a.TimestampAccesso) = month(DATE_SUB(current_date, INTERVAL 1 MONTH))
												) as AccessiMesePrecedente
                                                
    FROM contratto co INNER JOIN centro ce on ce.IdCentro = co.IdCentro
	where DATEDIFF(CURRENT_DATE, DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH)) > 0
	group by co.IdCentro;

END $$
DELIMITER ;


-- 5 contratti in scadenza
/*
Elencare i contratti in scadenza entro due settimane di modo tale che l'azienda possa contattare il cliente per il rinnovo. 
*/



DROP PROCEDURE IF EXISTS CheckContratti;

DELIMITER $$
CREATE PROCEDURE CheckContratti()
BEGIN

	SELECT co.IdContratto, co.CodFiscale, cl.Nome, cl.Cognome, 
		DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH) as Scadenza, tc.Nome as Suggerito

	FROM contratto co INNER JOIN cliente cl on cl.CodFiscale = co.CodFiscale
		INNER JOIN tipocontratto tc on tc.IdTipoContratto = co.Tipo
	WHERE DATEDIFF(DATE_ADD(co.DataInizio, INTERVAL co.Durata MONTH), CURRENT_DATE)
		BETWEEN 0 AND 14;

END $$
DELIMITER ;


-- ReportUsura

/*
Generazione report relativo allo stato di usura delle apparecchiature di un determinato centro fitness
*/


DROP PROCEDURE IF EXISTS ReportUsura;

DELIMITER $$
CREATE PROCEDURE ReportUsura(IN _Centro INT(11))
BEGIN

select c.IdCentro, s.IdSala, a.IdApparecchiatura, a.LivelloUsura
from centro c inner join sala s on s.IdCentro = c.IdCentro
	inner join apparecchiature a on a.IdSala = s.IdSala
where a.LivelloUsura > 80
		AND c.IdCentro = _Centro
ORDER BY a.LivelloUsura;

END $$
DELIMITER ;

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


-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  TRIGGER GENERICI

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




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



















