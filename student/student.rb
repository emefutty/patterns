class Student
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
#Написание геттеров
  	def id
  		@id
  	end
  	def surname
  		@surname
  	end
  	def first_name
  		@first_name
	end
	def second_name
  		@second_name
	end
	def phone
		@phone
	end
	def telegram
  		@telegram
	end
	def mail
  		@mail
	end
	def git
  		@git
  	end
#Написание сеттеров
  	def id=(set_id)
  		@id = set_id
  	end
  	def surname=(set_surname)
  		@surname = set_surname
  	end
  	def first_name=(set_first_name)
  		@first_name = set_first_name
  	end
  	def second_name=(set_second_name)
		@second_name = set_second_name
	end
	def phone=(set_phone)
  		@phone = set_phone
	end
	def telegram=(set_telegram)
	  	@telegram = set_telegram
	end
	def mail=(set_mail)
	  	@mail = set_mail
	end
	def git=(set_git)
		@git = set_git
	end

	def to_s
		"ID: #{@id}, ФИО: #{@surname} #{@first_name} #{@second_name},  Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@mail}, GitHub: #{@git}"
	end

end