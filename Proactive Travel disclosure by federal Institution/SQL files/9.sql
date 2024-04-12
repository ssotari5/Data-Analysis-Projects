SELECT 
CONCAT(DI.name, ' - ', TI.destination) AS traveler_dest,
CONCAT ( TI.start_date, ' to ', TI.end_date) AS travel_dates,
DI.purpose,
CONCAT(C.airfare, '+', C.lodging, '+', C.meals,'+',C.other_transport,'+',C.other_expenses) AS expenses,
C.total AS total_expense
FROM cost C
INNER JOIN travel_info TI ON C.ref_id = TI.ref_id
INNER JOIN doc_info DI ON C.ref_id = DI.ref_id
WHERE TI. destination = 'Boston'
