USE PeopleAnalytics;
GO

ALTER TABLE gold.fato_turnover
ADD CONSTRAINT fk_fato_turnover_tempo
FOREIGN KEY (id_tempo) REFERENCES gold.dim_tempo(id_tempo);
GO
ALTER TABLE gold.fato_turnover
ADD CONSTRAINT fk_fato_turnover_colaborador
FOREIGN KEY (id_colaborador_sk) REFERENCES gold.dim_colaborador(id_colaborador_sk);
GO
ALTER TABLE gold.fato_turnover
ADD CONSTRAINT fk_fato_turnover_area
FOREIGN KEY (id_area) REFERENCES gold.dim_area(id_area);
GO
ALTER TABLE gold.fato_turnover
ADD CONSTRAINT fk_fato_turnover_cargo
FOREIGN KEY (id_cargo) REFERENCES gold.dim_cargo(id_cargo);
GO
ALTER TABLE gold.fato_turnover
ADD CONSTRAINT fk_fato_turnover_faixa_etaria
FOREIGN KEY (id_faixa_etaria) REFERENCES gold.dim_faixa_etaria(id_faixa_etaria);
GO
ALTER TABLE gold.fato_turnover
ADD CONSTRAINT fk_fato_turnover_hora_extra
FOREIGN KEY (id_hora_extra) REFERENCES gold.dim_hora_extra(id_hora_extra);
GO
ALTER TABLE gold.fato_turnover
ADD CONSTRAINT fk_fato_turnover_frequencia_viagem
FOREIGN KEY (id_frequencia_viagem) REFERENCES gold.dim_frequencia_viagem(id_frequencia_viagem);
GO
ALTER TABLE gold.fato_turnover
ADD CONSTRAINT fk_fato_turnover_faixa_tempo_empresa
FOREIGN KEY (id_faixa_tempo_empresa) REFERENCES gold.dim_faixa_tempo_empresa(id_faixa_tempo_empresa);
GO
ALTER TABLE gold.fato_turnover
ADD CONSTRAINT fk_fato_turnover_faixa_salarial
FOREIGN KEY (id_faixa_salarial) REFERENCES gold.dim_faixa_salarial(id_faixa_salarial);
GO

ALTER TABLE gold.fato_headcount
ADD CONSTRAINT fk_fato_headcount_tempo
FOREIGN KEY (id_tempo) REFERENCES gold.dim_tempo(id_tempo);
GO
ALTER TABLE gold.fato_headcount
ADD CONSTRAINT fk_fato_headcount_colaborador
FOREIGN KEY (id_colaborador_sk) REFERENCES gold.dim_colaborador(id_colaborador_sk);
GO
ALTER TABLE gold.fato_headcount
ADD CONSTRAINT fk_fato_headcount_area
FOREIGN KEY (id_area) REFERENCES gold.dim_area(id_area);
GO
ALTER TABLE gold.fato_headcount
ADD CONSTRAINT fk_fato_headcount_cargo
FOREIGN KEY (id_cargo) REFERENCES gold.dim_cargo(id_cargo);
GO
ALTER TABLE gold.fato_headcount
ADD CONSTRAINT fk_fato_headcount_faixa_etaria
FOREIGN KEY (id_faixa_etaria) REFERENCES gold.dim_faixa_etaria(id_faixa_etaria);
GO
ALTER TABLE gold.fato_headcount
ADD CONSTRAINT fk_fato_headcount_hora_extra
FOREIGN KEY (id_hora_extra) REFERENCES gold.dim_hora_extra(id_hora_extra);
GO
ALTER TABLE gold.fato_headcount
ADD CONSTRAINT fk_fato_headcount_frequencia_viagem
FOREIGN KEY (id_frequencia_viagem) REFERENCES gold.dim_frequencia_viagem(id_frequencia_viagem);
GO
ALTER TABLE gold.fato_headcount
ADD CONSTRAINT fk_fato_headcount_faixa_tempo_empresa
FOREIGN KEY (id_faixa_tempo_empresa) REFERENCES gold.dim_faixa_tempo_empresa(id_faixa_tempo_empresa);
GO
ALTER TABLE gold.fato_headcount
ADD CONSTRAINT fk_fato_headcount_faixa_salarial
FOREIGN KEY (id_faixa_salarial) REFERENCES gold.dim_faixa_salarial(id_faixa_salarial);
GO