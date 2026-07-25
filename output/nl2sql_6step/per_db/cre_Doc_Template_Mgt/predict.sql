SELECT COUNT(*) FROM Documents	cre_Doc_Template_Mgt
SELECT COUNT(*) AS count FROM Documents	cre_Doc_Template_Mgt
SELECT Document_ID, Document_Name, Document_Description FROM Documents	cre_Doc_Template_Mgt
SELECT Document_ID, Document_Name, Document_Description FROM Documents	cre_Doc_Template_Mgt
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'	cre_Doc_Template_Mgt
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'	cre_Doc_Template_Mgt
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT COUNT(DISTINCT Template_ID) AS count FROM Documents	cre_Doc_Template_Mgt
SELECT COUNT(DISTINCT Templates.Template_ID) AS count FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT COUNT(*) AS count FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT Templates.Template_ID, COUNT(*) AS number_of_documents FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID	cre_Doc_Template_Mgt
SELECT T1.Template_ID, COUNT(*) AS count FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID	cre_Doc_Template_Mgt
SELECT Templates.Template_ID, Templates.Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT T.Template_ID, T.Template_Type_Code FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID, T.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Templates.Template_ID FROM Templates INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID HAVING COUNT(*) > 1	cre_Doc_Template_Mgt
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(1) > 1	cre_Doc_Template_Mgt
SELECT template_id FROM Templates EXCEPT SELECT template_id FROM Documents	cre_Doc_Template_Mgt
SELECT template_id FROM Templates EXCEPT SELECT template_id FROM Documents	cre_Doc_Template_Mgt
SELECT COUNT(*) AS template_count FROM Templates	cre_Doc_Template_Mgt
SELECT COUNT(*) AS count FROM Templates	cre_Doc_Template_Mgt
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates	cre_Doc_Template_Mgt
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates	cre_Doc_Template_Mgt
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT template_id FROM Templates WHERE (template_type_code = "PP" OR template_type_code = "PPT")	cre_Doc_Template_Mgt
SELECT template_id FROM Templates WHERE (template_type_code = "PP" OR template_type_code = "PPT")	cre_Doc_Template_Mgt
SELECT COUNT(*) AS count FROM Templates WHERE Template_Type_Code = 'CV'	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV';	cre_Doc_Template_Mgt
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5	cre_Doc_Template_Mgt
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5;	cre_Doc_Template_Mgt
SELECT Ref_Template_Types.Template_Type_Code, COUNT(*) AS number_of_templates FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code GROUP BY Ref_Template_Types.Template_Type_Code	cre_Doc_Template_Mgt
SELECT Template_Type_Code, COUNT(*) AS number_of_templates FROM Templates GROUP BY Template_Type_Code	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code FROM Templates GROUP BY Templates.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(1) < 3	cre_Doc_Template_Mgt
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T1.Template_Type_Code HAVING COUNT(*) < 3	cre_Doc_Template_Mgt
SELECT min(t0.Version_Number) , t0.template_type_code FROM Templates AS t0	cre_Doc_Template_Mgt
SELECT min(t0.Version_Number) , t0.template_type_code FROM Templates AS t0	cre_Doc_Template_Mgt
SELECT T1.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = 'Data base'	cre_Doc_Template_Mgt
SELECT a.template_type_code FROM Templates AS a INNER JOIN Documents AS b ON a.template_id = b.template_id WHERE b.document_name = "Data base"	cre_Doc_Template_Mgt
SELECT T1.Document_Name FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'BK'	cre_Doc_Template_Mgt
SELECT T1.Document_Name FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'BK'	cre_Doc_Template_Mgt
SELECT Ref_Template_Types.Template_Type_Code, COUNT(*) AS number_of_documents FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Ref_Template_Types.Template_Type_Code	cre_Doc_Template_Mgt
SELECT a.template_type_code , count(*) FROM Templates AS a INNER JOIN Documents AS b ON a.template_id = b.template_id GROUP BY a.template_type_code	cre_Doc_Template_Mgt
SELECT Ref_Template_Types.Template_Type_Code FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code GROUP BY Ref_Template_Types.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID GROUP BY Templates.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates)	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Ref_Template_Types EXCEPT SELECT DISTINCT t.Template_Type_Code FROM Templates t JOIN Documents d ON t.Template_ID = d.Template_ID	cre_Doc_Template_Mgt
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'	cre_Doc_Template_Mgt
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'	cre_Doc_Template_Mgt
SELECT DISTINCT Ref_Template_Types.Template_Type_Description FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID	cre_Doc_Template_Mgt
SELECT DISTINCT Ref_Template_Types.Template_Type_Description FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID	cre_Doc_Template_Mgt
SELECT Templates.Template_ID FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = 'Presentation'	cre_Doc_Template_Mgt
SELECT T1.Template_ID FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Description = 'Presentation'	cre_Doc_Template_Mgt
SELECT COUNT(*) AS total_paragraphs FROM Paragraphs;	cre_Doc_Template_Mgt
SELECT COUNT(*) AS paragraph_count FROM Paragraphs	cre_Doc_Template_Mgt
SELECT count(*) FROM Paragraphs AS a INNER JOIN Documents AS b ON a.document_ID = b.document_ID WHERE b.document_name = 'Summer Show'	cre_Doc_Template_Mgt
SELECT COUNT(*) AS paragraph_count FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Summer Show'	cre_Doc_Template_Mgt
SELECT Paragraph_ID, Document_ID, Paragraph_Text, Other_Details FROM Paragraphs WHERE Paragraph_Text = 'Korea'	cre_Doc_Template_Mgt
SELECT Paragraph_ID, Document_ID, Paragraph_Text, Other_Details FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'	cre_Doc_Template_Mgt
SELECT Paragraphs.Paragraph_ID, Paragraphs.Paragraph_Text FROM Paragraphs JOIN Documents ON Documents.Document_ID = Paragraphs.Document_ID WHERE Documents.Document_Name = 'Welcome to NY'	cre_Doc_Template_Mgt
SELECT a.paragraph_id , a.paragraph_text FROM Paragraphs AS a INNER JOIN Documents AS b ON a.document_id = b.document_id WHERE b.Document_Name = 'Welcome to NY'	cre_Doc_Template_Mgt
SELECT Paragraphs.Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Customer reviews'	cre_Doc_Template_Mgt
SELECT Paragraphs.Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Customer reviews'	cre_Doc_Template_Mgt
SELECT Documents.Document_ID, COUNT(*) AS count_paragraphs FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID	cre_Doc_Template_Mgt
SELECT Documents.Document_ID, COUNT(*) AS Number_of_Paragraphs FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID ASC	cre_Doc_Template_Mgt
SELECT T1.Document_ID, T1.Document_Name, COUNT(T2.Paragraph_ID) AS number_of_paragraphs FROM Documents AS T1 LEFT JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID, T1.Document_Name	cre_Doc_Template_Mgt
SELECT T1.Document_ID, T1.Document_Name, COUNT(T2.Paragraph_ID) AS Paragraph_Count FROM Documents AS T1 LEFT JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) >= 2	cre_Doc_Template_Mgt
SELECT T1.Document_ID FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID HAVING COUNT(T2.Paragraph_ID) >= 2	cre_Doc_Template_Mgt
SELECT a.document_id , b.document_name FROM Paragraphs AS a INNER JOIN Documents AS b ON a.document_id = b.document_id GROUP BY a.document_id ORDER BY count(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT a.document_id , b.document_name FROM Paragraphs AS a INNER JOIN Documents AS b ON a.document_id = b.document_id GROUP BY a.document_id ORDER BY count(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT p.Document_ID FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY p.Document_ID ORDER BY COUNT(*) ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT Paragraphs.Document_ID FROM Paragraphs GROUP BY Paragraphs.Document_ID ORDER BY COUNT(*) ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs WHERE (paragraph_text = 'Brazil' INTERSECT SELECT document_id FROM Paragraphs WHERE paragraph_text = 'Ireland')	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs WHERE (paragraph_text = 'Brazil' INTERSECT SELECT document_id FROM Paragraphs WHERE paragraph_text = 'Ireland')	cre_Doc_Template_Mgt
