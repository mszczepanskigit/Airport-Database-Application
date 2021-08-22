--dane do miejsc--*

INSERT INTO miejsca(miejsce_docelowe) VALUES('Warszawa');
INSERT INTO miejsca(miejsce_docelowe) VALUES('Dubaj');
INSERT INTO miejsca(miejsce_docelowe) VALUES('Berlin');
INSERT INTO miejsca(miejsce_docelowe) VALUES('Madryt');
INSERT INTO miejsca(miejsce_docelowe) VALUES('Barcelona');


--dane do klasy--*

INSERT INTO klasy(klasa_samolotu) VALUES ('ekonomiczna');
INSERT INTO klasy(klasa_samolotu) VALUES ('normalna');
INSERT INTO klasy(klasa_samolotu) VALUES ('premium');

--dane do linii--*

INSERT INTO linie_lotnicze(linie_lotnicze) VALUES ('emirates');
INSERT INTO linie_lotnicze(linie_lotnicze) VALUES ('ryanair');
INSERT INTO linie_lotnicze(linie_lotnicze) VALUES ('lot');
INSERT INTO linie_lotnicze(linie_lotnicze) VALUES ('eurowings');

--dane do zalogi-- *

INSERT INTO zalogi(nazwa_zalogi, ilosc_osob, linie_lotnicze) VALUES('Piraci',6, 'emirates');
INSERT INTO zalogi(nazwa_zalogi, ilosc_osob, linie_lotnicze) VALUES('Bogacze',7, 'emirates');
INSERT INTO zalogi(nazwa_zalogi, ilosc_osob, linie_lotnicze) VALUES('Poszukiwacze',5, 'ryanair');
INSERT INTO zalogi(nazwa_zalogi, ilosc_osob, linie_lotnicze) VALUES('Zagubieni',5, 'ryanair');
INSERT INTO zalogi(nazwa_zalogi, ilosc_osob, linie_lotnicze) VALUES('PoCHMURNI',6, 'lot');
INSERT INTO zalogi(nazwa_zalogi, ilosc_osob, linie_lotnicze) VALUES('Straszni',6, 'lot');
INSERT INTO zalogi(nazwa_zalogi, ilosc_osob, linie_lotnicze) VALUES('Grozni',5, 'eurowings');
INSERT INTO zalogi(nazwa_zalogi, ilosc_osob, linie_lotnicze) VALUES('Podroznicy',6, 'eurowings');

--dane do hangaru --*

INSERT INTO hangary(nazwa_hangaru, id_hangaru, ilosc_miejsc) VALUES('dwor',0, 999);
INSERT INTO hangary(nazwa_hangaru, id_hangaru, ilosc_miejsc) VALUES('hangar1',1, 1);
INSERT INTO hangary(nazwa_hangaru, id_hangaru, ilosc_miejsc) VALUES('hangar2',2, 1);
INSERT INTO hangary(nazwa_hangaru, id_hangaru, ilosc_miejsc) VALUES('hangar3',3, 2);
INSERT INTO hangary(nazwa_hangaru, id_hangaru, ilosc_miejsc) VALUES('hangar4',4, 2);
INSERT INTO hangary(nazwa_hangaru, id_hangaru, ilosc_miejsc) VALUES('hangar5',5, 3);
INSERT INTO hangary(nazwa_hangaru, id_hangaru, ilosc_miejsc) VALUES('hangar6',6, 4);

--dane do klienta --
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Karolina','Hetnal',22112, 1100, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Karolina','Hetnal',22112, 100, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Mateusz','Szczepanski',27121, 800, '', 'Dubaj', 'premium');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Jan','Kowalski',11111, 500, '', 'Madryt', 'normalna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Maria','Kowalska',22222, 348, '', 'Barcelona', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Asia','Kania',33333, 465, '', 'Barcelona', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Basia','Kanik',44444, 105, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Ela','Duraj',55555, 998, '', 'Dubaj', 'premium');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Ola','Wiak',66666, 105, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Adam','Chrobak',77777, 334, '', 'Barcelona', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Ewa','Koc',88888, 345, '', 'Madryt', 'normalna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Kinga','Wczorajsza',99999, 700, '', 'Dubaj', 'premium');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Kalina','Romanowicz',00000, 700, '', 'Dubaj', 'premium');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Katarzyna','Mak',12121, 123, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Katarzyna','Kosa',32323, 669, '', 'Dubaj', 'premium');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Jakub','Kosa',43434, 666, '', 'Dubaj', 'premium');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Zygfryd','Kosak',54545, 444, '', 'Madryt', 'normalna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Zofia','Kosak',56565, 273, '', 'Barcelona', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Krzysztof','Duraj',67676, 103, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Barbara','Szoda',78787, 246, '', 'Berlin', 'normalna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Mikołaj','Szkoda',89898, 879, '', 'Dubaj', 'premium');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Amelia','Matlak',90909, 312, '', 'Madryt', 'normalna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Genowefa','Szczepanska',11221, 98, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Grzegorz','Hetnal',22332, 98, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Jakub','Milenium',33443, 98, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Krystyna','Gancarz',44554, 239, '', 'Barcelona', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Pawel','Gancarczyk',55665, 140, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Kordian','Jakis',66776, 459, '', 'Madryt', 'normalna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Michal','Goral',77878, 122, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Olga','Goral',89899, 211, '', 'Berlin', 'normalna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Ewelina','Wielka',90900, 122, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Samuel','Grubszy',12222, 432, '', 'Barcelona', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Franciszek','Klisza',23333, 98, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Bartosz','Fiak',43578, 98, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Kamil','Wiak',97878, 199, '', 'Barcelona', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Mariusz','Midor',65434, 150, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Marek','Cwajna',67543, 233, '', 'Madryt', 'normalna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Krzysztof','Filiks',33466, 102, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Dominik','Cwajna',98820, 69, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Jakub','Mikociak',55444, 564, '', 'Madryt', 'normalna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Kornelia','Fajna',09090, 788, '', 'Dubaj', 'premium');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Lilia','Kociak',33456, 101, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Bogusia','Habdas',12345, 298, '', 'Berlin', 'normalna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Krystian','Stasica',23456, 89, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Joachim','Jachym',34567, 196, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Aleksander','Hetnal',45678, 196, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Stefan','Banach',56789, 999, '', 'Dubaj', 'premium');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Hugo','Steinhaus',67899, 432, '', 'Barcelona', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Jadwiga','Drozd',09876, 112, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Klaudia','Bogdan',87291, 999, '', 'Dubaj', 'premium');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Piotr','Maly',98765, 145, '', 'Berlin', 'normalna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Paulina','Napieralska',76543, 67, '', 'Warszawa', 'ekonomiczna');
INSERT INTO klienci(imie, nazwisko, pesel, cena, numer_samolotu, miejsce_docelowe, klasy_samolotu) VALUES('Piotr','Maly',65443, 500, '', 'Dubaj', 'premium');


-- dane do samoloty --

INSERT INTO samoloty(id_samolotu, ilosc_miejsc, numer_pilota, klasy_samolotu, nazwa_zalogi, linie_lotnicze, miejsce_docelowe, numer_hangaru) VALUES(0, 25,'' , 'premium', 'Piraci', 'emirates', 'Dubaj',1 );
INSERT INTO samoloty(numer_samolotu, ilosc_miejsc, numer_pilota, klasy_samolotu, nazwa_zalogi, linie_lotnicze, miejsce_docelowe, numer_hangaru) VALUES(1, 30,'' , 'ekonomiczna', 'PoCHMURNI', 'lot', 'Warszawa',2 );
INSERT INTO samoloty(numer_samolotu, ilosc_miejsc, numer_pilota, klasy_samolotu, nazwa_zalogi, linie_lotnicze, miejsce_docelowe, numer_hangaru) VALUES(2, 15,'' , 'normalna', 'Grozni', 'eurowings', 'Madryt',3 );
INSERT INTO samoloty(numer_samolotu, ilosc_miejsc, numer_pilota, klasy_samolotu, nazwa_zalogi, linie_lotnicze, miejsce_docelowe, numer_hangaru) VALUES(3, 15,'' , 'ekonomiczna', '	Zagubieni', 'ryanair', 'Barcelona',4 );
INSERT INTO samoloty(numer_samolotu, ilosc_miejsc, numer_pilota, klasy_samolotu, nazwa_zalogi, linie_lotnicze, miejsce_docelowe, numer_hangaru) VALUES(4, 10,'' , 'normalna', 'Straszni', 'lot', 'Berlin',5 );
INSERT INTO samoloty(numer_samolotu, ilosc_miejsc, numer_pilota, klasy_samolotu, nazwa_zalogi, linie_lotnicze, miejsce_docelowe, numer_hangaru) VALUES(5, 25,'' , 'premium', 'Bogacze', 'emirates', 'Dubaj',6 );
INSERT INTO samoloty(numer_samolotu, ilosc_miejsc, numer_pilota, klasy_samolotu, nazwa_zalogi, linie_lotnicze, miejsce_docelowe, numer_hangaru) VALUES(6, 15,'' , 'normalna', 'Podroznicy', 'eurowings', 'Madryt',1 );
