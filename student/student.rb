class Student
	attr_reader :id, :surname, :first_name, :second_name, :phone, :telegram, :mail, :git

	def initialize(args = {id:, surname:, first_name:, second_name:, phone:, telegram:, mail:, git: })
    	self.surname=args[:surname] 
    	self.first_name=args[:first_name] 
    	self.second_name=args[:second_name] 
    	@id=args[:id] 
    	self.phone = args[:phone] 
    	self.telegram = args[:telegram]
    	self.mail = args[:mail]
    	self.git = args[:git] 
	end

	def self.validate_phone?(phone) 
    	phone =~ /\A\+?\d{10,}\z/
  	end

  	def phone=(phone)
  		raise "Пожалуйста, введите корректный номер телефона" if !Student.validate_phone?(phone)
  		@phone=phone
  	end

  	def self.validate_surname?(surname)
    	surname =~ /\A[А-Яа-яA-Za-z]+\z/
  	end

  	def surname=(surname)
    	raise "Фамилия должна содержать только буквы" if !Student.validate_surname?(surname)
    	@surname = surname
  	end

  	def self.validate_first_name?(first_name)
    	first_name =~ /\A[А-Яа-яA-Za-z]+\z/
  	end

  	def first_name=(first_name)
    	raise "Имя должно содержать только буквы" if !Student.validate_first_name?(first_name)
    	@first_name = first_name
  	end

  	def self.validate_second_name?(second_name)
    	second_name =~ /\A[А-Яа-яA-Za-z]+\z/
  	end

  	def second_name=(second_name)
    	raise "Отчество должно содержать только буквы" if !Student.validate_second_name?(second_name)
    	@second_name = second_name
  	end

  	def self.validate_telegram?(telegram)
    	telegram =~ /\A@[a-zA-Z0-9_]{5,}\z/
  	end

  	def telegram=(telegram)
    	raise "Некорректное имя пользователя в Telegram" if !Student.validate_telegram?(telegram)
    	@telegram = telegram
  	end

  	def self.validate_mail?(mail)
    	mail =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	end

  	def mail=(mail)
    	raise "Некорректный формат email" if !Student.validate_mail?(mail)
    	@mail = mail
  	end

  	def self.validate_git?(git)
    	git =~ /\Ahttps:\/\/github\.com\/[a-zA-Z0-9_-]+\z/
  	end

  	def git=(git)
    	raise "Некорректный формат GitHub URL" if !Student.validate_git?(git)
    	@git = git
  	end
  	def git_present?
  		!git.nil?
	end

	def contact_present?
		!phone.nil? || !email.nil? || !telegram.nil?
	end  

	def validate?
		git_present? && contact_present?
	end

	def to_s
		"ID: #{@id}, ФИО: #{@surname} #{@first_name} #{@second_name},  Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@mail}, GitHub: #{@git}"
	end

end