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




# json_strategy = JSONStrategy.new
# yaml_strategy = YAMLStrategy.new

# students_list = StudentsList.new(filepath: './data/students.json', strategy: json_strategy)
# students_list.read

# yaml_strategy.write('./data/students.yaml', students_list.students)


# прочитать из json в yaml
# filepath1 = 'data/students.json'
# strategy1 = JSONStrategy.new

# students_list = StudentsList.new(filepath: filepath1, strategy: strategy1)
# students_list.read

# filepath2 = 'data/students.yaml'
# strategy2 = YAMLStrategy.new

# students_list_yaml = StudentsList.new(filepath: filepath2, strategy: strategy2)
# students_list_yaml.students = students_list.students
# students_list_yaml.write

# puts "Студенты записаны в YAML: #{filepath2}"


# input_file_path = 'data/students.json'
# output_file_path = 'data/students.yaml'


# list = StudentsList.new(JSONStrategy.new)
# list.read(input_file_path)


# list.strategy = YAMLStrategy.new
# list.write(output_file_path)


filepath1 = './student_list/students_list_json'
strategy1 = JSONStrategy.new

students_list = StudentsList.new(filepath: filepath1, strategy: strategy1)
students_list.read
filepath2 = './student_list/students_list_yaml'
strategy2 = YAMLStrategy.new

students_list_yaml = StudentsList.new(filepath2, strategy2)
students_list_yaml.send(:students=, students_list.get_students)
students_list_yaml.save_students

puts "Студенты записаны в YAML: #{filepath2}"