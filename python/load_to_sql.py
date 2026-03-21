import pandas as pd
import sqlalchemy as sa

# conexão com SQL Server
engine = sa.create_engine(
    "mssql+pyodbc://@localhost/PeopleAnalytics?driver=ODBC+Driver+17+for+SQL+Server"
)

# lê o CSV tratado
df = pd.read_csv("data/processed/hr_data_clean.csv")

# envia para o SQL Server
df.to_sql("hr_raw", engine, schema="bronze", if_exists="append", index=False)

print("Dados carregados com sucesso no SQL Server!")