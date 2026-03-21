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