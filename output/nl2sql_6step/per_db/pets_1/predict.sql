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
