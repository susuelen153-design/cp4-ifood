-- ============================================================
-- CP4 - Cognitive Data Science
-- Demonstração de operações DML (INSERT / UPDATE / DELETE)
-- Executar DEPOIS da carga feita pelo notebook/load_data.py
-- ============================================================

-- INSERT: novo cliente cadastrado manualmente
INSERT INTO IFOOD_CUSTOMERS (
    ID, YEAR_BIRTH, EDUCATION, MARITAL_STATUS, INCOME, KIDHOME, TEENHOME,
    DT_CUSTOMER, RECENCY, MNT_WINES, MNT_FRUITS, MNT_MEAT_PRODUCTS,
    MNT_FISH_PRODUCTS, MNT_SWEET_PRODUCTS, MNT_GOLD_PRODS,
    NUM_DEALS_PURCHASES, NUM_WEB_PURCHASES, NUM_CATALOG_PURCHASES,
    NUM_STORE_PURCHASES, NUM_WEB_VISITS_MONTH,
    ACCEPTED_CMP3, ACCEPTED_CMP4, ACCEPTED_CMP5, ACCEPTED_CMP1, ACCEPTED_CMP2,
    COMPLAIN, Z_COST_CONTACT, Z_REVENUE, RESPONSE
) VALUES (
    99999, 1990, 'Graduation', 'Married', 52000, 0, 0,
    DATE '2014-01-15', 10, 300, 20, 150,
    30, 15, 40,
    2, 4, 2,
    5, 6,
    0, 0, 0, 0, 0,
    0, 3, 11, 0
);

-- UPDATE: correção de renda de um cliente específico
UPDATE IFOOD_CUSTOMERS
   SET INCOME = 53500.00
 WHERE ID = 99999;

-- UPDATE em lote: normaliza Marital_Status inconsistentes ("Absurd"/"YOLO") para "Single"
UPDATE IFOOD_CUSTOMERS
   SET MARITAL_STATUS = 'Single'
 WHERE MARITAL_STATUS IN ('Absurd', 'YOLO');

-- DELETE: remove o registro de teste inserido acima
DELETE FROM IFOOD_CUSTOMERS
 WHERE ID = 99999;

COMMIT;
