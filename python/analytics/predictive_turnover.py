import os
import pandas as pd
import numpy as np

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder, StandardScaler
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import (
    accuracy_score,
    precision_score,
    recall_score,
    f1_score,
    roc_auc_score,
    classification_report
)

# =========================================================
# 1. CONFIGURAÇÕES
# =========================================================

INPUT_PATH = "data/processed/hr_data_clean.csv"
OUTPUT_DIR = "python/analytics/outputs"

os.makedirs(OUTPUT_DIR, exist_ok=True)

# =========================================================
# 2. LEITURA DA BASE
# =========================================================

df = pd.read_csv(INPUT_PATH)

# Padroniza nomes das colunas, por segurança
df.columns = df.columns.str.strip().str.lower()

# =========================================================
# 3. TARGET E FEATURES
# =========================================================

# Target binária
df["flag_turnover"] = df["attrition"].apply(lambda x: 1 if x == "Yes" else 0)

# Remove colunas pouco úteis ou constantes
colunas_remover = [
    "attrition",
    "employeecount",
    "over18",
    "standardhours",
    "employeenumber"  # remove ID do modelo
]

df_model = df.drop(columns=colunas_remover)

X = df_model.drop(columns=["flag_turnover"])
y = df_model["flag_turnover"]

# Identifica colunas numéricas e categóricas
categorical_features = X.select_dtypes(include=["object"]).columns.tolist()
numeric_features = X.select_dtypes(include=["int64", "float64"]).columns.tolist()

# =========================================================
# 4. PRÉ-PROCESSAMENTO
# =========================================================

numeric_transformer = Pipeline(steps=[
    ("imputer", SimpleImputer(strategy="median")),
    ("scaler", StandardScaler())
])

categorical_transformer = Pipeline(steps=[
    ("imputer", SimpleImputer(strategy="most_frequent")),
    ("onehot", OneHotEncoder(handle_unknown="ignore"))
])

preprocessor = ColumnTransformer(
    transformers=[
        ("num", numeric_transformer, numeric_features),
        ("cat", categorical_transformer, categorical_features)
    ]
)

# =========================================================
# 5. MODELO
# =========================================================

model = Pipeline(steps=[
    ("preprocessor", preprocessor),
    ("classifier", LogisticRegression(max_iter=2000, random_state=42))
])

# =========================================================
# 6. TREINO E TESTE
# =========================================================

X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42,
    stratify=y
)

model.fit(X_train, y_train)

# =========================================================
# 7. AVALIAÇÃO
# =========================================================

y_pred = model.predict(X_test)
y_prob = model.predict_proba(X_test)[:, 1]

accuracy = accuracy_score(y_test, y_pred)
precision = precision_score(y_test, y_pred, zero_division=0)
recall = recall_score(y_test, y_pred, zero_division=0)
f1 = f1_score(y_test, y_pred, zero_division=0)
roc_auc = roc_auc_score(y_test, y_prob)

metrics_text = f"""
=== MÉTRICAS DO MODELO - REGRESSÃO LOGÍSTICA ===

Accuracy : {accuracy:.4f}
Precision: {precision:.4f}
Recall   : {recall:.4f}
F1-Score : {f1:.4f}
ROC AUC  : {roc_auc:.4f}

=== CLASSIFICATION REPORT ===
{classification_report(y_test, y_pred, zero_division=0)}
"""

print(metrics_text)

with open(os.path.join(OUTPUT_DIR, "model_metrics.txt"), "w", encoding="utf-8") as f:
    f.write(metrics_text)

# =========================================================
# 8. IMPORTÂNCIA DAS VARIÁVEIS (coeficientes)
# =========================================================

# Recupera nomes das features após transformação
ohe = model.named_steps["preprocessor"].named_transformers_["cat"].named_steps["onehot"]
encoded_cat_features = ohe.get_feature_names_out(categorical_features)

all_feature_names = numeric_features + list(encoded_cat_features)

coefficients = model.named_steps["classifier"].coef_[0]

feature_importance = pd.DataFrame({
    "feature": all_feature_names,
    "coefficient": coefficients,
    "abs_coefficient": np.abs(coefficients)
}).sort_values(by="abs_coefficient", ascending=False)

feature_importance.to_csv(
    os.path.join(OUTPUT_DIR, "feature_importance.csv"),
    index=False
)

print("\nTop 15 variáveis mais influentes:")
print(feature_importance.head(15))

# =========================================================
# 9. SCORE INDIVIDUAL DE RISCO
# =========================================================

# Gera score para a base inteira
all_prob = model.predict_proba(X)[:, 1]

scored_df = df.copy()
scored_df["prob_turnover"] = all_prob

def classificar_risco(prob):
    if prob >= 0.60:
        return "Alto risco"
    elif prob >= 0.30:
        return "Médio risco"
    return "Baixo risco"

scored_df["classificacao_risco_modelo"] = scored_df["prob_turnover"].apply(classificar_risco)

# Seleciona colunas úteis para análise
output_cols = [
    "employeenumber",
    "department",
    "jobrole",
    "age",
    "monthlyincome",
    "yearsatcompany",
    "overtime",
    "jobsatisfaction",
    "worklifebalance",
    "flag_turnover",
    "prob_turnover",
    "classificacao_risco_modelo"
]

model_outputs = scored_df[output_cols].sort_values(by="prob_turnover", ascending=False)

model_outputs.to_csv(
    os.path.join(OUTPUT_DIR, "model_outputs.csv"),
    index=False,
    sep=";",
    decimal="."
)

print("\nArquivos gerados com sucesso:")
print("- python/analytics/outputs/model_metrics.txt")
print("- python/analytics/outputs/feature_importance.csv")
print("- python/analytics/outputs/model_outputs.csv")