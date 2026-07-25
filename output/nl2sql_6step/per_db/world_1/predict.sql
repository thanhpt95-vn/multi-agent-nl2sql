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
