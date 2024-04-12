WITH RankedOrganizations AS (
    SELECT
        org.org_owner,
        ROUND(AVG(cost.total), 2) AS avg_total_cost,
        RANK() OVER (ORDER BY AVG(cost.total) DESC) AS org_rank
    FROM
        public.organization AS org
    JOIN public.doc_info AS doc ON org.ref_id = doc.ref_id
    JOIN public.travel_info AS travel ON doc.ref_id = travel.ref_id
    JOIN public.cost AS cost ON doc.ref_id = cost.ref_id
    GROUP BY
        org.org_owner
    HAVING
        COUNT(travel.info_id) > 1
)
SELECT
    org_owner,
    avg_total_cost
FROM
    RankedOrganizations
WHERE
    org_rank <= 10;
