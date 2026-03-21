USE PeopleAnalytics;
GO

IF OBJECT_ID('gold.kpi_turnover_departamento', 'U') IS NOT NULL
    DROP TABLE gold.kpi_turnover_departamento;
GO

SELECT
    departamento,
    COUNT(*) AS total_colaboradores,
    SUM(flag_turnover) AS total_desligados,
    CAST(SUM(flag_turnover) * 1.0 / COUNT(*) AS DECIMAL(10,4)) AS taxa_turnover
INTO gold.kpi_turnover_departamento
FROM silver.hr_employee
GROUP BY departamento;
GO


IF OBJECT_ID('gold.kpi_turnover_cargo', 'U') IS NOT NULL
    DROP TABLE gold.kpi_turnover_cargo;
GO

SELECT
    cargo,
    COUNT(*) AS total_colaboradores,
    SUM(flag_turnover) AS total_desligados,
    CAST(SUM(flag_turnover) * 1.0 / COUNT(*) AS DECIMAL(10,4)) AS taxa_turnover
INTO gold.kpi_turnover_cargo
FROM silver.hr_employee
GROUP BY cargo;
GO


IF OBJECT_ID('gold.kpi_turnover_faixa_etaria', 'U') IS NOT NULL
    DROP TABLE gold.kpi_turnover_faixa_etaria;
GO

SELECT
    faixa_etaria,
    COUNT(*) AS total_colaboradores,
    SUM(flag_turnover) AS total_desligados,
    CAST(SUM(flag_turnover) * 1.0 / COUNT(*) AS DECIMAL(10,4)) AS taxa_turnover
INTO gold.kpi_turnover_faixa_etaria
FROM silver.hr_employee
GROUP BY faixa_etaria;
GO


IF OBJECT_ID('gold.kpi_turnover_faixa_tempo_empresa', 'U') IS NOT NULL
    DROP TABLE gold.kpi_turnover_faixa_tempo_empresa;
GO

SELECT
    faixa_tempo_empresa,
    COUNT(*) AS total_colaboradores,
    SUM(flag_turnover) AS total_desligados,
    CAST(SUM(flag_turnover) * 1.0 / COUNT(*) AS DECIMAL(10,4)) AS taxa_turnover
INTO gold.kpi_turnover_faixa_tempo_empresa
FROM silver.hr_employee
GROUP BY faixa_tempo_empresa;
GO


IF OBJECT_ID('gold.kpi_headcount_departamento', 'U') IS NOT NULL
    DROP TABLE gold.kpi_headcount_departamento;
GO

SELECT
    departamento,
    COUNT(*) AS headcount
INTO gold.kpi_headcount_departamento
FROM silver.hr_employee
GROUP BY departamento;
GO


IF OBJECT_ID('gold.kpi_salario_departamento', 'U') IS NOT NULL
    DROP TABLE gold.kpi_salario_departamento;
GO

SELECT
    departamento,
    AVG(CAST(salario_mensal AS DECIMAL(10,2))) AS salario_medio
INTO gold.kpi_salario_departamento
FROM silver.hr_employee
GROUP BY departamento;
GO


IF OBJECT_ID('gold.kpi_resumo_geral', 'U') IS NOT NULL
    DROP TABLE gold.kpi_resumo_geral;
GO

SELECT
    COUNT(*) AS total_colaboradores,
    SUM(flag_turnover) AS total_desligados,
    CAST(SUM(flag_turnover) * 1.0 / COUNT(*) AS DECIMAL(10,4)) AS taxa_turnover_geral,
    AVG(CAST(salario_mensal AS DECIMAL(10,2))) AS salario_medio_geral,
    AVG(CAST(anos_empresa AS DECIMAL(10,2))) AS media_anos_empresa
INTO gold.kpi_resumo_geral
FROM silver.hr_employee;
GO