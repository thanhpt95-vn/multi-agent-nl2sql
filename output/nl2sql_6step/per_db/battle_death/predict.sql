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
