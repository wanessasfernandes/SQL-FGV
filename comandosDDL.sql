CREATE TABLE "pet_mortality"(
			"country" TEXT NULL,
			"ref_year" INTEGER NULL,
			"tot_deaths" INTEGER NULL
)

SELECT *
FROM pet_mortality

CREATE TABLE "uf" (
			"cd_uf" CHAR(2) NOT NULL PRIMARY KEY,
			"descr_uf" VARCHAR(50) NOT NULL
)

CREATE TABLE "cidade" (
			"cd_ibge" NUMERIC(8) NOT NULL PRIMARY KEY, 
			"descr_municipio" VARCHAR(100) NOT NULL, 
			"cd_uf" CHAR(2) NOT NULL, 
			FOREIGN KEY ("cd_uf")
			REFERENCES "uf"("cd_uf")
);

--ALTER TABLE
--ADD COLUMN 

--DROP TABLE uf;
--DROP TABLE cidade;

CREATE TABLE "relatorio_focus" (
			"ref_date" DATE NOT NULL PRIMARY KEY,
			"ipca" NUMERIC(5,2) NOT NULL,
			"pib" NUMERIC(5,2) NOT NULL,
			"dolar" NUMERIC(8,2) NOT NULL		
)


INSERT INTO relatorio_focus (ref_date, ipca, pib, dolar)
VALUES ('2024-06-21', 3.98, 2.09, 5.15),
		('2024-06-28', 4.00, 2.09, 5.20),
		('2024-07-05', 4.02, 2.10, 5.20),
		('2024-07-12', 4.00, 2.11, 5.22),
		('2024-07-19', 4.05, 2.15, 5.30)
		
ALTER TABLE relatorio_focus 
ADD COLUMN selic NUMERIC(5,2) NOT NULL;

SELECT *
FROM relatorio_focus 

UPDATE relatorio_focus 
SET selic = 10.5

CREATE TABLE relatorio_focus_temp (
	ref_date DATE NOT NULL PRIMARY KEY,
	ipca NUMERIC(5,2) NOT NULL,
	pib NUMERIC(5,2) NOT NULL,
	dolar NUMERIC(8,2) NOT NULL,
	selic NUMERIC(5,2) NOT NULL
);

INSERT INTO relatorio_focus_temp 
SELECT * FROM relatorio_focus;

SELECT * 
FROM relatorio_focus_temp;

DROP TABLE relatorio_focus;

ALTER TABLE relatorio_focus_temp 
RENAME TO relatorio_focus;

SELECT * 
FROM relatorio_focus;

ALTER TABLE relatorio_focus 
RENAME TO focus_report;

DROP TABLE focus_report;