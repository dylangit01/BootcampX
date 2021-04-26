-- SELECT students.name as student, count(assignment_submissions.*) as total_submissions
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.end_date IS NULL
-- GROUP BY students.name
-- ORDER BY students.name;

-- SELECT students.name as student, count(assignment_submissions.*) as total_submissions
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- -- WHERE students.end_date IS NULL
-- GROUP BY students.name, students.end_date HAVING students.end_date IS NULL
-- ORDER BY students.name;

SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
GROUP BY students.name, students.end_date 
HAVING students.end_date IS NULL AND count(assignment_submissions.*) < 100;