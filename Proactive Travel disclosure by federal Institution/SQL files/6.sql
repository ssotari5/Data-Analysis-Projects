with ranked_trips AS (
    SELECT
        ti.destination,
        MIN(ti.start_date) AS first_trip_start_date,
        MAX(ti.end_date) AS last_trip_end_date,
        SUM(c.total) AS total_spent,
        RANK() OVER (ORDER BY SUM(c.total) DESC) AS rank_num
    FROM
        travel_info ti
    JOIN
        cost c ON ti.ref_id = c.ref_id
    WHERE
        c.total > 5000
        AND ti.start_date >= '2018-01-01'
    GROUP BY
        ti.destination
)
SELECT
    destination AS "Location",
	(last_trip_end_date - first_trip_start_date) AS "Duration (In Days)",
    ROUND((total_spent / (last_trip_end_date - first_trip_start_date)),2) AS "Expense Per Day (Calculated)",
	total_spent AS "Total Spent for Location"	
FROM
    ranked_trips
WHERE
    rank_num <= 10
ORDER BY
	"Expense Per Day (Calculated)" DESC;
