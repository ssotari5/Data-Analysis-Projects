select coalesce(d.disclosure_group, 'Total') as disclosure_group, 
round(sum(total),0)::integer as total_expenses
from doc_info d
inner join 
cost c
on c.ref_id = d.ref_id
group by cube (disclosure_group)
order by disclosure_group
