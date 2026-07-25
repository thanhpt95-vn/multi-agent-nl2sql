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
