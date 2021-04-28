const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx',
});

const args = process.argv.slice(2)

pool.query(`
SELECT students.id, students.name student, cohorts.name cohort
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '${args[0]}%'
LIMIT ${args[1]};
`)
	.then(res => {
		res.rows.forEach((row) => console.log(`${row.student} has an id of ${row.id} and was in the ${row.cohort} cohort`));
	})
	.catch(err => console.error('query error', err.stack));