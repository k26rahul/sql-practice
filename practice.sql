SELECT
  *
FROM
  students;

SELECT
  name
FROM
  students;

SELECT
  dob,
  typeof (dob)
FROM
  students;

PRAGMA table_info (students);

PRAGMA foreign_keys;

CREATE TABLE
  teachers (
    name TEXT NOT NULL,
    subject TEXT NOT NULL,
    annual_salary INTEGER NOT NULL
  );

PRAGMA table_info (teachers);