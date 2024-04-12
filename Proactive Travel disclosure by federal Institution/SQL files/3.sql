select start_month, total_count,
rank () over (order by total_count desc) as ranking
from (
		select
		case
			when extract(month from start_date) = 1 then 'January'
			when extract(month from start_date) = 2 then 'February'
			when extract(month from start_date) = 3 then 'March'
			when extract(month from start_date) = 4 then 'April'
			when extract(month from start_date) = 5 then 'May'
			when extract(month from start_date) = 6 then 'June'
			when extract(month from start_date) = 7 then 'July'
			when extract(month from start_date) = 8 then 'August'
			when extract(month from start_date) = 9 then 'September'
			when extract(month from start_date) = 10 then 'October'
			when extract(month from start_date) = 11 then 'November'
			when extract(month from start_date) = 12 then 'December'
		end as start_month,
	count(info_id) as total_count
	from travel_info
	group by start_month
	order by start_month
) as rank_outer     
