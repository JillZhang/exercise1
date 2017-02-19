CREATE TABLE procedure
as select  A.measure_id, A.measure_name, A.provider_id, A.hospital_name, A.score from (
select measure_id, measure_name, provider_id, hospital_name, score from procedure_timely_effective where substr(score,1,1) in (1,2,3,4,5,6,7,8,9)
UNION ALL
select measure_id, measure_name, provider_id, hospital_name, score from procedure_readmissions where substr(score,1,1) in (1,2,3,4,5,6,7,8,9)) A
 join measure_date B on A.measure_id = B.measure_id;

create table hospital
as select provider_id, hospital_name, city, address, state from general_hospital_information;

create table survey_result
as select substr(overall_achievement,1,1) as overall_achievements, substr(overall_improvement,1,1) as overall_improvements, substr(overall_dimension,1,2) as overall_dimensions, (substr(overall_achievement,1,1)+ substr(overall_improvement,1,1)+substr(overall_dimension,1,2))/3 as overall_rating from survey_response;

select substr(overall_achievement,1,1) as overall_achievements, substr(overall_improvement,1,1) as overall_improvements, substr(overall_dimension,1,2) as overall_dimensions, (substr(overall_achievement,1,1)+ substr(overall_improvement,1,1)+substr(overall_dimension,1,2))/3 as overall_rating from survey_response limit 10;
