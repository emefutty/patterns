require_relative 'person'
require_relative 'student'
require_relative 'student_short'
require_relative 'student_tree'

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

tree = StudentTree.new
tree.insert(student1)
tree.insert(student2)
tree.insert(student3)

puts "\nДаты рождения студентов по возрастанию:"
tree.each { |student| puts student }