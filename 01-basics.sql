CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    --serial auto incremented integer, primary key is unique
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(322) UNIQUE NOT NULL,
    phone_number VARCHAR(10) UNIQUE,
)