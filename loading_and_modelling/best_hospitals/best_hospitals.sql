select B.hospital_name, sum(score) as aggregate_score, avg(score) as average_score, variance(score) as variance_score from procedure A
join hospital B on A.provider_id = B.provider_id
group by B.hospital_name
order by average_score desc limit 10;
