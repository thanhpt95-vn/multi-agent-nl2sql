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
