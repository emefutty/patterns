require_relative './model/person'
require_relative './model/student'
require_relative './model/student_short'
require_relative 'student_tree'
require_relative './lib/data_table'
require_relative './lib/data_list'
require_relative './lib/data_list_student_short'
require_relative './student_list/students_list_json'
require_relative './student_list/students_list_yaml'
require_relative './student_list/strategy'
require_relative './student_list/students_list'
require 'json'
require 'yaml'

student1=Student.new(       
	surname:"Иванов", 
	first_name:"Иван", 
	patronymic:"Иванович", 
	birthdate: '2003-03-05',
	id: 1,
	phone:"+79999999999", 
	telegram: "@aaaaa",
	email:"ivanov@mail.ru", 
	git:"https://github.com/git1"
)

student2=Student.new(       
	surname:"Петров", 
	first_name:"Николай", 
	patronymic:"Васильевич",
	birthdate: '2005-10-05',
	id: 2, 
	phone:"+79999999998", 
	telegram:"@bbbbb",
	email:"petrov@mail.ru", 
	git:"https://github.com/git2"
)

student3=Student.new(       
	surname:"Куликов", 
	first_name:"Илья", 
	patronymic:"Иванович",
	birthdate: '2007-04-07',
	id: 3, 
	phone:"+79999999998", 
	telegram:"@ccccc",
	email:"kulikov@mail.ru", 
	git:"https://github.com/git3"
)

# puts student1
# student_short = StudentShort.from_student(student1) 
# puts student_short
# aa=StudentShort.from_string(1, "Иванов И.И., https://github.com/ivanov, +79999999999")
# puts aa

# tree = StudentTree.new
# tree.insert(student1)
# tree.insert(student2)
# tree.insert(student3)

# puts "\nДаты рождения студентов по возрастанию:"
# tree.each { |student| puts student }



# testdata = DataTable.new([[1,2,3],[4,5,6]])

# puts testdata.inspect
# puts testdata.rows_count
# puts testdata.columns_count
# puts testdata.get_element(1,2)

# list = DataList.new([10, 20, 30])
# puts list.inspect 
# list.select(1)
# list.select(2)
# puts list.get_selected 

# student_short1 = StudentShort.from_student(student1)


# data_list = DataListStudentShort.new([student_short1])

# puts "До замены данных:"
# puts data_list.get_names.join(", ")
# puts data_list.get_data.inspect

# new_student_short1 = StudentShort.from_student(student3)

# new_data_list = DataListStudentShort.new([new_student_short1])

# puts "\nПосле замены данных:"
# puts data_list.get_names.join(", ")
# puts new_data_list.get_data.inspect



# students_list = StudentsListYAML.new(filepath: './student_list/students.yaml')
# students_list.read_from_file

# if students_list.students.nil? || students_list.students.empty?
# 	puts "Ошибка: данные не загружены или файл пуст."
# else
# 	puts "Данные успешно загружены."
# end

# if students_list.students.empty?
# 	puts "Список студентов пуст."
# else
# 	puts "Все студенты:"
# 	students_list.students.each { |student| puts student.to_s }
# end

# puts "Список студентов (с 2 по 3):"
# student_short_list = students_list.get_k_n_student_short_list(2, 2)

# students = student_short_list.get_data

# for i in 0..(students.length - 1)
# 	puts students[i].to_s
# end

# puts "Количество студентов: #{students_list.get_student_short_count}"


# json_strategy = JSONStrategy.new
# yaml_strategy = YAMLStrategy.new

# students = StudentsList.new(filepath: './data/students.json', strategy: json_strategy)

# students.read
# puts "Список студентов с JSON:"

# students.students.each { |student| puts student.to_s }
# puts "Студент с id = 3: #{students.get_student_by_id(3)}"
# puts "Количество студентов: #{students.get_student_short_count}"

# students = StudentsList.new(filepath: './data/students.yaml', strategy: yaml_strategy)

# students.read
# puts "Список студентов с YAML:"

# students.students.each { |student| puts student.to_s }
# puts "Студент с id = 2: #{students.get_student_by_id(2)}"
# puts "Количество студентов: #{students.get_student_short_count}"


json_strategy = JSONStrategy.new
yaml_strategy = YAMLStrategy.new

# Читаем студентов из JSON
students_list = StudentsList.new(filepath: './data/students.json', strategy: json_strategy)
students_list.read

# Записываем студентов в YAML 
yaml_strategy.write('./data/students.yaml', students_list.students)

puts "Данные успешно сконвертированы из JSON в YAML!"
