SELECT day, count(*) number_of_assignments, sum(duration) duration
FROM assignments
GROUP BY day
ORDER BY day;