USE PeopleAnalytics;
GO

IF OBJECT_ID('gold.dim_area', 'U') IS NOT NULL
    DROP TABLE gold.dim_area;
GO

CREATE TABLE gold.dim_area (
    id_area INT IDENTITY(1,1) PRIMARY KEY,
    departamento VARCHAR(100) NOT NULL
);
GO

INSERT INTO gold.dim_area (departamento)
SELECT DISTINCT
    departamento
FROM silver.hr_employee
ORDER BY departamento;
GO