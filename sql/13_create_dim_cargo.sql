USE PeopleAnalytics;
GO

IF OBJECT_ID('gold.dim_cargo', 'U') IS NOT NULL
    DROP TABLE gold.dim_cargo;
GO

CREATE TABLE gold.dim_cargo (
    id_cargo INT IDENTITY(1,1) PRIMARY KEY,
    cargo VARCHAR(100) NOT NULL
);
GO

INSERT INTO gold.dim_cargo (cargo)
SELECT DISTINCT
    cargo
FROM silver.hr_employee
ORDER BY cargo;
GO