# 📊 People Analytics End-to-End

![Python](https://img.shields.io/badge/Python-3.10-blue?logo=python)
![SQL Server](https://img.shields.io/badge/SQL%20Server-Data%20Warehouse-red?logo=microsoftsqlserver)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow?logo=powerbi)
![Machine Learning](https://img.shields.io/badge/Machine%20Learning-Scikit--Learn-orange?logo=scikitlearn)
![Status](https://img.shields.io/badge/Status-Completed-success)

> Um pipeline completo de dados em People Analytics — da ingestão ao insight, simulando um ambiente real corporativo.

---

## 🧠 Visão Geral

Este projeto representa a construção de um ecossistema analítico completo, cobrindo:

- Ingestão de dados  
- Tratamento e padronização  
- Modelagem analítica  
- Modelagem dimensional (Star Schema)  
- Machine Learning  
- Visualização estratégica  

A proposta não é apenas analisar dados, mas **estruturar um pipeline robusto, escalável e orientado a negócio**.

---

## 🎯 Objetivo

Transformar dados brutos de colaboradores em informações acionáveis para suportar decisões de RH:

- Turnover  
- Retenção de talentos  
- Estrutura organizacional  

---

## 🏗️ Arquitetura do Projeto

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

## ⚙️ Stack Tecnológica

| Camada           | Tecnologia      |
| ---------------- | --------------- |
| Ingestão         | Python (pandas) |
| Modelagem        | SQL Server      |
| Análise          | Power BI        |
| Machine Learning | scikit-learn    |
| Desenvolvimento  | VS Code         |
| Versionamento    | Git / GitHub    |

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
├── scripts (01 ao 23)
└── validações (bronze, silver, gold)

---

## 📘 Pipeline de Dados
🥉 Bronze
Dados brutos ingeridos diretamente do CSV.

🥈 Silver
Camada tratada com:
- Padronização
- Regras de negócio
- Criação de variáveis analíticas

🥇 Gold
Camada analítica com:
- KPIs
- Agregações
- Tabelas prontas para BI

---

## 📊 Indicadores Principais
- Headcount
- Taxa de Turnover
- Turnover por área, cargo e tempo de empresa
- Salário médio

---

## 🔍 Insights Relevantes
- Turnover geral: 16,12%
- Área de Sales concentra maior rotatividade
- Cargo Sales Representative apresenta maior risco
- Colaboradores com até 2 anos têm maior churn
- Faixas etárias mais jovens apresentam maior saída

---

## 🤖 Modelo Preditivo
Objetivo
Antecipar desligamentos e apoiar estratégias de retenção.

Métricas
| Métrica   | Valor |
| --------- | ----- |
| ROC AUC   | 0.81  |
| Accuracy  | 86%   |
| Precision | 61%   |
| Recall    | 34%   |

Principais Features
- Cargo
- Hora extra
- Frequência de viagem
- Tempo desde última promoção
- Estado civil

---

## 🧩 Modelo Dimensional
*Dimensões*
- dim_colaborador
- dim_tempo
- dim_area
- dim_cargo
- dim_faixa_etaria
- dim_hora_extra
- dim_frequencia_viagem
- dim_faixa_tempo_empresa
dim_faixa_salarial

*Fatos*
- fato_turnover
- fato_headcount

---

## Definição de Turnover
Turnover = Desligamentos / Total de colaboradores no período analisado

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

*Ingestão*
python ingestion.py

*Carga no SQL Server*
python load_to_sql.py

*Executar scripts SQL (ordem numérica)*

*Modelo preditivo*
python python/analytics/predictive_turnover.py

Conectar o Power BI às tabelas da camada Gold + outputs do modelo.

---

## Outputs

python/analytics/outputs/
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