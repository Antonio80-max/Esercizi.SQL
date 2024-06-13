create schema Toysgroup_Antonio_Barbone;

-- creazione tabella prodotto
-- CREATE TABLE prodotto (
    -- Id_Prodotto INT PRIMARY KEY NOT NULL,
    -- Prezzo_unità DOUBLE,
    -- Marca VARCHAR(50),
    -- Nome_Prodotto VARCHAR(50)
-- );
-- cancellarazione tabella prodotto
drop table prodotto;

-- creazione tabella prodotto
create table prodotto (
Id_prodotto int primary key not null,
nome_prodotto varchar(50),
categoria_prodotto varchar(50),
prezzo_prodotto double
);

-- Creazione tabella vendite
CREATE TABLE vendite (
    id_vendite INT PRIMARY KEY NOT NULL,
    id_prodotto INT,
    id_stato INT,
    data_ordine VARCHAR(50),
    tot_vendite DOUBLE,
    quantità_venduta DOUBLE
);

-- cancellazione tabella vendite
drop table vendite;

-- creazione tabella vendita
create table vendita
(
id_vendita int primary key not null,
data_vendita date,
id_stato int,
id_prodotto int,
prezzo_prodotto double,
quantità_prodotto integer,
totale double
);

-- creazione tabella stato
-- CREATE TABLE stato (
   -- Id_stato INT PRIMARY KEY NOT NULL,
    -- indirizzo VARCHAR(50),
    -- Nome_stato VARCHAR(50)
-- );

-- cancellazione tabella stato
drop table stato;

-- creazione tabella stato
create table stato
(
Id_stato int primary key not null,
Nome_stato varchar (50)
);
select * from prodotto;

-- Popolamento tabella prodotto
insert into prodotto(id_prodotto,nome_prodotto,categoria_prodotto,prezzo_prodotto)values (1,"BATMAN","Collezione",60.00);
insert into prodotto(id_prodotto,nome_prodotto,categoria_prodotto,prezzo_prodotto)values(2,"QUEEN","Musica",30.00);
insert into prodotto(id_prodotto,nome_prodotto,categoria_prodotto,prezzo_prodotto)values(3,"SPIDERMAN","Collezione",60.00);
insert into prodotto(id_prodotto,nome_prodotto,categoria_prodotto,prezzo_prodotto)values(4,"LAVAGNA SCRIVI E DISGNA","Gioco da tavolo",45.00);
insert into prodotto(id_prodotto,nome_prodotto,categoria_prodotto,prezzo_prodotto)values(5,"GOKU","Collezione",60.00);
insert into prodotto(id_prodotto,nome_prodotto,categoria_prodotto,prezzo_prodotto)values(6,"PUZZLE CARS","Gioco da tavolo",50.00);
insert into prodotto(id_prodotto,nome_prodotto,categoria_prodotto,prezzo_prodotto)values(7,"JOKER","collezione",60.00);
insert into prodotto(id_prodotto,nome_prodotto,categoria_prodotto,prezzo_prodotto)values(8,"Innuendo","musica",35.00);
insert into prodotto(id_prodotto,nome_prodotto,categoria_prodotto,prezzo_prodotto)values(9,"Assassin's Creed II","videogiochi",50.00);
insert into prodotto(id_prodotto,nome_prodotto,categoria_prodotto,prezzo_prodotto)values(10,"Mada in Japan","Musica",20.00);

-- Popolamento tabella vendita
insert into vendita(id_vendita,data_vendita,Id_stato,Id_prodotto,prezzo_prodotto,quantità_prodotto,totale)values (1,"2024-01-02",1,1,60.00,1250,75000);
insert into vendita(id_vendita,data_vendita,Id_stato,Id_prodotto,prezzo_prodotto,quantità_prodotto,totale)values(2,"2024-01-26",2,2,30.00,500,1500);
insert into vendita(id_vendita,data_vendita,Id_stato,Id_prodotto,prezzo_prodotto,quantità_prodotto,totale)values (3,"2023-09-25",3,3,60.00,1250,75000);
insert into vendita(id_vendita,data_vendita,Id_stato,Id_prodotto,prezzo_prodotto,quantità_prodotto,totale)values (4,"2022-06-25",1,4,45.00,550,24750);
insert into vendita(id_vendita,data_vendita,Id_stato,Id_prodotto,prezzo_prodotto,quantità_prodotto,totale)values (5,"2023-01-01",2,5,60.00,100,6000);
insert into vendita(id_vendita,data_vendita,Id_stato,Id_prodotto,prezzo_prodotto,quantità_prodotto,totale)values (6,"2022-01-01",3,6,50.00,50,2500);
insert into vendita(id_vendita,data_vendita,Id_stato,Id_prodotto,prezzo_prodotto,quantità_prodotto,totale)values(7,"2023-02-28",1,7,60.00,100,6000);
insert into vendita(id_vendita,data_vendita,Id_stato,Id_prodotto,prezzo_prodotto,quantità_prodotto,totale)values(8,"2022-02-04",2,8,35.00,100,3500);
insert into vendita(id_vendita,data_vendita,Id_stato,Id_prodotto,prezzo_prodotto,quantità_prodotto,totale)values(9,"2024-02-20",3,9,50.00,50,2500);
insert into vendita(id_vendita,data_vendita,Id_stato,Id_prodotto,prezzo_prodotto,quantità_prodotto,totale)values(10,"2023-08-20",1,10,20.00,100,2000);


insert into stato (id_stato,nome_stato) values (1,"Italia");
insert into stato (id_stato,nome_stato) values  (2,"Germania");
insert into stato (id_stato,nome_stato) values (3,"Francia");
select * from stato;

-- Es. 1 verificare che i campi definiti come PK siano univoci
show columns from prodotto;
show columns from vendita;
show columns from stato;

-- Es. 2 Esporre l'elenco dei soli prodotti venduti e per ognino di questi il fatturato totale per anno
SELECT 
    nome_prodotto,
    SUM(totale),
    YEAR(data_vendita) AS vendita_anno
FROM
    vendita
        JOIN
    prodotto ON vendita.id_prodotto = prodotto.id_prodotto
GROUP BY Nome_Prodotto, vendita_anno;


-- Es. 3 Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente
SELECT 
    YEAR(data_vendita) AS anno,
    id_stato,
    SUM(totale) AS fatturato_totale
FROM
    vendita
GROUP BY anno, id_stato
ORDER BY anno asc, fatturato_totale DESC;


-- Es. 4 Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?
select categoria_prodotto, sum(prodotto.prezzo_prodotto) as totale
from
prodotto 
join 
vendita on prodotto.Id_Prodotto=vendita.Id_Prodotto
group by categoria_prodotto
order by totale desc;

-- Es. 5 Rispondere alla seguente domanda: quali sono, se ci sono i prodotto invenduti? Proponi due approcci risolutivi differenti
SELECT 
    *
FROM
    prodotto
WHERE
    prodotto.Id_Prodotto NOT IN (SELECT DISTINCT
            prodotto.Id_Prodotto
        FROM
            vendita);

SELECT 
    prodotto.*
FROM
    prodotto
        LEFT JOIN
    vendita ON prodotto.Id_Prodotto = vendita.id_prodotto
WHERE
    vendita.id_prodotto IS NULL;

-- es 6 Esporre l'elenco dei prodotti con la rispettiva ultima data di vendita (la data di vendita più recente)
SELECT 
    prodotto.Id_Prodotto,
    prodotto.Nome_Prodotto,
    MAX(vendita.data_vendita) AS ultima_data_ordine
FROM
    prodotto
        LEFT JOIN
    vendita ON prodotto.Id_Prodotto = vendita.id_prodotto
GROUP BY prodotto.Id_Prodotto , prodotto.Nome_Prodotto;
