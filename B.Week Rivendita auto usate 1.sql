-- CODICE PER GENERARE IL DB SECONDAUTO_G1, LE QUERY SONO MESSE IN ORDINE DI LANCIO PER EVITARE ERRORI NELLA COSTRUZIONE DEL DB.

CREATE SCHEMA SECONDAUTO_G1;
USE SECONDAUTO_G1;

CREATE TABLE CONCESSIONARIA (
    ID_CONCESSIONARIA INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    CITTA VARCHAR(20) NOT NULL,
    REGIONE VARCHAR(20) NOT NULL,
    INDIRIZZO VARCHAR(150) NOT NULL,
    TELEFONO VARCHAR(20) NOT NULL,
    RESPONSABILE VARCHAR(100) NOT NULL
);

CREATE TABLE AUTO (
    Targa VARCHAR(7) NOT NULL UNIQUE PRIMARY KEY,
    Marca VARCHAR(50) NOT NULL,
    Colore VARCHAR(20) NOT NULL,
    Cilindrata INT NOT NULL,
    Tipo_Cambio VARCHAR(15) NOT NULL,
    Prezzo DOUBLE NOT NULL,
    ID_Concessionaria INT NOT NULL,
    foreign key (ID_Concessionaria) references CONCESSIONARIA(ID_CONCESSIONARIA)
);


CREATE TABLE PROPRIETARIO (
    ID_Proprietario INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Targa VARCHAR(7) NOT NULL,
    Nominativo VARCHAR(100) NOT NULL,
    Citta_Residenza VARCHAR(20) NOT NULL,
    Anno_Acquisto YEAR NOT NULL,
    Anno_Vendita YEAR,
    foreign key (TARGA) REFERENCES AUTO(TARGA)
);


INSERT INTO CONCESSIONARIA (Citta, Regione, Indirizzo, Telefono, Responsabile)
        VALUES
        ('Roma', 'Lazio', 'Via Roma 1', '+39 06 1234567', 'Giacomo De Luca'),
        ('Milano', 'Lombardia',' Via Milano 2', '+39 02 2345678', 'Chiara Mercuri'),
        ('Napoli', 'Campania','Via Napoli 3', '+39 081 3456789', 'Lorenzo Colombo'),
        ('Torino', 'Piemonte','Via Torino 4', '+39 011 4567890', 'Elena Perego'),
        ('Palermo', 'Sicilia','Via Palermo 5', '+39 091 5678901', 'Fabrizio Franceschini');

 INSERT INTO AUTO (Marca, Targa, Colore, Cilindrata, Tipo_Cambio, Prezzo, ID_CONCESSIONARIA) 
VALUES
        ('Mercedes', 'AB123CD', 'Nero', 1600, 'Automatico', 25000, 1),
        ('Ford', 'EF456GH', 'Bianco', 2000, 'Manuale', 22000, 2),
        ('Ford', 'IJ789KL', 'Blu', 2500, 'Automatico', 35000, 3),
        ('Audi', 'MN012OP', 'Grigio', 1800, 'Manuale', 30000, 4),
        ('Mercedes', 'QR345ST', 'Argento', 2200, 'Automatico', 40000, 5),
        ('Fiat', 'UV678WX', 'Rosso', 1900, 'Manuale', 28000, 1),
        ('Fiat', 'YZ901AB', 'Verde', 1400, 'Manuale', 18000, 2),
        ('Ford', 'CD234EF', 'Nero', 1600, 'Automatico', 23000, 3),
        ('Audi', 'GH567IJ', 'Grigio', 1700, 'Manuale', 20000, 4),
        ('Fiat', 'KL890MN', 'Bianco', 1800, 'Automatico', 27000, 5),
        ('Audi', 'AB234CD', 'Blu', 2100, 'Manuale', 24000, 1),
        ('Mercedes', 'EF567GH', 'Argento', 2300, 'Automatico', 32000, 2 ),
        ('Mercedes', 'IJ890KL', 'Rosso', 2000, 'Manuale', 26000, 3),
        ('Ford', 'MN123OP', 'Verde', 1500, 'Automatico', 29000, 4),
        ('Fiat', 'QR456ST', 'Nero', 1700, 'Manuale', 21000, 5),
        ('Ford', 'UV789WX', 'Grigio', 1900, 'Automatico', 33000, 1),
        ('Audi', 'YZ012AB', 'Bianco', 2200, 'Manuale', 25000, 2),
        ('Fiat', 'CD345EF', 'Blu', 2400, 'Automatico', 38000, 3),
        ('Mercedes', 'GH678IJ', 'Argento', 2600, 'Manuale', 23000, 4),
        ('Audi', 'KL901MN', 'Rosso', 2100, 'Automatico', 31000, 2);
 

        INSERT INTO PROPRIETARIO (Targa, Nominativo, Citta_Residenza, Anno_Acquisto, Anno_Vendita)
        VALUES
        ('AB123CD', 'Marco Rossi', 'Roma', 2018, 2021),
        ('AB123CD', 'Daniele Bianchi', 'Roma', 2021, 2022),
        ('AB123CD', 'Cristian Bergamo', 'Roma', 2022, 2023),
        ('AB123CD', 'Salvatore Ricci', 'Roma', 2023, 2024),
        ('EF456GH', 'Laura Bianchi', 'Milano', 2019, 2023),
        ('IJ789KL', 'Luca Verdi', 'Napoli', 2020, 2024),
        ('MN012OP', 'Anna Russo', 'Torino', 2015, 2022),
        ('QR345ST', 'Simone Esposito', 'Palermo', 2021, NULL),
        ('UV678WX', 'Giulia Romano', 'Bologna', 2019, 2023),
        ('YZ901AB', 'Paolo Fiore', 'Firenze', 2020, 2024),
        ('CD234EF', 'Martina Vitale', 'Bari', 2018, 2022),
        ('GH567IJ', 'Giorgio Conti', 'Catania', 2021, NULL),
        ('KL890MN', 'Sara Marchetti', 'Genova', 2017, 2022),
        ('AB234CD', 'Luigi Ferrari', 'Roma', 2019, 2023),
        ('EF567GH', 'Alessia Russo', 'Milano', 2020, 2024),
        ('IJ890KL', 'Giovanni Verdi', 'Napoli', 2018, 2022),
        ('MN123OP', 'Francesca Esposito', 'Torino', 2019, 2023),
        ('QR456ST', 'Lorenzo Romano', 'Palermo', 2015, 2022),
        ('UV789WX', 'Elena Bianchi', 'Bologna', 2020, 2024),
        ('YZ012AB', 'Fabio Fiore', 'Firenze', 2018, 2022),
        ('CD345EF', 'Silvia Vitale', 'Bari', 2015, 2025),
        ('GH678IJ', 'Roberto Conti', 'Catania', 2017, 2022),
        ('KL901MN', 'Chiara Marchetti', 'Milano', 2020, 2024);
        
        
