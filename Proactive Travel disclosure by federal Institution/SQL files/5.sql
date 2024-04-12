SELECT
    org_owner_title,
    total_cost,
    airfare_percentage
FROM
    (
        SELECT
            o.org_owner_title,
            SUM(c.total) AS total_cost,
            (
                SUM(c.airfare) / SUM(c.total) * 100
            ) AS airfare_percentage
        FROM
            organization o
        INNER JOIN cost c ON o.ref_id = c.ref_id
        GROUP BY o.org_owner_title
    ) AS org_costs
ORDER BY
    total_cost ;
