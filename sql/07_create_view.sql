USE PeopleAnalytics;
GO

IF OBJECT_ID('gold.vw_people_analytics', 'V') IS NOT NULL
    DROP VIEW gold.vw_people_analytics;
GO

CREATE VIEW gold.vw_people_analytics AS
SELECT
    id_colaborador,
    idade,
    genero,
    estado_civil,
    departamento,
    cargo,
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
    flag_turnover,
    faixa_etaria,
    faixa_tempo_empresa,
    faixa_salarial
FROM silver.hr_employee;
GO