--a) Erstelle eine Tabelle Produkte, die folgende Spalten enthält: Produkt-ID (als Primärschlüssel), Produktname, Preis und Lagerbestand. 
--Definiere geeignete Datentypen und Integritätsbedingungen, die sicherstellen, dass der Preis immer größer als 0 
--und der Lagerbestand niemals negativ ist. 
CREATE TABLE Produkte (
    ProduktID INT PRIMARY KEY,
    Produktname VARCHAR(100) NOT NULL,
    Preis DECIMAL(10, 2) CHECK (Preis > 0),
    Lagerbestand INT CHECK (Lagerbestand >= 0)
);

--b) Definiere eine Tabelle Lieferanten mit den Spalten Lieferanten-ID (als Primärschlüssel), Name, Adresse und Bewertung. 
--Die Bewertung soll zwischen 1 und 5 liegen, wobei 1 die schlechteste und 5 die beste Bewertung ist. 
CREATE TABLE Lieferanten (
    LieferantenID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Adresse VARCHAR(200),
    Bewertung INT CHECK (Bewertung BETWEEN 1 AND 5)
);

--c) Implementiere einen Trigger CheckLagerbestand, der nach jedem Einfügen oder Aktualisieren eines Produktes in der Tabelle Produkte prüft, 
--ob der Lagerbestand unter 10 Einheiten fällt. Wenn dies der Fall ist, soll eine Warnmeldung ausgegeben werden. 
CREATE TRIGGER CheckLagerbestand
AFTER INSERT OR UPDATE ON Produkte
FOR EACH ROW
BEGIN
    IF NEW.Lagerbestand < 10 THEN
        SIGNAL SQLSTATE '01000' 
        SET MESSAGE_TEXT = 'Warnung: Lagerbestand unter 10 Einheiten!';
    END IF;
END;

--d) Erstelle eine assertion namens Durchschnittspreis, die sicherstellt, dass der Durchschnittspreis aller Produkte 
--in der Tabelle Produkte nicht unter 5 Euro fällt. 
CREATE ASSERTION Durchschnittspreis
CHECK (
    (SELECT AVG(Preis) FROM Produkte) >= 5.00
);

--e) Beschreibe, wie du die Trigger und Assertions testen würdest, um sicherzustellen, dass sie korrekt funktionieren. 
--Trigger CheckLagerbestand testen:
--Testfall 1: Lagerbestand auf 5 setzen → Warnmeldung sollte erscheinen.
UPDATE Produkte SET Lagerbestand = 5 WHERE ProduktID = 1;

--Testfall 2: Lagerbestand auf 15 setzen → Keine Warnmeldung.
UPDATE Produkte SET Lagerbestand = 15 WHERE ProduktID = 1;

--Assertion Durchschnittspreis testen:
--Testfall 1: Produkt mit Preis 1 € einfügen → Fehler, wenn der Durchschnitt dadurch unter 5 € fällt.
INSERT INTO Produkte VALUES (100, 'Billigprodukt', 1.00, 50);

--Testfall 2: Produkt mit Preis 10 € einfügen → Erfolg, wenn der Durchschnitt ≥5 € bleibt.
INSERT INTO Produkte VALUES (101, 'Qualitätsprodukt', 10.00, 30);
