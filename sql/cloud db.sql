CREATE DATABASE IF NOT EXISTS students_db;
USE students_db;

-- Create Students table
CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    cgpa DECIMAL(3, 2),
     CONSTRAINT check_cgpa_range CHECK (cgpa>=0 AND cgpa<=4)
);

select * from students;

-- Create Subjects table
CREATE TABLE subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(100)
);
select * from subjects;


-- Create Student_Subjects table
CREATE TABLE student_subjects (
    student_id INT,
    subject_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE ,
    PRIMARY KEY (student_id, subject_id)
);

select* from student_subjects;

-- Insert values into Students table
INSERT INTO students (name, age, cgpa) VALUES
('omar abdelrahman', 20, 3.5),
('farah', 21, 3.8),
('ahmed', 19, 3.9);

-- Insert values into Subjects table
INSERT INTO subjects (subject_name) VALUES
('Math'),
('Science'),
('English');

-- Insert values into Student_Subjects table
INSERT INTO student_subjects (student_id, subject_id) VALUES
(1, 1), -- John Doe knows Math
(1, 2), -- John Doe knows Science
(2, 2), -- Jane Smith knows Science
(2, 3), -- Jane Smith knows English
(3, 1), -- Alice Johnson knows Math
(3, 3); -- Alice Johnson knows English