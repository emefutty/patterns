class Student
	attr_accessor :id, :surname, :first_name, :second_name, :phone, :telegram, :mail, :git
#Функция инициализации
	def initialize(args = {})
		#Проверка обязательных полей
    	@surname=args[:surname] or raise 'Пожалуйста, введите фамилию'
    	@first_name=args[:first_name] or raise 'Пожалуйста, введите имя'
    	@second_name=args[:second_name] or raise 'Пожалуйста, введите отчество'
    	# Инициализация необязательных полей
    	@id=args[:id] 
    	@phone=args[:phone] 
    	@telegram=args[:telegram] 
    	@mail=args[:mail] 
    	@git=args[:git] 
	end

	def to_s
		"ID: #{@id || 'Не указано'}, ФИО: #{@surname} #{@first_name} #{@second_name},  Телефон: #{@phone || 'Не указано'}, Телеграм: #{@telegram || 'Не указано'}, Почта: #{@mail || 'Не указано'}, GitHub: #{@git || 'Не указано'}"
	end

end