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
