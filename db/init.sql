CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100)
);

INSERT INTO students(name, course)
VALUES
('Alan','AWS'),
('Naufia','DevOps'),
('Jerin','Java');