SELECT count(*) FROM CONTINENTS;	car_1
SELECT COUNT(*) FROM continents	car_1
SELECT continents.ContId, continents.Continent, COUNT(*) as number_of_countries FROM continents JOIN countries ON countries.Continent = continents.ContId GROUP BY continents.ContId, continents.Continent	car_1
SELECT continents.ContId, continents.Continent, COUNT(*) AS CountryCount FROM continents INNER JOIN countries ON countries.Continent = continents.ContId GROUP BY continents.ContId, continents.Continent	car_1
SELECT COUNT(*) FROM countries	car_1
SELECT count(*) FROM COUNTRIES;	car_1
SELECT car_makers.FullName, car_makers.Id, COUNT(*) AS number_of_models FROM car_makers JOIN model_list ON model_list.Maker = car_makers.Id GROUP BY car_makers.FullName, car_makers.Id	car_1
SELECT car_makers.FullName, car_makers.Id, COUNT(*) AS model_count FROM car_makers JOIN model_list ON model_list.Maker = car_makers.Id GROUP BY car_makers.FullName, car_makers.Id	car_1
SELECT model_list.Model FROM model_list JOIN car_names ON car_names.Model = model_list.Model JOIN cars_data ON cars_data.Id = car_names.MakeId WHERE cars_data.Horsepower = (SELECT MIN(Horsepower) FROM cars_data)	car_1
SELECT model_list.Model FROM model_list JOIN car_names ON car_names.Model = model_list.Model JOIN cars_data ON cars_data.Id = car_names.MakeId ORDER BY cars_data.Horsepower ASC LIMIT 1	car_1
SELECT model_list.Model FROM model_list JOIN car_names ON car_names.Model = model_list.Model JOIN cars_data ON cars_data.Id = car_names.MakeId WHERE cars_data.Weight < (SELECT AVG(Weight) FROM cars_data)	car_1
SELECT model_list.Model FROM model_list JOIN car_names ON car_names.Model = model_list.Model JOIN cars_data ON cars_data.Id = car_names.MakeId WHERE cars_data.Weight < (SELECT AVG(cars_data.Weight) FROM cars_data)	car_1
SELECT DISTINCT car_makers.Maker FROM car_makers JOIN model_list ON model_list.Maker = car_makers.Id JOIN car_names ON car_names.Model = model_list.Model JOIN cars_data ON cars_data.Id = car_names.MakeId WHERE cars_data.Year = 1970	car_1
SELECT DISTINCT car_makers.Maker FROM car_makers JOIN model_list ON model_list.Maker = car_makers.Id JOIN car_names ON car_names.Model = model_list.Model JOIN cars_data ON cars_data.Id = car_names.MakeId WHERE cars_data.Year = 1970	car_1
SELECT car_makers.Maker, cars_data.Year FROM car_makers JOIN model_list ON model_list.Maker = car_makers.Id JOIN car_names ON car_names.Model = model_list.Model JOIN cars_data ON cars_data.Id = car_names.MakeId WHERE cars_data.Year = (SELECT MIN(Year) FROM cars_data)	car_1
SELECT car_makers.Maker, cars_data.Year FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Year = (SELECT MIN(Year) FROM cars_data)	car_1
SELECT DISTINCT car_names.Model FROM car_names INNER JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Year > 1980	car_1
SELECT DISTINCT model_list.Model FROM model_list JOIN car_names ON car_names.Model = model_list.Model JOIN cars_data ON cars_data.Id = car_names.MakeId WHERE cars_data.Year > 1980	car_1
SELECT a.Continent , count(*) FROM CONTINENTS AS a INNER JOIN COUNTRIES AS b ON a.ContId = b.continent INNER JOIN car_makers AS c ON b.CountryId = c.Country GROUP BY a.Continent;	car_1
SELECT continents.Continent, COUNT(*) AS "Number of Car Makers" FROM continents JOIN countries ON countries.Continent = continents.ContId JOIN car_makers ON car_makers.Country = countries.CountryId GROUP BY continents.Continent	car_1
SELECT countries.CountryName FROM countries JOIN car_makers ON car_makers.Country = countries.CountryId GROUP BY car_makers.Country HAVING COUNT(car_makers.Maker) = (SELECT MAX(maker_count) FROM (SELECT COUNT(car_makers.Maker) AS maker_count FROM car_makers GROUP BY car_makers.Country) AS temp);	car_1
SELECT b.CountryName FROM CAR_MAKERS AS a INNER JOIN COUNTRIES AS b ON a.Country = b.CountryId GROUP BY a.Country ORDER BY Count(*) DESC LIMIT 1;	car_1
select count(*) , b.fullname from model_list AS a INNER JOIN car_makers AS b on a.maker = b.id group by b.id;	car_1
SELECT COUNT(model_list.ModelId), car_makers.Id, car_makers.FullName FROM car_makers JOIN model_list ON model_list.Maker = car_makers.Id GROUP BY car_makers.Id, car_makers.FullName	car_1
SELECT cars_data.Accelerate FROM car_names INNER JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE car_names.Make = 'amc hornet sportabout (sw)'	car_1
SELECT cars_data.Accelerate FROM car_names INNER JOIN cars_data ON cars_data.Id = car_names.MakeId WHERE car_names.Make = 'amc hornet sportabout (sw)'	car_1
SELECT count(*) FROM CAR_MAKERS AS a INNER JOIN COUNTRIES AS b ON a.Country = b.CountryId WHERE b.CountryName = 'france';	car_1
SELECT count(*) FROM CAR_MAKERS AS a INNER JOIN COUNTRIES AS b ON a.Country = b.CountryId WHERE b.CountryName = 'france';	car_1
SELECT COUNT(*) AS Count FROM countries JOIN car_makers ON car_makers.Country = countries.CountryId JOIN model_list ON model_list.Maker = car_makers.Id WHERE countries.CountryName = 'usa'	car_1
SELECT count(*) FROM MODEL_LIST AS a INNER JOIN CAR_MAKERS AS b ON a.Maker = b.Id INNER JOIN COUNTRIES AS c ON b.Country = c.CountryId WHERE c.CountryName = 'usa';	car_1
SELECT AVG(MPG) AS AVG_MPG FROM cars_data WHERE Cylinders = 4	car_1
SELECT AVG(MPG) FROM cars_data WHERE (Cylinders = 4)	car_1
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974	car_1
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974	car_1
SELECT car_makers.Maker, model_list.Model FROM car_makers JOIN model_list ON model_list.Maker = car_makers.Id	car_1
SELECT T1.Maker, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T2.Maker = T1.Id	car_1
SELECT countries.CountryName, countries.CountryId FROM countries WHERE EXISTS (SELECT 1 FROM car_makers WHERE car_makers.Country = countries.CountryId)	car_1
SELECT countries.CountryName, countries.CountryId FROM countries WHERE EXISTS (SELECT 1 FROM car_makers WHERE car_makers.Country = countries.CountryId)	car_1
SELECT COUNT(*) FROM cars_data WHERE (Horsepower > 150)	car_1
SELECT COUNT(*) AS number_of_cars FROM cars_data WHERE Horsepower > 150	car_1
SELECT AVG(Weight) AS average_weight, Year FROM cars_data GROUP BY Year	car_1
SELECT AVG(Weight) AS average_weight, Year FROM cars_data GROUP BY Year	car_1
SELECT countries.CountryName FROM continents JOIN countries ON countries.Continent = continents.ContId JOIN car_makers ON car_makers.Country = countries.CountryId WHERE continents.Continent = 'europe' GROUP BY countries.CountryId HAVING COUNT(car_makers.Maker) >= 3	car_1
SELECT countries.CountryName FROM countries JOIN continents ON countries.Continent = continents.ContId JOIN car_makers ON car_makers.Country = countries.CountryId WHERE continents.Continent = 'europe' GROUP BY countries.CountryName HAVING COUNT(car_makers.Country) >= 3	car_1
SELECT MAX(cars_data.Horsepower), car_names.Make FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Cylinders = 3	car_1
SELECT MAX(cars_data.Horsepower), car_makers.Maker FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Cylinders = 3	car_1
SELECT model_list.Model FROM model_list JOIN car_names ON car_names.Model = model_list.Model JOIN cars_data ON cars_data.Id = car_names.MakeId ORDER BY cars_data.MPG DESC LIMIT 1	car_1
select a.model from car_names AS a INNER JOIN cars_data AS b on a.makeid = b.id order by b.mpg desc limit 1;	car_1
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980	car_1
SELECT AVG(Horsepower) AS AVG_Horsepower FROM cars_data WHERE Year < 1980	car_1
SELECT avg(b.edispl) FROM CAR_NAMES AS a INNER JOIN CARS_DATA AS b ON a.MakeId = b.Id WHERE a.Model = 'volvo';	car_1
SELECT AVG(T4.Edispl) AS avg_edispl FROM car_makers AS T1 JOIN model_list AS T2 ON T2.Maker = T1.Id JOIN car_names AS T3 ON T3.Model = T2.Model JOIN cars_data AS T4 ON T4.Id = T3.MakeId WHERE T1.Maker = 'volvo'	car_1
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders	car_1
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders	car_1
SELECT model_list.Model FROM model_list JOIN car_names ON car_names.Model = model_list.Model GROUP BY model_list.Model HAVING COUNT(car_names.Make) = (SELECT MAX(subquery.counts) FROM (SELECT COUNT(*) AS counts FROM car_names GROUP BY car_names.Model) AS subquery)	car_1
SELECT model_list.Model FROM model_list JOIN car_names ON model_list.Model = car_names.Model GROUP BY car_names.Model HAVING COUNT(car_names.MakeId) = (SELECT MAX(version_count) FROM (SELECT COUNT(MakeId) AS version_count FROM car_names GROUP BY Model))	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4	car_1
SELECT COUNT(*) FROM cars_data WHERE Year = 1980	car_1
SELECT COUNT(*) FROM cars_data WHERE Year = 1980	car_1
SELECT count(*) FROM CAR_MAKERS AS a INNER JOIN MODEL_LIST AS b ON a.Id = b.Maker WHERE a.FullName = 'American Motor Company';	car_1
SELECT COUNT(*) AS number_of_models FROM car_makers JOIN model_list ON model_list.Maker = car_makers.Id WHERE car_makers.FullName = 'American Motor Company'	car_1
SELECT a.FullName , a.Id FROM CAR_MAKERS AS a INNER JOIN MODEL_LIST AS b ON a.Id = b.Maker GROUP BY a.Id HAVING count(*) > 3;	car_1
SELECT car_makers.Maker, car_makers.Id FROM car_makers JOIN model_list ON model_list.Maker = car_makers.Id GROUP BY car_makers.Maker, car_makers.Id HAVING COUNT(model_list.Maker) > 3	car_1
SELECT DISTINCT model_list.Model FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.FullName = 'General Motors' UNION SELECT DISTINCT model_list.Model FROM model_list JOIN car_names ON car_names.Model = model_list.Model JOIN cars_data ON cars_data.Id = car_names.MakeId WHERE cars_data.Weight > 3500	car_1
SELECT model_list.Model FROM car_makers JOIN model_list ON model_list.Maker = car_makers.Id WHERE car_makers.FullName = 'General Motors' UNION SELECT model_list.Model FROM model_list JOIN car_names ON car_names.Model = model_list.Model JOIN cars_data ON cars_data.Id = car_names.MakeId WHERE cars_data.Weight > 3500	car_1
SELECT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000	car_1
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 INTERSECT SELECT DISTINCT Year FROM cars_data WHERE Weight > 3000	car_1
SELECT Horsepower FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data)	car_1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1	car_1
SELECT cars_data.Cylinders FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model WHERE model_list.Model = 'volvo' ORDER BY cars_data.Accelerate ASC LIMIT 1	car_1
SELECT a.cylinders FROM CARS_DATA AS a INNER JOIN CAR_NAMES AS b ON a.Id = b.MakeId WHERE b.Model = 'volvo' ORDER BY a.accelerate ASC LIMIT 1;	car_1
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(CAST(Horsepower AS REAL)) FROM cars_data)	car_1
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(CAST(Horsepower AS NUMERIC)) FROM cars_data)	car_1
SELECT COUNT(*) FROM (SELECT T1.CountryId FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId HAVING COUNT(T2.Id) > 2)	car_1
select count(*) from countries AS a INNER JOIN car_makers AS b on a.countryid = b.country group by a.countryid having count(*) > 2	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6	car_1
SELECT COUNT(*) AS number_of_cars FROM cars_data WHERE Cylinders > 6	car_1
SELECT a.Model FROM CAR_NAMES AS a INNER JOIN CARS_DATA AS b ON a.MakeId = b.Id WHERE b.Cylinders = 4 ORDER BY b.horsepower DESC LIMIT 1;	car_1
SELECT Id AS Model FROM cars_data WHERE Cylinders = 4 ORDER BY CAST(Horsepower AS REAL) DESC LIMIT 1	car_1
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T2.Maker = T1.Id JOIN car_names AS T3 ON T3.Model = T2.Model JOIN cars_data AS T4 ON T4.Id = T3.MakeId WHERE T4.Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND T4.Cylinders <= 3	car_1
SELECT car_makers.Id, car_makers.FullName FROM car_makers JOIN model_list ON model_list.Maker = car_makers.Id JOIN car_names ON car_names.Model = model_list.Model JOIN cars_data ON cars_data.Id = car_names.MakeId WHERE cars_data.Cylinders < 4 AND cars_data.Horsepower <> (SELECT MIN(Horsepower) FROM cars_data)	car_1
SELECT MAX(MPG) FROM cars_data WHERE (Cylinders = 8 OR Year < 1980)	car_1
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980	car_1
SELECT T1.Model FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id JOIN car_names AS T3 ON T1.Model = T3.Model JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T4.Weight < 3500 AND T2.FullName <> 'Ford Motor Company'	car_1
SELECT DISTINCT T1.Model FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id JOIN car_names AS T3 ON T1.Model = T3.Model JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T4.Weight < 3500 AND T2.FullName <> 'Ford Motor Company'	car_1
SELECT CountryName FROM countries WHERE NOT EXISTS (SELECT 1 FROM car_makers WHERE car_makers.Country = countries.CountryId)	car_1
SELECT CountryName FROM countries WHERE NOT EXISTS (SELECT 1 FROM car_makers WHERE car_makers.Country = countries.CountryId)	car_1
SELECT car_makers.Id, car_makers.Maker FROM car_makers JOIN model_list ON model_list.Maker = car_makers.Id GROUP BY car_makers.Id HAVING COUNT(model_list.ModelId) >= 2 AND (SELECT COUNT(DISTINCT car_makers.Id) FROM car_makers) > 3	car_1
SELECT car_makers.Id, car_makers.Maker FROM car_makers JOIN model_list ON model_list.Maker = car_makers.Id JOIN car_names ON car_names.Model = model_list.Model GROUP BY car_makers.Id, car_makers.Maker HAVING COUNT(model_list.Maker) >= 2 AND COUNT(car_names.Make) > 3	car_1
SELECT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON car_makers.Country = countries.CountryId GROUP BY countries.CountryId, countries.CountryName HAVING COUNT(*) > 3 UNION SELECT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON car_makers.Country = countries.CountryId JOIN model_list ON model_list.Maker = car_makers.Id WHERE model_list.Model = 'fiat'	car_1
SELECT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY countries.CountryId HAVING COUNT(car_makers.Maker) > 3 UNION SELECT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON car_makers.Country = countries.CountryId JOIN model_list ON model_list.Maker = car_makers.Id WHERE model_list.Model = 'fiat'	car_1
