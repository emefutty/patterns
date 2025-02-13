# Тестовый скрипт
require_relative './students_list_DB'
require_relative '../model/student'
require 'pg'

students_list = StudentsListDB.new

puts "\n=== Тест add_student ==="
begin
  student = Student.new(
    surname:"Петров", 
  first_name:"Николай", 
  patronymic:"Васильевич",
  birthdate: '2005-10-05',
  phone:"+79999999998", 
  telegram:"@bbbbb",
  email:"petrov@mail.ru", 
  git:"https://github.com/git2"
  )
  added_student = students_list.add_student(student)  # Исправлено new_student → student
  puts "Добавлен студент с ID: #{added_student.id}"
rescue => e
  puts "Ошибка в add_student: #{e.message}"
end

puts "\n=== Тест replace_student_by_id ==="
begin
  updated_student = Student.new(
    surname:"Куликов", 
  first_name:"Илья", 
  patronymic:"Иванович",
  birthdate: '2007-04-07',
  phone:"+79999999998", 
  telegram:"@ccccc",
  email:"kulikov@mail.ru", 
  git:"https://github.com/git3"
  )
  students_list.replace_student_by_id(added_student.id, updated_student)  # Используем актуальный ID
  puts "Студент с ID #{added_student.id} обновлён"
rescue => e
  puts "Ошибка в replace_student_by_id: #{e.message}"
end


