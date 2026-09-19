# CP4 - Cognitive Data Science + Machine Learning & Modelling (Case iFood)

Turma 1TIAPZ-2026 — 2º semestre.

**Integrantes:** Arthur Zeferino (RM 570858), Suellen Pereira da Silva (RM 573862),
Giovanni Hessel (RM 570574), Israel Carneiro (RM 573854).

## Estrutura do repositório

```
data/
  ifood_customers.csv        # dataset original do Case iFood
sql/
  01_ddl.sql                 # criação da tabela IFOOD_CUSTOMERS (CREATE/ALTER, constraints)
  load_data.py                # carga do CSV no Oracle via python-oracledb
  02_dml_demo.sql             # demonstração de INSERT/UPDATE/DELETE
  03_validacao.sql            # validação da estrutura/carga + query final para o ML
notebooks/
  CP4_iFood.ipynb              # EDA, Feature Engineering, tuning e avaliação do modelo
```

## Como reproduzir

1. Criar um ambiente virtual e instalar as dependências:

```bash
pip install -r requirements.txt
```

2. Configurar as credenciais do Oracle FIAP como variáveis de ambiente (copiar
   `.env.example` para `.env` e preencher, ou exportar direto no terminal):

```bash
export ORACLE_USER=RM_DO_ALUNO
export ORACLE_PASSWORD=SUA_SENHA
export ORACLE_DSN=ORACLE.FIAP.COM.BR:1521/ORCL
```

3. Rodar `sql/01_ddl.sql` no SQL Developer (ou via script) para criar a tabela.
4. Rodar a carga dos dados:

```bash
python sql/load_data.py
```

5. Rodar `sql/02_dml_demo.sql` e `sql/03_validacao.sql` para validar a estrutura e a carga.
6. Abrir `notebooks/CP4_iFood.ipynb` no Jupyter e executar todas as células — o notebook lê
   os dados diretamente do Oracle usando a query fornecida pelos professores.

## Resumo dos resultados

| Modelo | Precision | Recall | F1 | ROC AUC |
|---|---|---|---|---|
| Baseline (Decision Tree de aula) | 0.46 | 0.52 | 0.49 | 0.71 |
| Final (Feature Engineering + tuning) | 0.50 | 0.31 | 0.39 | **0.74** |

O modelo final supera o baseline em ROC AUC sem uso de dados de teste no treino ou no tuning
(HoldOut estratificado 80/20, imputação e encoding ajustados apenas no treino, tuning via
`GridSearchCV` com validação cruzada estratificada de 5 folds).
