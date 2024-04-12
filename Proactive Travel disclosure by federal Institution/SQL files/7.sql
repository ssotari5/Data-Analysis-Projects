WITH trip_counts AS (
 SELECT
        o.org_owner_title,
       COUNT(ti.info_id) AS trip_count,
        RANK() OVER (ORDER BY COUNT(ti.info_id) DESC) AS row_num
    FROM
        organization o
    JOIN
        doc_info di ON o.ref_id = di.ref_id
    JOIN
        travel_info ti ON di.ref_id = ti.ref_id
    GROUP BY
        o.org_owner_title
    HAVING
        COUNT(ti.info_id) > 2
)
SELECT
    org_owner_title,
    trip_count
FROM
    trip_counts
ORDER BY trip_count DESC;
