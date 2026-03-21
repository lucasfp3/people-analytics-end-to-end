USE PeopleAnalytics;
GO

CREATE TABLE gold.dim_colaborador (
    id_colaborador_sk INT IDENTITY(1,1) PRIMARY KEY,
    id_colaborador INT NOT NULL,
    idade INT NOT NULL,
    genero VARCHAR(20) NOT NULL,
    estado_civil VARCHAR(30) NOT NULL,
    CONSTRAINT uq_dim_colaborador_id UNIQUE (id_colaborador)
);
GO

INSERT INTO gold.dim_colaborador (
    id_colaborador,
    idade,
    genero,
    estado_civil
)
SELECT DISTINCT
    id_colaborador,
    idade,
    genero,
    estado_civil
FROM silver.hr_employee;
GO