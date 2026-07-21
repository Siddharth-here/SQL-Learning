

CREATE TABLE student(
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email  VARCHAR(100),
    branch VARCHAR(50)
)

CREATE TABLE internship(
    internship_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100),
    role VARCHAR(50),
    stipend INT CHECK(stipend>1000),
    status VARCHAR(20), --selected, pending, rejected

    --foreign key
    student_id INT REFERENCES student(student_id) ON DELETE CASCADE --pointing to student table

    --cascade, null, restrict
)

INSERT INTO student (name, email, branch) VALUES
('Arjun Sharma', 'arjun.sharma@email.com', 'Computer Science'),
('Priya Patel', 'priya.patel@email.com', 'Electronics'),
('Rahul Verma', 'rahul.verma@email.com', 'Mechanical'),
('Sneha Reddy', 'sneha.reddy@email.com', 'Civil'),
('Vikram Singh', 'vikram.singh@email.com', 'Information Technology');


SELECT * FROM student

INSERT INTO internship ( student_id, company_name, role, stipend, status) VALUES
(1,'Microsoft', 'Software Engineer Intern', 50000, 'selected'),
(1,'Google', 'Data Analyst Intern', 45000, 'pending'),
(2,'Amazon', 'Backend Developer Intern', 40000, 'selected'),
(3,'TCS', 'Frontend Developer Intern', 15000, 'rejected'),
(5,'Infosys', 'DevOps Intern', 12000, 'pending')

DELETE FROM internship

SELECT * FROM internship

TRUNCATE TABLE internship RESTART IDENTITY CASCADE; --If you want to reset the auto-increment counter (SERIAL) back to 1 as well, use TRUNCATE instead