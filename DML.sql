INSERT INTO petrobras ("Date", "Open", High, Low, "Close", 
						"Adj Close", Volume)
VALUES ('2024-01-02', 16.09, 16.22, 15.92, 16.00, 14.55, 10100.0)

SELECT * 
FROM petrobras p 
WHERE "Date" > '2023-12-29';

UPDATE petrobras 
SET High = 16.64
WHERE "Date" = '2024-01-02';

DELETE 
FROM petrobras 
WHERE "Date" = '2024-01-02'

INSERT INTO men_years_at_school (country, ref_year, mean_years)
VALUES ('Brazil', 2010, 6.7),
		('Brazil', 2011, 6.8),
		('Brazil', 2012, 7.0),
		('Brazil', 2013, 7.1),
		('Brazil', 2014, 7.2),
		('Brazil', 2015, 7.3),
		('Brazil', 2016, 7.5),
		('Brazil', 2017, 7.6),
		('Brazil', 2018, 7.8),
		('Brazil', 2019, NULL),
		('Brazil', 2020, NULL),
		('Argentina', 2010, 10.5),
		('Argentina', 2011, 10.6),
		('Argentina', 2012, 10.6),
		('Argentina', 2013, 10.8),
		('Argentina', 2014, 10.7),
		('Argentina', 2015, 10.7),
		('Argentina', 2016, 10.8),
		('Argentina', 2017, NULL),
		('Argentina',  2018, 10.9),
		('Argentina', 2019, NULL),
		('Argentina', 2020, 10.9)
 	
SELECT *
FROM men_years_at_school myas 
WHERE country = 'Argentina'

UPDATE men_years_at_school 
SET mean_years = 7.8 
WHERE ref_year IN (2019, 2020)
	AND country = 'Brazil';

SELECT *
FROM men_years_at_school 
WHERE ref_year BETWEEN 2009 AND 2020
	AND country = 'Brazil';

UPDATE men_years_at_school 
SET mean_years = (
	SELECT AVG(m.mean_years)
	FROM men_years_at_school m
	WHERE m.country = 'Argentina'
		AND ref_year BETWEEN 2011 AND 2020
)
WHERE mean_years IS NULL
	AND country = 'Argentina'
	AND ref_year BETWEEN 2017 AND 2018;

SELECT *
FROM men_years_at_school myas 
WHERE country = 'Argentina'
	AND myas.ref_year BETWEEN 2016 AND 2020;

DELETE 
FROM men_years_at_school 
WHERE ref_year >= 2019
	AND country = 'Brazil';

SELECT *
FROM men_years_at_school m
WHERE m.ref_year BETWEEN 2018 AND 2020
	AND m.country = 'Brazil';

DELETE 
FROM men_years_at_school 
WHERE ref_year BETWEEN 2010 AND 2018 
	AND country = 'Brazil';

SELECT *
FROM men_years_at_school m
WHERE m.ref_year BETWEEN 2009 AND 2020
	AND m.country = 'Brazil';