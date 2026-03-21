import pandas as pd
import os

# Garante que a pasta existe
os.makedirs("data/processed", exist_ok=True)

df = pd.read_csv("data/raw/hr_data.csv")

df.columns = df.columns.str.strip().str.lower()

print(df.head())
print(df.shape)
print(df.isnull().sum())

df.to_csv("data/processed/hr_data_clean.csv", index=False)

print("Arquivo salvo com sucesso!")