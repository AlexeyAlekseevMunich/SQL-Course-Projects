# Exam 2: SQL DDL - Library Database Schema

## Task Description (General Overview)

This exam required providing the SQL DDL (Data Definition Language) statements to define the schema for a library database. This involved creating tables for books, authors, and borrowing transactions with specific columns, data types, primary keys, foreign keys, and other constraints, including a custom domain type for genres.

## SQL Solution (`library_schema.sql`)

The `library_schema.sql` file contains the `CREATE DOMAIN` and `CREATE TABLE` statements as submitted for the exam:

```sql
CREATE DOMAIN GenreTyp AS VARCHAR(100)
CHECK (VALUE IN ('Roman', 'Krimi', 'Sachbuch', 'Biografie'))
DEFAULT 'Roman';

CREATE TABLE Buch (
    BuchID INTEGER NOT NULL,
    Titel VARCHAR(255) NOT NULL,
    AutorID INTEGER,
    Erscheinungsjahr INTEGER,
    Genre GenreTyp,
    Verfügbarkeit BOOLEAN DEFAULT true,
    PRIMARY KEY (BuchID),
    FOREIGN KEY (AutorID) REFERENCES Autor(AutorID)
);

CREATE TABLE Autor (
    AutorID INTEGER NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Land VARCHAR(100),
    PRIMARY KEY (AutorID)
);

CREATE TABLE Ausleihe (
    AusleiheID INTEGER NOT NULL,
    BuchID INTEGER,
    NutzerID INTEGER,
    Rückgabedatum DATE,
    PRIMARY KEY (AusleiheID),
    FOREIGN KEY (BuchID) REFERENCES Buch(BuchID),
    FOREIGN KEY (NutzerID) REFERENCES Nutzer(NutzerID) -- Note: Assumes Nutzer table exists or will be created.
);
