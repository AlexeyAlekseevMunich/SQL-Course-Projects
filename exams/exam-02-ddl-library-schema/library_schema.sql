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
    FOREIGN KEY (NutzerID) REFERENCES Nutzer(NutzerID)
);
