# 📘 Dicionário de Dados

## 🧱 silver.hr_employee

Tabela analítica contendo dados tratados de colaboradores.

| Coluna                     | Descrição |
|----------------------------|----------|
| id_colaborador            | Identificador único do colaborador |
| idade                     | Idade do colaborador |
| genero                    | Gênero |
| estado_civil              | Estado civil |
| departamento              | Área da empresa |
| cargo                     | Cargo ocupado |
| frequencia_viagem         | Frequência de viagens |
| salario_mensal            | Salário mensal |
| anos_empresa              | Tempo de empresa |
| anos_funcao_atual         | Tempo na função atual |
| anos_desde_ultima_promocao| Tempo desde última promoção |
| hora_extra                | Indica se faz hora extra |
| satisfacao_trabalho       | Nível de satisfação |
| equilibrio_vida_trabalho  | Work-life balance |
| avaliacao_performance     | Avaliação de performance |
| flag_turnover             | 1 = desligado / 0 = ativo |
| faixa_etaria              | Faixa de idade |
| faixa_tempo_empresa       | Faixa de tempo de empresa |
| faixa_salarial            | Faixa salarial |

---

## 🧱 gold.kpi_turnover_departamento

Tabela agregada com indicadores de turnover por área.

| Coluna              | Descrição |
|---------------------|----------|
| departamento        | Área |
| total_colaboradores | Total de colaboradores |
| total_desligados    | Total de desligamentos |
| taxa_turnover       | Percentual de turnover |

---

## 🧱 gold.employee_risk_profile

Tabela com classificação de risco de turnover.

| Coluna              | Descrição |
|---------------------|----------|
| id_colaborador      | Identificador |
| classificacao_risco | Alto, Médio ou Baixo risco |
| flag_turnover       | Indica desligamento |