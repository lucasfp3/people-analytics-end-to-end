USE PeopleAnalytics;
GO

IF OBJECT_ID('gold.dim_colaborador', 'U') IS NOT NULL
    DROP TABLE gold.dim_colaborador;
GO

CREATE TABLE gold.dim_colaborador (
    id_colaborador_sk INT IDENTITY(1,1) PRIMARY KEY,
    id_colaborador INT NOT NULL,
    idade INT NOT NULL,
    genero VARCHAR(20) NOT NULL,
    estado_civil VARCHAR(30) NOT NULL,
    frequencia_viagem VARCHAR(50) NOT NULL,
    salario_mensal INT NOT NULL,
    anos_totais_carreira INT NOT NULL,
    anos_empresa INT NOT NULL,
    anos_funcao_atual INT NOT NULL,
    anos_desde_ultima_promocao INT NOT NULL,
    anos_com_gestor_atual INT NOT NULL,
    hora_extra VARCHAR(10) NOT NULL,
    satisfacao_trabalho INT NOT NULL,
    satisfacao_ambiente INT NOT NULL,
    equilibrio_vida_trabalho INT NOT NULL,
    avaliacao_performance INT NOT NULL,
    faixa_tempo_empresa VARCHAR(50) NOT NULL,
    faixa_salarial VARCHAR(20) NOT NULL
);
GO

INSERT INTO gold.dim_colaborador (
    id_colaborador,
    idade,
    genero,
    estado_civil,
    frequencia_viagem,
    salario_mensal,
    anos_totais_carreira,
    anos_empresa,
    anos_funcao_atual,
    anos_desde_ultima_promocao,
    anos_com_gestor_atual,
    hora_extra,
    satisfacao_trabalho,
    satisfacao_ambiente,
    equilibrio_vida_trabalho,
    avaliacao_performance,
    faixa_tempo_empresa,
    faixa_salarial
)
SELECT
    id_colaborador,
    idade,
    genero,
    estado_civil,
    frequencia_viagem,
    salario_mensal,
    anos_totais_carreira,
    anos_empresa,
    anos_funcao_atual,
    anos_desde_ultima_promocao,
    anos_com_gestor_atual,
    hora_extra,
    satisfacao_trabalho,
    satisfacao_ambiente,
    equilibrio_vida_trabalho,
    avaliacao_performance,
    faixa_tempo_empresa,
    faixa_salarial
FROM silver.hr_employee;
GO