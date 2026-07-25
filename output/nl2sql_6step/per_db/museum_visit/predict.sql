SELECT COUNT(*) AS count FROM visitor WHERE Age < 30	museum_visit
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC	museum_visit
SELECT AVG(Age) AS average_age FROM visitor WHERE Level_of_membership <= 4	museum_visit
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC	museum_visit
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1	museum_visit
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < '2009'	museum_visit
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'	museum_visit
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > 2010)	museum_visit
SELECT a.id , a.name , a.age FROM visitor AS a INNER JOIN visit AS b ON a.id = b.visitor_id GROUP BY a.id HAVING count(*) > 1	museum_visit
SELECT T1.ID, T1.Name, T1.Level_of_membership FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID GROUP BY T1.ID ORDER BY SUM(T2.Total_spent) DESC LIMIT 1	museum_visit
SELECT b.Museum_ID , a.name FROM museum AS a INNER JOIN visit AS b ON a.Museum_ID = b.Museum_ID GROUP BY b.Museum_ID ORDER BY count(*) DESC LIMIT 1	museum_visit
SELECT museum.Name FROM museum LEFT JOIN visit ON museum.Museum_ID = visit.Museum_ID WHERE visit.Museum_ID IS NULL	museum_visit
SELECT visitor.Name, visitor.Age FROM visitor JOIN visit ON visitor.ID = visit.visitor_ID ORDER BY visit.Num_of_Ticket DESC LIMIT 1	museum_visit
SELECT AVG(Num_of_Ticket), MAX(Num_of_Ticket) FROM visit	museum_visit
SELECT SUM(visit.Total_spent) FROM visit JOIN visitor ON visit.visitor_ID = visitor.ID WHERE visitor.Level_of_membership = 1	museum_visit
SELECT visitor.Name FROM museum JOIN visit ON visit.Museum_ID = museum.Museum_ID JOIN visitor ON visit.visitor_ID = visitor.ID WHERE museum.Open_Year < 2009 INTERSECT SELECT visitor.Name FROM museum JOIN visit ON visit.Museum_ID = museum.Museum_ID JOIN visitor ON visit.visitor_ID = visitor.ID WHERE museum.Open_Year > 2011	museum_visit
SELECT COUNT(*) FROM (SELECT DISTINCT T1.visitor_ID FROM visit AS T1 JOIN museum AS T2 ON T1.Museum_ID = T2.Museum_ID WHERE T2.Open_Year <= 2010 EXCEPT SELECT DISTINCT T1.visitor_ID FROM visit AS T1 JOIN museum AS T2 ON T1.Museum_ID = T2.Museum_ID WHERE T2.Open_Year > 2010) AS temp	museum_visit
SELECT COUNT(*) AS count FROM museum WHERE Open_Year > 2013 OR Open_Year < 2008	museum_visit
