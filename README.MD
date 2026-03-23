# People Analytics End-to-End

![Python](https://img.shields.io/badge/Python-3.10-blue?logo=python)
![SQL Server](https://img.shields.io/badge/SQL%20Server-Data%20Warehouse-red?logo=microsoftsqlserver)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow?logo=powerbi)
![Machine Learning](https://img.shields.io/badge/Machine%20Learning-Scikit--Learn-orange?logo=scikitlearn)
![Status](https://img.shields.io/badge/Status-Completed-success)

> Um pipeline completo de dados em People Analytics — da ingestão ao insight, simulando um ambiente real corporativo.

---

## Visão Geral

Este projeto representa a construção de um ecossistema analítico completo, cobrindo:

- Ingestão de dados  
- Tratamento e padronização  
- Modelagem analítica  
- Modelagem dimensional (Star Schema)  
- Machine Learning  
- Visualização estratégica  

A proposta não é apenas analisar dados, mas **estruturar um pipeline robusto, escalável e orientado a negócio**.

---

## Objetivo

Transformar dados brutos de colaboradores em informações acionáveis para suportar decisões de RH:

- Turnover  
- Retenção de talentos  
- Estrutura organizacional  

---

## Arquitetura do Projeto

```text
CSV (Kaggle)
   ↓
Python (Ingestão + Limpeza)
   ↓
SQL Server (Modelagem)
   ↓
Bronze → Silver → Gold
   ↓
Star Schema
   ↓
Power BI (Visualização)
   ↓
Machine Learning (Predição de Turnover)
```

---

## Stack Tecnológica

| Camada           | Tecnologia      |
| ---------------- | --------------- |
| Ingestão         | Python (pandas) |
| Modelagem        | SQL Server      |
| Análise          | Power BI        |
| Machine Learning | scikit-learn    |
| Desenvolvimento  | VS Code         |
| Versionamento    | Git / GitHub    |

---

## Estrutura do Projeto

```text
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
```

---

## Pipeline de Dados
**Bronze**

Dados brutos ingeridos diretamente do CSV.

**Silver**

Camada tratada com:
- Padronização
- Regras de negócio
- Criação de variáveis analíticas

**Gold**

Camada analítica com:
- KPIs
- Agregações
- Tabelas prontas para BI

---

## Indicadores Principais
- Headcount
- Taxa de Turnover
- Turnover por área, cargo e tempo de empresa
- Salário médio

---

## Insights Relevantes
- Turnover geral: 16,12%
- Área de Sales concentra maior rotatividade
- Cargo Sales Representative apresenta maior risco
- Colaboradores com até 2 anos têm maior churn
- Faixas etárias mais jovens apresentam maior saída

---

## Modelo Preditivo
**Objetivo**
Antecipar desligamentos e apoiar estratégias de retenção.

**Métricas**
| Métrica   | Valor |
| --------- | ----- |
| ROC AUC   | 0.81  |
| Accuracy  | 86%   |
| Precision | 61%   |
| Recall    | 34%   |

**Principais Features**
- Cargo
- Hora extra
- Frequência de viagem
- Tempo desde última promoção
- Estado civil

---

## Modelo Dimensional
**Dimensões**
- dim_colaborador
- dim_tempo
- dim_area
- dim_cargo
- dim_faixa_etaria
- dim_hora_extra
- dim_frequencia_viagem
- dim_faixa_tempo_empresa
dim_faixa_salarial

**Fatos**
- fato_turnover
- fato_headcount

---

## Definição de Turnover
**Turnover** = Desligamentos / Total de colaboradores no período analisado

---

## Diferenciais do Projeto
- Pipeline completo end-to-end
- Arquitetura Bronze / Silver / Gold
- Modelagem dimensional (Star Schema)
- Integração Python + SQL + Power BI
- Modelo preditivo aplicado ao negócio
- Camada de risco de turnover
- Validação de dados estruturada

---

## Como Executar

**Ingestão**

python ingestion.py

**Carga no SQL Server**

python load_to_sql.py

**Executar scripts SQL (ordem numérica)**

**Modelo preditivo**

python python/analytics/predictive_turnover.py

Conectar o Power BI às tabelas da camada Gold + outputs do modelo.

---

## Outputs

**python/analytics/outputs/**
- feature_importance.csv
- model_metrics.txt
- model_outputs.csv

---

## Próximos Passos
- Otimização do modelo (tuning)
- Balanceamento de classes
- Automação do pipeline
- Deploy em cloud
- Uso com dados reais

---

## Autor

Projeto desenvolvido como portfólio em Data Analytics & People Analytics.