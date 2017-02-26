select corr(S.average_score, S.average_survey) average_correlation, corr(S.variance_score,S.average_survey) variance_correlation,
corr(S.average_score, S.average_achievement) achievement_avg_corr, corr(S.variance_score,S.average_achievement) achievement_var_corr,
corr(S.average_score, S.average_improvement) improvement_avg_corr, corr(S.variance_score,S.average_improvement) improvement_var_corr,
corr(S.average_score, S.average_dimension) dimension_avg_corr, corr(variance_score,average_dimension) dimension_var_corr
from (select B.hospital_name, sum(score) as aggregate_score, avg(score) as average_score, variance(score) as variance_score, avg(C.overall_rating) as average_survey,
average(C.overall_achievements) as average_achievement, average(C.overall_improvements) as average_improvement, average(C.overall_dimensions) as average_dimension from procedure A
join hospital B on A.provider_id = B.provider_id
join survey_result C on C.provider_id = A.provider_id
group by B.hospital_name) S;

select corr(S.average_score, S.average_survey) average_correlation, corr(S.variance_score,S.average_survey) variance_correlation,
corr(S.average_score, S.average_achievement) achievement_avg_corr, corr(S.variance_score,S.average_achievement) achievement_var_corr,
corr(S.average_score, S.average_improvement) improvement_avg_corr, corr(S.variance_score,S.average_improvement) improvement_var_corr,
corr(S.average_score, S.average_dimension) dimension_avg_corr, corr(variance_score,average_dimension) dimension_var_corr
from (select B.hospital_name, sum(score) as aggregate_score, avg(score) as average_score, variance(score) as variance_score, avg(C.overall_rating) as average_survey,
avg(C.overall_achievements) as average_achievement, avg(C.overall_improvements) as average_improvement, avg(C.overall_dimensions) as average_dimension from procedure A
join hospital B on A.provider_id = B.provider_id
join survey_result C on C.provider_id = A.provider_id
group by B.hospital_name) S;

