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

-- Enrollments Table
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
)

-- Insert students table data
INSERT INTO students (first_name, last_name, email,school_enrollment_date) VALUES
('John', 'Doe', 'JohnDoe@email.com', '2024-01-01'),
('Jane', 'Smith', 'JaneSmith@email.com', '2024-02-02'),
('Bob', 'Doyle', 'BobDoyle@email.com', '2024-03-03'),
('Mark', 'Delaney', 'MarkDelaney@email.com', '2024-04-04'),
('Anne', 'Myers', 'AnneMyers@email.com', '2024-05-05');

-- Insert professors table data
INSERT INTO professors (first_name, last_name, department) VALUES
('Chelsea', 'Davidson', 'Mathematics'),
('Valery', 'Cole', 'Chemistry'),
('Felix', 'Montes', 'Physics'),
('Bishop', 'Cochran', 'History');

-- Insert courses table data
INSERT INTO courses (course_name, course_description, professor_id)  VALUES
('Algebra 101', 'Introduction to to algebra concepts'),
('General Chemistry', 'Introduction to chemistry compounds'),
('Physics 101', 'Introduction to physics');

-- Insert enrollments table data
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 3, '2024-01-01'),
(2, 2, '2024-02-02'),
(3, 1, '2024-03-03'),
(4, 2, '2024-04-04'),
(5, 3, '2024-05-05');

-- Query students full name in Physics 101 
SELECT CONCAT (students.first_name, ' ', students.last_name) AS full_name FROM students 
JOIN enrollments ON students.id = enrollments.student_id
JOIN courses ON enrollments.course_id = course_id
WHERE courses.course_name = 'Physics 101';

