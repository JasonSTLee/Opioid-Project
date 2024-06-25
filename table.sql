-- Creating the tables of opioid transactions and state populations

CREATE TABLE az (
	REPORTER_DEA_NO VARCHAR(200),
	REPORTER_BUS_ACT VARCHAR(200),
	REPORTER_NAME VARCHAR(200),
	REPORTER_ADDL_CO_INFO VARCHAR(200),
	REPORTER_ADDRESS1 VARCHAR(200),
	REPORTER_ADDRESS2 VARCHAR(200),
	REPORTER_CITY VARCHAR(200),
	REPORTER_STATE VARCHAR(200),
	REPORTER_ZIP INT,
	REPORTER_COUNTY VARCHAR(200),
	BUYER_DEA_NO VARCHAR(200),
	BUYER_BUS_ACT VARCHAR(200),
	BUYER_NAME VARCHAR(200),
	BUYER_ADDL_CO_INFO VARCHAR(200),
	BUYER_ADDRESS1 VARCHAR(200),
	BUYER_ADDRESS2 VARCHAR(200),
	BUYER_CITY VARCHAR(200),
	BUYER_ZIP INT,
	TRANSACTION_CODE VARCHAR(200),
	DRUG_CODE INT,
	NDC_NO VARCHAR(200),
	DRUG_NAME VARCHAR(200),
	Measure VARCHAR(200),
	MME_Conversion_Factor NUMERIC,
	Dosage_Strength NUMERIC,
	TRANSACTION_DATE DATE,
	Combined_Labeler_Name VARCHAR(200),
	Reporter_family VARCHAR(200),
	CALC_BASE_WT_IN_GM NUMERIC,
	DOSAGE_UNIT NUMERIC,
	MME NUMERIC,
	BUYER_STATE VARCHAR(200),
	BUYER_COUNTY VARCHAR(200)
)

-- Chunking the data into a sample table and querying that table first to find the fastest way to run code

CREATE TABLE all_states as (
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ak
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	al
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ar
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	az
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ca
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	co
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ct
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	dc
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	de
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	fl
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ga
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	hi
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ia
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	id
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	il
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	inn
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ks
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ky
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	la
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ma
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	md
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	me
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	mi
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	mn
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	mo
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ms
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	mt
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	nc
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	nd
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ne
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	nh
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	nj
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	nm
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	nv
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ny
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	oh
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ok
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	orr
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	pa
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ri
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	sc
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	sd
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	tn
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	tx
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	ut
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	va
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	vt
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	wa
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	wi
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	wv
UNION
SELECT
	transaction_date, reporter_dea_no, reporter_bus_act, reporter_name, 
	reporter_zip, reporter_county, reporter_state, 
	buyer_dea_no, buyer_bus_act, buyer_name, buyer_zip, buyer_county, buyer_state, 
	drug_code, drug_name,  
	combined_labeler_name, reporter_family,
	calc_base_wt_in_gm,
	dosage_unit
FROM
	wy
)


-- Creating and cleaning the state population table
CREATE TABLE states_population (
	state VARCHAR(200),
	population VARCHAR(200)
)

CREATE TABLE state_population as (
	SELECT
		state, (REPLACE(population, ',', ''))::INTEGER
	FROM
		states_population
)
ALTER TABLE state_population
RENAME COLUMN replace TO population


-- Creating the deaths per year per state table
CREATE TABLE deaths (
	year INTEGER,
	state VARCHAR(200),
	num_per_100k NUMERIC
)




































