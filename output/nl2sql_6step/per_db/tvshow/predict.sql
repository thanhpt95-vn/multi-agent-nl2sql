SELECT Title FROM Cartoon ORDER BY Title ASC	tvshow
SELECT Title FROM Cartoon ORDER BY Title ASC	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'	tvshow
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'	tvshow
SELECT COUNT(*) AS number_of_cartoons FROM Cartoon WHERE Written_by = 'Joseph Kuhr'	tvshow
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date ASC	tvshow
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date ASC	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones" OR Directed_by = "Brandon Vietti";	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'	tvshow
SELECT Country, COUNT(id) AS number_of_TV_Channels FROM TV_Channel GROUP BY Country ORDER BY number_of_TV_Channels DESC LIMIT 1	tvshow
SELECT Country, COUNT(id) AS TV_Channels_Count FROM TV_Channel GROUP BY Country ORDER BY TV_Channels_Count DESC LIMIT 1	tvshow
SELECT COUNT(DISTINCT series_name) AS number_of_series_names, COUNT(DISTINCT Content) AS number_of_contents FROM TV_Channel	tvshow
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel	tvshow
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT COUNT(*) AS count FROM TV_Channel WHERE Language = 'English'	tvshow
SELECT COUNT(*) AS count FROM TV_Channel WHERE Language = 'English'	tvshow
SELECT Language, COUNT(id) AS num_tv_channels FROM TV_Channel GROUP BY Language ORDER BY num_tv_channels ASC LIMIT 1	tvshow
SELECT LANGUAGE , COUNT(1) FROM TV_Channel GROUP BY LANGUAGE ORDER BY count(*) ASC LIMIT 1	tvshow
SELECT LANGUAGE , COUNT(1) FROM TV_Channel GROUP BY LANGUAGE	tvshow
SELECT Language, COUNT(*) AS count FROM TV_Channel GROUP BY Language	tvshow
SELECT T1.series_name FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'	tvshow
SELECT T1.series_name FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = "The Rise of the Blue Beetle!";	tvshow
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'	tvshow
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'	tvshow
SELECT Episode FROM TV_series ORDER BY Rating ASC	tvshow
SELECT Episode, Rating FROM TV_series ORDER BY Rating ASC	tvshow
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3	tvshow
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3	tvshow
SELECT MIN(Share) AS Share_min, MAX(Share) AS Share_max FROM TV_series	tvshow
SELECT MAX(Share), MIN(Share) FROM TV_series	tvshow
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT Original_air_date FROM Cartoon WHERE Title = 'A Love of a Lifetime'	tvshow
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT TV_series.Channel, TV_Channel.series_name FROM TV_series JOIN TV_Channel ON TV_series.Channel = TV_Channel.id WHERE TV_series.Episode = 'A Love of a Lifetime'	tvshow
SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = 'A Love of a Lifetime'	tvshow
SELECT T1.Episode FROM TV_series AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'	tvshow
SELECT Episode FROM TV_series WHERE Channel = (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')	tvshow
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by	tvshow
SELECT Directed_by, COUNT(*) AS cartoon_count FROM Cartoon GROUP BY Directed_by	tvshow
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1	tvshow
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1	tvshow
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'yes'	tvshow
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'yes'	tvshow
SELECT TV_Channel.Country FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Written_by = 'Todd Casey'	tvshow
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T2.Channel = T1.id WHERE T2.Written_by = 'Todd Casey' AND T1.Content = 'cartoons'	tvshow
SELECT Country FROM TV_Channel EXCEPT SELECT TV_Channel.Country FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Written_by = 'Todd Casey'	tvshow
SELECT TV_Channel.Country FROM TV_Channel INNER JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Written_by <> 'Todd Casey'	tvshow
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones' OR T2.Directed_by = 'Michael Chang'	tvshow
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones' INTERSECT SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Michael Chang'	tvshow
SELECT Pixel_aspect_ratio_PAR , country FROM tv_channel WHERE LANGUAGE <> 'English'	tvshow
SELECT Pixel_aspect_ratio_PAR , country FROM tv_channel WHERE LANGUAGE <> 'English'	tvshow
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(*) > 2)	tvshow
SELECT T1.id FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel GROUP BY T1.id HAVING COUNT(*) > 2	tvshow
SELECT id FROM TV_Channel EXCEPT SELECT channel FROM cartoon WHERE (directed_by = 'Ben Jones')	tvshow
SELECT id FROM TV_Channel EXCEPT SELECT channel FROM cartoon WHERE (directed_by = 'Ben Jones')	tvshow
SELECT Package_Option FROM TV_Channel EXCEPT SELECT T1.Package_Option FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones'	tvshow
SELECT DISTINCT T1.Package_Option FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by <> 'Ben Jones'	tvshow
