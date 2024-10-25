class Student
	attr_reader :id, :surname, :first_name, :second_name, :phone, :telegram, :mail, :git

	def initialize(args = {id:, surname:, first_name:, second_name:, phone:, telegram:, mail:, git: })
    	@surname=args[:surname] 
    	@first_name=args[:first_name] 
    	@second_name=args[:second_name] 
    	@id=args[:id] 
    	self.phone = args[:phone] 
    	@telegram=args[:telegram] 
    	@mail=args[:mail] 
    	@git=args[:git] 
	end

	def self.validate_phone?(phone) 
    	phone =~ /\A\+?\d{10,}\z/
  	end

  	def phone=(phone)
  		raise "Пожалуйста, введите корректный номер телефона" if !Student.validate_phone?(phone)
  		@phone=phone
  	end

	def to_s
		"ID: #{@id}, ФИО: #{@surname} #{@first_name} #{@second_name},  Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@mail}, GitHub: #{@git}"
	end

end