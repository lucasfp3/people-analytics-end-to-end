# 📊 People Analytics End-to-End

## 🧠 Visão Geral
Este projeto simula uma solução completa de People Analytics, construída de ponta a ponta, com foco em ingestão, tratamento, modelagem analítica, automação e visualização de indicadores estratégicos de RH.

O objetivo foi demonstrar não apenas análise de dados, mas a construção de um ecossistema analítico estruturado, próximo ao contexto real de grandes empresas.

---

## 🎯 Objetivo
Transformar dados brutos de colaboradores em informações confiáveis e acionáveis para apoiar decisões relacionadas a turnover, retenção e estrutura organizacional.

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
Visualização e insights (Power BI)
```

---

## ⚙️ Tecnologias Utilizadas

- Python (pandas)
- SQL Server
- VSCode
- Power BI
- GitHub

---

## 📂 Estrutura do Projeto
```text
data/
├── raw/
├── processed/

python/
├── ingestion/
├── validation/
├── automation/

sql/
├── bronze/
├── silver/
├── gold/

powerbi/
├── prints/

docs/

README.md
requirements.txt
.gitignore
```
---

## 📘 Documentação

- [Dicionário de Dados](docs/dicionario_dados.md)

---

## 🧱 Pipeline de Dados

### 🔹 Bronze
Dados brutos carregados diretamente do CSV.

### 🔹 Silver
Camada tratada com:
- padronização
- regras de negócio
- criação de variáveis analíticas

### 🔹 Gold
Camada analítica com:
- KPIs
- agregações
- tabelas prontas para BI

## 📊 Prints do Pipeline de Dados

### Bronze (dados brutos)
![Bronze](powerbi/prints/bronze.png)

### Silver (dados tratados)
![Silver](powerbi/prints/silver.png)

### Gold (KPIs)
![Gold](powerbi/prints/gold_turnover.png)

### Análise de risco
![Risk](powerbi/prints/risk_profile.png)

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

- Taxa geral de turnover: **16,12%**
- Área de Sales com maior turnover: **20,63%**
- Cargo com maior risco: **Sales Representative (39,76%)**
- Maior concentração de desligamentos em colaboradores com até **2 anos de empresa (34,88%)**
- Colaboradores com até **29 anos apresentam maior taxa de saída (27,91%)**

---

## 🚨 Análise de Risco

Foi criada uma classificação de risco baseada em:
- tempo de empresa
- satisfação
- carga de trabalho

### Resultado:

| Risco        | Turnover |
|-------------|--------|
| Alto risco  | 20,14% |
| Médio risco | 10,87% |
| Baixo risco | 9,29% |

👉 O modelo demonstra capacidade de segmentação e priorização para ações de retenção.

---

## 💡 Interpretação de Negócio

Os resultados indicam maior vulnerabilidade de retenção em funções comerciais, especialmente entre profissionais mais jovens e com pouco tempo de empresa.

Isso pode indicar necessidade de revisão em:
- processo de contratação
- onboarding
- desenvolvimento de carreira
- gestão de expectativas

---

## 🤖 Modelo Preditivo de Turnover

Foi desenvolvido um modelo de Machine Learning utilizando Regressão Logística para estimar a probabilidade de desligamento dos colaboradores.

### 🎯 Objetivo
Antecipar o risco de turnover e apoiar decisões estratégicas de retenção.

### 📊 Métricas do modelo
- ROC AUC: 0.81
- Accuracy: 86%
- Precision: 61%
- Recall: 34%

### 🔍 Principais fatores de risco identificados
- Cargo (Sales Representative, Laboratory Technician)
- Realização de horas extras
- Alta frequência de viagens
- Tempo elevado desde a última promoção
- Estado civil (Single)

### 🧠 Interpretação
O modelo demonstrou boa capacidade de discriminação entre colaboradores com maior e menor probabilidade de desligamento.

Apesar de um recall mais baixo, o modelo já permite identificar padrões relevantes de risco, sendo um ponto de partida sólido para evoluções futuras com técnicas de balanceamento e tuning.

### 📁 Outputs gerados
- Probabilidade individual de turnover
- Classificação de risco (Alto, Médio, Baixo)
- Importância das variáveis

Arquivos disponíveis em:
`python/analytics/outputs/`

---

## 🧠 Diferenciais do Projeto

- Pipeline estruturado (Bronze / Silver / Gold)
- Integração Python + SQL Server
- Modelagem analítica
- Criação de KPIs estratégicos
- Camada de risco de turnover
- Uso de view para consumo analítico
- Validações de qualidade de dados
- Implementação de modelo preditivo de turnover com Machine Learning
- Integração entre camada analítica e modelo preditivo

---

## ▶️ Como executar o projeto

1. Baixar o dataset IBM HR Analytics (Kaggle)
2. Executar o script de ingestão em Python:
   - python ingestion.py
3. Executar os scripts SQL na ordem:
   - criação de database e schemas
   - carga na camada Bronze
   - transformação para Silver
   - criação das tabelas Gold
4. Conectar o Power BI ao SQL Server
5. Utilizar as tabelas da camada Gold para construção dos dashboards

---

## 🚀 Próximos Passos

- Aprimoramento do modelo preditivo (balanceamento de classes e tuning)
- Deploy automatizado do pipeline
- Integração com dados reais de RH
- Expansão para análises temporais (histórico de eventos)
- Deploy em ambiente cloud (GCP / Azure)

---

## 👨‍💻 Autor

Projeto desenvolvido como parte de portfólio em Data Analytics e People Analytics.