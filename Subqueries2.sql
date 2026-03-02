SELECT gp.country,
	gp.gdp_pc AS maior_PIB
FROM gdp_pc gp
WHERE gp.gdp_pc = (
		SELECT MAX(gp2.gdp_pc) 
		FROM gdp_pc gp2 
		JOIN country c ON c.country = gp2.country 
		WHERE c.four_regions = 'africa' 
			AND gp2.ref_year = 2019
)
AND gp.ref_year = 2019;

SELECT le2.country, 
	agg.idade_min, 
	ROUND(agg.idade_min, 2) AS idade_med,
	agg.idade_max
FROM life_expectancy le2 
JOIN country c2 
	ON c2.country = le2.country 
JOIN (
		SELECT  MIN(le.tot_years ) AS idade_min,
				AVG(le.tot_years) AS idade_med,
				MAX(le.tot_years) AS idade_max
		FROM country c 
		JOIN life_expectancy le 
			ON c.country = le.country
		WHERE c.wb_regions = 'Latin America & Caribbean'
			AND le.ref_year = 1990
) AS agg ON le2.tot_years = agg.idade_min
WHERE le2.ref_year = 1990
	AND c2.wb_regions = 'Latin America & Caribbean'

SELECT le2.country, 
	le2.tot_years,
	agg.idade_min, 
	ROUND(agg.idade_min, 2) AS idade_med,
	agg.idade_max
FROM life_expectancy le2 
JOIN country c2 
	ON c2.country = le2.country 
JOIN (
		SELECT  MIN(le.tot_years ) AS idade_min,
				AVG(le.tot_years) AS idade_med,
				MAX(le.tot_years) AS idade_max
		FROM country c 
		JOIN life_expectancy le 
			ON c.country = le.country
		WHERE c.wb_regions = 'Latin America & Caribbean'
			AND le.ref_year = 2010
) AS agg ON le2.tot_years = agg.idade_min
WHERE le2.ref_year = 2010
	AND c2.wb_regions = 'Latin America & Caribbean'	

SELECT 	tab1.wb_regions AS regiao,
		tab1.med_dif AS diferenca
FROM (
	SELECT c.wb_regions,
		ROUND(AVG(m.mean_years - w.mean_years), 2) AS med_dif
	FROM men_years_at_school m
	JOIN women_years_at_school w
		ON m.country = w.country AND m.ref_year = w.ref_year
	JOIN country c
		ON c.country = m.country
	WHERE m.ref_year = 2000
	GROUP BY c.wb_regions
) AS tab1
WHERE tab1.med_dif = (
	SELECT MAX(tab2.med_dif)
	FROM (
	SELECT AVG(m2.mean_years - w2.mean_years) AS med_dif
	FROM men_years_at_school m2
	JOIN women_years_at_school w2 ON m2.country = w2.country AND m2.ref_year = w2.ref_year
	JOIN country c2 ON c2.country = m2.country
	WHERE m2.ref_year = 2000
	GROUP BY c2.wb_regions 
	) AS tab2
);

SELECT tab.country,
		MIN(tab.media) AS menor_media
FROM (
	SELECT ai.country,
	AVG(ai.mean_usd) as media
	FROM avg_income ai 
	JOIN country c 
		ON ai.country = c.country 
	WHERE c.four_regions = 'europe'
		AND ai.ref_year = 2020
	GROUP BY ai.country
	ORDER BY media	
) as tab
ORDER BY tab.media;

SELECT c.country
FROM country c
JOIN men_years_at_school m 
	ON c.country = m.country
JOIN women_years_at_school w
	ON c.country = w.country AND w.ref_year = m.ref_year
WHERE c.wb_regions = 'Latin America & Caribbean'
	AND m.ref_year = 2000
	AND EXISTS (
	SELECT 1
	FROM women_years_at_school w2
	JOIN men_years_at_school m2
		ON w2.country = m2.country AND w2.ref_year = m2.ref_year
	WHERE m2.country = 'Brazil'
		AND m2.ref_year = 2000
		AND (m.mean_years - w.mean_years) < (m2.mean_years - w2.mean_years)
	);
