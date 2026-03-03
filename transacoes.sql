BEGIN TRANSACTION;  

DELETE 
FROM men_years_at_school 
WHERE country = 'Brazil'
	AND ref_year BETWEEN 2009 AND 2020;

SELECT *
FROM men_years_at_school 
WHERE country = 'Brazil'
	AND ref_year BETWEEN 2000 AND 2009;

ROLLBACK;

SELECT *
FROM men_years_at_school 
WHERE country = 'Brazil'
	AND ref_year BETWEEN 2000 AND 2009;


BEGIN TRANSACTION;  

DELETE 
FROM men_years_at_school 
WHERE country = 'Brazil'
	AND ref_year BETWEEN 2000 AND 2008;

SELECT *
FROM men_years_at_school 
WHERE country = 'Brazil'
	AND ref_year BETWEEN 2000 AND 2009;

COMMIT;

SELECT *
FROM men_years_at_school 
WHERE country = 'Brazil'
	AND ref_year BETWEEN 2000 AND 2009;