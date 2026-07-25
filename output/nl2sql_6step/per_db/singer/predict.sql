SELECT COUNT(*) AS count FROM singer	singer
SELECT COUNT(*) FROM singer;	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC;	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC	singer
SELECT Birth_Year, Citizenship FROM singer	singer
SELECT Birth_Year, Citizenship FROM singer;	singer
SELECT Name FROM singer WHERE Citizenship != "France"	singer
SELECT Name FROM singer WHERE Citizenship != "France"	singer
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949	singer
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1	singer
SELECT Citizenship , COUNT(1) FROM singer GROUP BY Citizenship	singer
SELECT Citizenship, COUNT(*) AS singer_count FROM singer GROUP BY Citizenship	singer
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC	singer
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1	singer
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship	singer
SELECT Citizenship, MAX(Net_Worth_Millions) AS maximum_net_worth FROM singer GROUP BY Citizenship	singer
SELECT b.Title , a.Name FROM singer AS a INNER JOIN song AS b ON a.Singer_ID = b.Singer_ID	singer
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID	singer
SELECT DISTINCT s.Name FROM singer s JOIN song sg ON s.Singer_ID = sg.Singer_ID WHERE sg.Sales > 300000	singer
SELECT DISTINCT singer.Name FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID WHERE song.Sales > 300000	singer
SELECT a.Name FROM singer AS a INNER JOIN song AS b ON a.Singer_ID = b.Singer_ID GROUP BY a.Name HAVING COUNT(*) > 1	singer
SELECT s.Name FROM singer AS s JOIN song AS sg ON s.Singer_ID = sg.Singer_ID GROUP BY s.Name HAVING COUNT(*) > 1	singer
SELECT singer.Name, SUM(song.Sales) AS total_sales FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY singer.Name	singer
SELECT T1.Name, SUM(T2.Sales) AS total_sales FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name	singer
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)	singer
SELECT T1.Name FROM singer AS T1 LEFT JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Singer_ID IS NULL	singer
SELECT Citizenship FROM singer WHERE (Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955)	singer
SELECT Citizenship FROM singer WHERE (Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955)	singer
