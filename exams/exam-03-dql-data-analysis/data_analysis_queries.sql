--a) Erstelle eine Anfrage, die alle Produkte anzeigt, deren Preis zwischen 50 und 150 Euro liegt, 
--und sortiere die Ergebnisse nach der Kategorie und innerhalb der Kategorie nach dem Preis in aufsteigender Reihenfolge.
SELECT *
FROM Produkte
WHERE Preis BETWEEN 50 AND 150
ORDER BY Kategorie, Preis ASC;

--b) Entwickle eine Anfrage, um alle Kunden zu ermitteln, deren Namen mit "Sch" beginnen und die in Berlin oder München wohnen. 
--Zeige ihre Kunden-ID und Wohnort an. 
SELECT Kunden_ID, Wohnort
FROM Kunden
WHERE Name LIKE 'Sch%' 
  AND Wohnort IN ('Berlin', 'München');

--c) Formuliere eine Anfrage, die für jede Kategorie die durchschnittliche Anzahl von Bestellungen pro Kunde berechnet, 
--unter der Bedingung, dass die Kunden mindestens drei Bestellungen getätigt haben. 
--Gib die Kategorie und den berechneten Durchschnittswert an. 
SELECT p.Kategorie, 
       AVG(bestellungen_pro_kunde.anzahl) AS durchschnittliche_bestellungen
FROM Produkte p
JOIN (
    SELECT b.Kunden_ID, p.Kategorie, COUNT(*) AS anzahl
    FROM Bestellungen b
    JOIN Produkte p ON b.Produkt_ID = p.Produkt_ID
    GROUP BY b.Kunden_ID, p.Kategorie
    HAVING COUNT(*) >= 3
) AS bestellungen_pro_kunde ON p.Kategorie = bestellungen_pro_kunde.Kategorie
GROUP BY p.Kategorie;

--d) Schreibe eine Anfrage, die prüft, ob es Produkte gibt, die noch nie bestellt wurden. Verwende das exists-Prädikat. 
SELECT p.Produkt_ID, p.Bezeichnung
FROM Produkte p
WHERE NOT EXISTS (
    SELECT 1
    FROM Bestellungen b
    WHERE b.Produkt_ID = p.Produkt_ID
);

--e) Erstelle eine Anfrage, die alle Kunden findet, deren Gesamtbetrag aller Bestellungen über 1000 Euro liegt. 
--Verwende Skalare Ausdrücke und Aggregatfunktionen, um den Gesamtbetrag pro Kunde zu berechnen, 
--und zeige die Kunden-ID und den Gesamtbetrag an.  
SELECT k.Kunden_ID, k.Name, 
       SUM(b.Gesamtbetrag) AS gesamtbestellwert
FROM Kunden k
JOIN Bestellungen b ON k.Kunden_ID = b.Kunden_ID
GROUP BY k.Kunden_ID, k.Name
HAVING SUM(b.Gesamtbetrag) > 1000
ORDER BY gesamtbestellwert DESC;

