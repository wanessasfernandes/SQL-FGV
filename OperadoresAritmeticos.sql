-- Operadores Aritméticos 

SELECT cm.ref_year, 
	 cm.tot_deaths,
	 cm.tot_deaths / 10 as percent_deaths
FROM child_mortality cm 
WHERE cm.ref_year in (1910, 1920, 1930, 1940, 1950, 1960, 1970, 
						1980, 1990, 2000, 2010, 2020)
	AND cm.country = 'Brazil'
ORDER BY cm.ref_year;

SELECT gp.country, 
		gp.gdp_pc, 
		p.tot_pop, 
		(gp.gdp_pc * p.tot_pop)/1E6 AS pib_tot
FROM gdp_pc gp 
JOIN population p 
	ON gp.country = p.country AND gp.ref_year = p.ref_year 
WHERE gp.ref_year = 2022
ORDER BY pib_tot DESC
LIMIT 10;

SELECT cep.ref_year,
		cep.co2_pc 
FROM co2_emissions_pc cep 
WHERE ref_year BETWEEN 1972 AND 2016
	AND ref_year % 4 = 0
	AND country = 'Portugal'
ORDER BY ref_year;

-- SUMARIZANDO DADOS 

SELECT AVG(gp.gdp_pc) AS avg_gdp_pc 
FROM gdp_pc gp 
JOIN country c 
	ON c.country = gp.country 
WHERE gp.ref_year = 2020
	AND c.four_regions = 'americas';
SELECT SUM(ai.mean_usd) AS "sum", 
	AVG(ai.mean_usd) AS mean, 
	MAX(ai.mean_usd), 
	MIN(ai.mean_usd) AS "min", 
	COUNT(ai.mean_usd) AS "count"
FROM avg_income ai 
JOIN country c 
	ON ai.country = c.country 
WHERE ai.ref_year = 2020
	AND c.four_regions = 'europe';