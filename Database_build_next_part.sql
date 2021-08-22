ALTER TABLE klienci ADD CHECK (cena_biletu>0 AND cena_biletu<=1000); 

ALTER TABLE klienci ADD CHECK (pesel>0);

ALTER TABLE piloci ADD CHECK (imie LIKE 'A%');

ALTER TABLE miejsca ADD CHECK (miejsce_docelowe != 'Sosnowiec');

--

SELECT COUNT(*) FROM samoloty;

SELECT id_samolotu FROM samoloty WHERE hangary = 0;

SELECT nazwisko, pesel FROM klienci WHERE cena_biletu < 700 AND cena_biletu > 500;

SELECT linie_lotnicze FROM linie_lotnicze;

SELECT nazwa_zalogi as zaloga FROM zalogi WHERE linie_lotnicze = 'ryanair';

SELECT imie, nazwisko FROM klienci WHERE miejsca = 'Berlin' ORDER BY nazwisko DESC;

SELECT samoloty , count(*) as ilosc_osob_w_samolocie FROM klienci GROUP BY samoloty;

--

CREATE OR REPLACE FUNCTION dodaj_osobe(pesel1 INTEGER, 
									   imie1 TEXT, 
									   nazwisko1 TEXT, 
									   cena_biletu1 DECIMAL(7,2), 
									   miejsca1 TEXT, 
									   klasy1 TEXT, 
									   samoloty1 INTEGER) RETURNS VOID AS $$
BEGIN 
	
IF imie1 != 'Tomasz' AND nazwisko1 != 'Elsner'	THEN 
	INSERT INTO klienci (pesel, imie, nazwisko ,cena_biletu, miejsca, klasy, samoloty) VALUES 
		(pesel1, imie1, nazwisko1 ,cena_biletu1, miejsca1, klasy1, samoloty1);
ELSE RAISE EXCEPTION 'Dyrektor boi się latać samolotami!';		
END IF;		
END
$$ LANGUAGE 'plpgsql';
 
--
 
CREATE OR REPLACE FUNCTION usun_osobe(pesel1 INTEGER) RETURNS VOID AS $$
BEGIN 
	
IF (SELECT imie FROM klienci WHERE pesel = pesel1) = 'Jakub' AND (SELECT nazwisko FROM klienci WHERE pesel = pesel1) = 'Gismatullin' THEN 
			RAISE EXCEPTION 'NIGDZIE SIĘ NIE WYBIERA';
ELSE DELETE FROM klienci WHERE pesel = pesel1;
END IF;			
END
$$ LANGUAGE 'plpgsql';

--

CREATE OR REPLACE FUNCTION samolotowy_trigger() RETURNS TRIGGER AS $$
BEGIN 
	INSERT INTO ilosc_miejsc (samoloty) VALUES (NEW.id_samolotu);
	RETURN NEW;
END
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER samolotowy_trigger1 AFTER INSERT ON samoloty
	FOR EACH ROW EXECUTE PROCEDURE samolotowy_trigger();
	
--

CREATE OR REPLACE FUNCTION osobowy_trigger() RETURNS TRIGGER AS $$
BEGIN 
	IF (SELECT ilosc_miejsc FROM ilosc_miejsc WHERE NEW.samoloty = samoloty)>0 THEN
		UPDATE ilosc_miejsc SET ilosc_miejsc = ilosc_miejsc - 1 WHERE NEW.samoloty = samoloty;
		RETURN NEW;
	ELSE 
		RAISE 'W samolocie nie ma już wolnych miejsc!';
	END IF;	
END
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER osobowy_trigger1 BEFORE INSERT ON klienci
	FOR EACH ROW EXECUTE PROCEDURE osobowy_trigger();
	
CREATE OR REPLACE FUNCTION hangarowy_trigger() RETURNS TRIGGER AS $$
BEGIN 
	IF (SELECT ilosc_miejsc FROM hangary WHERE NEW.hangary = id_hangaru)>0 THEN
		UPDATE hangary SET ilosc_miejsc = ilosc_miejsc - 1 WHERE NEW.hangary = id_hangaru;
		RETURN NEW;
	ELSE 
		RAISE 'Hangar jest pelny!';
	END IF;	
END
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER hangarowy_trigger1 BEFORE INSERT ON samoloty
	FOR EACH ROW EXECUTE PROCEDURE hangarowy_trigger();	

 	