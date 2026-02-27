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

SELECT p.Date,
		(p.Close + p.Open)/2 AS mean,
		(p.Close - p.Open) AS range
FROM petrobras p 
WHERE Date BETWEEN '2020-02-20' AND '2020-03-20'
	AND (p.Close + p.Open)/2 > 0
	AND (p.Close - p.Open) > 0

SELECT DISTINCT w.country
FROM women_years_at_school w
JOIN men_years_at_school m
	ON w.country = m.country AND m.ref_year = w.ref_year 
JOIN country c ON c.country = w.country
WHERE (w.mean_years - m.mean_years) <= 1
	AND m.ref_year BETWEEN 2001 AND 2010
	AND c.four_regions = 'africa';
	
SELECT cm.ref_year,
		cm.tot_deaths,
		cm.tot_deaths / 10 AS percent_deaths
FROM child_mortality cm 
WHERE cm.country = 'Brazil'
	AND cm.ref_year BETWEEN 1910 AND 2020 
	AND cm.ref_year % 10 = 0
ORDER BY cm.ref_year;


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

SELECT c.country,
		c.wb_regions,
		MIN(le.tot_years) AS minimo_year,
		MAX(le.tot_years) AS maximo_year,
		AVG(le.tot_years) AS media_year
FROM life_expectancy le 
JOIN country c 
	ON c.country = le.country 
WHERE c.wb_regions = 'Latin America & Caribbean'
	AND le.ref_year = 1990;

SELECT ai.country,
		AVG(gp.gdp_pc) AS pib_pc,
		AVG(ai.mean_usd) AS renda_pc
FROM avg_income ai
JOIN gdp_pc gp 
	ON ai.country = gp.country AND ai.ref_year = gp.ref_year 
WHERE ai.ref_year = 2019;

SELECT AVG(m.mean_years - w.mean_years) AS avg_diff
FROM women_years_at_school w
JOIN men_years_at_school m
	ON m.country = w.country AND m.ref_year = w.ref_year 
WHERE m.ref_year = 2000;