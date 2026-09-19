-- Criação da tabela IFOOD_CUSTOMERS no Oracle

CREATE TABLE IFOOD_CUSTOMERS (
    ID                      NUMBER          PRIMARY KEY,
    YEAR_BIRTH              NUMBER(4)       NOT NULL,
    EDUCATION               VARCHAR2(20)    NOT NULL,
    MARITAL_STATUS          VARCHAR2(20)    NOT NULL,
    INCOME                  NUMBER(12,2),
    KIDHOME                 NUMBER(1)       DEFAULT 0,
    TEENHOME                NUMBER(1)       DEFAULT 0,
    DT_CUSTOMER             DATE            NOT NULL,
    RECENCY                 NUMBER(3),
    MNT_WINES               NUMBER(8)       DEFAULT 0,
    MNT_FRUITS              NUMBER(8)       DEFAULT 0,
    MNT_MEAT_PRODUCTS       NUMBER(8)       DEFAULT 0,
    MNT_FISH_PRODUCTS       NUMBER(8)       DEFAULT 0,
    MNT_SWEET_PRODUCTS      NUMBER(8)       DEFAULT 0,
    MNT_GOLD_PRODS          NUMBER(8)       DEFAULT 0,
    NUM_DEALS_PURCHASES     NUMBER(4)       DEFAULT 0,
    NUM_WEB_PURCHASES       NUMBER(4)       DEFAULT 0,
    NUM_CATALOG_PURCHASES   NUMBER(4)       DEFAULT 0,
    NUM_STORE_PURCHASES     NUMBER(4)       DEFAULT 0,
    NUM_WEB_VISITS_MONTH    NUMBER(4)       DEFAULT 0,
    ACCEPTED_CMP3           NUMBER(1)       DEFAULT 0,
    ACCEPTED_CMP4           NUMBER(1)       DEFAULT 0,
    ACCEPTED_CMP5           NUMBER(1)       DEFAULT 0,
    ACCEPTED_CMP1           NUMBER(1)       DEFAULT 0,
    ACCEPTED_CMP2           NUMBER(1)       DEFAULT 0,
    COMPLAIN                NUMBER(1)       DEFAULT 0,
    Z_COST_CONTACT          NUMBER(6),
    Z_REVENUE               NUMBER(6),
    RESPONSE                NUMBER(1)       NOT NULL CHECK (RESPONSE IN (0,1))
);

-- Exemplo de ALTER TABLE
ALTER TABLE IFOOD_CUSTOMERS ADD LOAD_DATE DATE DEFAULT SYSDATE;
