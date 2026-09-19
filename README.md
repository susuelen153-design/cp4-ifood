# CP4 - Case iFood

Trabalho da CP4 (Cognitive Data Science + Machine Learning), turma 1TIAPZ-2026.

Grupo: Arthur Zeferino (RM 570858), Suellen Pereira da Silva (RM 573862), Giovanni Hessel (RM 570574), Israel Carneiro (RM 573854).

## O que tem aqui

- `data/ifood_customers.csv` - o dataset original
- `sql/01_ddl.sql` - criação da tabela no Oracle
- `sql/load_data.py` - script que faz a carga do CSV pro Oracle
- `sql/02_dml_demo.sql` - INSERT/UPDATE/DELETE
- `sql/03_validacao.sql` - conferência dos dados carregados
- `notebooks/CP4_iFood.ipynb` - EDA, feature engineering, tuning e avaliação do modelo

Ordem pra rodar: `01_ddl.sql`, depois `load_data.py`, depois `02_dml_demo.sql` e `03_validacao.sql`, e por fim o notebook.

## Resultado

| Modelo | Precision | Recall | F1 | ROC AUC |
|---|---|---|---|---|
| Baseline (árvore de aula) | 0.46 | 0.52 | 0.49 | 0.71 |
| Final (com feature engineering + tuning) | 0.50 | 0.31 | 0.39 | 0.74 |

O modelo final ficou com ROC AUC maior que o baseline, sem vazar dado de teste no treino (holdout estratificado, tuning só com dados de treino via GridSearchCV).
