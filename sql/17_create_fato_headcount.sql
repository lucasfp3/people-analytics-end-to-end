USE PeopleAnalytics;
GO

IF OBJECT_ID('gold.fato_headcount', 'U') IS NOT NULL
    DROP TABLE gold.fato_headcount;
GO

CREATE TABLE gold.fato_headcount (
    id_fato_headcount INT IDENTITY(1,1) PRIMARY KEY,
    id_tempo INT NOT NULL,
    id_colaborador_sk INT NOT NULL,
    id_area INT NOT NULL,
    id_cargo INT NOT NULL,
    id_faixa_etaria INT NOT NULL,
    flag_ativo INT NOT NULL
);
GO

INSERT INTO gold.fato_headcount (
    id_tempo,
    id_colaborador_sk,
    id_area,
    id_cargo,
    id_faixa_etaria,
    flag_ativo
)
SELECT
    dt.id_tempo,
    dc.id_colaborador_sk,
    da.id_area,
    dg.id_cargo,
    dfe.id_faixa_etaria,
    CASE
        WHEN s.flag_turnover = 1 THEN 0
        ELSE 1
    END AS flag_ativo
FROM silver.hr_employee s
INNER JOIN gold.dim_colaborador dc
    ON s.id_colaborador = dc.id_colaborador
INNER JOIN gold.dim_area da
    ON s.departamento = da.departamento
INNER JOIN gold.dim_cargo dg
    ON s.cargo = dg.cargo
INNER JOIN gold.dim_faixa_etaria dfe
    ON s.faixa_etaria = dfe.faixa_etaria
CROSS JOIN gold.dim_tempo dt;
GO