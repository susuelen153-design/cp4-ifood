-- ============================================================
-- CP4 - Cognitive Data Science
-- Validação da estrutura e da carga
-- ============================================================

-- Contagem total de registros carregados (esperado: 2240)
SELECT COUNT(*) AS TOTAL_REGISTROS FROM IFOOD_CUSTOMERS;

-- Checagem de duplicidade de ID (esperado: 0 linhas)
SELECT ID, COUNT(*)
  FROM IFOOD_CUSTOMERS
 GROUP BY ID
HAVING COUNT(*) > 1;

-- Checagem de nulos em colunas-chave para o modelo
SELECT
    SUM(CASE WHEN INCOME IS NULL THEN 1 ELSE 0 END) AS INCOME_NULOS,
    SUM(CASE WHEN EDUCATION IS NULL THEN 1 ELSE 0 END) AS EDUCATION_NULOS,
    SUM(CASE WHEN RESPONSE IS NULL THEN 1 ELSE 0 END) AS RESPONSE_NULOS
FROM IFOOD_CUSTOMERS;

-- Distribuição da variável alvo (Response)
SELECT RESPONSE, COUNT(*) AS QTD
  FROM IFOOD_CUSTOMERS
 GROUP BY RESPONSE
 ORDER BY RESPONSE;

-- Query fornecida pelos professores, completa com as variáveis necessárias
-- para o DataFrame de Machine Learning
SELECT
    ID, YEAR_BIRTH, EDUCATION, MARITAL_STATUS, INCOME, KIDHOME, TEENHOME,
    DT_CUSTOMER, RECENCY, MNT_WINES, MNT_FRUITS, MNT_MEAT_PRODUCTS,
    MNT_FISH_PRODUCTS, MNT_SWEET_PRODUCTS, MNT_GOLD_PRODS,
    NUM_DEALS_PURCHASES, NUM_WEB_PURCHASES, NUM_CATALOG_PURCHASES,
    NUM_STORE_PURCHASES, NUM_WEB_VISITS_MONTH,
    ACCEPTED_CMP3, ACCEPTED_CMP4, ACCEPTED_CMP5, ACCEPTED_CMP1, ACCEPTED_CMP2,
    COMPLAIN, RESPONSE
FROM IFOOD_CUSTOMERS;
