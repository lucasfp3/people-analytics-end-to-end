USE PeopleAnalytics;
GO

IF OBJECT_ID('gold.dim_faixa_tempo_empresa', 'U') IS NOT NULL
    DROP TABLE gold.dim_faixa_tempo_empresa;
GO

CREATE TABLE gold.dim_faixa_tempo_empresa (
    id_faixa_tempo_empresa INT IDENTITY(1,1) PRIMARY KEY,
    faixa_tempo_empresa VARCHAR(50) NOT NULL,
    CONSTRAINT uq_dim_faixa_tempo_empresa UNIQUE (faixa_tempo_empresa)
);
GO

INSERT INTO gold.dim_faixa_tempo_empresa (faixa_tempo_empresa)
SELECT DISTINCT
    faixa_tempo_empresa
FROM silver.hr_employee;
GO