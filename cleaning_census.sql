CREATE TABLE population (
	index NUMERIC,
	county VARCHAR(200),
	date_code VARCHAR(200),
	date_desc VARCHAR(200),
	density NUMERIC,
	population NUMERIC,
	name VARCHAR(200),
	state VARCHAR(200),
	state_id NUMERIC
)


CREATE TABLE era_dosage_pop (
	state VARCHAR(200),
	eras VARCHAR(200),
	total_dosage NUMERIC,
	pop_in_era NUMERIC,
	dosage_per_pop NUMERIC 
)


CREATE TABLE population as (
	SELECT
		name state, population, EXTRACT(year FROM((REPLACE(date_desc, 'population estimate', ''))::date)) as year,
		CASE 
			WHEN name = 'Alabama' THEN 'AL'
			WHEN name = 'Alaska' THEN 'AK'
			WHEN name = 'Arizona' THEN 'AZ'
			WHEN name = 'Arkansas' THEN 'AR'
			WHEN name = 'California' THEN 'CA'
			WHEN name = 'Colorado' THEN 'CO'
			WHEN name = 'Delaware' THEN 'DE'
			WHEN name = 'District of Columbia' THEN 'DC'
			WHEN name = 'Connecticut' THEN 'CT'
			WHEN name = 'Florida' THEN 'FL'
			WHEN name = 'Georgia' THEN 'GA'
			WHEN name = 'Idaho' THEN 'ID'
			WHEN name = 'Hawaii' THEN 'HI'
			WHEN name = 'Illinois' THEN 'IL'
			WHEN name = 'Indiana' THEN 'IN'
			WHEN name = 'Iowa' THEN 'IA'
			WHEN name = 'Kansas' THEN 'KS'
			WHEN name = 'Kentucky' THEN 'KY'
			WHEN name = 'Louisiana' THEN 'LA'
			WHEN name = 'Maine' THEN 'ME'
			WHEN name = 'Maryland' THEN 'MD'
			WHEN name = 'Massachusetts' THEN 'MA'
			WHEN name = 'Michigan' THEN 'MI'
			WHEN name = 'Minnesota' THEN 'MN'
			WHEN name = 'Mississippi' THEN 'MS'
			WHEN name = 'Missouri' THEN 'MO'
			WHEN name = 'Montana' THEN 'AL'
			WHEN name = 'Nebraska' THEN 'NE'
			WHEN name = 'Nevada' THEN 'NV'
			WHEN name = 'New Hampshire' THEN 'NH'
			WHEN name = 'New Jersey' THEN 'NJ'
			WHEN name = 'New Mexico' THEN 'NM'
			WHEN name = 'New York' THEN 'NY'
			WHEN name = 'North Carolina' THEN 'NC'
			WHEN name = 'North Dakota' THEN 'ND'
			WHEN name = 'Ohio' THEN 'OH'
			WHEN name = 'Oklahoma' THEN 'OK'
			WHEN name = 'Oregon' THEN 'OR'
			WHEN name = 'Pennsylvania' THEN 'PA'
			WHEN name = 'Rhode Island' THEN 'RI'
			WHEN name = 'South Carolina' THEN 'SC'
			WHEN name = 'South Dakota' THEN 'SD'
			WHEN name = 'Tennessee' THEN 'TN'
			WHEN name = 'Texas' THEN 'TX'
			WHEN name = 'Vermont' THEN 'VT'
			WHEN name = 'Utah' THEN 'UT'
			WHEN name = 'Virginia' THEN 'VA'
			WHEN name = 'Washington' THEN 'WA'
			WHEN name = 'West Virginia' THEN 'WV'
			WHEN name = 'Wisconsin' THEN 'WI'
			WHEN name = 'Wyoming' THEN 'WY'
		ELSE null END state_short
	FROM
		population_raw
	WHERE
		date_desc LIKE '%population estimate'
		and
		name != 'Puerto Rico'
		and
		(EXTRACT(year FROM((REPLACE(date_desc, 'population estimate', ''))::date)) = 2010
		or
		EXTRACT(year FROM((REPLACE(date_desc, 'population estimate', ''))::date)) = 2014
		or
		EXTRACT(year FROM((REPLACE(date_desc, 'population estimate', ''))::date)) = 2019)
)