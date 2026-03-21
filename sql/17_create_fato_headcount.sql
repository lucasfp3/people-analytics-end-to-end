USE PeopleAnalytics;
GO

CREATE TABLE gold.fato_headcount (
    id_fato_headcount INT IDENTITY(1,1) PRIMARY KEY,
    id_tempo INT NOT NULL,
    id_colaborador_sk INT NOT NULL,
    id_area INT NOT NULL,
    id_cargo INT NOT NULL,
    id_faixa_etaria INT NOT NULL,
    flag_ativo INT NOT NULL,
    salario_mensal INT NOT NULL,
    anos_totais_carreira INT NOT NULL,
    anos_empresa INT NOT NULL,
    anos_funcao_atual INT NOT NULL,
    anos_desde_ultima_promocao INT NOT NULL,
    anos_com_gestor_atual INT NOT NULL,
    hora_extra VARCHAR(10) NOT NULL,
    frequencia_viagem VARCHAR(50) NOT NULL,
    satisfacao_trabalho INT NOT NULL,
    satisfacao_ambiente INT NOT NULL,
    equilibrio_vida_trabalho INT NOT NULL,
    avaliacao_performance INT NOT NULL,
    faixa_tempo_empresa VARCHAR(50) NOT NULL,
    faixa_salarial VARCHAR(20) NOT NULL
);
GO

INSERT INTO gold.fato_headcount (
    id_tempo,
    id_colaborador_sk,
    id_area,
    id_cargo,
    id_faixa_etaria,
    flag_ativo,
    salario_mensal,
    anos_totais_carreira,
    anos_empresa,
    anos_funcao_atual,
    anos_desde_ultima_promocao,
    anos_com_gestor_atual,
    hora_extra,
    frequencia_viagem,
    satisfacao_trabalho,
    satisfacao_ambiente,
    equilibrio_vida_trabalho,
    avaliacao_performance,
    faixa_tempo_empresa,
    faixa_salarial
)
SELECT
    dt.id_tempo,
    dc.id_colaborador_sk,
    da.id_area,
    dg.id_cargo,
    dfe.id_faixa_etaria,
    CASE WHEN s.flag_turnover = 1 THEN 0 ELSE 1 END,
    s.salario_mensal,
    s.anos_totais_carreira,
    s.anos_empresa,
    s.anos_funcao_atual,
    s.anos_desde_ultima_promocao,
    s.anos_com_gestor_atual,
    s.hora_extra,
    s.frequencia_viagem,
    s.satisfacao_trabalho,
    s.satisfacao_ambiente,
    s.equilibrio_vida_trabalho,
    s.avaliacao_performance,
    s.faixa_tempo_empresa,
    s.faixa_salarial
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