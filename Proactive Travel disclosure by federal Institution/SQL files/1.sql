select salary_rank, title, total  
from(
	select title,total,
	dense_rank() over (order by total desc) as salary_rank
	from (
		select d.title as title, sum(c.total) as total
		from doc_info d
		inner join cost c
		on d.ref_id = c.ref_id
		group by title
	) as title_ranking
) as top_10
where salary_rank <= 10
