DROP TABLE IF EXISTS assignments;

CREATE TABLE assignments (
id SERIAL PRIMARY KEY NOT NULL,
name VARCHAR(225),
content TEXT,
day INT,
chapter INT,
duration INT
);

DROP TABLE IF EXISTS assignment_submissions;

CREATE TABLE assignment_submissions (
id SERIAL PRIMARY KEY NOT NULL,
assignment_id INT REFERENCES assignments(id) ON DELETE CASCADE,
student_id INT REFERENCES students(id) ON DELETE CASCADE,
duration INT,
submission_date DATE
);