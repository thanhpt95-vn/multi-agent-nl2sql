SELECT COUNT(*) FROM conductor;	orchestra
SELECT COUNT(*) FROM conductor	orchestra
SELECT Name FROM conductor ORDER BY Age ASC	orchestra
SELECT Name FROM conductor ORDER BY Age ASC	orchestra
SELECT Name FROM conductor WHERE Nationality != 'USA'	orchestra
SELECT Name FROM conductor WHERE Nationality != 'USA'	orchestra
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC	orchestra
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC;	orchestra
SELECT AVG(Attendance) AS average_attendance FROM show	orchestra
SELECT AVG(Attendance) AS average_attendance FROM show	orchestra
SELECT max(SHARE) , min(SHARE) FROM performance WHERE TYPE <> "Live final"	orchestra
SELECT max(SHARE) , min(SHARE) FROM performance WHERE TYPE <> "Live final"	orchestra
SELECT COUNT(DISTINCT Nationality) AS count FROM conductor	orchestra
SELECT COUNT(DISTINCT Nationality) AS number_of_different_nationalities FROM conductor	orchestra
SELECT Name FROM conductor ORDER BY Year_of_Work DESC	orchestra
SELECT Name FROM conductor ORDER BY Year_of_Work DESC	orchestra
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1;	orchestra
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1	orchestra
SELECT T1.Name, T2.Orchestra FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID	orchestra
SELECT T1.Name, T2.Orchestra FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID	orchestra
SELECT a.Name FROM conductor AS a INNER JOIN orchestra AS b ON a.Conductor_ID = b.Conductor_ID GROUP BY b.Conductor_ID HAVING COUNT(*) > 1	orchestra
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID HAVING COUNT(*) > 1	orchestra
SELECT c.Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name ORDER BY COUNT(*) DESC LIMIT 1	orchestra
SELECT conductor.Name FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID GROUP BY conductor.Conductor_ID ORDER BY COUNT(*) DESC LIMIT 1	orchestra
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008	orchestra
SELECT conductor.Name FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID WHERE orchestra.Year_of_Founded > 2008	orchestra
SELECT Record_Company, COUNT(*) AS number_of_orchestras FROM orchestra GROUP BY Record_Company	orchestra
SELECT Record_Company , COUNT(1) FROM orchestra GROUP BY Record_Company	orchestra
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) ASC	orchestra
SELECT Major_Record_Format, COUNT(*) AS frequency FROM orchestra GROUP BY Major_Record_Format ORDER BY frequency DESC;	orchestra
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1	orchestra
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1	orchestra
SELECT orchestra.Orchestra FROM orchestra LEFT JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID WHERE performance.Orchestra_ID IS NULL	orchestra
SELECT o.Orchestra FROM orchestra AS o LEFT JOIN performance AS p ON o.Orchestra_ID = p.Orchestra_ID WHERE p.Performance_ID IS NULL	orchestra
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003;	orchestra
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003	orchestra
SELECT COUNT(*) FROM orchestra WHERE (Major_Record_Format = "CD" OR Major_Record_Format = "DVD")	orchestra
SELECT COUNT(*) FROM orchestra WHERE (Major_Record_Format = "CD" OR Major_Record_Format = "DVD")	orchestra
SELECT DISTINCT T1.Year_of_Founded FROM orchestra AS T1 JOIN (SELECT Orchestra_ID FROM performance GROUP BY Orchestra_ID HAVING COUNT(Performance_ID) > 1) AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID	orchestra
SELECT DISTINCT T1.Year_of_Founded FROM orchestra AS T1 JOIN (SELECT Orchestra_ID FROM performance GROUP BY Orchestra_ID HAVING COUNT(*) > 1) AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID	orchestra
