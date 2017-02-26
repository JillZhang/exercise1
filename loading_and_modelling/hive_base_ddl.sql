CREATE EXTERNAL TABLE IF NOT EXISTS general_hospital_information
(provider_id string,
hospital_name string,
address string,
city string,
state string,
zipcode string,
county string,
hospital_type string,
hospital_ownership string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/general_hospital_information';

CREATE EXTERNAL TABLE IF NOT EXISTS procedure_timely_effective
(provider_id string,
hospital_name string,
address string,
city string,
state string,
zipcode string,
county string,
phone_number string,
condition string,
measure_id string,
measure_name string,
score  int,
sample string,
measure_start date,
measure_end date)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/procedure_timely_effective';

CREATE EXTERNAL TABLE IF NOT EXISTS procedure_readmissions
(provider_id string,
hospital_name string,
address string,
city string,
state string,
zipcode string,
county string,
phone_number string,
measure_name string,
measure_id string,
compared_to_national string,
denominator string,
score  int,
low_estimate float,
high_estimate float,
footnote string,
measure_start date,
measure_end date)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/procedure_readmissions';

CREATE EXTERNAL TABLE IF NOT EXISTS measure_date
(
measure_name string,
measure_id string,
measure_start_quarter string,
measure_start date,
measure_end_quarter string,
measure_end date)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measure_date';

CREATE EXTERNAL TABLE IF NOT EXISTS survey_response
(
provider_id string,
hospital_name string,
address string,
city string,
state string,
zipcode string,
county string,
nurse_achievement string,
nurse_improvement string,
nurse_dimension string,
doctor_achievement string,
doctor_improvement string,
doctor_dimension string,
hospital_staff_achievement string,
hospital_staff_improvement string,
hospital_staff_dimension string,
pain_achievement string,
pain_improvement string,
pain_dimension string,
medicine_achievement string,
medicine_improvement string,
medicine_dimension string,
environment_achievement string,
environment_improvement string,
environment_dimension string,
discharge_achievement string,
discharge_improvement string,
discharge_dimension string,
overall_achievement string,
overall_improvement string,
overall_dimension string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey_response_data';