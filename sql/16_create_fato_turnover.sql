USE PeopleAnalytics;
GO

CREATE TABLE gold.fato_turnover (
    id_fato_turnover INT IDENTITY(1,1) PRIMARY KEY,
    id_tempo INT NOT NULL,
    id_colaborador_sk INT NOT NULL,
    id_area INT NOT NULL,
    id_cargo INT NOT NULL,
    id_faixa_etaria INT NOT NULL,
    id_hora_extra INT NOT NULL,
    id_frequencia_viagem INT NOT NULL,
    id_faixa_tempo_empresa INT NOT NULL,
    id_faixa_salarial INT NOT NULL,
    flag_turnover INT NOT NULL,
    salario_mensal INT NOT NULL,
    anos_totais_carreira INT NOT NULL,
    anos_empresa INT NOT NULL,
    anos_funcao_atual INT NOT NULL,
    anos_desde_ultima_promocao INT NOT NULL,
    anos_com_gestor_atual INT NOT NULL,
    satisfacao_trabalho INT NOT NULL,
    satisfacao_ambiente INT NOT NULL,
    equilibrio_vida_trabalho INT NOT NULL,
    avaliacao_performance INT NOT NULL
);
GO

INSERT INTO gold.fato_turnover (
    id_tempo,
    id_colaborador_sk,
    id_area,
    id_cargo,
    id_faixa_etaria,
    id_hora_extra,
    id_frequencia_viagem,
    id_faixa_tempo_empresa,
    id_faixa_salarial,
    flag_turnover,
    salario_mensal,
    anos_totais_carreira,
    anos_empresa,
    anos_funcao_atual,
    anos_desde_ultima_promocao,
    anos_com_gestor_atual,
    satisfacao_trabalho,
    satisfacao_ambiente,
    equilibrio_vida_trabalho,
    avaliacao_performance
)
SELECT
    dt.id_tempo,
    dc.id_colaborador_sk,
    da.id_area,
    dg.id_cargo,
    dfe.id_faixa_etaria,
    dhe.id_hora_extra,
    dfv.id_frequencia_viagem,
    dte.id_faixa_tempo_empresa,
    dfs.id_faixa_salarial,
    s.flag_turnover,
    s.salario_mensal,
    s.anos_totais_carreira,
    s.anos_empresa,
    s.anos_funcao_atual,
    s.anos_desde_ultima_promocao,
    s.anos_com_gestor_atual,
    s.satisfacao_trabalho,
    s.satisfacao_ambiente,
    s.equilibrio_vida_trabalho,
    s.avaliacao_performance
FROM silver.hr_employee s
INNER JOIN gold.dim_colaborador dc
    ON s.id_colaborador = dc.id_colaborador
INNER JOIN gold.dim_area da
    ON s.departamento = da.departamento
INNER JOIN gold.dim_cargo dg
    ON s.cargo = dg.cargo
INNER JOIN gold.dim_faixa_etaria dfe
    ON s.faixa_etaria = dfe.faixa_etaria
INNER JOIN gold.dim_hora_extra dhe
    ON s.hora_extra = dhe.hora_extra
INNER JOIN gold.dim_frequencia_viagem dfv
    ON s.frequencia_viagem = dfv.frequencia_viagem
INNER JOIN gold.dim_faixa_tempo_empresa dte
    ON s.faixa_tempo_empresa = dte.faixa_tempo_empresa
INNER JOIN gold.dim_faixa_salarial dfs
    ON s.faixa_salarial = dfs.faixa_salarial
CROSS JOIN gold.dim_tempo dt;
GO