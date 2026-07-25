SELECT line_1, line_2 FROM Addresses	student_transcripts_tracking
SELECT line_1, line_2 FROM Addresses	student_transcripts_tracking
SELECT COUNT(*) AS total_courses FROM Courses	student_transcripts_tracking
SELECT COUNT(*) AS number_of_courses FROM Courses	student_transcripts_tracking
SELECT course_description FROM Courses WHERE course_name = 'math'	student_transcripts_tracking
SELECT course_description FROM Courses WHERE (course_name = 'math')	student_transcripts_tracking
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'	student_transcripts_tracking
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'	student_transcripts_tracking
SELECT b.department_name , a.department_id FROM Degree_Programs AS a INNER JOIN Departments AS b ON a.department_id = b.department_id GROUP BY a.department_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
select b.department_name , a.department_id from degree_programs AS a INNER JOIN departments AS b on a.department_id = b.department_id group by a.department_id order by count(*) desc limit 1	student_transcripts_tracking
SELECT COUNT(DISTINCT department_id) AS count FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(DISTINCT T1.department_id) AS count_of_departments FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id	student_transcripts_tracking
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(DISTINCT degree_summary_name) AS distinct_count FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(*) AS "Number of Degrees" FROM Degree_Programs JOIN Departments ON Degree_Programs.department_id = Departments.department_id WHERE Departments.department_name = 'engineering'	student_transcripts_tracking
SELECT COUNT(*) AS count FROM Degree_Programs JOIN Departments ON Degree_Programs.department_id = Departments.department_id WHERE Departments.department_name = 'engineering'	student_transcripts_tracking
SELECT section_name, section_description FROM Sections	student_transcripts_tracking
SELECT section_name, section_description FROM Sections	student_transcripts_tracking
SELECT a.course_name , a.course_id FROM Courses AS a INNER JOIN Sections AS b ON a.course_id = b.course_id GROUP BY a.course_id HAVING count(*) <= 2	student_transcripts_tracking
SELECT C.course_name, C.course_id FROM Courses AS C LEFT JOIN Sections AS S ON C.course_id = S.course_id GROUP BY C.course_id, C.course_name HAVING COUNT(*) < 2	student_transcripts_tracking
SELECT section_name FROM Sections ORDER BY section_name DESC	student_transcripts_tracking
SELECT section_name FROM Sections ORDER BY section_name DESC	student_transcripts_tracking
SELECT a.semester_name , a.semester_id FROM Semesters AS a INNER JOIN Student_Enrolment AS b ON a.semester_id = b.semester_id GROUP BY a.semester_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT a.semester_name , a.semester_id FROM Semesters AS a INNER JOIN Student_Enrolment AS b ON a.semester_id = b.semester_id GROUP BY a.semester_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT department_description FROM Departments WHERE department_name LIKE '%the computer%'	student_transcripts_tracking
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'	student_transcripts_tracking
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id AS id FROM Students AS T1 WHERE T1.student_id IN (SELECT student_id FROM Student_Enrolment GROUP BY student_id, semester_id HAVING COUNT(DISTINCT degree_program_id) = 2)	student_transcripts_tracking
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id, T1.first_name, T1.middle_name, T1.last_name, T2.semester_id HAVING COUNT(DISTINCT T2.degree_program_id) = 2	student_transcripts_tracking
SELECT Students.first_name, Students.middle_name, Students.last_name FROM Students JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Bachelor'	student_transcripts_tracking
SELECT Students.first_name, Students.middle_name, Students.last_name FROM Students JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Bachelor'	student_transcripts_tracking
SELECT a.degree_summary_name FROM Degree_Programs AS a INNER JOIN Student_Enrolment AS b ON a.degree_program_id = b.degree_program_id GROUP BY a.degree_summary_name ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT a.degree_summary_name FROM Degree_Programs AS a INNER JOIN Student_Enrolment AS b ON a.degree_program_id = b.degree_program_id GROUP BY a.degree_summary_name ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT Degree_Programs.degree_program_id, Degree_Programs.degree_summary_description FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT Degree_Programs.degree_program_id, Degree_Programs.degree_summary_description FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_program_id, Degree_Programs.degree_summary_description ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT Students.student_id, Students.first_name, Students.middle_name, Students.last_name, COUNT(Student_Enrolment.student_id) AS number_of_enrollments, Students.student_id FROM Students JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id GROUP BY Students.student_id, Students.first_name, Students.middle_name, Students.last_name ORDER BY number_of_enrollments DESC LIMIT 1;	student_transcripts_tracking
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id, COUNT(T2.student_id) AS number_of_enrollments FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY number_of_enrollments DESC LIMIT 1	student_transcripts_tracking
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)	student_transcripts_tracking
SELECT semester_name FROM Semesters LEFT JOIN Student_Enrolment ON Semesters.semester_id = Student_Enrolment.semester_id WHERE Student_Enrolment.semester_id IS NULL	student_transcripts_tracking
SELECT DISTINCT Courses.course_name FROM Courses JOIN Student_Enrolment_Courses ON Courses.course_id = Student_Enrolment_Courses.course_id WHERE EXISTS (SELECT 1 FROM Student_Enrolment WHERE Student_Enrolment.student_enrolment_id = Student_Enrolment_Courses.student_enrolment_id)	student_transcripts_tracking
SELECT DISTINCT a.course_name FROM Courses AS a INNER JOIN Student_Enrolment_Courses AS b ON a.course_id = b.course_id;	student_transcripts_tracking
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id, T1.course_name ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.last_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id LEFT JOIN Student_Enrolment AS T3 ON T1.student_id = T3.student_id WHERE T2.state_province_county = 'North Carolina' AND T3.degree_program_id IS NULL	student_transcripts_tracking
SELECT T1.last_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id LEFT JOIN Student_Enrolment AS T3 ON T1.student_id = T3.student_id WHERE T2.state_province_county = 'North Carolina' AND T3.student_id IS NULL	student_transcripts_tracking
SELECT b.transcript_date , a.transcript_id FROM Transcript_Contents AS a INNER JOIN Transcripts AS b ON a.transcript_id = b.transcript_id GROUP BY a.transcript_id HAVING count(*) >= 2	student_transcripts_tracking
SELECT b.transcript_date , a.transcript_id FROM Transcript_Contents AS a INNER JOIN Transcripts AS b ON a.transcript_id = b.transcript_id GROUP BY a.transcript_id HAVING count(*) >= 2	student_transcripts_tracking
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'	student_transcripts_tracking
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1	student_transcripts_tracking
SELECT first_name AS c1 , middle_name , last_name FROM Students ORDER BY date_left ASC LIMIT 1	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_left ASC LIMIT 1	student_transcripts_tracking
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id	student_transcripts_tracking
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id	student_transcripts_tracking
SELECT A.address_id, A.line_1, A.line_2, A.line_3 FROM Addresses AS A JOIN (SELECT current_address_id, COUNT(*) AS student_count FROM Students GROUP BY current_address_id) AS S ON A.address_id = S.current_address_id ORDER BY S.student_count DESC LIMIT 1	student_transcripts_tracking
SELECT a.address_id , a.line_1 , a.line_2 FROM Addresses AS a INNER JOIN Students AS b ON a.address_id = b.current_address_id GROUP BY a.address_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT AVG(transcript_date) AS transcript_date FROM Transcripts;	student_transcripts_tracking
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts	student_transcripts_tracking
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1	student_transcripts_tracking
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1	student_transcripts_tracking
SELECT COUNT(*) AS transcripts_count FROM Transcripts	student_transcripts_tracking
SELECT COUNT(*) AS transcript_count FROM Transcripts	student_transcripts_tracking
SELECT transcript_date FROM Transcripts ORDER BY transcript_date DESC LIMIT 1	student_transcripts_tracking
SELECT transcript_date FROM Transcripts ORDER BY transcript_date DESC LIMIT 1	student_transcripts_tracking
SELECT Student_Enrolment_Courses.student_course_id AS course_enrollment_id, COUNT(*) AS max_count FROM Student_Enrolment_Courses JOIN Transcript_Contents ON Student_Enrolment_Courses.student_course_id = Transcript_Contents.student_course_id GROUP BY Student_Enrolment_Courses.student_course_id ORDER BY max_count DESC LIMIT 1;	student_transcripts_tracking
SELECT COUNT(*) AS course_count, T2.student_enrolment_id FROM Transcript_Contents AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.student_course_id = T2.student_course_id GROUP BY T2.student_enrolment_id ORDER BY course_count DESC LIMIT 1	student_transcripts_tracking
SELECT T.transcript_date, T.transcript_id FROM Transcripts AS T JOIN Transcript_Contents AS TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id ORDER BY COUNT(*) ASC LIMIT 1	student_transcripts_tracking
	student_transcripts_tracking
SELECT semester_name FROM Semesters WHERE semester_id IN (SELECT semester_id FROM Student_Enrolment JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Master' INTERSECT SELECT semester_id FROM Student_Enrolment JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Bachelor')	student_transcripts_tracking
SELECT T1.semester_id FROM Student_Enrolment AS T1 INNER JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id WHERE T2.degree_summary_name = 'Master' INTERSECT SELECT T1.semester_id FROM Student_Enrolment AS T1 INNER JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id WHERE T2.degree_summary_name = 'Bachelor'	student_transcripts_tracking
SELECT COUNT(DISTINCT address_id) AS how_many_different_addresses FROM Addresses WHERE address_id IN (SELECT current_address_id FROM Students)	student_transcripts_tracking
SELECT DISTINCT Addresses.line_1, Addresses.line_2, Addresses.line_3, Addresses.city, Addresses.zip_postcode, Addresses.state_province_county, Addresses.country FROM Addresses JOIN Students ON Addresses.address_id = Students.current_address_id OR Addresses.address_id = Students.permanent_address_id	student_transcripts_tracking
SELECT student_id, current_address_id, permanent_address_id, first_name, middle_name, last_name, cell_mobile_number, email_address, ssn, date_first_registered, date_left, other_student_details FROM Students ORDER BY student_id DESC	student_transcripts_tracking
SELECT student_id, first_name, middle_name, last_name, cell_mobile_number, email_address, ssn, date_first_registered, date_left, other_student_details FROM Students ORDER BY last_name DESC	student_transcripts_tracking
SELECT section_id, course_id, section_name, section_description, other_details FROM Sections WHERE section_name = 'h'	student_transcripts_tracking
SELECT section_description FROM Sections WHERE section_name = 'h'	student_transcripts_tracking
SELECT Students.first_name FROM Students JOIN Addresses ON Students.permanent_address_id = Addresses.address_id WHERE Addresses.country = 'Haiti' OR Students.cell_mobile_number = '09700166582'	student_transcripts_tracking
select a.first_name from students AS a INNER JOIN addresses AS b on a.permanent_address_id = b.address_id where b.country = 'haiti' or a.cell_mobile_number = '09700166582'	student_transcripts_tracking
