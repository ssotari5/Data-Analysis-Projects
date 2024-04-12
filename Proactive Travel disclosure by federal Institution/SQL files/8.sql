SELECT 
    DI.name AS traveler_name,
    TI.destination,
    COUNT(C.cost_id) AS num_trips,
    ROUND(AVG(C.total), 2) AS average_expenses,
    SUM(C.total) AS total_expenses
FROM cost AS C
INNER JOIN travel_info AS TI ON C.ref_id = TI.ref_id
INNER JOIN doc_info AS DI ON C.ref_id = DI.ref_id
WHERE TI.destination = 'Regina'
GROUP BY DI.name, TI.destination;
