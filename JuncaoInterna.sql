-- LEFT JOIN

SELECT  f.ref_year,
			f.mean_babies,
			wyas.mean_years 
FROM fertility f 
LEFT JOIN women_years_at_school wyas 
	ON wyas.country = f.country AND wyas.ref_year = f.ref_year 
WHERE f.country = 'Brazil'
	AND f.ref_year 
	BETWEEN 2001 AND 2020
ORDER BY f.ref_year;

SELECT cm.country,
		cm.tot_deaths,
		f.mean_babies 
FROM child_mortality cm 
LEFT JOIN fertility f 
	ON cm.country = f.country AND cm.ref_year = f.ref_year 
WHERE cm.country IN ('Andorra', 'Liechtenstein', 'Malta', 'Mônaco', 
'San Marino', 'Holy See')
	AND cm.ref_year = 2000;

SELECT cm.country, 
		cm.tot_deaths,
		f.mean_babies,
		p.tot_pop 
FROM child_mortality cm 
LEFT JOIN fertility f 
	ON cm.country = f.country AND cm.ref_year = f.ref_year 
LEFT JOIN population p 
	ON cm.country = p.country AND cm.ref_year = p.ref_year 
WHERE cm.country IN ('Andorra', 'Liechtenstein', 'Malta', 'Mônaco', 
'San Marino', 'Holy See')
	AND cm.ref_year = 2000;

SELECT cm.country, 
		cm.tot_deaths,
		f.mean_babies,
		p.tot_pop 
FROM child_mortality cm 
LEFT JOIN fertility f 
	ON cm.country = f.country AND cm.ref_year = f.ref_year 
JOIN population p 
	ON cm.country = p.country AND cm.ref_year = p.ref_year 
WHERE cm.country IN ('Andorra', 'Liechtenstein', 'Malta', 'Mônaco', 
'San Marino', 'Holy See')
	AND cm.ref_year = 2000;

-- RIGHT JOIN

SELECT gp.ref_year,
			cep.co2_pc,
			gp.gdp_pc
FROM co2_emissions_pc cep 
RIGHT JOIN gdp_pc gp 
	ON cep.country = gp.country AND cep.ref_year = gp.ref_year
WHERE gp.country = 'Brazil'
	AND gp.ref_year BETWEEN 2014 AND 2023 
ORDER BY gp.ref_year;

SELECT cm.country,
		cm.tot_deaths,
		f.mean_babies 
FROM fertility f 
RIGHT JOIN child_mortality cm 
	ON f.country = cm.country AND f.ref_year = cm.ref_year
WHERE cm.country IN ('Andorra', 'Liechtenstein', 'Malta', 'Mônaco', 
'San Marino', 'Holy See')
	AND cm.ref_year = 2000;

-- FULL JOIN 

SELECT f.country,
		p.country,
		p.tot_pop,
		f.mean_babies
FROM population p 
FULL JOIN fertility f 
	ON f.country = p.country AND f.ref_year = p.ref_year 
WHERE (f.country IN ('Fiji', 'Guam', 'Nauru', 'Palau', 'Polinésia Francesa')
	OR p.country IN ('Fiji', 'Guam', 'Nauru', 'Palau', 'Polinésia Francesa'))
	AND (f.ref_year = 2018
	OR p.ref_year = 2018);

SELECT cm.country,
		f.country,
		cm.tot_deaths,
		f.mean_babies 
FROM child_mortality cm 
FULL JOIN fertility f
	ON f.country = cm.country AND cm.ref_year = f.ref_year 
WHERE (f.country IN ('Aruba', 'Cuba', 'Dominica', 'Martinique', 'Puerto Rico')
	OR cm.country IN ('Aruba', 'Cuba', 'Dominica', 'Martinique', 'Puerto Rico'))
	AND (cm.ref_year = 2000 
	OR f.ref_year = 2000);
	