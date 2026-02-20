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