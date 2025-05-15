# Exam 3: SQL DQL - Customer and Order Data Analysis

## Task Description (General Overview)

This exam required writing SQL queries to extract information from a database with `Kunden` (Customers), `Bestellungen` (Orders), and `Produkte` (Products) tables. Tasks included filtering, sorting, joining tables, using aggregate functions, and subqueries for data analysis.

## SQL Solution (`data_analysis_queries.sql`)

The `data_analysis_queries.sql` file contains five SQL queries to address the specific tasks:

1.  **Query a):** Selects products priced between 50 and 150 Euros, ordered by category and price.
    ```sql
    SELECT *
    FROM Produkte
    WHERE Preis BETWEEN 50 AND 150
    ORDER BY Kategorie, Preis ASC;
    ```
2.  **Query b):** Finds customers with names starting "Sch" in Berlin or Munich.
    ```sql
    SELECT Kunden_ID, Wohnort
    FROM Kunden
    WHERE Name LIKE 'Sch%'
      AND Wohnort IN ('Berlin', 'München');
    ```
3.  **Query c):** Calculates the average number of orders per customer for each category, for customers with at least three orders.
    ```sql
    -- Calculates average orders per customer per category (for customers with >=3 orders in that category context)
    SELECT p.Kategorie,
           AVG(bestellungen_pro_kunde.anzahl) AS durchschnittliche_bestellungen
    FROM Produkte p
    JOIN (
        SELECT b.Kunden_ID, prod.Kategorie, COUNT(DISTINCT b.Bestell_ID) AS anzahl
        FROM Bestellungen b
        JOIN Produkte prod ON b.Produkt_ID = prod.Produkt_ID -- Assumes Produkt_ID in Bestellungen
        GROUP BY b.Kunden_ID, prod.Kategorie
        HAVING COUNT(DISTINCT b.Bestell_ID) >= 3
    ) AS bestellungen_pro_kunde ON p.Kategorie = bestellungen_pro_kunde.Kategorie
    GROUP BY p.Kategorie;
    ```
4.  **Query d):** Identifies products that have never been ordered using `NOT EXISTS`.
    ```sql
    SELECT p.Produkt_ID, p.Bezeichnung
    FROM Produkte p
    WHERE NOT EXISTS (
        SELECT 1
        FROM Bestellungen b
        WHERE b.Produkt_ID = p.Produkt_ID -- Assumes Produkt_ID in Bestellungen
    );
    ```
5.  **Query e):** Finds customers whose total order amount exceeds 1000 Euros.
    ```sql
    SELECT k.Kunden_ID, k.Name,
           SUM(b.Gesamtbetrag) AS gesamtbestellwert
    FROM Kunden k
    JOIN Bestellungen b ON k.Kunden_ID = b.Kunden_ID
    GROUP BY k.Kunden_ID, k.Name
    HAVING SUM(b.Gesamtbetrag) > 1000
    ORDER BY gesamtbestellwert DESC;
    ```

## Key SQL DQL Concepts Demonstrated:

*   Filtering data (`WHERE` clause with `BETWEEN`, `LIKE`, `IN`).
*   Sorting results (`ORDER BY`).
*   Joining tables (`JOIN`).
*   Aggregate functions (`AVG`, `COUNT`, `SUM`) with `GROUP BY` and `HAVING`.
*   Subqueries and `EXISTS` / `NOT EXISTS` predicate.
*   Table and column aliases.
