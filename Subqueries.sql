-- SUBQUERIES 

SELECT le.country, le.tot_years 
FROM life_expectancy le 
WHERE le.ref_year = 2000
	AND le.tot_years = (
		SELECT MIN(le2.tot_years)
		FROM life_expectancy le2 
		WHERE le2.ref_year = 2000
	);

SELECT *
FROM life_expectancy le 
WHERE le.ref_year = 2000
	AND (
		le.tot_years = (
			SELECT MIN(le2.tot_years)
			FROM life_expectancy le2 
			WHERE le2.ref_year = 2000
		) 
		OR le.tot_years = (
			SELECT MAX(le3.tot_years) 
			FROM life_expectancy le3
			WHERE le3.ref_year = 2000
		)
	);

SELECT tab.country, 
	tab.gender, 
	ROUND(AVG(tab.mean_years), 2) AS avg_mean_years
FROM (
	SELECT m.country, 
		m.ref_year, 
		'male' AS gender, 
		m.mean_years 
	FROM men_years_at_school m
	UNION ALL 
	SELECT w.country,
		w.ref_year, 
		'female' AS gender, 
		w.mean_years 
	FROM women_years_at_school w
) AS tab
JOIN country c 
	ON tab.country = c.country 
	AND c.four_regions = 'africa'
	AND tab.ref_year BETWEEN 2000 AND 2009 
GROUP BY tab.country, tab.gender 
ORDER BY tab.gender, avg_mean_years;

-- EXIST 

SELECT * 
FROM co2_emissions_pc cep 
WHERE cep.ref_year = 2000
	AND EXISTS 
	(SELECT * 
	FROM co2_emissions_pc cep2 
	WHERE cep2.country = 'USA'
		AND cep2.ref_year = 2000
		AND cep.co2_pc > cep2.co2_pc 
	)
	
SELECT *
FROM co2_emissions_pc cep 
WHERE cep.ref_year = 2000
	AND NOT EXISTS 
	(SELECT *
	FROM co2_emissions_pc cep2 
	WHERE cep2.country = 'USA'
		AND cep2.ref_year = 2000
		AND cep.co2_pc <= cep2.co2_pc 
	)