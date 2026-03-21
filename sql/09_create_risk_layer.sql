USE PeopleAnalytics;
GO

IF OBJECT_ID('gold.employee_risk_profile', 'U') IS NOT NULL
    DROP TABLE gold.employee_risk_profile;
GO

SELECT
    id_colaborador,
    departamento,
    cargo,
    idade,
    faixa_etaria,
    anos_empresa,
    faixa_tempo_empresa,
    salario_mensal,
    faixa_salarial,
    hora_extra,
    satisfacao_trabalho,
    satisfacao_ambiente,
    equilibrio_vida_trabalho,
    avaliacao_performance,
    flag_turnover,
    CASE
        WHEN (
            anos_empresa < 2
            AND hora_extra = 'Yes'
        )
        OR satisfacao_trabalho <= 2
        OR equilibrio_vida_trabalho <= 2
        THEN 'Alto risco'

        WHEN (
            anos_empresa BETWEEN 2 AND 5
            OR satisfacao_trabalho = 3
        )
        THEN 'Médio risco'

        ELSE 'Baixo risco'
    END AS classificacao_risco
INTO gold.employee_risk_profile
FROM silver.hr_employee;
GO

-- SELECT
--     classificacao_risco,
--     COUNT(*) AS total_colaboradores
-- FROM gold.employee_risk_profile
-- GROUP BY classificacao_risco
-- ORDER BY total_colaboradores DESC;

-- SELECT
--     classificacao_risco,
--     COUNT(*) AS total_colaboradores,
--     SUM(flag_turnover) AS total_desligados,
--     CAST(SUM(flag_turnover) * 1.0 / COUNT(*) AS DECIMAL(10,4)) AS taxa_turnover
-- FROM gold.employee_risk_profile
-- GROUP BY classificacao_risco
-- ORDER BY taxa_turnover DESC;