"""
Carga do CSV do Case iFood na tabela IFOOD_CUSTOMERS (Oracle FIAP).
Executar depois de rodar o 01_ddl.sql.

Credenciais lidas de variáveis de ambiente para não deixar senha no código:
    ORACLE_USER, ORACLE_PASSWORD, ORACLE_DSN (host:porta/service_name)
"""
import os
import math
import pandas as pd
import oracledb

CSV_PATH = os.path.join(os.path.dirname(__file__), "..", "data", "ifood_customers.csv")

ORACLE_USER = os.environ["ORACLE_USER"]
ORACLE_PASSWORD = os.environ["ORACLE_PASSWORD"]
ORACLE_DSN = os.environ["ORACLE_DSN"]

INSERT_SQL = """
INSERT INTO IFOOD_CUSTOMERS (
    ID, YEAR_BIRTH, EDUCATION, MARITAL_STATUS, INCOME, KIDHOME, TEENHOME,
    DT_CUSTOMER, RECENCY, MNT_WINES, MNT_FRUITS, MNT_MEAT_PRODUCTS,
    MNT_FISH_PRODUCTS, MNT_SWEET_PRODUCTS, MNT_GOLD_PRODS,
    NUM_DEALS_PURCHASES, NUM_WEB_PURCHASES, NUM_CATALOG_PURCHASES,
    NUM_STORE_PURCHASES, NUM_WEB_VISITS_MONTH,
    ACCEPTED_CMP3, ACCEPTED_CMP4, ACCEPTED_CMP5, ACCEPTED_CMP1, ACCEPTED_CMP2,
    COMPLAIN, Z_COST_CONTACT, Z_REVENUE, RESPONSE
) VALUES (
    :1, :2, :3, :4, :5, :6, :7,
    TO_DATE(:8, 'YYYY-MM-DD'), :9, :10, :11, :12,
    :13, :14, :15,
    :16, :17, :18,
    :19, :20,
    :21, :22, :23, :24, :25,
    :26, :27, :28, :29
)
"""


def clean_value(v):
    if isinstance(v, float) and math.isnan(v):
        return None
    return v


def main():
    df = pd.read_csv(CSV_PATH)

    rows = []
    for _, r in df.iterrows():
        rows.append(tuple(clean_value(v) for v in [
            r.ID, r.Year_Birth, r.Education, r.Marital_Status, r.Income,
            r.Kidhome, r.Teenhome, r.Dt_Customer, r.Recency,
            r.MntWines, r.MntFruits, r.MntMeatProducts, r.MntFishProducts,
            r.MntSweetProducts, r.MntGoldProds,
            r.NumDealsPurchases, r.NumWebPurchases, r.NumCatalogPurchases,
            r.NumStorePurchases, r.NumWebVisitsMonth,
            r.AcceptedCmp3, r.AcceptedCmp4, r.AcceptedCmp5, r.AcceptedCmp1, r.AcceptedCmp2,
            r.Complain, r.Z_CostContact, r.Z_Revenue, r.Response,
        ]))

    with oracledb.connect(user=ORACLE_USER, password=ORACLE_PASSWORD, dsn=ORACLE_DSN) as conn:
        with conn.cursor() as cursor:
            cursor.executemany(INSERT_SQL, rows)
        conn.commit()

    print(f"Carga concluída: {len(rows)} registros inseridos em IFOOD_CUSTOMERS.")


if __name__ == "__main__":
    main()
