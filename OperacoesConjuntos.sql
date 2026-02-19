-- UNION 

SELECT m.country, m.ref_year, 'male' AS gender, m.mean_years 
FROM men_years_at_school m 
WHERE m.country = 'Brazil'
	AND m.ref_year = 2005
UNION ALL
SELECT w.country, w.ref_year, 'female' AS gender, w.mean_years 
FROM women_years_at_school w
WHERE w.country = 'Brazil'
	AND w.ref_year = 2005;

SELECT w.country, 
	w.mean_years, 
	'female' AS gender
FROM women_years_at_school w
WHERE w.country IN ('Brazil', 'Russia', 'India', 'China', 'South Africa')
	AND w.ref_year = 2000
UNION 
SELECT m.country, 
	m.mean_years, 
	'male' AS gender
FROM men_years_at_school m 
WHERE m.country IN ('Brazil', 'Russia', 'India', 'China', 'South Africa')
	AND m.ref_year = 2000;

-- EXCEPT

SELECT p.country 
FROM population p 
EXCEPT 
SELECT f.country 
FROM fertility f;

SELECT cm.country
FROM child_mortality cm 
EXCEPT 
SELECT f.country
FROM fertility f;

SELECT p.country 
FROM population p 
EXCEPT 
SELECT cm.country
FROM child_mortality cm;

SELECT p.country 
FROM population p
EXCEPT 
SELECT c.country 
FROM country c 

SELECT cep.country, cep.ref_year 
FROM co2_emissions_pc cep 
WHERE cep.country = 'Brazil'
	AND cep.ref_year >= 2000
EXCEPT 
SELECT m.country, m.ref_year 
FROM men_years_at_school m
	WHERE m.country = 'Brazil'
	AND m.ref_year >= 2000;

-- INTERSECT

SELECT p.country 
FROM population p 
INTERSECT 
SELECT f.country 
FROM fertility f;

SELECT cep.country, cep.ref_year 
FROM co2_emissions_pc cep 
WHERE cep.country = 'Brazil'
	AND cep.ref_year >= 2000
INTERSECT 
SELECT m.country, m.ref_year 
FROM men_years_at_school m
WHERE m.country = 'Brazil'
	AND m.ref_year >= 2000;