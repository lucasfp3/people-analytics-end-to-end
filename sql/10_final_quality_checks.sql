USE PeopleAnalytics;
GO

-- 1. Contagem Bronze
-- SELECT COUNT(*) AS total_bronze
-- FROM bronze.hr_raw;
-- GO

-- 2. Contagem Silver
-- SELECT COUNT(*) AS total_silver
-- FROM silver.hr_employee;
-- GO

-- 3. Contagem View Gold
-- SELECT COUNT(*) AS total_view_gold
-- FROM gold.vw_people_analytics;
-- GO

-- 4. Duplicidade de colaborador
-- SELECT
--     id_colaborador,
--     COUNT(*) AS qtd
-- FROM silver.hr_employee
-- GROUP BY id_colaborador
-- HAVING COUNT(*) > 1;
-- GO

-- 5. Nulos críticos
-- SELECT
--     SUM(CASE WHEN id_colaborador IS NULL THEN 1 ELSE 0 END) AS nulo_id_colaborador,
--     SUM(CASE WHEN departamento IS NULL THEN 1 ELSE 0 END) AS nulo_departamento,
--     SUM(CASE WHEN cargo IS NULL THEN 1 ELSE 0 END) AS nulo_cargo,
--     SUM(CASE WHEN flag_turnover IS NULL THEN 1 ELSE 0 END) AS nulo_flag_turnover
-- FROM silver.hr_employee;
-- GO

-- 6. Resumo geral
-- SELECT *
-- FROM gold.kpi_resumo_geral;
-- GO

-- 7. Top turnover por cargo
-- SELECT TOP 10 *
-- FROM gold.kpi_turnover_cargo
-- ORDER BY taxa_turnover DESC;
-- GO

-- 8. Turnover por faixa de tempo de empresa
-- SELECT *
-- FROM gold.kpi_turnover_faixa_tempo_empresa
-- ORDER BY taxa_turnover DESC;
-- GO

-- 9. Turnover por faixa etária
-- SELECT *
-- FROM gold.kpi_turnover_faixa_etaria
-- ORDER BY taxa_turnover DESC;
-- GO

-- 10. Risco x turnover
-- SELECT
--     classificacao_risco,
--     COUNT(*) AS total_colaboradores,
--     SUM(flag_turnover) AS total_desligados,
--     CAST(SUM(flag_turnover) * 1.0 / COUNT(*) AS DECIMAL(10,4)) AS taxa_turnover
-- FROM gold.employee_risk_profile
-- GROUP BY classificacao_risco
-- ORDER BY taxa_turnover DESC;
-- GO