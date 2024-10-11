-- Students Table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    school_enrollment_date DATE
);

-- Professors Table
CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

-- Courses Table
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    course_description TEXT,
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professors(id)
);


