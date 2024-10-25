require_relative 'student'

student1=Student.new(       
	surname:"Иванов", 
	first_name:"Иван", 
	second_name:"Иванович", 
	id: 1,
	phone:"+79999999999", 
	telegram: "@aaaaa",
	mail:"ivanov@mail.ru", 
	git:"https://github.com/git1"
)

student2=Student.new(       
	surname:"Петров", 
	first_name:"Николай", 
	second_name:"Васильевич", 
	id:2, 
	phone:"+79999999998", 
	telegram:"@bbbb",
	mail:"petrov@mail.ru", 
	git:"https://github.com/git2"
)

puts student1
puts student2