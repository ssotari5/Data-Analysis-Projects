with min_max as(
		select min(total) as min_total, max(total) as max_total from cost
),
histogram as (
	select width_bucket(total,min_total,max_total,5) as bucket, count(cost_id) as total_count 
	from cost c inner join min_max m
	on 1=1
	group by bucket
	order by bucket
)

select concat(low_value,' - ',high_value) as bucket_range,
total_count 
from (
	select bucket, 
	floor(((max_total - min_total)/5) * (bucket - 1)) as low_value,
	floor(((max_total - min_total)/5) * bucket) as high_value,
	total_count
	from histogram inner join min_max on 1=1) as outer_query
