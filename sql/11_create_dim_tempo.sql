USE PeopleAnalytics;
GO

IF OBJECT_ID('gold.dim_tempo', 'U') IS NOT NULL
    DROP TABLE gold.dim_tempo;
GO

CREATE TABLE gold.dim_tempo (
    id_tempo INT IDENTITY(1,1) PRIMARY KEY,
    data_referencia DATE NOT NULL,
    ano INT NOT NULL,
    mes INT NOT NULL,
    nome_mes VARCHAR(20) NOT NULL,
    trimestre INT NOT NULL
);
GO

INSERT INTO gold.dim_tempo (
    data_referencia,
    ano,
    mes,
    nome_mes,
    trimestre
)
SELECT
    CAST(GETDATE() AS DATE) AS data_referencia,
    YEAR(GETDATE()) AS ano,
    MONTH(GETDATE()) AS mes,
    DATENAME(MONTH, GETDATE()) AS nome_mes,
    DATEPART(QUARTER, GETDATE()) AS trimestre;
GO