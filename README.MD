# 📊 People Analytics End-to-End

## 🧠 Visão Geral
Este projeto simula uma solução completa de People Analytics, construída de ponta a ponta, com foco em ingestão, tratamento, modelagem analítica, modelagem dimensional, machine learning e visualização de indicadores estratégicos de RH.

O objetivo foi demonstrar não apenas análise de dados, mas a construção de um ecossistema analítico estruturado, próximo ao contexto real de grandes empresas.
---
## 🎯 Objetivo
Transformar dados brutos de colaboradores em informações confiáveis e acionáveis para apoiar decisões relacionadas a:

- Turnover
- Retenção de talentos
- Estrutura organizacional
---
## 🏗️ Arquitetura

```text
Fonte de dados (CSV - Kaggle)
        ↓
Ingestão e tratamento (Python)
        ↓
Armazenamento e modelagem (SQL Server)
        ↓
Camadas analíticas (Bronze → Silver → Gold)
        ↓
Modelo dimensional (Star Schema)
        ↓
Visualização e insights (Power BI)
        ↓
Modelo preditivo (Machine Learning)
```
---
## ⚙️ Tecnologias Utilizadas
Python (pandas, scikit-learn)
SQL Server
Power BI
VSCode
GitHub
---
## 📂 Estrutura do Projeto
data/
├── raw/
│   └── hr_data.csv
├── processed/
│   └── hr_data_clean.csv

docs/
└── dicionario_dados.md

powerbi/
└── prints/
    ├── overview.png
    ├── breakdown.png
    ├── drivers.png
    └── predictive_model.png

python/
├── ingestion.py
├── load_to_sql.py
└── analytics/
    ├── predictive_turnover.py
    └── outputs/
        ├── feature_importance.csv
        ├── model_metrics.txt
        └── model_outputs.csv

sql/
├── prints/
│   ├── bronze.png
│   ├── silver.png
│   ├── gold_turnover.png
│   └── risk_profile.png
├── 01_create_db.sql
├── 02_create_schemas.sql
├── 03_create_bronze.sql
├── 04_create_silver.sql
├── 05_create_gold.sql
├── 06_check_silver_structure.sql
├── 07_create_view.sql
├── 08_create_indexes.sql
├── 09_create_risk_layer.sql
├── 10_final_quality_checks.sql
├── 11_create_dim_tempo.sql
├── 12_create_dim_area.sql
├── 13_create_dim_cargo.sql
├── 14_create_dim_faixa_etaria.sql
├── 15_create_dim_colaborador.sql
├── 16_create_fato_turnover.sql
├── 17_create_fato_headcount.sql
├── 18_validate_star_schema.sql
├── 19_add_foreign_keys.sql
├── 20_create_dim_hora_extra.sql
├── 21_create_dim_frequencia_viagem.sql
├── 22_create_dim_faixa_tempo_empresa.sql
├── 23_create_dim_faixa_salarial.sql
├── validate_bronze.sql
├── validate_gold.sql
└── validate_silver.sql

README.md
requirements.txt
.gitignore
---
## 📘 Documentação
Dicionário de Dados
🧱 Pipeline de Dados
🔹 Bronze
Dados brutos carregados diretamente do CSV.

🔹 Silver
Camada tratada com:
- padronização
- regras de negócio
- criação de variáveis analíticas

🔹 Gold
Camada analítica com:
- KPIs
- agregações
- tabelas prontas para BI
---
## 📊 Prints do Pipeline de Dados (SQL)
Bronze

Silver

Gold

Risk Layer
---
## 📊 Principais Indicadores
- Headcount
- Taxa de turnover geral
- Turnover por área
- Turnover por cargo
- Turnover por faixa etária
- Turnover por tempo de empresa
- Salário médio
---
## 🔍 Principais Insights
- Taxa geral de turnover: 16,12%
- Área de Sales com maior turnover
- Cargo Sales Representative lidera risco
- Colaboradores com até 2 anos concentram maior rotatividade
- Faixa etária mais jovem apresenta maior risco de saída
---
## 🤖 Modelo Preditivo de Turnover
# 🎯 Objetivo

Antecipar o risco de desligamento e apoiar ações de retenção.

# 📊 Métricas
- ROC AUC: 0.81
- Accuracy: 86%
- Precision: 61%
- Recall: 34%

# 🔍 Principais variáveis
- Cargo
- Hora extra
- Frequência de viagem
- Tempo desde última promoção
- Estado civil
---
## 📁 Outputs

python/analytics/outputs/
---
## 🧩 Modelo Dimensional
Dimensões
- dim_colaborador
- dim_tempo
- dim_area
- dim_cargo
- dim_faixa_etaria
- dim_hora_extra
- dim_frequencia_viagem
- dim_faixa_tempo_empresa
- dim_faixa_salarial
Fatos
- fato_turnover
- fato_headcount
---
## 📐 Definição de Turnover

Turnover = Desligamentos / Total de colaboradores no contexto analisado
---
## 🧠 Diferenciais do Projeto
- Pipeline completo (end-to-end)
- Arquitetura Bronze / Silver / Gold
- Modelagem dimensional (Star Schema)
- Integração Python + SQL + Power BI
- Modelo preditivo aplicado ao negócio
- Camada de risco de turnover
- Validação de dados
---
## ▶️ Como Executar
Executar ingestão:
- python ingestion.py
Carregar no SQL:
- python load_to_sql.py
- Executar scripts SQL (ordem numérica)
Rodar modelo preditivo:
- python python/analytics/predictive_turnover.py
- Conectar Power BI nas tabelas Gold + outputs
---
## 🚀 Próximos Passos
- Tuning do modelo
- Balanceamento de classes
- Automação do pipeline
- Deploy em cloud
- Uso com dados reais
---
## 👨‍💻 Autor

Projeto desenvolvido como portfólio em Data Analytics e People Analytics.