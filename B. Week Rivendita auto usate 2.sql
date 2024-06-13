       -- 1. Marca e Colore delle Auto di che costano più di 10.000 €
SELECT 
    marca, colore
FROM
    auto
WHERE
    prezzo > 10000;
    
-- 2. Tutti i proprietari di un’auto di colore ROSSO
SELECT 
    p.nominativo, a.marca, a.colore
FROM
    proprietario AS p
        JOIN
    auto AS a ON p.targa = a.targa
WHERE
    a.colore = 'rosso';
    
-- 3. Costo totale di tutte le auto con Cilindrata superiore a 1600lo c14
SELECT 
    SUM(prezzo) as costo_auto_cilindrata_maggiore_millesecento
FROM
    auto
WHERE
    cilindrata > 1600;
    
-- 4. Targa e Nome del proprietario delle Auto in una concessionaria della Città di Roma
SELECT 
    p.nominativo, p.targa
FROM
    proprietario p
        JOIN
    auto a ON p.Targa = a.Targa
        JOIN
    concessionaria c ON a.ID_Concessionaria = c.ID_Concessionaria
WHERE
    c.CITTA = 'Roma';
    
-- 5. Per ogni Concessionaria, il numero di Auto
SELECT 
    c.citta, COUNT(a.targa) AS n_macchine
FROM
    concessionaria AS c
        LEFT JOIN
    auto AS a ON c.id_concessionaria = a.id_concessionaria
GROUP BY c.citta;

-- 6. Il Responsabile di Concessionaria di tutte le auto con Cambio Automatico e Anno Acquisto 2019
SELECT 
    c.responsabile, a.Marca, a.Tipo_Cambio, p.anno_acquisto
FROM
    concessionaria AS c
        JOIN
    auto AS a ON c.ID_CONCESSIONARIA = a.ID_Concessionaria
        JOIN
    proprietario AS p ON a.targa = p.targa
WHERE
    a.Tipo_Cambio = 'automatico'
        AND p.anno_acquisto = '2019'; 
	

        
        
-- 1. Per ciascuna TARGA il colore, il prezzo e la città in cui si trova il veicolo 
SELECT 
    A.TARGA, A.COLORE, A.PREZZO, C.CITTA
FROM
    AUTO A
        JOIN
    CONCESSIONARIA C ON A.ID_CONCESSIONARIA = C.ID_CONCESSIONARIA;

-- 2. Le auto con almeno tre Proprietari 
SELECT 
    A.TARGA, COUNT(P.ID_PROPRIETARIO) N_PROPRIETARI
FROM
    AUTO A
        JOIN
    PROPRIETARIO P ON A.TARGA = P.TARGA
GROUP BY A.TARGA
HAVING N_PROPRIETARI >= 3;

-- 3. La targa delle auto vendute nel 2015 
SELECT 
    A.TARGA
FROM
    AUTO A
        JOIN
    PROPRIETARIO P ON A.TARGA = P.TARGA
WHERE
    P.ANNO_ACQUISTO = '2015';

-- 4. La regione con più auto (trovare un modo per associare la Regione) 
-- Vista delle regioni con più auto
CREATE VIEW NUMERO_AUTO_X_REGIONE AS
    SELECT 
        C.REGIONE, COUNT(A.TARGA) AS N_AUTO
    FROM
        AUTO A
            JOIN
        CONCESSIONARIA C ON A.ID_CONCESSIONARIA = C.ID_CONCESSIONARIA
    GROUP BY C.REGIONE;
 -- Le regioni con il valore maggiore di auto
SELECT 
    REGIONE
FROM
    NUMERO_AUTO_X_REGIONE
WHERE
    N_AUTO = (SELECT 
            MAX(N_AUTO)
        FROM
            NUMERO_AUTO_X_REGIONE);

-- 5. La Targa delle auto che si trovano a Milano, con cambio automatico, colore rosso, di proprietari residenti a Milano 
SELECT 
    A.TARGA, C.CITTA, A.TIPO_CAMBIO, A.COLORE, P.CITTA_RESIDENZA
FROM
    AUTO A
        JOIN
    PROPRIETARIO P ON A.TARGA = P.TARGA
        JOIN
    CONCESSIONARIA C ON A.ID_CONCESSIONARIA = C.ID_CONCESSIONARIA
WHERE
    UPPER(P.CITTA_RESIDENZA) = 'MILANO'
        AND UPPER(C.CITTA) = 'MILANO'
        AND A.TIPO_CAMBIO = 'AUTOMATICO'
        AND A.COLORE = 'Rosso';
        
-- 1. Gestione fatturato per Concessionaria 
SELECT 
    C.ID_CONCESSIONARIA,
    (P.ANNO_ACQUISTO) AS ANNO_VENDITA,
    SUM(A.PREZZO) AS FATTURATO
FROM
    AUTO A
        JOIN
    CONCESSIONARIA C ON A.ID_CONCESSIONARIA = C.ID_CONCESSIONARIA
        JOIN
    PROPRIETARIO P ON A.TARGA = P.TARGA
GROUP BY C.ID_CONCESSIONARIA , P.ANNO_ACQUISTO
ORDER BY C.ID_CONCESSIONARIA , P.ANNO_ACQUISTO;

-- 2. Gestione Clienti per Concessionaria
SELECT DISTINCT
    C.ID_CONCESSIONARIA, P.NOMINATIVO
FROM
    PROPRIETARIO P
        JOIN
    AUTO A ON P.TARGA = A.TARGA
        JOIN
    CONCESSIONARIA C ON A.ID_CONCESSIONARIA = C.ID_CONCESSIONARIA;


