SELECT COUNT(*) AS count FROM singer	concert_singer
SELECT COUNT(*) AS total_number_of_singers FROM singer	concert_singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC	concert_singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC	concert_singer
SELECT AVG(Age) AS average_age, MIN(Age) AS minimum_age, MAX(Age) AS maximum_age FROM singer WHERE Country = 'France'	concert_singer
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'	concert_singer
SELECT Name, Song_release_year FROM singer ORDER BY Age ASC LIMIT 1	concert_singer
SELECT song_name , song_release_year FROM singer ORDER BY age ASC LIMIT 1	concert_singer
SELECT DISTINCT Country FROM singer WHERE Age > 20	concert_singer
SELECT DISTINCT Country FROM singer WHERE Age > 20	concert_singer
SELECT Country, COUNT(*) AS number_of_singers FROM singer GROUP BY Country	concert_singer
SELECT Country, COUNT(*) AS Number_of_Singers FROM singer GROUP BY Country	concert_singer
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)	concert_singer
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)	concert_singer
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000	concert_singer
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000	concert_singer
SELECT MAX(Capacity) AS Capacity, AVG(Average) AS Average FROM stadium	concert_singer
SELECT AVG(Capacity) AS average_capacity, MAX(Capacity) AS maximum_capacity FROM stadium	concert_singer
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1	concert_singer
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1	concert_singer
SELECT count(*) FROM concert WHERE (YEAR = 2014 OR YEAR = 2015)	concert_singer
SELECT count(*) FROM concert WHERE (YEAR = 2014 OR YEAR = 2015)	concert_singer
SELECT stadium.Name, COUNT(concert.concert_ID) AS number_of_concerts FROM stadium INNER JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID GROUP BY stadium.Name	concert_singer
SELECT b.name , count(*) FROM concert AS a INNER JOIN stadium AS b ON a.stadium_id = b.stadium_id GROUP BY a.stadium_id	concert_singer
SELECT b.name , b.capacity FROM concert AS a INNER JOIN stadium AS b ON a.stadium_id = b.stadium_id WHERE a.year >= 2014 GROUP BY b.stadium_id ORDER BY count(*) DESC LIMIT 1	concert_singer
SELECT T1.Name, T1.Capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year > 2013 GROUP BY T1.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1	concert_singer
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1	concert_singer
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1	concert_singer
SELECT T1.Name FROM stadium AS T1 LEFT JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Stadium_ID IS NULL	concert_singer
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)	concert_singer
SELECT DISTINCT Country FROM singer WHERE Age > 40 INTERSECT SELECT DISTINCT Country FROM singer WHERE Age < 30	concert_singer
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')	concert_singer
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014)	concert_singer
SELECT T1.concert_Name, T1.Theme, COUNT(*) AS singer_count FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID GROUP BY T1.concert_ID	concert_singer
select b.concert_name , b.theme , count(*) from singer_in_concert AS a INNER JOIN concert AS b on a.concert_id = b.concert_id group by b.concert_id	concert_singer
SELECT singer.Name, COUNT(singer_in_concert.concert_ID) AS number_of_concerts FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID GROUP BY singer.Singer_ID	concert_singer
SELECT b.name , count(*) FROM singer_in_concert AS a INNER JOIN singer AS b ON a.singer_id = b.singer_id GROUP BY b.singer_id	concert_singer
SELECT singer.Name FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID JOIN concert ON singer_in_concert.concert_ID = concert.concert_ID WHERE concert.Year = 2014	concert_singer
SELECT singer.Name FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID JOIN concert ON singer_in_concert.concert_ID = concert.concert_ID WHERE concert.Year = 2014	concert_singer
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'	concert_singer
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'	concert_singer
SELECT T1.Name, T1.Location FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = '2014' INTERSECT SELECT T1.Name, T1.Location FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = '2015'	concert_singer
SELECT stadium.Name, stadium.Location FROM stadium JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID WHERE concert.Year = 2014 INTERSECT SELECT stadium.Name, stadium.Location FROM stadium JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID WHERE concert.Year = 2015	concert_singer
SELECT COUNT(*) AS "Number of Concerts" FROM concert JOIN stadium ON concert.Stadium_ID = stadium.Stadium_ID WHERE stadium.Capacity = (SELECT MAX(Capacity) FROM stadium)	concert_singer
SELECT COUNT(*) AS concert_count FROM concert JOIN stadium ON concert.Stadium_ID = stadium.Stadium_ID WHERE stadium.Capacity = (SELECT MAX(Capacity) FROM stadium)	concert_singer
