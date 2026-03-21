USE PeopleAnalytics;
GO

IF OBJECT_ID('gold.dim_faixa_etaria', 'U') IS NOT NULL
    DROP TABLE gold.dim_faixa_etaria;
GO

CREATE TABLE gold.dim_faixa_etaria (
    id_faixa_etaria INT IDENTITY(1,1) PRIMARY KEY,
    faixa_etaria VARCHAR(50) NOT NULL
);
GO

INSERT INTO gold.dim_faixa_etaria (faixa_etaria)
SELECT DISTINCT
    faixa_etaria
FROM silver.hr_employee
ORDER BY faixa_etaria;
GO