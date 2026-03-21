USE PeopleAnalytics;
GO

IF OBJECT_ID('silver.hr_employee', 'U') IS NOT NULL
    DROP TABLE silver.hr_employee;
GO

SELECT
    -- Identificação
    employeenumber                                  AS id_colaborador,

    -- Demográfico
    age                                             AS idade,
    gender                                          AS genero,
    maritalstatus                                   AS estado_civil,

    -- Organizacional
    department                                      AS departamento,
    jobrole                                         AS cargo,
    businesstravel                                  AS frequencia_viagem,

    -- Financeiro
    monthlyincome                                   AS salario_mensal,

    -- Tempo
    totalworkingyears                               AS anos_totais_carreira,
    yearsatcompany                                  AS anos_empresa,
    yearsincurrentrole                              AS anos_funcao_atual,
    yearssincelastpromotion                         AS anos_desde_ultima_promocao,
    yearswithcurrmanager                            AS anos_com_gestor_atual,

    -- Comportamento
    overtime                                        AS hora_extra,

    -- Satisfação
    jobsatisfaction                                 AS satisfacao_trabalho,
    environmentsatisfaction                         AS satisfacao_ambiente,
    worklifebalance                                 AS equilibrio_vida_trabalho,

    -- Performance
    performancerating                               AS avaliacao_performance,

    -- REGRA DE NEGÓCIO
    CASE
        WHEN attrition = 'Yes' THEN 1
        ELSE 0
    END                                             AS flag_turnover,

    -- ENRIQUECIMENTO
    CASE
        WHEN age < 30 THEN 'Até 29'
        WHEN age BETWEEN 30 AND 39 THEN '30 a 39'
        WHEN age BETWEEN 40 AND 49 THEN '40 a 49'
        ELSE '50+'
    END                                             AS faixa_etaria,

    CASE
        WHEN yearsatcompany < 2 THEN 'Até 2 anos'
        WHEN yearsatcompany BETWEEN 2 AND 5 THEN '2 a 5 anos'
        WHEN yearsatcompany BETWEEN 6 AND 10 THEN '6 a 10 anos'
        ELSE '10+ anos'
    END                                             AS faixa_tempo_empresa,

    CASE
        WHEN monthlyincome < 3000 THEN 'Baixa'
        WHEN monthlyincome BETWEEN 3000 AND 7000 THEN 'Média'
        ELSE 'Alta'
    END                                             AS faixa_salarial

INTO silver.hr_employee
FROM bronze.hr_raw;
GO