-- SELECT COUNT(*) FROM silver.hr_employee;

-- SELECT TOP 10 * FROM silver.hr_employee;

-- SELECT flag_turnover, COUNT(*)
-- FROM silver.hr_employee
-- GROUP BY flag_turnover;

-- SELECT
--     departamento,
--     AVG(CAST(flag_turnover AS FLOAT)) AS taxa_turnover
-- FROM silver.hr_employee
-- GROUP BY departamento
-- ORDER BY taxa_turnover DESC;
