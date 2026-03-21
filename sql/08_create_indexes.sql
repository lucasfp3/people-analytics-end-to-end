USE PeopleAnalytics;
GO

IF EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = 'idx_hr_employee_id'
      AND object_id = OBJECT_ID('silver.hr_employee')
)
    DROP INDEX idx_hr_employee_id ON silver.hr_employee;
GO

CREATE INDEX idx_hr_employee_id
ON silver.hr_employee (id_colaborador);
GO


-- Validações
-- SELECT
--     i.name AS nome_indice,
--     t.name AS nome_tabela
-- FROM sys.indexes i
-- JOIN sys.tables t
--     ON i.object_id = t.object_id
-- JOIN sys.schemas s
--     ON t.schema_id = s.schema_id
-- WHERE s.name = 'silver'
--   AND t.name = 'hr_employee';