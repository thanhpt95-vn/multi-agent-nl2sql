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
