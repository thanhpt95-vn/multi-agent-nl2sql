SELECT COUNT(*) AS teacher_count FROM teacher	course_teach
SELECT COUNT(*) AS total_count FROM teacher	course_teach
SELECT Name FROM teacher ORDER BY Age ASC	course_teach
SELECT Name FROM teacher ORDER BY Age ASC	course_teach
SELECT Age, Hometown FROM teacher	course_teach
SELECT Age, Hometown FROM teacher	course_teach
select name from teacher where hometown != "little lever urban district"	course_teach
select name from teacher where hometown != "little lever urban district"	course_teach
SELECT Name FROM teacher WHERE (Age = 32 OR Age = 33)	course_teach
SELECT Name FROM teacher WHERE (Age = 32 OR Age = 33)	course_teach
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1	course_teach
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1	course_teach
SELECT Hometown, COUNT(*) AS number_of_teachers FROM teacher GROUP BY Hometown	course_teach
SELECT Hometown , COUNT(1) FROM teacher GROUP BY Hometown	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2	course_teach
SELECT teacher.Name, course.Course FROM course_arrange JOIN teacher ON course_arrange.Teacher_ID = teacher.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID	course_teach
SELECT teacher.Name, course.Course FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course.Course_ID = course_arrange.Course_ID	course_teach
SELECT T1.Name, T3.Course FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T2.Course_ID = T3.Course_ID ORDER BY T1.Name ASC	course_teach
SELECT teacher.Name, course.Course FROM course_arrange JOIN teacher ON course_arrange.Teacher_ID = teacher.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID ORDER BY teacher.Name ASC	course_teach
SELECT teacher.Name FROM teacher JOIN course_arrange ON course_arrange.Teacher_ID = teacher.Teacher_ID JOIN course ON course_arrange.Course_ID = course.Course_ID WHERE course.Course = 'Math'	course_teach
SELECT T1.Name FROM course AS T2 JOIN course_arrange AS T3 ON T2.Course_ID = T3.Course_ID JOIN teacher AS T1 ON T3.Teacher_ID = T1.Teacher_ID WHERE T2.Course = 'Math'	course_teach
SELECT teacher.Name, COUNT(course_arrange.Course_ID) AS number_of_courses FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Teacher_ID	course_teach
SELECT b.Name , COUNT(*) FROM course_arrange AS a INNER JOIN teacher AS b ON a.Teacher_ID = b.Teacher_ID GROUP BY b.Name	course_teach
SELECT b.Name FROM course_arrange AS a INNER JOIN teacher AS b ON a.Teacher_ID = b.Teacher_ID GROUP BY b.Name HAVING COUNT(*) >= 2	course_teach
SELECT teacher.Name FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Name HAVING COUNT(*) >= 2	course_teach
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)	course_teach
SELECT teacher.Name FROM teacher LEFT JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID WHERE course_arrange.Course_ID IS NULL	course_teach
