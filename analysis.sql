-- Before I start my analysis, I want to create a sample table so I can run my queries there first to find the fastest performing query
-- I will test on the sample table and then use the CREATE TABLE function to create a table out of each result.

CREATE TABLE sample as (
	SELECT	
		*
	FROM
		all_states
	LIMIT 
		5,000,000
)

SELECT
	*
FROM
	all_states
LIMIT 
	5

	
-- FIND THE NUMBER OF DOSAGE_UNIT PER STATE

CREATE TABLE total_dosages_per_state as (
	SELECT
		buyer_state, SUM(dosage_unit)
	FROM
		all_states
	GROUP BY
		buyer_state)
	
	
-- FIND THE NUMBER OF DOSAGES PER YEAR PER STATE

CREATE TABLE total_dosages_per_year_per_state as (
	SELECT
		EXTRACT(year FROM transaction_date) as year,
		buyer_state state,
		(SUM(dosage_unit))::numeric total_dosage
	FROM
		all_states
	GROUP BY
		EXTRACT(year FROM transaction_date), buyer_state)

	
-- DOSAGE_UNIT PER STATE IN 3 DIFFERENT ERAS 
-- RISE YEARS: 2006 - 2009
-- PEAK YEARS: 2010 - 2014
-- FAL YEARS: 2015 - 2019

CREATE TABLE dosage_per_era_per_state as (
SELECT
	CASE 
		WHEN EXTRACT(year FROM transaction_date) <= 2009 THEN 'Rise Years'
		WHEN EXTRACT(year FROM transaction_date) > 2009 and EXTRACT(year FROM transaction_date) <= 2014 THEN 'Peak Years'
		WHEN EXTRACT(year FROM transaction_date) > 2014 THEN 'Fall Years' 
	END eras,
	buyer_state,
	SUM(dosage_unit) total_dosage
FROM
	all_states
GROUP BY
	eras, buyer_state)

CREATE TABLE total_dosage_per_era_by_pop as (
SELECT
	eras, buyer_state, (total_dosage / population::numeric) dosage_pop
FROM
	dosage_per_era_per_state d
JOIN
	population p ON d.buyer_state = p.state)
	

SELECT
	CASE 
		WHEN EXTRACT(year FROM transaction_date) = 2006 or EXTRACT(year FROM transaction_date) = 2007 or EXTRACT(year FROM transaction_date) = 2008 or EXTRACT(year FROM transaction_date) = 2009 THEN 'Rise Years'
		WHEN EXTRACT(year FROM transaction_date) = 2010 or EXTRACT(year FROM transaction_date) = 2011 or EXTRACT(year FROM transaction_date) = 2012 or EXTRACT(year FROM transaction_date) = 2013 or EXTRACT(year FROM transaction_date) = 2014 THEN 'Peak Years'
		WHEN EXTRACT(year FROM transaction_date) = 20115 or EXTRACT(year FROM transaction_date) = 2016 or EXTRACT(year FROM transaction_date) = 2017 or EXTRACT(year FROM transaction_date) = 2018 or EXTRACT(year FROM transaction_date) = 2019 THEN 'Fall Years'
	END eras,
	buyer_state,
	SUM(dosage_unit) total_dosage
FROM
	all_states
GROUP BY
	eras, buyer_state 


-- WHAT IS THE DOSAGE_UNIT PER POPULATION? IS THERE A CORRELATION TO THE AMOUNT OF DEATHS IN EACH STATE


with cte as (
	SELECT
		EXTRACT(year FROM transaction_date) year_date,
		buyer_state state,
		SUM(dosage_unit) total_dosage,
		AVG(calc_base_wt_in_gm) avg_base,
		MAX(deaths) deaths
	FROM
		all_states s
	RIGHT JOIN	
		deaths d ON s.buyer_state = d.state and EXTRACT(year FROM s.transaction_date) = d.year
	GROUP BY
		year_date, buyer_state
)
SELECT
	CORR(total_dosage, deaths) death_dosage,
	CORR(avg_base, deaths) death_base
FROM
	cte
	-- There is little to no correlation between deaths/100,00, total dosage and average calc_base_wt_in_gm




-- FIND THE DOSAGE_UNIT PER YEAR


-- FIND THE NUMBER OF DOSAGE_UNIT PER ZIP CODE AND COUNTY

CREATE TABLE dosage_per_zip as (
	SELECT
		buyer_zip zip_code,
		SUM(dosage_unit) total_dosage
	FROM
		all_states
	GROUP BY
		buyer_zip
)

	

CREATE TABLE dosage_per_county as (
	SELECT
		buyer_county county,
		SUM(dosage_unit) total_dosage
	FROM
		all_states
	GROUP BY
		buyer_county
)

	
	
CREATE TABLE dosage_per_100 as (
	SELECT
		buyer_state,
		SUM(dosage_unit) total_dosage
	FROM
		sample s 
	JOIN	
		population p ON s.buyer_state = p.state
	GROUP BY
		buyer_county
)

SELECT
	*
FROM
	dosage_per_county


-- SHOW YEAR OVER YEAR CHANGE IN TOTAL OPIOID RELATED DEATH ADN YEAR OVER YEAR CHANGE IN TOTAL DOSAGE_UNITS

CREATE TABLE year_over_year_deaths as (
	with cte as (
		SELECT
			year, SUM(deaths) total_deaths
		FROM
			deaths
		GROUP BY
			year
	)
	SELECT
		year, total_deaths, LAG(total_deaths) OVER(ORDER BY year), COALESCE(ROUND(((total_deaths - LAG(total_deaths) OVER(ORDER BY year))::numeric / total_deaths) * 100, 2),0) rate
	FROM
		cte
)


CREATE TABLE year_over_year_pills as (
	with cte as (
		SELECT
			EXTRACT(year FROM transaction_date) year_, SUM(dosage_unit) total_pills
		FROM
			all_states
		GROUP BY
			year_
	)
	SELECT
		year_, total_pills, LAG(total_pills) OVER(ORDER BY year_), COALESCE(ROUND(((total_pills - LAG(total_pills) OVER(ORDER BY year_))::numeric / total_pills) * 100, 2),0) rate
	FROM
		cte
)

	-- Joining the 2 tables above to create one table
CREATE TABLE yoy_death_pills as (
SELECT
	year, total_deaths, d.rate death_rate, total_pills, p.rate pill_rate
FROM
	year_over_year_deaths d
JOIN
	year_over_year_pills p ON d.year = p.year_)


-- FINDING THE STATES WITH THE HIGHEST INCREASE/DECREASE OF DOSAGE_UNIT per person FROM THE PREVIOUS YEAR 

CREATE TABLE yoy_pill_rate_top_10 as ( 
	with cte as (
		SELECT
			t.state, t.year, 
			(total_dosage / population) pill_per_person, 
			LAG(total_dosage / population) OVER(PARTITION BY t.state ORDER BY t.state, t.year),
			(total_dosage / population) - (LAG(total_dosage / population) OVER(PARTITION BY t.state ORDER BY t.state, t.year)) difference_yoy
		FROM
			total_dosages_per_year_per_state t
		JOIN
			population p ON t.state = p.state
	), cte2 as (
		SELECT
			state, year, difference_yoy, ROW_NUMBER() OVER(ORDER BY difference_yoy desc) high_rnk,
			ROW_NUMBER() OVER(ORDER BY difference_yoy) low_rnk
		FROM
			cte
		WHERE
			difference_yoy is not null
	)
	SELECT
		state, year, difference_yoy
	FROM
		cte2
	WHERE
		high_rnk <= 10
		or 
		low_rnk <= 10
)



-- USING WIDTH BUCKET, CREATE A HISTOGRAM OF DOSAGE_UNIT

with cte as (
	SELECT 
		WIDTH_BUCKET(dosage_unit, 1, 100000, 10) low_bucket,
		WIDTH_BUCKET(dosage_unit, 100000, 3115001, 1) rest_bucket
	FROM    
		all_states
)
SELECT
	CASE 
		WHEN low_bucket = 1 THEN '1 - 10000 pills'
		WHEN low_bucket = 2 THEN '10001 - 20000 pills'
		WHEN low_bucket = 3 THEN '20001 - 30000 pills'
		WHEN low_bucket = 4 THEN '30001 - 40000 pills'
		WHEN low_bucket = 5 THEN '40001 - 50000 pills'
		WHEN low_bucket = 6 THEN '50001 - 60000 pills'
		WHEN low_bucket = 7 THEN '60001 - 70000 pills'
		WHEN low_bucket = 8 THEN '70001 - 80000 pills'
		WHEN low_bucket = 9 THEN '80001 - 90000 pills'
		WHEN low_bucket = 10 THEN '90001 - 100000 pills'
	END bucket_groups, 
	COUNT(*) num_transactions
FROM
	cte
GROUP BY
	1
UNION
SELECT
	CASE 
		WHEN rest_bucket = 1 THEN '100000 - 3115001 pills'
	END bucket_groups, 
	COUNT(*) pills_per_transaction
FROM
	cte
GROUP BY
	1



	
-- USING ZSCORE FIND ANY OUTLIERS IN TOTAL DOSAGE_UNIT OR DEATH TO POPULATION RATIO PER STATE

	
	-- KY and WV are outliers that are outside of the 99%
with zscore as (
	SELECT
		t.state, 
		(total_dosage / population::numeric) dosage_pop
	FROM
		total_dosages_per_state t
	JOIN
		population p ON t.state = p.state
), zscore2 as (
	SELECT
		state,
		((dosage_pop - AVG(dosage_pop) OVER()) / (STDDEV(dosage_pop) OVER())) zscore
	FROM
		zscore
)
SELECT
	state, zscore
FROM
	zscore2
WHERE
	zscore NOT BETWEEN -2.33 and 2.33

CREATE TABLE total_dosage_per_pop as (
SELECT
	t.state, 
	(total_dosage / population::numeric) dosage_pop
FROM
	total_dosages_per_state t
JOIN
	population p ON t.state = p.state)

CREATE TABLE scatterplot as (
	
	SELECT	
		d.state, population, total_dosage, (total_dosage / population) dosage_pop
	FROM
		total_dosages_per_state d
	JOIN
		population p ON d.state = p.state
	
)


	-- DC and VT are outliers
with zscore as (
	SELECT
		state, 
		SUM(deaths) total_deaths
	FROM
		deaths
	GROUP BY
		state
), zscore2 as (
	SELECT
		p.state,
		((total_deaths * 100000)::numeric / population::numeric) death_pop
	FROM
		population p 
	JOIN
		zscore z ON z.state = p.state
), zscore3 as (
	SELECT
		state,
		((death_pop - AVG(death_pop) OVER()) / (STDDEV(death_pop) OVER())) zscore
	FROM
		zscore2
)
SELECT
	state, zscore
FROM
	zscore3
WHERE
	zscore NOT BETWEEN -2.33 and 2.33


-- Find the count of both drugs to use in a pie chart

CREATE TABLE drug as (
SELECT
	drug_name,
	COUNT(*)
FROM
	all_states
GROUP BY drug_name)
