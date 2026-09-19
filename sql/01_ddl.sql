-- ============================================================
-- CP4 - Cognitive Data Science
-- Estrutura da tabela IFOOD_CUSTOMERS no Oracle Database FIAP
-- ============================================================

-- Remove a tabela se já existir (facilita reexecução do script)
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE IFOOD_CUSTOMERS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

CREATE TABLE IFOOD_CUSTOMERS (
    ID                      NUMBER          NOT NULL,
    YEAR_BIRTH              NUMBER(4)       NOT NULL,
    EDUCATION               VARCHAR2(20)    NOT NULL,
    MARITAL_STATUS          VARCHAR2(20)    NOT NULL,
    INCOME                  NUMBER(10,2),
    KIDHOME                 NUMBER(1)       DEFAULT 0 NOT NULL,
    TEENHOME                NUMBER(1)       DEFAULT 0 NOT NULL,
    DT_CUSTOMER             DATE            NOT NULL,
    RECENCY                 NUMBER(3)       NOT NULL,
    MNT_WINES               NUMBER(8)       DEFAULT 0 NOT NULL,
    MNT_FRUITS              NUMBER(8)       DEFAULT 0 NOT NULL,
    MNT_MEAT_PRODUCTS       NUMBER(8)       DEFAULT 0 NOT NULL,
    MNT_FISH_PRODUCTS       NUMBER(8)       DEFAULT 0 NOT NULL,
    MNT_SWEET_PRODUCTS      NUMBER(8)       DEFAULT 0 NOT NULL,
    MNT_GOLD_PRODS          NUMBER(8)       DEFAULT 0 NOT NULL,
    NUM_DEALS_PURCHASES     NUMBER(4)       DEFAULT 0 NOT NULL,
    NUM_WEB_PURCHASES       NUMBER(4)       DEFAULT 0 NOT NULL,
    NUM_CATALOG_PURCHASES   NUMBER(4)       DEFAULT 0 NOT NULL,
    NUM_STORE_PURCHASES     NUMBER(4)       DEFAULT 0 NOT NULL,
    NUM_WEB_VISITS_MONTH    NUMBER(4)       DEFAULT 0 NOT NULL,
    ACCEPTED_CMP3           NUMBER(1)       DEFAULT 0 NOT NULL,
    ACCEPTED_CMP4           NUMBER(1)       DEFAULT 0 NOT NULL,
    ACCEPTED_CMP5           NUMBER(1)       DEFAULT 0 NOT NULL,
    ACCEPTED_CMP1           NUMBER(1)       DEFAULT 0 NOT NULL,
    ACCEPTED_CMP2           NUMBER(1)       DEFAULT 0 NOT NULL,
    COMPLAIN                NUMBER(1)       DEFAULT 0 NOT NULL,
    Z_COST_CONTACT          NUMBER(6)       NOT NULL,
    Z_REVENUE               NUMBER(6)       NOT NULL,
    RESPONSE                NUMBER(1)       NOT NULL,
    CONSTRAINT PK_IFOOD_CUSTOMERS PRIMARY KEY (ID),
    CONSTRAINT CK_IFOOD_INCOME        CHECK (INCOME IS NULL OR INCOME >= 0),
    CONSTRAINT CK_IFOOD_YEAR_BIRTH    CHECK (YEAR_BIRTH BETWEEN 1850 AND 2026), -- base tem outliers reais de cadastro (ex: 1893), tratados na etapa de EDA/ML
    CONSTRAINT CK_IFOOD_KIDHOME       CHECK (KIDHOME BETWEEN 0 AND 5),
    CONSTRAINT CK_IFOOD_TEENHOME      CHECK (TEENHOME BETWEEN 0 AND 5),
    CONSTRAINT CK_IFOOD_RECENCY       CHECK (RECENCY BETWEEN 0 AND 999),
    CONSTRAINT CK_IFOOD_RESPONSE      CHECK (RESPONSE IN (0,1)),
    CONSTRAINT CK_IFOOD_COMPLAIN      CHECK (COMPLAIN IN (0,1)),
    CONSTRAINT CK_IFOOD_ACC_CMP1      CHECK (ACCEPTED_CMP1 IN (0,1)),
    CONSTRAINT CK_IFOOD_ACC_CMP2      CHECK (ACCEPTED_CMP2 IN (0,1)),
    CONSTRAINT CK_IFOOD_ACC_CMP3      CHECK (ACCEPTED_CMP3 IN (0,1)),
    CONSTRAINT CK_IFOOD_ACC_CMP4      CHECK (ACCEPTED_CMP4 IN (0,1)),
    CONSTRAINT CK_IFOOD_ACC_CMP5      CHECK (ACCEPTED_CMP5 IN (0,1)),
    CONSTRAINT CK_IFOOD_EDUCATION     CHECK (EDUCATION IN ('Basic','2n Cycle','Graduation','Master','PhD')),
    CONSTRAINT CK_IFOOD_MARITAL       CHECK (MARITAL_STATUS IN ('Single','Together','Married','Divorced','Widow','Alone','Absurd','YOLO'))
);

-- ============================================================
-- Demonstração de ALTER TABLE (parte do requisito "CREATE/ALTER")
-- ============================================================

-- Coluna de auditoria para registrar quando cada linha foi carregada
ALTER TABLE IFOOD_CUSTOMERS
    ADD LOAD_TIMESTAMP TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL;

-- Ajuste de precisão da coluna INCOME (exemplo de ALTER ... MODIFY)
ALTER TABLE IFOOD_CUSTOMERS
    MODIFY INCOME NUMBER(12,2);

-- Índice auxiliar para consultas por perfil de escolaridade/estado civil
CREATE INDEX IX_IFOOD_EDU_MARITAL ON IFOOD_CUSTOMERS (EDUCATION, MARITAL_STATUS);

COMMIT;
