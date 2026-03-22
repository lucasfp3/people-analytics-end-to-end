USE PeopleAnalytics;
GO

IF OBJECT_ID('gold.dim_hora_extra', 'U') IS NOT NULL
    DROP TABLE gold.dim_hora_extra;
GO

CREATE TABLE gold.dim_hora_extra (
    id_hora_extra INT IDENTITY(1,1) PRIMARY KEY,
    hora_extra VARCHAR(10) NOT NULL,
    CONSTRAINT uq_dim_hora_extra UNIQUE (hora_extra)
);
GO

INSERT INTO gold.dim_hora_extra (hora_extra)
SELECT DISTINCT
    hora_extra
FROM silver.hr_employee;
GO