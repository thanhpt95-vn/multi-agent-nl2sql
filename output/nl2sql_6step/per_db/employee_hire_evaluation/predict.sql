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
