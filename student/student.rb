class Student
	attr_accessor :id, :surname, :first_name, :second_name, :phone, :telegram, :mail, :git
#Функция инициализации
	def initialize(surname:, first_name:, second_name:, id:nil,
                 phone:nil, telegram:nil, mail:nil, git:nil)
    	@surname=surname
    	@first_name=first_name
    	@second_name=second_name
    	@id=id 
    	@phone=phone 
    	@telegram=telegram 
    	@mail=mail 
    	@git=git 
	end

	def to_s
		"ID: #{@id || 'Не указано'}, ФИО: #{@surname} #{@first_name} #{@second_name},  Телефон: #{@phone || 'Не указано'}, Телеграм: #{@telegram || 'Не указано'}, Почта: #{@mail || 'Не указано'}, GitHub: #{@git || 'Не указано'}"
	end

end