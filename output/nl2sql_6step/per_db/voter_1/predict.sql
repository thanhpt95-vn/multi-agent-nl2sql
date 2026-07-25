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
