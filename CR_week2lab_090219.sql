/*
DATA 607: Lab 2.3 - Combining Data From Multiple Sources
C. Rosemond 090219
PostgreSQL
dbname: data607fall19
*/

--Tuberculosis
--Creating table for tuberculosis .csv
CREATE TABLE tb (
	country varchar(100) NOT NULL,
	year integer NOT NULL,
	sex varchar(6) NOT NULL,
	child integer NULL,
	adult integer NULL,
	elderly integer NULL
);
--Reading tuberculosis .csv into tb table
COPY tb
FROM PROGRAM 'curl "https://raw.githubusercontent.com/chrosemo/data607_fall19_week2/master/tb(1).csv"'
WITH (FORMAT CSV);
--Setting '-1' as NULL for the child, adult, and elderly columns in tb
UPDATE tb SET child = NULL WHERE child = -1;
UPDATE tb SET adult = NULL WHERE adult = -1;
UPDATE tb SET elderly = NULL WHERE elderly = -1;

--Population--
--Creating table for population .csv
CREATE TABLE population (
	country varchar(100) NOT NULL,
	year integer NOT NULL,
	population integer NOT NULL
);
--Reading population .csv into population table
COPY population
FROM PROGRAM 'curl "https://raw.githubusercontent.com/chrosemo/data607_fall19_week2/master/population.csv"'
WITH (FORMAT CSV, HEADER);
--Visual check
SELECT * FROM population;
SELECT * FROM tb;

--Creating a table, called tb_rate, with tuberculosis rate
CREATE TABLE tb_rate AS
	SELECT
		pop.country,
		pop.year,
		ROUND((CAST(tb.total AS numeric) / CAST(pop.population AS numeric)) * 100, 3) AS rate
	FROM population pop INNER JOIN (
			SELECT country, year, SUM(child + adult + elderly) AS total
			FROM tb
			GROUP BY country, year
			ORDER BY country, year) tb
	ON pop.country = tb.country
		AND pop.year = tb.year
	ORDER BY pop.country, pop.year;
--Visual check
SELECT * FROM tb_rate;
