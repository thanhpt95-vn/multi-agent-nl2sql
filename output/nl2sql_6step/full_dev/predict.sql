SELECT Name FROM country WHERE IndepYear > 1950	world_1
SELECT Name FROM country WHERE IndepYear > 1950	world_1
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'	world_1
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'	world_1
SELECT SUM(SurfaceArea) AS total_surface_area FROM country WHERE Region = 'Caribbean'	world_1
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'	world_1
SELECT Continent FROM country WHERE Name = 'Anguilla'	world_1
SELECT Continent FROM country WHERE Name = 'Anguilla'	world_1
SELECT country.Region FROM city JOIN country ON city.CountryCode = country.Code WHERE city.Name = 'Kabul'	world_1
SELECT country.Region FROM city JOIN country ON city.CountryCode = country.Code WHERE city.Name = 'Kabul'	world_1
SELECT countrylanguage.Language FROM country JOIN countrylanguage ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba' ORDER BY countrylanguage.Percentage DESC LIMIT 1	world_1
SELECT countrylanguage.Language FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Name = 'Aruba'	world_1
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'	world_1
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'	world_1
SELECT Region, Population FROM country WHERE Name = 'Angola'	world_1
SELECT Region, Population FROM country WHERE Name = 'Angola'	world_1
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'	world_1
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'	world_1
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1	world_1
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1	world_1
SELECT SUM(Population) AS total_population, MAX(GNP) AS maximum_gnp FROM country WHERE Continent = 'Asia'	world_1
SELECT COUNT(*), MAX(GNP) FROM country WHERE Continent = 'Asia'	world_1
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'	world_1
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'	world_1
SELECT SUM(SurfaceArea) FROM country WHERE Continent = 'Asia' OR Continent = 'Europe'	world_1
SELECT SUM(SurfaceArea) FROM country WHERE Continent = 'Asia' OR Continent = 'Europe'	world_1
SELECT COUNT(*) FROM city WHERE District = 'Gelderland'	world_1
SELECT SUM(Population) AS total_population FROM city WHERE District = 'Gelderland'	world_1
SELECT AVG(GNP) AS average_gnp, SUM(Population) AS total_population FROM country WHERE GovernmentForm = 'US Territory'	world_1
SELECT avg(GNP) , sum(population) FROM country WHERE (GovernmentForm = "US Territory")	world_1
SELECT COUNT(DISTINCT Language) AS count_distinct_languages FROM countrylanguage	world_1
SELECT count(DISTINCT LANGUAGE) FROM countrylanguage	world_1
SELECT count(DISTINCT GovernmentForm) FROM country WHERE (Continent = "Africa")	world_1
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'	world_1
SELECT COUNT(b.Language) FROM country AS a INNER JOIN countrylanguage AS b ON a.Code = b.CountryCode WHERE a.Name = "Aruba"	world_1
SELECT COUNT(*) AS "number of languages" FROM countrylanguage WHERE CountryCode = 'ABW'	world_1
SELECT COUNT(*) FROM country AS a INNER JOIN countrylanguage AS b ON a.Code = b.CountryCode WHERE a.Name = "Afghanistan" AND IsOfficial = "T"	world_1
SELECT COUNT(*) FROM country AS a INNER JOIN countrylanguage AS b ON a.Code = b.CountryCode WHERE a.Name = "Afghanistan" AND IsOfficial = "T"	world_1
SELECT country.Name FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY countrylanguage.CountryCode ORDER BY COUNT(countrylanguage.Language) DESC LIMIT 1	world_1
SELECT country.Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Code ORDER BY COUNT(countrylanguage.Language) DESC LIMIT 1	world_1
SELECT country.Continent FROM country JOIN countrylanguage ON countrylanguage.CountryCode = country.Code GROUP BY country.Continent HAVING COUNT(DISTINCT countrylanguage.Language) = (SELECT MAX(language_count) FROM (SELECT COUNT(DISTINCT countrylanguage.Language) AS language_count FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Continent) AS language_counts)	world_1
SELECT a.Continent FROM country AS a INNER JOIN countrylanguage AS b ON a.Code = b.CountryCode GROUP BY a.Continent ORDER BY COUNT(*) DESC LIMIT 1	world_1
SELECT COUNT(*) FROM (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' UNION SELECT CountryCode FROM countrylanguage WHERE Language = 'Dutch') GROUP BY CountryCode HAVING COUNT(*) = 2;	world_1
SELECT COUNT(*) FROM (SELECT country.Code FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' INTERSECT SELECT country.Code FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Dutch')	world_1
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') INTERSECT SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'French')	world_1
SELECT DISTINCT country.Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' INTERSECT SELECT DISTINCT country.Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'French'	world_1
SELECT Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T' INTERSECT SELECT Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT DISTINCT c.Name FROM country c JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode WHERE cl1.Language = 'English' AND cl1.IsOfficial = 'T' INTERSECT SELECT DISTINCT c.Name FROM country c JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode WHERE cl2.Language = 'French' AND cl2.IsOfficial = 'T'	world_1
SELECT COUNT(DISTINCT country.Continent) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Chinese'	world_1
SELECT COUNT(DISTINCT country.Continent) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Chinese'	world_1
SELECT DISTINCT a.Region FROM country AS a INNER JOIN countrylanguage AS b ON a.Code = b.CountryCode WHERE b.Language = "English" OR b.Language = "Dutch"	world_1
SELECT DISTINCT country.Region FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Dutch' OR countrylanguage.Language = 'English'	world_1
SELECT country.Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' OR countrylanguage.Language = 'Dutch'	world_1
SELECT country.Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' OR countrylanguage.Language = 'Dutch'	world_1
SELECT countrylanguage.Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Continent = 'Asia' ORDER BY countrylanguage.Percentage DESC LIMIT 1	world_1
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.Continent = 'Asia' GROUP BY cl.Language HAVING COUNT(cl.CountryCode) = (SELECT MAX(country_count) FROM (SELECT COUNT(cl_sub.CountryCode) AS country_count FROM countrylanguage cl_sub JOIN country c_sub ON cl_sub.CountryCode = c_sub.Code WHERE c_sub.Continent = 'Asia' GROUP BY cl_sub.Language) AS counts_subquery)	world_1
SELECT b.Language FROM country AS a INNER JOIN countrylanguage AS b ON a.Code = b.CountryCode WHERE a.GovernmentForm = "Republic" GROUP BY b.Language HAVING COUNT(*) = 1	world_1
SELECT DISTINCT countrylanguage.Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.GovernmentForm = 'Republic' GROUP BY countrylanguage.Language HAVING COUNT(DISTINCT countrylanguage.CountryCode) = 1	world_1
SELECT city.Name FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' ORDER BY city.Population DESC LIMIT 1	world_1
SELECT city.Name FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' ORDER BY city.Population DESC LIMIT 1	world_1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1	world_1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1	world_1
SELECT AVG(country.LifeExpectancy) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language <> 'English' AND countrylanguage.IsOfficial = 'F'	world_1
SELECT AVG(country.LifeExpectancy) FROM country JOIN countrylanguage ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.Language <> 'English' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT SUM(country.Population) AS total_population FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language <> 'English'	world_1
SELECT SUM(country.Population) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language <> 'English'	world_1
SELECT countrylanguage.Language FROM country JOIN countrylanguage ON countrylanguage.CountryCode = country.Code WHERE country.HeadOfState = 'Beatrix'	world_1
SELECT countrylanguage.Language FROM country JOIN countrylanguage ON countrylanguage.CountryCode = country.Code WHERE country.HeadOfState = 'Beatrix' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT COUNT(DISTINCT countrylanguage.Language) AS total_number_of_unique_official_languages FROM country JOIN countrylanguage ON countrylanguage.CountryCode = country.Code WHERE country.IndepYear < 1930 AND countrylanguage.IsOfficial = 'T'	world_1
SELECT COUNT(DISTINCT countrylanguage.Language) AS 'total number of distinct official languages' FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.IndepYear < 1930	world_1
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')	world_1
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')	world_1
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')	world_1
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')	world_1
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa')	world_1
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa')	world_1
SELECT Code FROM country WHERE NOT EXISTS (SELECT 1 FROM countrylanguage WHERE countrylanguage.CountryCode = country.Code AND countrylanguage.Language = 'English')	world_1
SELECT DISTINCT country.Code FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Code NOT IN (SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language = 'English')	world_1
SELECT DISTINCT CountryCode FROM countrylanguage WHERE LANGUAGE != "English"	world_1
SELECT DISTINCT country.Code FROM country JOIN countrylanguage ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.Language <> 'English'	world_1
SELECT country.Code FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language <> 'English' EXCEPT SELECT country.Code FROM country WHERE country.GovernmentForm = 'Republic'	world_1
SELECT DISTINCT country.Code FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.GovernmentForm <> 'Republic' AND NOT EXISTS (SELECT 1 FROM countrylanguage WHERE countrylanguage.CountryCode = country.Code AND countrylanguage.Language = 'English')	world_1
SELECT DISTINCT city.Name FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Europe' AND countrylanguage.Language <> 'English' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT city.Name FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Europe' AND countrylanguage.Language <> 'English' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT DISTINCT city.Name FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Asia' AND countrylanguage.Language = 'Chinese' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT DISTINCT city.Name FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Asia' AND countrylanguage.Language = 'Chinese' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1	world_1
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT MIN(Population) FROM country)	world_1
SELECT Population, Name, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1	world_1
SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1	world_1
SELECT country.Name, COUNT(countrylanguage.Language) AS language_count FROM country INNER JOIN countrylanguage ON countrylanguage.CountryCode = country.Code GROUP BY country.Name HAVING COUNT(countrylanguage.Language) >= 3	world_1
SELECT COUNT(b.Language) , a.Name FROM country AS a INNER JOIN countrylanguage AS b ON a.Code = b.CountryCode GROUP BY a.Name HAVING COUNT(*) > 2	world_1
SELECT city.District, COUNT(*) FROM city WHERE city.Population > (SELECT AVG(city.Population) FROM city) GROUP BY city.District	world_1
SELECT District, COUNT(*) AS CityCount FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District	world_1
SELECT GovernmentForm, SUM(Population) AS TotalPopulation FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72	world_1
SELECT GovernmentForm, SUM(Population) AS TotalPopulation FROM country WHERE LifeExpectancy > 72 GROUP BY GovernmentForm	world_1
SELECT AVG(LifeExpectancy) AS average_life_expectancy, SUM(Population) AS total_population FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72	world_1
SELECT Continent, SUM(Population) AS TotalPopulation, AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72	world_1
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5	world_1
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5	world_1
SELECT Name FROM country ORDER BY Population DESC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population DESC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population ASC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population ASC LIMIT 3	world_1
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'	world_1
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'	world_1
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000	world_1
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000	world_1
SELECT SUM(Population) AS total_population, AVG(SurfaceArea) AS average_area FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000	world_1
SELECT SUM(Population) AS total_population, AVG(SurfaceArea) AS average_surface_area FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000	world_1
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000	world_1
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000	world_1
SELECT Language FROM countrylanguage GROUP BY Language HAVING COUNT(CountryCode) = (SELECT MAX(country_count) FROM (SELECT COUNT(CountryCode) AS country_count FROM countrylanguage GROUP BY Language) AS subquery)	world_1
SELECT Language FROM countrylanguage GROUP BY Language HAVING COUNT(CountryCode) = (SELECT MAX(CNT) FROM (SELECT COUNT(CountryCode) AS CNT FROM countrylanguage GROUP BY Language))	world_1
SELECT c.Name, cl.Language FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Percentage = (SELECT MAX(cl2.Percentage) FROM countrylanguage cl2 WHERE cl2.CountryCode = c.Code)	world_1
SELECT country.Code, countrylanguage.Language FROM country INNER JOIN countrylanguage ON countrylanguage.CountryCode = country.Code WHERE (countrylanguage.Percentage = (SELECT MAX(Percentage) FROM countrylanguage AS cl WHERE cl.CountryCode = country.Code))	world_1
SELECT COUNT(*) AS total_number_of_countries FROM (SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC LIMIT 1)	world_1
SELECT COUNT(*) FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Spanish'	world_1
SELECT countrylanguage.CountryCode FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.Language = 'Spanish' GROUP BY countrylanguage.CountryCode HAVING MAX(countrylanguage.Percentage) = (SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish')	world_1
SELECT country.Code FROM country JOIN countrylanguage ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.Language = 'Spanish'	world_1
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
SELECT COUNT(*) FROM Documents	cre_Doc_Template_Mgt
SELECT COUNT(*) AS count FROM Documents	cre_Doc_Template_Mgt
SELECT Document_ID, Document_Name, Document_Description FROM Documents	cre_Doc_Template_Mgt
SELECT Document_ID, Document_Name, Document_Description FROM Documents	cre_Doc_Template_Mgt
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'	cre_Doc_Template_Mgt
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'	cre_Doc_Template_Mgt
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT COUNT(DISTINCT Template_ID) AS count FROM Documents	cre_Doc_Template_Mgt
SELECT COUNT(DISTINCT Templates.Template_ID) AS count FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT COUNT(*) AS count FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT Templates.Template_ID, COUNT(*) AS number_of_documents FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID	cre_Doc_Template_Mgt
SELECT T1.Template_ID, COUNT(*) AS count FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID	cre_Doc_Template_Mgt
SELECT Templates.Template_ID, Templates.Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT T.Template_ID, T.Template_Type_Code FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID, T.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Templates.Template_ID FROM Templates INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID HAVING COUNT(*) > 1	cre_Doc_Template_Mgt
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(1) > 1	cre_Doc_Template_Mgt
SELECT template_id FROM Templates EXCEPT SELECT template_id FROM Documents	cre_Doc_Template_Mgt
SELECT template_id FROM Templates EXCEPT SELECT template_id FROM Documents	cre_Doc_Template_Mgt
SELECT COUNT(*) AS template_count FROM Templates	cre_Doc_Template_Mgt
SELECT COUNT(*) AS count FROM Templates	cre_Doc_Template_Mgt
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates	cre_Doc_Template_Mgt
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates	cre_Doc_Template_Mgt
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT template_id FROM Templates WHERE (template_type_code = "PP" OR template_type_code = "PPT")	cre_Doc_Template_Mgt
SELECT template_id FROM Templates WHERE (template_type_code = "PP" OR template_type_code = "PPT")	cre_Doc_Template_Mgt
SELECT COUNT(*) AS count FROM Templates WHERE Template_Type_Code = 'CV'	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV';	cre_Doc_Template_Mgt
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5	cre_Doc_Template_Mgt
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5;	cre_Doc_Template_Mgt
SELECT Ref_Template_Types.Template_Type_Code, COUNT(*) AS number_of_templates FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code GROUP BY Ref_Template_Types.Template_Type_Code	cre_Doc_Template_Mgt
SELECT Template_Type_Code, COUNT(*) AS number_of_templates FROM Templates GROUP BY Template_Type_Code	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code FROM Templates GROUP BY Templates.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(1) < 3	cre_Doc_Template_Mgt
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T1.Template_Type_Code HAVING COUNT(*) < 3	cre_Doc_Template_Mgt
SELECT min(t0.Version_Number) , t0.template_type_code FROM Templates AS t0	cre_Doc_Template_Mgt
SELECT min(t0.Version_Number) , t0.template_type_code FROM Templates AS t0	cre_Doc_Template_Mgt
SELECT T1.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = 'Data base'	cre_Doc_Template_Mgt
SELECT a.template_type_code FROM Templates AS a INNER JOIN Documents AS b ON a.template_id = b.template_id WHERE b.document_name = "Data base"	cre_Doc_Template_Mgt
SELECT T1.Document_Name FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'BK'	cre_Doc_Template_Mgt
SELECT T1.Document_Name FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'BK'	cre_Doc_Template_Mgt
SELECT Ref_Template_Types.Template_Type_Code, COUNT(*) AS number_of_documents FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Ref_Template_Types.Template_Type_Code	cre_Doc_Template_Mgt
SELECT a.template_type_code , count(*) FROM Templates AS a INNER JOIN Documents AS b ON a.template_id = b.template_id GROUP BY a.template_type_code	cre_Doc_Template_Mgt
SELECT Ref_Template_Types.Template_Type_Code FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code GROUP BY Ref_Template_Types.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID GROUP BY Templates.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates)	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Ref_Template_Types EXCEPT SELECT DISTINCT t.Template_Type_Code FROM Templates t JOIN Documents d ON t.Template_ID = d.Template_ID	cre_Doc_Template_Mgt
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'	cre_Doc_Template_Mgt
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'	cre_Doc_Template_Mgt
SELECT DISTINCT Ref_Template_Types.Template_Type_Description FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID	cre_Doc_Template_Mgt
SELECT DISTINCT Ref_Template_Types.Template_Type_Description FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID	cre_Doc_Template_Mgt
SELECT Templates.Template_ID FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = 'Presentation'	cre_Doc_Template_Mgt
SELECT T1.Template_ID FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Description = 'Presentation'	cre_Doc_Template_Mgt
SELECT COUNT(*) AS total_paragraphs FROM Paragraphs;	cre_Doc_Template_Mgt
SELECT COUNT(*) AS paragraph_count FROM Paragraphs	cre_Doc_Template_Mgt
SELECT count(*) FROM Paragraphs AS a INNER JOIN Documents AS b ON a.document_ID = b.document_ID WHERE b.document_name = 'Summer Show'	cre_Doc_Template_Mgt
SELECT COUNT(*) AS paragraph_count FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Summer Show'	cre_Doc_Template_Mgt
SELECT Paragraph_ID, Document_ID, Paragraph_Text, Other_Details FROM Paragraphs WHERE Paragraph_Text = 'Korea'	cre_Doc_Template_Mgt
SELECT Paragraph_ID, Document_ID, Paragraph_Text, Other_Details FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'	cre_Doc_Template_Mgt
SELECT Paragraphs.Paragraph_ID, Paragraphs.Paragraph_Text FROM Paragraphs JOIN Documents ON Documents.Document_ID = Paragraphs.Document_ID WHERE Documents.Document_Name = 'Welcome to NY'	cre_Doc_Template_Mgt
SELECT a.paragraph_id , a.paragraph_text FROM Paragraphs AS a INNER JOIN Documents AS b ON a.document_id = b.document_id WHERE b.Document_Name = 'Welcome to NY'	cre_Doc_Template_Mgt
SELECT Paragraphs.Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Customer reviews'	cre_Doc_Template_Mgt
SELECT Paragraphs.Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Customer reviews'	cre_Doc_Template_Mgt
SELECT Documents.Document_ID, COUNT(*) AS count_paragraphs FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID	cre_Doc_Template_Mgt
SELECT Documents.Document_ID, COUNT(*) AS Number_of_Paragraphs FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID ASC	cre_Doc_Template_Mgt
SELECT T1.Document_ID, T1.Document_Name, COUNT(T2.Paragraph_ID) AS number_of_paragraphs FROM Documents AS T1 LEFT JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID, T1.Document_Name	cre_Doc_Template_Mgt
SELECT T1.Document_ID, T1.Document_Name, COUNT(T2.Paragraph_ID) AS Paragraph_Count FROM Documents AS T1 LEFT JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) >= 2	cre_Doc_Template_Mgt
SELECT T1.Document_ID FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID HAVING COUNT(T2.Paragraph_ID) >= 2	cre_Doc_Template_Mgt
SELECT a.document_id , b.document_name FROM Paragraphs AS a INNER JOIN Documents AS b ON a.document_id = b.document_id GROUP BY a.document_id ORDER BY count(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT a.document_id , b.document_name FROM Paragraphs AS a INNER JOIN Documents AS b ON a.document_id = b.document_id GROUP BY a.document_id ORDER BY count(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT p.Document_ID FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY p.Document_ID ORDER BY COUNT(*) ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT Paragraphs.Document_ID FROM Paragraphs GROUP BY Paragraphs.Document_ID ORDER BY COUNT(*) ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs WHERE (paragraph_text = 'Brazil' INTERSECT SELECT document_id FROM Paragraphs WHERE paragraph_text = 'Ireland')	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs WHERE (paragraph_text = 'Brazil' INTERSECT SELECT document_id FROM Paragraphs WHERE paragraph_text = 'Ireland')	cre_Doc_Template_Mgt
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals	dog_kennels
SELECT DISTINCT state FROM Owners INTERSECT SELECT DISTINCT state FROM Professionals	dog_kennels
SELECT AVG(Dogs.age) FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id	dog_kennels
SELECT AVG(T1.age) AS average_age FROM Dogs AS T1 WHERE T1.dog_id IN (SELECT T2.dog_id FROM Treatments AS T2)	dog_kennels
SELECT T1.professional_id, T1.last_name, T1.cell_number FROM Professionals AS T1 WHERE T1.state = 'Indiana' OR (SELECT COUNT(*) FROM Treatments AS T2 WHERE T2.professional_id = T1.professional_id) > 2	dog_kennels
SELECT P.professional_id, P.last_name, P.cell_number FROM Professionals AS P LEFT JOIN Treatments AS T ON P.professional_id = T.professional_id GROUP BY P.professional_id, P.last_name, P.cell_number HAVING COUNT(T.treatment_id) > 2 OR MAX(P.state = 'Indiana') = 1	dog_kennels
SELECT name FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments GROUP BY dog_id HAVING SUM(cost_of_treatment) > 1000)	dog_kennels
SELECT T1.name FROM Dogs AS T1 WHERE T1.owner_id NOT IN (SELECT T2.owner_id FROM Dogs AS T2 JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id WHERE T3.cost_of_treatment > 1000)	dog_kennels
(SELECT T1.first_name FROM Owners AS T1 EXCEPT SELECT T2.name FROM Dogs AS T2) UNION (SELECT T1.first_name FROM Professionals AS T1 EXCEPT SELECT T2.name FROM Dogs AS T2)	dog_kennels
SELECT first_name FROM Owners EXCEPT SELECT name FROM Dogs UNION SELECT first_name FROM Professionals EXCEPT SELECT name FROM Dogs	dog_kennels
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)	dog_kennels
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)	dog_kennels
SELECT Owners.owner_id, Owners.first_name, Owners.last_name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id GROUP BY Owners.owner_id ORDER BY COUNT(*) DESC LIMIT 1	dog_kennels
SELECT a.owner_id , b.first_name , b.last_name FROM Dogs AS a INNER JOIN Owners AS b ON a.owner_id = b.owner_id GROUP BY a.owner_id ORDER BY count(*) DESC LIMIT 1	dog_kennels
SELECT Professionals.professional_id, Professionals.role_code, Professionals.first_name FROM Professionals JOIN Treatments ON Professionals.professional_id = Treatments.professional_id GROUP BY Professionals.professional_id HAVING COUNT(*) >= 2	dog_kennels
SELECT Professionals.professional_id AS id, Professionals.role_code, Professionals.first_name FROM Professionals JOIN Treatments ON Professionals.professional_id = Treatments.professional_id GROUP BY Professionals.professional_id HAVING COUNT(*) >= 2	dog_kennels
SELECT a.breed_name FROM Breeds AS a INNER JOIN Dogs AS b ON a.breed_code = b.breed_code GROUP BY a.breed_name ORDER BY count(*) DESC LIMIT 1	dog_kennels
SELECT a.breed_name FROM Breeds AS a INNER JOIN Dogs AS b ON a.breed_code = b.breed_code GROUP BY a.breed_name ORDER BY count(*) DESC LIMIT 1	dog_kennels
SELECT Owners.owner_id, Owners.last_name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id JOIN Treatments ON Dogs.dog_id = Treatments.dog_id GROUP BY Owners.owner_id, Owners.last_name ORDER BY SUM(Treatments.cost_of_treatment) DESC LIMIT 1	dog_kennels
SELECT O.owner_id, O.last_name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.last_name ORDER BY SUM(T.cost_of_treatment) DESC LIMIT 1	dog_kennels
SELECT a.treatment_type_description FROM Treatment_types AS a INNER JOIN Treatments AS b ON a.treatment_type_code = b.treatment_type_code GROUP BY a.treatment_type_code ORDER BY sum(cost_of_treatment) ASC LIMIT 1	dog_kennels
SELECT T1.treatment_type_description FROM Treatment_Types AS T1 JOIN Treatments AS T2 ON T1.treatment_type_code = T2.treatment_type_code GROUP BY T1.treatment_type_code ORDER BY SUM(T2.cost_of_treatment) ASC LIMIT 1	dog_kennels
SELECT o.owner_id, o.zip_code FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Charges c ON d.dog_id = c.dog_id GROUP BY o.owner_id ORDER BY SUM(c.charge_amount) DESC LIMIT 1	dog_kennels
SELECT a.owner_id , a.zip_code FROM Owners AS a INNER JOIN Dogs AS b ON a.owner_id = b.owner_id INNER JOIN Treatments AS c ON b.dog_id = c.dog_id GROUP BY a.owner_id ORDER BY sum(c.cost_of_treatment) DESC LIMIT 1	dog_kennels
SELECT Professionals.professional_id, Professionals.cell_number FROM Professionals JOIN Treatments ON Professionals.professional_id = Treatments.professional_id GROUP BY Professionals.professional_id, Professionals.cell_number HAVING COUNT(DISTINCT Treatments.treatment_type_code) >= 2	dog_kennels
SELECT Professionals.professional_id, Professionals.cell_number FROM Professionals JOIN Treatments ON Treatments.professional_id = Professionals.professional_id JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code GROUP BY Professionals.professional_id, Professionals.cell_number HAVING COUNT(DISTINCT Treatment_Types.treatment_type_code) >= 2	dog_kennels
SELECT DISTINCT Professionals.first_name, Professionals.last_name FROM Professionals JOIN Treatments ON Professionals.professional_id = Treatments.professional_id WHERE Treatments.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)	dog_kennels
SELECT DISTINCT T1.first_name, T1.last_name FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id WHERE T2.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)	dog_kennels
SELECT T1.date_of_treatment, T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id	dog_kennels
SELECT Treatments.date_of_treatment, Professionals.first_name FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id	dog_kennels
SELECT Treatments.cost_of_treatment, Treatment_Types.treatment_type_description FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code	dog_kennels
SELECT Treatments.cost_of_treatment, Treatment_Types.treatment_type_description FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code;	dog_kennels
SELECT Owners.first_name, Owners.last_name, Sizes.size_description FROM Dogs JOIN Owners ON Dogs.owner_id = Owners.owner_id JOIN Sizes ON Dogs.size_code = Sizes.size_code	dog_kennels
SELECT T1.first_name, T1.last_name, T3.size_description FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Sizes AS T3 ON T2.size_code = T3.size_code	dog_kennels
SELECT T1.first_name, T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id	dog_kennels
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id	dog_kennels
SELECT Dogs.name, Treatments.date_of_treatment FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Dogs.breed_code = (SELECT breed_code FROM (SELECT breed_code, COUNT(*) as breed_count FROM Dogs GROUP BY breed_code ORDER BY breed_count ASC LIMIT 1) as rarest_breed) ORDER BY Treatments.date_of_treatment ASC	dog_kennels
SELECT Dogs.name, Treatments.date_of_treatment FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Dogs.breed_code = (SELECT Breeds.breed_code FROM Breeds LEFT JOIN Dogs ON Dogs.breed_code = Breeds.breed_code GROUP BY Breeds.breed_code ORDER BY COUNT(Dogs.dog_id) ASC LIMIT 1)	dog_kennels
SELECT T1.first_name, T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T1.state = 'Virginia'	dog_kennels
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id WHERE Owners.state = 'Virginia'	dog_kennels
SELECT Dogs.date_arrived, Dogs.date_departed FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id	dog_kennels
SELECT T1.date_arrived, T1.date_departed FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id	dog_kennels
SELECT Owners.last_name FROM Dogs JOIN Owners ON Dogs.owner_id = Owners.owner_id ORDER BY Dogs.age ASC LIMIT 1	dog_kennels
SELECT T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id ORDER BY T2.age ASC LIMIT 1	dog_kennels
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'	dog_kennels
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'	dog_kennels
SELECT date_arrived, date_departed FROM Dogs	dog_kennels
SELECT date_arrived, date_departed FROM Dogs	dog_kennels
SELECT count(DISTINCT dog_id) FROM Treatments	dog_kennels
SELECT COUNT(DISTINCT Dogs.dog_id) AS dog_count FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id	dog_kennels
SELECT COUNT(DISTINCT T2.professional_id) AS count FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id WHERE T1.dog_id IS NOT NULL	dog_kennels
SELECT COUNT(DISTINCT T1.professional_id) AS number_of_professionals FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id JOIN Dogs AS T3 ON T2.dog_id = T3.dog_id	dog_kennels
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'	dog_kennels
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'	dog_kennels
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'	dog_kennels
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'	dog_kennels
SELECT COUNT(*) AS count FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)	dog_kennels
SELECT COUNT(*) AS number_of_dogs FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)	dog_kennels
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1	dog_kennels
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1	dog_kennels
SELECT COUNT(*) AS number_of_dogs_without_treatment FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)	dog_kennels
SELECT COUNT(*) AS number_of_dogs FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)	dog_kennels
SELECT COUNT(*) AS count FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs)	dog_kennels
SELECT COUNT(*) AS count_of_owners FROM Owners WHERE NOT EXISTS (SELECT 1 FROM Dogs WHERE Dogs.owner_id = Owners.owner_id)	dog_kennels
SELECT count(*) FROM Professionals WHERE professional_id NOT IN ( SELECT professional_id FROM Treatments )	dog_kennels
SELECT COUNT(*) AS number_of_professionals FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)	dog_kennels
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = 1	dog_kennels
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'	dog_kennels
SELECT AVG(age) AS average_age FROM Dogs	dog_kennels
SELECT AVG(age) AS average_age FROM Dogs	dog_kennels
SELECT MAX(age) FROM Dogs	dog_kennels
SELECT MAX(age) AS age FROM Dogs	dog_kennels
SELECT charge_type, charge_amount FROM Charges	dog_kennels
SELECT charge_type, charge_amount FROM Charges	dog_kennels
SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1	dog_kennels
SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1	dog_kennels
SELECT email_address, cell_number, home_phone FROM Professionals	dog_kennels
SELECT email_address, cell_number, home_phone FROM Professionals	dog_kennels
SELECT breed_name, size_description FROM Breeds CROSS JOIN Sizes	dog_kennels
SELECT DISTINCT Breeds.breed_name, Sizes.size_description FROM Dogs JOIN Breeds ON Dogs.breed_code = Breeds.breed_code JOIN Sizes ON Dogs.size_code = Sizes.size_code	dog_kennels
SELECT Professionals.first_name, Treatment_Types.treatment_type_description FROM Professionals JOIN Treatments ON Professionals.professional_id = Treatments.professional_id JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code	dog_kennels
SELECT Professionals.first_name, Treatment_Types.treatment_type_description FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code	dog_kennels
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'	flight_2
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'	flight_2
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'	flight_2
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'	flight_2
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'	flight_2
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'	flight_2
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'	flight_2
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'	flight_2
SELECT COUNT(*) AS airline_count FROM airlines	flight_2
SELECT COUNT(*) AS total_number_of_airlines FROM airlines	flight_2
SELECT COUNT(*) FROM airports	flight_2
SELECT COUNT(*) AS number_of_airports FROM airports	flight_2
SELECT COUNT(*) AS flight_count FROM flights	flight_2
SELECT COUNT(*) AS number_of_flights FROM flights;	flight_2
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'	flight_2
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'	flight_2
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'	flight_2
SELECT count(*) FROM AIRLINES WHERE (Country = "USA")	flight_2
SELECT City, Country FROM airports WHERE AirportName = 'Alton'	flight_2
SELECT City, Country FROM airports WHERE AirportName = 'Alton'	flight_2
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'	flight_2
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'	flight_2
SELECT AirportName FROM airports WHERE City = 'Aberdeen'	flight_2
SELECT AirportName FROM airports WHERE City = 'Aberdeen'	flight_2
SELECT COUNT(*) AS count FROM flights WHERE SourceAirport = ' APG'	flight_2
SELECT COUNT(*) AS number_of_flights FROM flights WHERE SourceAirport = 'APG'	flight_2
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'	flight_2
SELECT COUNT(*) AS count FROM flights WHERE DestAirport = 'ATO'	flight_2
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'	flight_2
SELECT count(*) FROM FLIGHTS AS a INNER JOIN AIRPORTS AS b ON a.SourceAirport = b.AirportCode WHERE b.City = "Aberdeen"	flight_2
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen '	flight_2
SELECT COUNT(*) AS flight_count FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen '	flight_2
SELECT COUNT(*) FROM flights JOIN airports AS source_airport ON flights.SourceAirport = source_airport.AirportCode JOIN airports AS dest_airport ON flights.DestAirport = dest_airport.AirportCode WHERE source_airport.City = 'Aberdeen ' AND dest_airport.City = 'Ashley'	flight_2
SELECT COUNT(*) AS number_of_flights FROM flights WHERE SourceAirport = 'APG' AND DestAirport = 'ASY'	flight_2
SELECT COUNT(*) FROM flights WHERE Airline = 'JetBlue Airways'	flight_2
SELECT count(*) FROM FLIGHTS AS a INNER JOIN AIRLINES AS b ON a.Airline = b.uid WHERE b.Airline = "JetBlue Airways"	flight_2
SELECT COUNT(*) AS count FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T2.Airline = 'United Airlines' AND T1.DestAirport = ' ASY'	flight_2
SELECT COUNT(*) AS number_of_flights FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = 'ASY'	flight_2
SELECT count(*) FROM AIRLINES AS a INNER JOIN FLIGHTS AS b ON b.Airline = a.uid WHERE a.Airline = "United Airlines" AND b.SourceAirport = "AHD"	flight_2
SELECT COUNT(*) AS number_of_flights FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE flights.SourceAirport = 'AHD' AND airlines.Airline = 'United Airlines'	flight_2
SELECT COUNT(*) AS count FROM flights JOIN airlines ON flights.Airline = airlines.uid JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen'	flight_2
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE flights.Airline = 'United Airlines' AND airports.City = 'Aberdeen '	flight_2
SELECT a.City FROM AIRPORTS AS a INNER JOIN FLIGHTS AS b ON a.AirportCode = b.DestAirport GROUP BY a.City ORDER BY count(*) DESC LIMIT 1	flight_2
SELECT airports.City FROM flights INNER JOIN airports ON flights.DestAirport = airports.AirportCode GROUP BY airports.City ORDER BY COUNT(*) DESC LIMIT 1	flight_2
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T2.SourceAirport = T1.AirportCode GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1	flight_2
SELECT airports.City FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode GROUP BY airports.City ORDER BY COUNT(*) DESC LIMIT 1	flight_2
SELECT a.AirportCode FROM AIRPORTS AS a INNER JOIN FLIGHTS AS b ON a.AirportCode = b.DestAirport OR a.AirportCode = b.SourceAirport GROUP BY a.AirportCode ORDER BY count(*) DESC LIMIT 1	flight_2
SELECT a.AirportCode FROM airports AS a JOIN flights AS f ON f.SourceAirport = a.AirportCode GROUP BY a.AirportCode ORDER BY COUNT(*) DESC LIMIT 1	flight_2
SELECT a.AirportCode FROM airports AS a JOIN flights AS f ON a.AirportCode = f.SourceAirport GROUP BY a.AirportCode ORDER BY COUNT(*) ASC LIMIT 1	flight_2
SELECT a.AirportCode FROM airports AS a JOIN flights AS f ON a.AirportCode = f.SourceAirport GROUP BY a.AirportCode ORDER BY COUNT(*) ASC LIMIT 1	flight_2
SELECT a.Airline FROM airlines AS a INNER JOIN flights AS b ON a.uid = b.Airline GROUP BY a.Airline ORDER BY COUNT(*) DESC LIMIT 1	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.uid ORDER BY COUNT(T2.Airline) DESC LIMIT 1	flight_2
SELECT a.Abbreviation , a.Country FROM AIRLINES AS a INNER JOIN FLIGHTS AS b ON a.uid = b.Airline GROUP BY a.Airline ORDER BY count(*) LIMIT 1	flight_2
SELECT a.Abbreviation , a.Country FROM AIRLINES AS a INNER JOIN FLIGHTS AS b ON a.uid = b.Airline GROUP BY a.Airline ORDER BY count(*) LIMIT 1	flight_2
SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.Airline = flights.Airline WHERE flights.SourceAirport = 'AHD'	flight_2
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.Airline = T2.Airline WHERE T2.SourceAirport = 'AHD'	flight_2
SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.Airline = flights.Airline WHERE flights.DestAirport = 'AHD'	flight_2
SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.Airline = flights.Airline WHERE flights.DestAirport = 'AHD'	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'APG' INTERSECT SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO'	flight_2
SELECT DISTINCT Airline FROM flights WHERE SourceAirport = 'APG' INTERSECT SELECT DISTINCT Airline FROM flights WHERE SourceAirport = 'CVO'	flight_2
SELECT a.Airline FROM AIRLINES AS a INNER JOIN FLIGHTS AS b ON a.uid = b.Airline WHERE b.SourceAirport = "CVO" EXCEPT SELECT a.Airline FROM AIRLINES AS a INNER JOIN FLIGHTS AS b ON a.uid = b.Airline WHERE b.SourceAirport = "APG"	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN (SELECT DISTINCT Airline FROM flights WHERE SourceAirport = 'CVO' EXCEPT SELECT DISTINCT Airline FROM flights WHERE SourceAirport = 'APG') AS T2 ON T1.Airline = T2.Airline	flight_2
SELECT airlines.Airline FROM airlines JOIN flights ON airlines.Airline = flights.Airline GROUP BY airlines.Airline HAVING COUNT(*) >= 10	flight_2
SELECT airlines.Airline FROM flights JOIN airlines ON flights.Airline = airlines.Airline GROUP BY airlines.Airline HAVING COUNT(*) >= 10	flight_2
SELECT airlines.Airline FROM airlines JOIN flights ON airlines.Airline = flights.Airline GROUP BY airlines.Airline HAVING COUNT(*) < 200	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.Airline = T2.Airline GROUP BY T1.Airline HAVING COUNT(*) < 200	flight_2
SELECT flights.FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.Airline WHERE airlines.Airline = 'United Airlines'	flight_2
SELECT FlightNo FROM flights WHERE Airline = 'United Airlines'	flight_2
SELECT FlightNo FROM flights WHERE SourceAirport = ' APG'	flight_2
SELECT FlightNo FROM flights WHERE SourceAirport = ' APG'	flight_2
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'	flight_2
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'	flight_2
SELECT flights.FlightNo FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen '	flight_2
SELECT a.FlightNo FROM FLIGHTS AS a INNER JOIN AIRPORTS AS b ON a.SourceAirport = b.AirportCode WHERE b.City = "Aberdeen"	flight_2
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen '	flight_2
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'	flight_2
SELECT count(*) FROM Flights AS a INNER JOIN Airports AS b ON a.DestAirport = b.AirportCode WHERE b.city = "Aberdeen" OR b.city = "Abilene"	flight_2
SELECT count(*) FROM Flights AS a INNER JOIN Airports AS b ON a.DestAirport = b.AirportCode WHERE b.city = "Aberdeen" OR b.city = "Abilene"	flight_2
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)	flight_2
SELECT AirportCode, AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)	flight_2
SELECT line_1, line_2 FROM Addresses	student_transcripts_tracking
SELECT line_1, line_2 FROM Addresses	student_transcripts_tracking
SELECT COUNT(*) AS total_courses FROM Courses	student_transcripts_tracking
SELECT COUNT(*) AS number_of_courses FROM Courses	student_transcripts_tracking
SELECT course_description FROM Courses WHERE course_name = 'math'	student_transcripts_tracking
SELECT course_description FROM Courses WHERE (course_name = 'math')	student_transcripts_tracking
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'	student_transcripts_tracking
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'	student_transcripts_tracking
SELECT b.department_name , a.department_id FROM Degree_Programs AS a INNER JOIN Departments AS b ON a.department_id = b.department_id GROUP BY a.department_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
select b.department_name , a.department_id from degree_programs AS a INNER JOIN departments AS b on a.department_id = b.department_id group by a.department_id order by count(*) desc limit 1	student_transcripts_tracking
SELECT COUNT(DISTINCT department_id) AS count FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(DISTINCT T1.department_id) AS count_of_departments FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id	student_transcripts_tracking
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(DISTINCT degree_summary_name) AS distinct_count FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(*) AS "Number of Degrees" FROM Degree_Programs JOIN Departments ON Degree_Programs.department_id = Departments.department_id WHERE Departments.department_name = 'engineering'	student_transcripts_tracking
SELECT COUNT(*) AS count FROM Degree_Programs JOIN Departments ON Degree_Programs.department_id = Departments.department_id WHERE Departments.department_name = 'engineering'	student_transcripts_tracking
SELECT section_name, section_description FROM Sections	student_transcripts_tracking
SELECT section_name, section_description FROM Sections	student_transcripts_tracking
SELECT a.course_name , a.course_id FROM Courses AS a INNER JOIN Sections AS b ON a.course_id = b.course_id GROUP BY a.course_id HAVING count(*) <= 2	student_transcripts_tracking
SELECT C.course_name, C.course_id FROM Courses AS C LEFT JOIN Sections AS S ON C.course_id = S.course_id GROUP BY C.course_id, C.course_name HAVING COUNT(*) < 2	student_transcripts_tracking
SELECT section_name FROM Sections ORDER BY section_name DESC	student_transcripts_tracking
SELECT section_name FROM Sections ORDER BY section_name DESC	student_transcripts_tracking
SELECT a.semester_name , a.semester_id FROM Semesters AS a INNER JOIN Student_Enrolment AS b ON a.semester_id = b.semester_id GROUP BY a.semester_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT a.semester_name , a.semester_id FROM Semesters AS a INNER JOIN Student_Enrolment AS b ON a.semester_id = b.semester_id GROUP BY a.semester_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT department_description FROM Departments WHERE department_name LIKE '%the computer%'	student_transcripts_tracking
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'	student_transcripts_tracking
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id AS id FROM Students AS T1 WHERE T1.student_id IN (SELECT student_id FROM Student_Enrolment GROUP BY student_id, semester_id HAVING COUNT(DISTINCT degree_program_id) = 2)	student_transcripts_tracking
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id, T1.first_name, T1.middle_name, T1.last_name, T2.semester_id HAVING COUNT(DISTINCT T2.degree_program_id) = 2	student_transcripts_tracking
SELECT Students.first_name, Students.middle_name, Students.last_name FROM Students JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Bachelor'	student_transcripts_tracking
SELECT Students.first_name, Students.middle_name, Students.last_name FROM Students JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Bachelor'	student_transcripts_tracking
SELECT a.degree_summary_name FROM Degree_Programs AS a INNER JOIN Student_Enrolment AS b ON a.degree_program_id = b.degree_program_id GROUP BY a.degree_summary_name ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT a.degree_summary_name FROM Degree_Programs AS a INNER JOIN Student_Enrolment AS b ON a.degree_program_id = b.degree_program_id GROUP BY a.degree_summary_name ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT Degree_Programs.degree_program_id, Degree_Programs.degree_summary_description FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT Degree_Programs.degree_program_id, Degree_Programs.degree_summary_description FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_program_id, Degree_Programs.degree_summary_description ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT Students.student_id, Students.first_name, Students.middle_name, Students.last_name, COUNT(Student_Enrolment.student_id) AS number_of_enrollments, Students.student_id FROM Students JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id GROUP BY Students.student_id, Students.first_name, Students.middle_name, Students.last_name ORDER BY number_of_enrollments DESC LIMIT 1;	student_transcripts_tracking
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id, COUNT(T2.student_id) AS number_of_enrollments FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY number_of_enrollments DESC LIMIT 1	student_transcripts_tracking
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)	student_transcripts_tracking
SELECT semester_name FROM Semesters LEFT JOIN Student_Enrolment ON Semesters.semester_id = Student_Enrolment.semester_id WHERE Student_Enrolment.semester_id IS NULL	student_transcripts_tracking
SELECT DISTINCT Courses.course_name FROM Courses JOIN Student_Enrolment_Courses ON Courses.course_id = Student_Enrolment_Courses.course_id WHERE EXISTS (SELECT 1 FROM Student_Enrolment WHERE Student_Enrolment.student_enrolment_id = Student_Enrolment_Courses.student_enrolment_id)	student_transcripts_tracking
SELECT DISTINCT a.course_name FROM Courses AS a INNER JOIN Student_Enrolment_Courses AS b ON a.course_id = b.course_id;	student_transcripts_tracking
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id, T1.course_name ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.last_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id LEFT JOIN Student_Enrolment AS T3 ON T1.student_id = T3.student_id WHERE T2.state_province_county = 'North Carolina' AND T3.degree_program_id IS NULL	student_transcripts_tracking
SELECT T1.last_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id LEFT JOIN Student_Enrolment AS T3 ON T1.student_id = T3.student_id WHERE T2.state_province_county = 'North Carolina' AND T3.student_id IS NULL	student_transcripts_tracking
SELECT b.transcript_date , a.transcript_id FROM Transcript_Contents AS a INNER JOIN Transcripts AS b ON a.transcript_id = b.transcript_id GROUP BY a.transcript_id HAVING count(*) >= 2	student_transcripts_tracking
SELECT b.transcript_date , a.transcript_id FROM Transcript_Contents AS a INNER JOIN Transcripts AS b ON a.transcript_id = b.transcript_id GROUP BY a.transcript_id HAVING count(*) >= 2	student_transcripts_tracking
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'	student_transcripts_tracking
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1	student_transcripts_tracking
SELECT first_name AS c1 , middle_name , last_name FROM Students ORDER BY date_left ASC LIMIT 1	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_left ASC LIMIT 1	student_transcripts_tracking
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id	student_transcripts_tracking
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id	student_transcripts_tracking
SELECT A.address_id, A.line_1, A.line_2, A.line_3 FROM Addresses AS A JOIN (SELECT current_address_id, COUNT(*) AS student_count FROM Students GROUP BY current_address_id) AS S ON A.address_id = S.current_address_id ORDER BY S.student_count DESC LIMIT 1	student_transcripts_tracking
SELECT a.address_id , a.line_1 , a.line_2 FROM Addresses AS a INNER JOIN Students AS b ON a.address_id = b.current_address_id GROUP BY a.address_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT AVG(transcript_date) AS transcript_date FROM Transcripts;	student_transcripts_tracking
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts	student_transcripts_tracking
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1	student_transcripts_tracking
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1	student_transcripts_tracking
SELECT COUNT(*) AS transcripts_count FROM Transcripts	student_transcripts_tracking
SELECT COUNT(*) AS transcript_count FROM Transcripts	student_transcripts_tracking
SELECT transcript_date FROM Transcripts ORDER BY transcript_date DESC LIMIT 1	student_transcripts_tracking
SELECT transcript_date FROM Transcripts ORDER BY transcript_date DESC LIMIT 1	student_transcripts_tracking
SELECT Student_Enrolment_Courses.student_course_id AS course_enrollment_id, COUNT(*) AS max_count FROM Student_Enrolment_Courses JOIN Transcript_Contents ON Student_Enrolment_Courses.student_course_id = Transcript_Contents.student_course_id GROUP BY Student_Enrolment_Courses.student_course_id ORDER BY max_count DESC LIMIT 1;	student_transcripts_tracking
SELECT COUNT(*) AS course_count, T2.student_enrolment_id FROM Transcript_Contents AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.student_course_id = T2.student_course_id GROUP BY T2.student_enrolment_id ORDER BY course_count DESC LIMIT 1	student_transcripts_tracking
SELECT T.transcript_date, T.transcript_id FROM Transcripts AS T JOIN Transcript_Contents AS TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id ORDER BY COUNT(*) ASC LIMIT 1	student_transcripts_tracking
	student_transcripts_tracking
SELECT semester_name FROM Semesters WHERE semester_id IN (SELECT semester_id FROM Student_Enrolment JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Master' INTERSECT SELECT semester_id FROM Student_Enrolment JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Bachelor')	student_transcripts_tracking
SELECT T1.semester_id FROM Student_Enrolment AS T1 INNER JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id WHERE T2.degree_summary_name = 'Master' INTERSECT SELECT T1.semester_id FROM Student_Enrolment AS T1 INNER JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id WHERE T2.degree_summary_name = 'Bachelor'	student_transcripts_tracking
SELECT COUNT(DISTINCT address_id) AS how_many_different_addresses FROM Addresses WHERE address_id IN (SELECT current_address_id FROM Students)	student_transcripts_tracking
SELECT DISTINCT Addresses.line_1, Addresses.line_2, Addresses.line_3, Addresses.city, Addresses.zip_postcode, Addresses.state_province_county, Addresses.country FROM Addresses JOIN Students ON Addresses.address_id = Students.current_address_id OR Addresses.address_id = Students.permanent_address_id	student_transcripts_tracking
SELECT student_id, current_address_id, permanent_address_id, first_name, middle_name, last_name, cell_mobile_number, email_address, ssn, date_first_registered, date_left, other_student_details FROM Students ORDER BY student_id DESC	student_transcripts_tracking
SELECT student_id, first_name, middle_name, last_name, cell_mobile_number, email_address, ssn, date_first_registered, date_left, other_student_details FROM Students ORDER BY last_name DESC	student_transcripts_tracking
SELECT section_id, course_id, section_name, section_description, other_details FROM Sections WHERE section_name = 'h'	student_transcripts_tracking
SELECT section_description FROM Sections WHERE section_name = 'h'	student_transcripts_tracking
SELECT Students.first_name FROM Students JOIN Addresses ON Students.permanent_address_id = Addresses.address_id WHERE Addresses.country = 'Haiti' OR Students.cell_mobile_number = '09700166582'	student_transcripts_tracking
select a.first_name from students AS a INNER JOIN addresses AS b on a.permanent_address_id = b.address_id where b.country = 'haiti' or a.cell_mobile_number = '09700166582'	student_transcripts_tracking
SELECT Title FROM Cartoon ORDER BY Title ASC	tvshow
SELECT Title FROM Cartoon ORDER BY Title ASC	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'	tvshow
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'	tvshow
SELECT COUNT(*) AS number_of_cartoons FROM Cartoon WHERE Written_by = 'Joseph Kuhr'	tvshow
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date ASC	tvshow
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date ASC	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones" OR Directed_by = "Brandon Vietti";	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'	tvshow
SELECT Country, COUNT(id) AS number_of_TV_Channels FROM TV_Channel GROUP BY Country ORDER BY number_of_TV_Channels DESC LIMIT 1	tvshow
SELECT Country, COUNT(id) AS TV_Channels_Count FROM TV_Channel GROUP BY Country ORDER BY TV_Channels_Count DESC LIMIT 1	tvshow
SELECT COUNT(DISTINCT series_name) AS number_of_series_names, COUNT(DISTINCT Content) AS number_of_contents FROM TV_Channel	tvshow
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel	tvshow
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT COUNT(*) AS count FROM TV_Channel WHERE Language = 'English'	tvshow
SELECT COUNT(*) AS count FROM TV_Channel WHERE Language = 'English'	tvshow
SELECT Language, COUNT(id) AS num_tv_channels FROM TV_Channel GROUP BY Language ORDER BY num_tv_channels ASC LIMIT 1	tvshow
SELECT LANGUAGE , COUNT(1) FROM TV_Channel GROUP BY LANGUAGE ORDER BY count(*) ASC LIMIT 1	tvshow
SELECT LANGUAGE , COUNT(1) FROM TV_Channel GROUP BY LANGUAGE	tvshow
SELECT Language, COUNT(*) AS count FROM TV_Channel GROUP BY Language	tvshow
SELECT T1.series_name FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'	tvshow
SELECT T1.series_name FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = "The Rise of the Blue Beetle!";	tvshow
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'	tvshow
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'	tvshow
SELECT Episode FROM TV_series ORDER BY Rating ASC	tvshow
SELECT Episode, Rating FROM TV_series ORDER BY Rating ASC	tvshow
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3	tvshow
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3	tvshow
SELECT MIN(Share) AS Share_min, MAX(Share) AS Share_max FROM TV_series	tvshow
SELECT MAX(Share), MIN(Share) FROM TV_series	tvshow
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT Original_air_date FROM Cartoon WHERE Title = 'A Love of a Lifetime'	tvshow
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT TV_series.Channel, TV_Channel.series_name FROM TV_series JOIN TV_Channel ON TV_series.Channel = TV_Channel.id WHERE TV_series.Episode = 'A Love of a Lifetime'	tvshow
SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = 'A Love of a Lifetime'	tvshow
SELECT T1.Episode FROM TV_series AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'	tvshow
SELECT Episode FROM TV_series WHERE Channel = (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')	tvshow
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by	tvshow
SELECT Directed_by, COUNT(*) AS cartoon_count FROM Cartoon GROUP BY Directed_by	tvshow
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1	tvshow
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1	tvshow
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'yes'	tvshow
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'yes'	tvshow
SELECT TV_Channel.Country FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Written_by = 'Todd Casey'	tvshow
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T2.Channel = T1.id WHERE T2.Written_by = 'Todd Casey' AND T1.Content = 'cartoons'	tvshow
SELECT Country FROM TV_Channel EXCEPT SELECT TV_Channel.Country FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Written_by = 'Todd Casey'	tvshow
SELECT TV_Channel.Country FROM TV_Channel INNER JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Written_by <> 'Todd Casey'	tvshow
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones' OR T2.Directed_by = 'Michael Chang'	tvshow
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones' INTERSECT SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Michael Chang'	tvshow
SELECT Pixel_aspect_ratio_PAR , country FROM tv_channel WHERE LANGUAGE <> 'English'	tvshow
SELECT Pixel_aspect_ratio_PAR , country FROM tv_channel WHERE LANGUAGE <> 'English'	tvshow
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(*) > 2)	tvshow
SELECT T1.id FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel GROUP BY T1.id HAVING COUNT(*) > 2	tvshow
SELECT id FROM TV_Channel EXCEPT SELECT channel FROM cartoon WHERE (directed_by = 'Ben Jones')	tvshow
SELECT id FROM TV_Channel EXCEPT SELECT channel FROM cartoon WHERE (directed_by = 'Ben Jones')	tvshow
SELECT Package_Option FROM TV_Channel EXCEPT SELECT T1.Package_Option FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones'	tvshow
SELECT DISTINCT T1.Package_Option FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by <> 'Ben Jones'	tvshow
SELECT COUNT(*) AS total_number_of_players FROM players	wta_1
SELECT COUNT(*) AS player_count FROM players	wta_1
SELECT COUNT(*) AS total_matches FROM matches	wta_1
SELECT COUNT(*) AS match_count FROM matches	wta_1
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'	wta_1
SELECT players.first_name, players.birth_date FROM players WHERE players.country_code = 'USA';	wta_1
SELECT AVG(winner_age) AS average_winner_age, AVG(loser_age) AS average_loser_age FROM matches	wta_1
SELECT AVG(loser_age) AS average_loser_age, AVG(winner_age) AS average_winner_age FROM matches	wta_1
SELECT AVG(winner_rank) AS average_rank_of_winners FROM matches	wta_1
SELECT avg(winner_rank) FROM matches	wta_1
SELECT MAX(loser_rank) FROM matches	wta_1
SELECT loser_rank FROM matches ORDER BY loser_rank ASC LIMIT 1	wta_1
SELECT COUNT(DISTINCT country_code) AS number_of_distinct_country_codes FROM players	wta_1
SELECT COUNT(DISTINCT country_code) AS count_distinct_countries FROM players	wta_1
SELECT COUNT(DISTINCT loser_name) AS number_of_distinct_loser_names FROM matches	wta_1
SELECT COUNT(DISTINCT loser_name) AS count FROM matches	wta_1
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(1) > 10	wta_1
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10	wta_1
SELECT T1.first_name, T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.year = 2013 INTERSECT SELECT T1.first_name, T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.year = 2016	wta_1
SELECT T1.first_name, T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.year = 2013 INTERSECT SELECT T1.first_name, T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.year = 2016	wta_1
SELECT count(*) FROM matches WHERE (YEAR = 2013 OR YEAR = 2016)	wta_1
SELECT count(*) FROM matches WHERE (YEAR = 2013 OR YEAR = 2016)	wta_1
SELECT p.country_code, p.first_name FROM players AS p WHERE p.player_id IN (SELECT winner_id FROM matches WHERE tourney_name = 'WTA Championships' INTERSECT SELECT winner_id FROM matches WHERE tourney_name = 'Australian Open');	wta_1
SELECT p.first_name, p.country_code FROM players p JOIN matches m1 ON p.player_id = m1.winner_id WHERE m1.tourney_name = 'WTA Championships' INTERSECT SELECT p.first_name, p.country_code FROM players p JOIN matches m2 ON p.player_id = m2.winner_id WHERE m2.tourney_name = 'Australian Open'	wta_1
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1	wta_1
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1	wta_1
SELECT first_name, last_name FROM players ORDER BY birth_date ASC	wta_1
SELECT first_name, last_name FROM players ORDER BY birth_date ASC	wta_1
SELECT first_name , last_name FROM players WHERE (hand = 'L' ORDER BY birth_date)	wta_1
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date ASC	wta_1
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id, T1.first_name, T1.country_code ORDER BY COUNT(*) DESC LIMIT 1	wta_1
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id ORDER BY SUM(T2.tours) DESC LIMIT 1	wta_1
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1	wta_1
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1	wta_1
SELECT T1.winner_name, T1.winner_rank_points FROM matches AS T1 JOIN (SELECT winner_name FROM matches GROUP BY winner_name ORDER BY COUNT(*) DESC LIMIT 1) AS T2 ON T1.winner_name = T2.winner_name LIMIT 1	wta_1
SELECT winner_name, winner_rank_points FROM matches WHERE winner_name = (SELECT winner_name FROM matches GROUP BY winner_name ORDER BY COUNT(*) DESC LIMIT 1)	wta_1
SELECT winner_name FROM matches WHERE tourney_name = 'Australian Open' ORDER BY winner_rank_points DESC LIMIT 1	wta_1
SELECT winner_name FROM matches WHERE tourney_name = 'Australian Open' ORDER BY winner_rank_points DESC LIMIT 1	wta_1
SELECT loser_name, winner_name FROM matches ORDER BY minutes DESC LIMIT 1	wta_1
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1	wta_1
SELECT players.first_name, AVG(rankings.ranking) FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id, players.first_name	wta_1
SELECT players.first_name, AVG(rankings.ranking) FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.first_name	wta_1
SELECT players.first_name, SUM(rankings.ranking_points) FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id	wta_1
SELECT T1.first_name, SUM(T2.ranking_points) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id	wta_1
SELECT country_code, COUNT(*) AS number_of_players FROM players GROUP BY country_code	wta_1
SELECT country_code, COUNT(*) AS player_count FROM players GROUP BY country_code	wta_1
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1	wta_1
SELECT country_code FROM players GROUP BY country_code ORDER BY count(*) DESC LIMIT 1	wta_1
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50	wta_1
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50	wta_1
SELECT ranking_date, SUM(tours) AS total_number_of_tours FROM rankings GROUP BY ranking_date	wta_1
SELECT COUNT(tours) AS total_tours, ranking_date FROM rankings GROUP BY ranking_date	wta_1
SELECT year, COUNT(*) AS number_of_matches FROM matches GROUP BY year	wta_1
SELECT COUNT(1) , YEAR FROM matches GROUP BY YEAR	wta_1
SELECT winner_name, winner_rank FROM matches ORDER BY winner_age ASC LIMIT 3	wta_1
SELECT winner_name, winner_rank FROM matches ORDER BY winner_age ASC LIMIT 3	wta_1
SELECT COUNT(DISTINCT matches.winner_id) AS number_of_different_winners FROM matches JOIN players ON matches.winner_id = players.player_id WHERE matches.tourney_name = 'WTA Championships' AND players.hand = 'L'	wta_1
SELECT COUNT(*) AS number_of_winners FROM matches WHERE winner_hand = 'L' AND tourney_name = 'WTA Championships'	wta_1
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id ORDER BY T2.winner_rank_points DESC LIMIT 1	wta_1
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T2.winner_id = T1.player_id ORDER BY T2.winner_rank_points DESC LIMIT 1	wta_1
SELECT hand, COUNT(*) AS number_of_players FROM players GROUP BY hand	wta_1
SELECT COUNT(*) AS count, hand FROM players GROUP BY hand	wta_1
SELECT COUNT(*) FROM Highschooler	network_1
SELECT COUNT(*) AS count FROM Highschooler	network_1
SELECT name, grade FROM Highschooler	network_1
SELECT name, grade FROM Highschooler	network_1
SELECT grade FROM Highschooler	network_1
SELECT grade FROM Highschooler	network_1
SELECT grade FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT grade FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT name FROM Highschooler WHERE grade = 10	network_1
SELECT name FROM Highschooler WHERE grade = 10	network_1
SELECT ID FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT ID FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT count(*) FROM Highschooler WHERE (grade = 9 OR grade = 10)	network_1
SELECT count(*) FROM Highschooler WHERE (grade = 9 OR grade = 10)	network_1
SELECT grade , COUNT(1) FROM Highschooler GROUP BY grade	network_1
SELECT grade, COUNT(*) AS highschooler_count FROM Highschooler GROUP BY grade	network_1
SELECT grade, COUNT(*) AS highschooler_count FROM Highschooler GROUP BY grade ORDER BY highschooler_count DESC LIMIT 1	network_1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1	network_1
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4	network_1
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4	network_1
SELECT Highschooler.ID, COUNT(Friend.friend_id) AS number_of_friends FROM Highschooler LEFT JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID	network_1
SELECT T1.name, COUNT(T2.friend_id) AS friend_count FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID	network_1
SELECT T1.name, COUNT(T2.friend_id) AS number_of_friends FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID	network_1
SELECT Highschooler.name, COUNT(Friend.friend_id) AS friend_count FROM Highschooler LEFT JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID	network_1
SELECT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID ORDER BY COUNT(Friend.friend_id) DESC LIMIT 1	network_1
SELECT H.name FROM Highschooler AS H JOIN Friend AS F ON H.ID = F.student_id GROUP BY H.ID ORDER BY COUNT(*) DESC LIMIT 1	network_1
SELECT b.name FROM Friend AS a INNER JOIN Highschooler AS b ON a.student_id = b.id GROUP BY a.student_id HAVING count(*) >= 3	network_1
SELECT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID HAVING COUNT(Friend.friend_id) >= 3	network_1
SELECT T2.name FROM Highschooler AS T1 JOIN Friend AS T3 ON T1.ID = T3.student_id JOIN Highschooler AS T2 ON T3.friend_id = T2.ID WHERE T1.name = 'Kyle'	network_1
SELECT T2.name FROM Highschooler AS T1 JOIN Friend AS T3 ON T1.ID = T3.student_id JOIN Highschooler AS T2 ON T3.friend_id = T2.ID WHERE T1.name = 'Kyle'	network_1
SELECT COUNT(*) AS friend_count FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id WHERE Highschooler.name = 'Kyle'	network_1
SELECT COUNT(*) FROM Friend JOIN Highschooler ON Highschooler.ID = Friend.student_id WHERE Highschooler.name = 'Kyle'	network_1
SELECT T1.ID FROM Highschooler AS T1 LEFT JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T2.student_id IS NULL	network_1
SELECT T1.ID FROM Highschooler AS T1 LEFT JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T2.student_id IS NULL	network_1
SELECT Highschooler.name FROM Highschooler LEFT JOIN Friend ON Highschooler.ID = Friend.student_id WHERE Friend.student_id IS NULL	network_1
SELECT Highschooler.name FROM Highschooler LEFT JOIN Friend ON Highschooler.ID = Friend.student_id WHERE Friend.student_id IS NULL	network_1
SELECT T1.ID FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id INTERSECT SELECT T1.ID FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id	network_1
SELECT student_id AS ID FROM Friend INTERSECT SELECT liked_id AS ID FROM Likes	network_1
SELECT DISTINCT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id JOIN Likes ON Highschooler.ID = Likes.liked_id	network_1
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend) INTERSECT SELECT name FROM Highschooler WHERE ID IN (SELECT liked_id FROM Likes)	network_1
SELECT student_id, COUNT(*) AS like_count FROM Likes GROUP BY student_id	network_1
SELECT student_id, COUNT(*) AS count_of_likes FROM Likes GROUP BY student_id	network_1
SELECT Highschooler.name, COUNT(*) AS number_of_likes FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Highschooler.ID	network_1
SELECT Highschooler.name, COUNT(*) AS likes_count FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Highschooler.ID	network_1
SELECT Highschooler.name FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Highschooler.ID ORDER BY COUNT(*) DESC LIMIT 1	network_1
SELECT Highschooler.name FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Highschooler.ID ORDER BY COUNT(*) DESC LIMIT 1	network_1
SELECT Highschooler.name FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Highschooler.ID HAVING COUNT(*) >= 2	network_1
SELECT Highschooler.name FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Highschooler.ID HAVING COUNT(*) >= 2	network_1
SELECT b.name FROM Friend AS a INNER JOIN Highschooler AS b ON a.student_id = b.id WHERE b.grade > 5 GROUP BY a.student_id HAVING count(*) >= 2	network_1
SELECT b.name FROM Friend AS a INNER JOIN Highschooler AS b ON a.student_id = b.id WHERE b.grade > 5 GROUP BY a.student_id HAVING count(*) >= 2	network_1
SELECT COUNT(*) AS number_of_likes FROM Likes JOIN Highschooler ON Highschooler.ID = Likes.student_id WHERE Highschooler.name = 'Kyle'	network_1
SELECT COUNT(*) AS likes_count FROM Likes JOIN Highschooler ON Likes.student_id = Highschooler.ID WHERE Highschooler.name = 'Kyle'	network_1
SELECT AVG(T1.grade) AS 'average grade' FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id	network_1
SELECT AVG(T1.grade) AS average_grade FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id	network_1
SELECT MIN(T1.grade) FROM Highschooler AS T1 LEFT JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T2.student_id IS NULL	network_1
SELECT MIN(T1.grade) FROM Highschooler AS T1 LEFT JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T2.friend_id IS NULL	network_1
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
SELECT COUNT(*) AS count FROM Pets WHERE weight > 10	pets_1
SELECT COUNT(*) FROM Pets WHERE weight > 10	pets_1
SELECT weight FROM Pets ORDER BY pet_age ASC LIMIT 1	pets_1
SELECT weight FROM pets ORDER BY pet_age LIMIT 1	pets_1
SELECT MAX(weight) AS weight, PetType FROM Pets GROUP BY PetType	pets_1
SELECT MAX(weight), PetType FROM Pets GROUP BY PetType	pets_1
SELECT count(*) FROM student AS a INNER JOIN has_pet AS b ON a.stuid = b.stuid WHERE a.age > 20	pets_1
SELECT count(*) FROM student AS a INNER JOIN has_pet AS b ON a.stuid = b.stuid WHERE a.age > 20	pets_1
SELECT COUNT(*) AS count FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'	pets_1
SELECT count(*) FROM student AS a INNER JOIN has_pet AS b ON a.stuid = b.stuid INNER JOIN pets AS c ON b.petid = c.petid WHERE a.sex = 'F' AND c.pettype = 'dog'	pets_1
SELECT COUNT(DISTINCT PetType) AS count FROM Pets	pets_1
SELECT COUNT(DISTINCT PetType) FROM Pets	pets_1
SELECT DISTINCT a.Fname FROM student AS a INNER JOIN has_pet AS b ON a.stuid = b.stuid INNER JOIN pets AS c ON c.petid = b.petid WHERE c.pettype = 'cat' OR c.pettype = 'dog'	pets_1
SELECT DISTINCT a.Fname FROM student AS a INNER JOIN has_pet AS b ON a.stuid = b.stuid INNER JOIN pets AS c ON c.petid = b.petid WHERE c.pettype = 'cat' OR c.pettype = 'dog'	pets_1
SELECT S.Fname FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' INTERSECT SELECT S.Fname FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'dog'	pets_1
SELECT Fname FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat' INTERSECT SELECT Fname FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'dog'	pets_1
SELECT Student.Major, Student.Age FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType <> 'cat'	pets_1
SELECT Student.Major, Student.Age FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType <> 'cat'	pets_1
SELECT stuid FROM student EXCEPT SELECT a.stuid FROM student AS a INNER JOIN has_pet AS b ON a.stuid = b.stuid INNER JOIN pets AS c ON c.petid = b.petid WHERE c.pettype = 'cat'	pets_1
SELECT stuid FROM student EXCEPT SELECT a.stuid FROM student AS a INNER JOIN has_pet AS b ON a.stuid = b.stuid INNER JOIN pets AS c ON c.petid = b.petid WHERE c.pettype = 'cat'	pets_1
SELECT a.fname , a.age FROM student AS a INNER JOIN has_pet AS b ON a.stuid = b.stuid INNER JOIN pets AS c ON c.petid = b.petid WHERE c.pettype = 'dog' AND a.stuid NOT IN (SELECT a.stuid FROM student AS a INNER JOIN has_pet AS b ON a.stuid = b.stuid INNER JOIN pets AS c ON c.petid = b.petid WHERE c.pettype = 'cat')	pets_1
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog' AND T1.StuID NOT IN (SELECT T2.StuID FROM Has_Pet AS T2 JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat')	pets_1
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1	pets_1
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1	pets_1
SELECT PetID, weight FROM Pets WHERE pet_age > 1	pets_1
SELECT PetID AS id, weight FROM Pets WHERE pet_age > 1	pets_1
SELECT PetType, AVG(pet_age) AS average_age, MAX(pet_age) AS maximum_age FROM Pets GROUP BY PetType	pets_1
SELECT PetType, AVG(pet_age) AS AverageAge, MAX(pet_age) AS MaximumAge FROM Pets GROUP BY PetType	pets_1
SELECT PetType, AVG(weight) AS avg_weight FROM Pets GROUP BY PetType;	pets_1
SELECT PetType, AVG(weight) AS avg_weight FROM Pets GROUP BY PetType	pets_1
SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID	pets_1
SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID	pets_1
SELECT Pets.PetID FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.LName = 'Smith'	pets_1
SELECT T2.petid FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid = T2.stuid WHERE T1.Lname = 'Smith'	pets_1
SELECT Student.StuID, COUNT(*) AS number_of_pets FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY Student.StuID	pets_1
select count(*) , a.stuid from student AS a INNER JOIN has_pet AS b on a.stuid = b.stuid group by a.stuid	pets_1
SELECT a.fname , a.sex FROM student AS a INNER JOIN has_pet AS b ON a.stuid = b.stuid GROUP BY a.stuid HAVING count(*) > 1	pets_1
SELECT DISTINCT Student.Fname, Student.Sex FROM Student JOIN Has_Pet T1 ON Student.StuID = T1.StuID JOIN Has_Pet T2 ON T1.StuID = T2.StuID AND T1.PetID <> T2.PetID	pets_1
SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3	pets_1
SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3	pets_1
SELECT AVG(T1.Age) AS average_age FROM Student AS T1 LEFT JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T2.StuID IS NULL	pets_1
SELECT AVG(T1.Age) AS average_age FROM Student AS T1 LEFT JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T2.StuID IS NULL	pets_1
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
SELECT COUNT(*) AS count FROM poker_player	poker_player
SELECT COUNT(*) AS number_of_poker_players FROM poker_player	poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC	poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC	poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player	poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player	poker_player
SELECT AVG(Earnings) AS average_earnings FROM poker_player;	poker_player
SELECT AVG(Earnings) AS average_earnings FROM poker_player	poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1;	poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1	poker_player
SELECT MAX(Final_Table_Made) FROM poker_player WHERE (Earnings < 200000)	poker_player
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000	poker_player
SELECT people.Name FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID	poker_player
SELECT a.Name FROM people AS a INNER JOIN poker_player AS b ON a.People_ID = b.People_ID	poker_player
SELECT people.Name FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE poker_player.Earnings > 300000	poker_player
SELECT a.Name FROM people AS a INNER JOIN poker_player AS b ON a.People_ID = b.People_ID WHERE b.Earnings > 300000	poker_player
SELECT people.Name FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID ORDER BY poker_player.Final_Table_Made ASC	poker_player
SELECT people.Name FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID ORDER BY poker_player.Final_Table_Made ASC	poker_player
SELECT people.Birth_Date FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID ORDER BY poker_player.Earnings ASC LIMIT 1;	poker_player
SELECT people.Birth_Date FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID ORDER BY poker_player.Earnings ASC LIMIT 1	poker_player
SELECT T1.Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1	poker_player
SELECT T1.Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1	poker_player
SELECT AVG(poker_player.Earnings) AS average_earnings FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE people.Height > 200	poker_player
SELECT AVG(poker_player.Earnings) AS average_earnings FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE people.Height > 200	poker_player
SELECT people.Name FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID ORDER BY poker_player.Earnings DESC	poker_player
SELECT people.Name FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID ORDER BY poker_player.Earnings DESC;	poker_player
SELECT Nationality, COUNT(*) AS number_of_people FROM people GROUP BY Nationality	poker_player
SELECT Nationality , COUNT(1) FROM people GROUP BY Nationality	poker_player
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1	poker_player
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1	poker_player
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2	poker_player
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2	poker_player
SELECT Name, Birth_Date FROM people ORDER BY Name ASC	poker_player
SELECT Name, Birth_Date FROM people ORDER BY Name ASC	poker_player
SELECT Name FROM people WHERE Nationality != "Russia"	poker_player
SELECT Name FROM people WHERE Nationality != "Russia"	poker_player
SELECT people.Name FROM people LEFT JOIN poker_player ON people.People_ID = poker_player.People_ID WHERE poker_player.People_ID IS NULL	poker_player
SELECT people.Name FROM people LEFT JOIN poker_player ON people.People_ID = poker_player.People_ID WHERE poker_player.People_ID IS NULL	poker_player
SELECT COUNT(DISTINCT Nationality) AS count FROM people	poker_player
SELECT COUNT(DISTINCT Nationality) FROM people	poker_player
SELECT COUNT(*) AS Count FROM employee	employee_hire_evaluation
SELECT COUNT(*) FROM employee	employee_hire_evaluation
SELECT Name FROM employee ORDER BY Age ASC	employee_hire_evaluation
SELECT Name FROM employee ORDER BY Age ASC	employee_hire_evaluation
SELECT COUNT(*) AS number_of_employees, City FROM employee GROUP BY City	employee_hire_evaluation
SELECT City, COUNT(*) AS employee_count FROM employee GROUP BY City	employee_hire_evaluation
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1	employee_hire_evaluation
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1	employee_hire_evaluation
SELECT Location, COUNT(*) AS number_of_shops FROM shop GROUP BY Location	employee_hire_evaluation
SELECT COUNT(*), Location FROM shop GROUP BY Location	employee_hire_evaluation
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1	employee_hire_evaluation
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1	employee_hire_evaluation
SELECT MIN(Number_products), MAX(Number_products) FROM shop	employee_hire_evaluation
SELECT MIN(Number_products) AS minimum_number_of_products, MAX(Number_products) AS maximum_number_of_products FROM shop	employee_hire_evaluation
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC;	employee_hire_evaluation
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC	employee_hire_evaluation
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)	employee_hire_evaluation
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)	employee_hire_evaluation
SELECT e.Name FROM employee AS e JOIN evaluation AS ev ON e.Employee_ID = ev.Employee_ID GROUP BY e.Employee_ID ORDER BY COUNT(*) DESC LIMIT 1	employee_hire_evaluation
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Employee_ID ORDER BY COUNT(*) DESC LIMIT 1	employee_hire_evaluation
SELECT employee.Name FROM employee JOIN evaluation ON employee.Employee_ID = evaluation.Employee_ID ORDER BY evaluation.Bonus DESC LIMIT 1	employee_hire_evaluation
SELECT employee.Name FROM employee JOIN evaluation ON employee.Employee_ID = evaluation.Employee_ID ORDER BY evaluation.Bonus DESC LIMIT 1	employee_hire_evaluation
SELECT employee.Name FROM employee LEFT JOIN evaluation ON employee.Employee_ID = evaluation.Employee_ID WHERE evaluation.Employee_ID IS NULL	employee_hire_evaluation
SELECT employee.Name FROM employee LEFT JOIN evaluation ON employee.Employee_ID = evaluation.Employee_ID WHERE evaluation.Employee_ID IS NULL	employee_hire_evaluation
SELECT b.name FROM hiring AS a INNER JOIN shop AS b ON a.shop_id = b.shop_id GROUP BY a.shop_id ORDER BY count(*) DESC LIMIT 1	employee_hire_evaluation
SELECT shop.Name FROM shop JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Shop_ID ORDER BY COUNT(*) DESC LIMIT 1	employee_hire_evaluation
SELECT shop.Name FROM shop WHERE shop.Shop_ID NOT IN (SELECT Shop_ID FROM hiring)	employee_hire_evaluation
SELECT T1.Name FROM shop AS T1 LEFT JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID WHERE T2.Shop_ID IS NULL	employee_hire_evaluation
SELECT count(*) , b.name FROM hiring AS a INNER JOIN shop AS b ON a.shop_id = b.shop_id GROUP BY b.name	employee_hire_evaluation
SELECT shop.Name, COUNT(hiring.Employee_ID) AS Number_of_Employees FROM shop JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Name	employee_hire_evaluation
SELECT SUM(Bonus) AS total_bonus FROM evaluation	employee_hire_evaluation
SELECT SUM(Bonus) AS total_bonus FROM evaluation;	employee_hire_evaluation
SELECT Employee_ID, Shop_ID, Start_from, Is_full_time FROM hiring	employee_hire_evaluation
SELECT Shop_ID, Employee_ID, Start_from, Is_full_time FROM hiring	employee_hire_evaluation
SELECT District FROM shop WHERE (Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000)	employee_hire_evaluation
SELECT District FROM shop WHERE Number_products < 3000 GROUP BY District INTERSECT SELECT District FROM shop WHERE Number_products > 10000 GROUP BY District	employee_hire_evaluation
SELECT COUNT(DISTINCT Location) AS number_of_store_locations FROM shop	employee_hire_evaluation
SELECT COUNT(DISTINCT Location) AS count_distinct_location FROM shop	employee_hire_evaluation
SELECT COUNT(*) AS teacher_count FROM teacher	course_teach
SELECT COUNT(*) AS total_count FROM teacher	course_teach
SELECT Name FROM teacher ORDER BY Age ASC	course_teach
SELECT Name FROM teacher ORDER BY Age ASC	course_teach
SELECT Age, Hometown FROM teacher	course_teach
SELECT Age, Hometown FROM teacher	course_teach
select name from teacher where hometown != "little lever urban district"	course_teach
select name from teacher where hometown != "little lever urban district"	course_teach
SELECT Name FROM teacher WHERE (Age = 32 OR Age = 33)	course_teach
SELECT Name FROM teacher WHERE (Age = 32 OR Age = 33)	course_teach
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1	course_teach
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1	course_teach
SELECT Hometown, COUNT(*) AS number_of_teachers FROM teacher GROUP BY Hometown	course_teach
SELECT Hometown , COUNT(1) FROM teacher GROUP BY Hometown	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2	course_teach
SELECT teacher.Name, course.Course FROM course_arrange JOIN teacher ON course_arrange.Teacher_ID = teacher.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID	course_teach
SELECT teacher.Name, course.Course FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course.Course_ID = course_arrange.Course_ID	course_teach
SELECT T1.Name, T3.Course FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T2.Course_ID = T3.Course_ID ORDER BY T1.Name ASC	course_teach
SELECT teacher.Name, course.Course FROM course_arrange JOIN teacher ON course_arrange.Teacher_ID = teacher.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID ORDER BY teacher.Name ASC	course_teach
SELECT teacher.Name FROM teacher JOIN course_arrange ON course_arrange.Teacher_ID = teacher.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID WHERE course.Course = 'Math'	course_teach
SELECT T1.Name FROM course AS T2 JOIN course_arrange AS T3 ON T2.Course_ID = T3.Course_ID JOIN teacher AS T1 ON T3.Teacher_ID = T1.Teacher_ID WHERE T2.Course = 'Math'	course_teach
SELECT teacher.Name, COUNT(course_arrange.Course_ID) AS number_of_courses FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Teacher_ID	course_teach
SELECT b.Name , COUNT(*) FROM course_arrange AS a INNER JOIN teacher AS b ON a.Teacher_ID = b.Teacher_ID GROUP BY b.Name	course_teach
SELECT b.Name FROM course_arrange AS a INNER JOIN teacher AS b ON a.Teacher_ID = b.Teacher_ID GROUP BY b.Name HAVING COUNT(*) >= 2	course_teach
SELECT teacher.Name FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Name HAVING COUNT(*) >= 2	course_teach
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)	course_teach
SELECT teacher.Name FROM teacher LEFT JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID WHERE course_arrange.Course_ID IS NULL	course_teach
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
SELECT COUNT(*) AS count FROM ship WHERE disposition_of_ship = 'Captured'	battle_death
SELECT name, tonnage FROM ship ORDER BY name DESC;	battle_death
SELECT name, date, result FROM battle	battle_death
SELECT MAX(killed) AS "maximum death toll", MIN(killed) AS "minimum death toll" FROM death	battle_death
SELECT AVG(injured) AS average_injuries FROM death;	battle_death
SELECT T2.killed, T2.injured FROM ship AS T1 JOIN death AS T2 ON T1.id = T2.caused_by_ship_id WHERE T1.tonnage = 't'	battle_death
SELECT name , RESULT FROM battle WHERE bulgarian_commander <> 'Boril'	battle_death
SELECT T1.id, T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.ship_type = 'Brig'	battle_death
SELECT a.id , a.name FROM battle AS a INNER JOIN ship AS b ON a.id = b.lost_in_battle INNER JOIN death AS c ON b.id = c.caused_by_ship_id GROUP BY a.id HAVING sum(c.killed) > 10	battle_death
SELECT ship.id AS ship_id, ship.name FROM ship JOIN death ON death.caused_by_ship_id = ship.id GROUP BY ship.id ORDER BY SUM(death.injured) DESC LIMIT 1	battle_death
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I';	battle_death
SELECT COUNT(DISTINCT result) AS count FROM battle	battle_death
SELECT COUNT(*) AS battle_count FROM battle WHERE battle.id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = '225')	battle_death
SELECT battle.name, battle.date FROM battle JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.name = 'Lettice' INTERSECT SELECT battle.name, battle.date FROM battle JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.name = 'HMS Atalanta'	battle_death
SELECT T1.name, T1.result, T1.bulgarian_commander FROM battle AS T1 WHERE NOT EXISTS (SELECT 1 FROM ship AS T2 WHERE T2.lost_in_battle = T1.id AND T2.location = 'English Channel')	battle_death
SELECT note FROM death WHERE note LIKE '%East%'	battle_death
SELECT count(*) FROM area_code_state	voter_1
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC	voter_1
SELECT vote_id, phone_number, state FROM VOTES	voter_1
SELECT MAX(area_code), MIN(area_code) FROM AREA_CODE_STATE;	voter_1
SELECT max(created) FROM votes WHERE state = 'CA'	voter_1
SELECT contestant_name FROM contestants WHERE contestant_name != 'Jessie Alloway'	voter_1
SELECT DISTINCT state, created FROM VOTES	voter_1
SELECT T1.contestant_number, T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T2.contestant_number = T1.contestant_number GROUP BY T1.contestant_number HAVING COUNT(*) >= 2	voter_1
SELECT a.contestant_number , a.contestant_name FROM contestants AS a INNER JOIN votes AS b ON a.contestant_number = b.contestant_number GROUP BY a.contestant_number ORDER BY count(*) ASC LIMIT 1	voter_1
SELECT count(*) FROM votes WHERE (state = 'NY' OR state = 'CA')	voter_1
SELECT COUNT(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES)	voter_1
SELECT a.area_code FROM AREA_CODE_STATE AS a INNER JOIN VOTES AS b ON a.state = b.state GROUP BY a.area_code ORDER BY COUNT(*) DESC LIMIT 1	voter_1
SELECT b.created , b.state , b.phone_number FROM contestants AS a INNER JOIN votes AS b ON a.contestant_number = b.contestant_number WHERE a.contestant_name = 'Tabatha Gehling'	voter_1
SELECT DISTINCT A.area_code FROM VOTES V JOIN CONTESTANTS C ON V.contestant_number = C.contestant_number JOIN AREA_CODE_STATE A ON V.state = A.state WHERE C.contestant_name = 'Tabatha Gehling' INTERSECT SELECT DISTINCT A.area_code FROM VOTES V JOIN CONTESTANTS C ON V.contestant_number = C.contestant_number JOIN AREA_CODE_STATE A ON V.state = A.state WHERE C.contestant_name = 'Kelly Clauss'	voter_1
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'	voter_1
SELECT COUNT(*) FROM Other_Available_Features	real_estate_properties
SELECT rft.feature_type_name FROM Ref_Feature_Types AS rft JOIN Other_Available_Features AS oaf ON rft.feature_type_code = oaf.feature_type_code WHERE oaf.feature_name = 'AirCon'	real_estate_properties
SELECT T1.property_type_description FROM Ref_Property_Types AS T1 INNER JOIN Properties AS T2 ON T1.property_type_code = T2.property_type_code WHERE T2.property_type_code = 'House'	real_estate_properties
SELECT Properties.property_name FROM Properties JOIN Ref_Property_Types ON Properties.property_type_code = Ref_Property_Types.property_type_code WHERE Properties.room_count > 1 AND Ref_Property_Types.property_type_description IN ('House, Bungalow, etc.','Apartment, Flat, Condo, etc.')	real_estate_properties
