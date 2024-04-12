--This file is Created by Siddhesh Otari-8934061
--The below query is created for the Assignment 3 Role of an Analyst - Descriptive Analysis Program -  W-24 Business Analytics section-1
--Here I have created a Data table for the selected metrics where as I have added Longitude and Latitude column from the location table
-- for creating 3D maps visualization
SELECT 
    c.City_ID,
    c.CityName,
    e.Year,
    e.Month,
    e.total_employment,
    e.goods_producing_sector,
    e.services_producing_sector,
    e.public_administration,
    d.total_population,
	l.Latitude,
	l.Longitude
FROM 
    City c
INNER JOIN 
    Cost_of_Living col ON c.city_id = col.city_id
INNER JOIN 
	location l on col.city_id = l.city_id
INNER JOIN 
    Employment e ON col.Year = e.Year 
                 AND col.Month = e.Month 
                 AND col.city_id = e.city_id
INNER JOIN 
    Demographics d ON col.city_id = d.city_id
					AND col.Month = d.Month 
                 AND col.year = d.year ;
