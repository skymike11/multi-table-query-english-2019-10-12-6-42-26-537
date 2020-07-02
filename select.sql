# 1.Query the existence of 1 course
SELECT * FROM course WHERE id =1;

# 2.Query the presence of both 1 and 2 courses
SELECT * FROM course WHERE id =1 or id = 2;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT
	s.id,
	s.`name`,
	AVG( sc.score ) avg
FROM
	student s
	LEFT JOIN student_course sc ON s.id = sc.studentId 
GROUP BY
	sc.courseId,
	s.id,
	s.`name`,
	sc.score
HAVING
	AVG( sc.score ) >= 60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT
	* 
FROM
	student s 
WHERE
	s.id NOT IN (
	SELECT DISTINCT
		s.id 
	FROM
		student s
	LEFT JOIN student_course sc ON s.id = sc.studentId 
);

# 5.Query all SQL with grades
SELECT
	* 
FROM
	student s
	LEFT JOIN student_course sc ON s.id = sc.studentId
	LEFT JOIN course c ON c.id = sc.courseId;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT
DISTINCT	* 
FROM
	student s
	LEFT JOIN student_course sc ON s.id = sc.studentId
	WHERE sc.courseId = 1 
	or sc.courseId = 2;

# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT
	s.id,
	s.`name`,
	AVG( sc.score ) avg 
FROM
	student s
	LEFT JOIN student_course sc ON s.id = sc.studentId 
WHERE
	sc.courseId = 1 
GROUP BY
	sc.courseId,
	s.id,
	s.`name`,
	sc.score 
HAVING
	AVG( sc.score ) < 60
ORDER BY
	avg asc;


# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT
	c.id, c.`name`,
	AVG( sc.score ) avg 
FROM
	student s
	LEFT JOIN student_course sc ON s.id = sc.studentId 
	LEFT JOIN course c ON  c.id = sc.courseId 
GROUP BY
	c.id,
	c.`name`,
	sc.courseId
ORDER BY
	avg ASC;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
	SELECT
	s.id,
	s.`name`,
	AVG( sc.score ) avg 
FROM
	student s
	LEFT JOIN student_course sc ON s.id = sc.studentId 
WHERE
	sc.courseId = 2 
GROUP BY
	sc.courseId,
	s.id,
	s.`name`,
	sc.score 
HAVING
	AVG( sc.score ) < 60
ORDER BY
	avg ASC;