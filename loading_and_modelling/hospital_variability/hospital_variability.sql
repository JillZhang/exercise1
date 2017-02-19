select A.measure_name, sum(score) as aggregate_score, avg(score) as average_score, variance(score) as variance_score from procedure A
join hospital B on A.provider_id = B.provider_id
group by A.measure_name
order by variance_score desc limit 10;