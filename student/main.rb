require_relative 'person'
require_relative 'student'
require_relative 'student_short'

student1=Student.new(       
	surname:"Иванов", 
	first_name:"Иван", 
	patronymic:"Иванович", 
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
	id: 2, 
	phone:"+79999999998", 
	telegram:"@bbbbb",
	email:"petrov@mail.ru", 
	git:"https://github.com/git2"
)

puts student1
student_short = StudentShort.from_student(student1) 
puts student_short
# aa=StudentShort.from_string(1, "Иванов И.И., https://github.com/ivanov, +79999999999")
# puts aa
