CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  surname VARCHAR(255),
  first_name VARCHAR(255),
  patronymic VARCHAR(255),
  birthdate VARCHAR(20),
  phone VARCHAR(20),
  telegram VARCHAR(50),
  email VARCHAR(255),
  git VARCHAR(255)
);