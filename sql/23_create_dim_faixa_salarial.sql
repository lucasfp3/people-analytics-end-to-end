USE PeopleAnalytics;
GO

IF OBJECT_ID('gold.dim_faixa_salarial', 'U') IS NOT NULL
    DROP TABLE gold.dim_faixa_salarial;
GO

CREATE TABLE gold.dim_faixa_salarial (
    id_faixa_salarial INT IDENTITY(1,1) PRIMARY KEY,
    faixa_salarial VARCHAR(20) NOT NULL,
    CONSTRAINT uq_dim_faixa_salarial UNIQUE (faixa_salarial)
);
GO

INSERT INTO gold.dim_faixa_salarial (faixa_salarial)
SELECT DISTINCT
    faixa_salarial
FROM silver.hr_employee;
GO