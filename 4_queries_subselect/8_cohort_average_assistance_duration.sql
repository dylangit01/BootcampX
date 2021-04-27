-- SELECT (SELECT sum(completed_at - started_at) 
-- 			FROM assistance_requests
-- 			JOIN students ON student_id = students.id
-- 			JOIN cohorts ON cohort_id = cohorts.id ) / count(DISTINCT cohorts.name)
-- FROM cohorts
-- JOIN students ON cohorts.id = cohort_id
-- JOIN assistance_requests ON student_id = students.id;

SELECT (SELECT sum(completed_at - started_at) 
			FROM assistance_requests
			JOIN students ON student_id = students.id
			JOIN cohorts ON cohort_id = cohorts.id ) / count(DISTINCT cohorts.*) average_total_duration 
FROM students
JOIN cohorts ON cohort_id = cohorts.id;

-- SELECT avg(total_duration) average_total_duration
-- FROM (
-- SELECT cohorts.name, sum(completed_at - started_at) AS total_duration
-- FROM assistance_requests
-- JOIN students ON student_id = students.id
-- JOIN cohorts ON cohort_id = cohorts.id
-- GROUP BY cohorts.name
-- ORDER BY total_duration
-- ) AS total_duration ;