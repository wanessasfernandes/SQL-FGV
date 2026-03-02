-- GROUP BY 

SELECT gp.ref_year, 
	AVG(gp.gdp_pc) AS avg_gdp_pc
FROM gdp_pc gp 
JOIN country c ON c.country = gp.country 
WHERE gp.ref_year BETWEEN 2018 AND 2022 
	AND c.four_regions = 'americas'
GROUP BY gp.ref_year;

SELECT c.four_regions,
	gp.ref_year, 
	ROUND(AVG(gp.gdp_pc), 2) AS avg_gdp_pc
FROM gdp_pc gp 
JOIN country c ON c.country = gp.country 
WHERE gp.ref_year BETWEEN 2018 AND 2022
GROUP BY c.four_regions, 
	gp.ref_year 
ORDER BY c.four_regions, 
	gp.ref_year;

SELECT c.wb3income,
	MAX(ai.mean_usd) AS max,
	MIN(ai.mean_usd) AS min, 
	AVG(ai.mean_usd) AS media
FROM country c 
JOIN avg_income ai 
	ON ai.country = c.country 
WHERE ai.ref_year = 2020
GROUP BY c.wb3income 
ORDER BY media DESC;

SELECT  c.eight_regions AS regiao,
		le.ref_year AS ano,
		ROUND(AVG(le.tot_years), 2) AS expc_med
FROM country c 
JOIN life_expectancy le 
	ON c.country = le.country 
WHERE le.ref_year BETWEEN 2019 AND 2021
GROUP BY c.eight_regions, 
	le.ref_year 
ORDER BY c.eight_regions,
	le.ref_year;

SELECT c.wb_regions,
		ROUND(SUM((cep.co2_pc * p.tot_pop)/1e9), 2) AS soma
FROM co2_emissions_pc cep 
JOIN population p  
	ON p.country = cep.country AND cep.ref_year = p.ref_year
JOIN country c 
	ON c.country = p.country 
WHERE cep.ref_year = 2022
GROUP BY c.wb_regions
ORDER BY soma DESC;

-- HAVING 

SELECT c.four_regions, 
	gp.ref_year, 
	ROUND(AVG(gp.gdp_pc), 2) AS avg_gdp_pc
FROM gdp_pc gp 
JOIN country c ON c.country = gp.country
WHERE gp.ref_year BETWEEN 2018 AND 2022
GROUP BY c.four_regions, 
	gp.ref_year 
HAVING avg_gdp_pc > 17000
ORDER BY c.four_regions, 
	gp.ref_year;

SELECT c.four_regions, 
	gp.ref_year, 
	ROUND(AVG(gp.gdp_pc), 2) AS avg_gdp_pc
FROM gdp_pc gp 
JOIN country c ON c.country = gp.country
WHERE gp.ref_year BETWEEN 2018 AND 2022
GROUP BY c.four_regions, 
	gp.ref_year 
HAVING avg_gdp_pc BETWEEN 17000 AND 20000
ORDER BY c.four_regions, 
	gp.ref_year;

SELECT c.four_regions, 
	gp.ref_year, 
	ROUND(AVG(gp.gdp_pc), 2) AS avg_gdp_pc
FROM gdp_pc gp 
JOIN country c ON c.country = gp.country
WHERE gp.ref_year BETWEEN 2018 AND 2022
GROUP BY c.four_regions, 
	gp.ref_year 
HAVING NOT avg_gdp_pc > 17000
ORDER BY c.four_regions, 
	gp.ref_year;

SELECT c.wb_regions,
		AVG(cm.tot_deaths) AS med_death
FROM country c 
JOIN child_mortality cm 
	ON c.country = cm.country 
WHERE cm.ref_year = 2010
GROUP BY c.wb_regions 
HAVING med_death < 20
ORDER BY med_death;

SELECT le.ref_year,
	MIN(le.tot_years) AS min,
	AVG(le.tot_years ) AS med,
	MAX(le.tot_years ) AS max
FROM country c
JOIN life_expectancy le
	ON c.country = le.country 
WHERE le.ref_year IN (1990, 2000, 2010, 2020)
	AND wb_regions = 'Latin America & Caribbean'
GROUP BY le.ref_year
ORDER BY le.ref_year;

SELECT c.wb4income, 
	ROUND(AVG(ai.mean_usd), 2) AS med_pc,
	ROUND(AVG(gp.gdp_pc), 2) AS med_PIB
FROM country c
JOIN avg_income ai 
	ON ai.country = c.country 
JOIN gdp_pc gp 
	ON ai.country = c.country AND ai.ref_year = gp.ref_year
WHERE ai.ref_year = 2019
GROUP BY c.wb4income
ORDER BY med_pc,
		med_PIB DESC;

SELECT c.wb4income,
	AVG(m.mean_years - w.mean_years) AS med_tempo
FROM women_years_at_school w
JOIN men_years_at_school m
	ON m.country = w.country AND m.ref_year = w.ref_year
JOIN country c 
	ON c.country = w.country 	
WHERE m.ref_year = 2000
GROUP BY c.wb4income
ORDER BY med_tempo;

SELECT c.wb_regions,
	AVG(m.mean_years - w.mean_years) AS med_tempo
FROM women_years_at_school w
JOIN men_years_at_school m
	ON m.country = w.country AND m.ref_year = w.ref_year
JOIN country c 
	ON c.country = w.country 	
WHERE m.ref_year = 2000
GROUP BY c.wb_regions 
ORDER BY med_tempo;
-- COUNT

SELECT COUNT(*)
FROM women_years_at_school wyas;

SELECT COUNT(DISTINCT country)
FROM women_years_at_school wyas;

SELECT COUNT(DISTINCT ref_year)
FROM women_years_at_school wyas;

SELECT COUNT(DISTINCT ref_year), MIN(ref_year), MAX(ref_year)
FROM women_years_at_school wyas;

SELECT country, COUNT(*)
FROM women_years_at_school wyas 
GROUP BY country;

SELECT count(*)
FROM women_years_at_school wyas 
WHERE wyas.mean_years IS NULL;

SELECT ref_year, count(*)
FROM women_years_at_school wyas
GROUP BY ref_year;