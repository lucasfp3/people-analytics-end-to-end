USE PeopleAnalytics;
GO

IF OBJECT_ID('gold.dim_frequencia_viagem', 'U') IS NOT NULL
    DROP TABLE gold.dim_frequencia_viagem;
GO

CREATE TABLE gold.dim_frequencia_viagem (
    id_frequencia_viagem INT IDENTITY(1,1) PRIMARY KEY,
    frequencia_viagem VARCHAR(50) NOT NULL,
    CONSTRAINT uq_dim_frequencia_viagem UNIQUE (frequencia_viagem)
);
GO

INSERT INTO gold.dim_frequencia_viagem (frequencia_viagem)
SELECT DISTINCT
    frequencia_viagem
FROM silver.hr_employee;
GO