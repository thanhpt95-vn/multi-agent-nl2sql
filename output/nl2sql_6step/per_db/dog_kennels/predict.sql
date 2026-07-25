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
