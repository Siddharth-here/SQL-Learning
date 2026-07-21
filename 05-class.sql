

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
    status VARCHAR(20) --selected, pending, rejected

    --foreign key
    student_id INT REFERENCES student(student_id) --pointing to student table
)