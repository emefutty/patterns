require_relative 'person'
require 'date'

class Student < Person
	
	include Comparable
	attr_reader :surname, :first_name, :patronymic, :birthdate, :phone, :telegram, :email

	def initialize(surname:, first_name:, patronymic:, birthdate:nil, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
	    self.surname = surname
	    self.first_name = first_name
	    self.patronymic = patronymic
	    self.birthdate = birthdate
	    set_contacts(phone: phone, telegram: telegram, email: email)
	    super(id: id, git: git)
  	end

	def self.valid_phone?(phone) 
    	phone =~ /\A\+?\d{10,}\z/
  	end

  	def phone=(phone)
  		raise "Пожалуйста, введите корректный номер телефона" if !Student.valid_phone?(phone)
  		@phone=phone
  	end

  	def self.valid_name?(name)
    	name =~ /\A[А-Яа-яA-Za-z]+\z/
  	end

  	def surname=(surname)
    	raise "Фамилия должна содержать только буквы" if !Student.valid_name?(surname)
    	@surname = surname
  	end

  	def first_name=(first_name)
    	raise "Имя должно содержать только буквы" if !Student.valid_name?(first_name)
    	@first_name = first_name
  	end

  	def patronymic=(patronymic)
    	raise "Отчество должно содержать только буквы" if !Student.valid_name?(patronymic)
    	@patronymic = patronymic
  	end

  	def birthdate=(birthdate)
		if birthdate.is_a?(Date)
			@birthdate = birthdate
		elsif birthdate.is_a?(String)
			@birthdate = Date.parse(birthdate)
		else
			raise ArgumentError, "Некорректная дата рождения"
		end
	end

  	def self.valid_telegram?(telegram)
    	telegram =~ /\A@[a-zA-Z0-9_]{5,}\z/
  	end

  	def telegram=(telegram)
    	raise "Некорректное имя пользователя в Telegram" if !Student.valid_telegram?(telegram)
    	@telegram = telegram
  	end

  	def self.valid_email?(email)
    	email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	end

  	def email=(email)
    	raise "Некорректный формат eemail" if !Student.valid_email?(email)
    	@email = email
  	end

	def set_contacts(phone: nil, email: nil, telegram: nil)
    	self.phone = phone if phone
    	self.telegram = telegram if telegram
    	self.email = email if email
  	end

  	def contact    
    	return "Телефон: #{@phone}" if @phone
    	return "Почта: #{@email}" if @email
    	return "Телеграм: #{@telegram}" if @telegram
  	end

	def surname_initials
		"#{surname} #{first_name[0]}.#{patronymic[0]}."
	end

	def get_info
		"#{surname_initials}, Git: #{git}, Связь: #{contact}"
	end

	def has_contact?
		!@telegram.nil? || !@phone.nil? || !@email.nil?
	end

	def <=>(other)
		birthdate <=> other.birthdate
	end

  	def ==(other)
    	return false unless other.is_a?(Student)
    
    	@telegram == other.telegram &&
     	@email == other.email &&
    	@phone == other.phone &&
    	@git == other.git
  	end

	def to_s
		"ID: #{@id}, ФИО: #{@surname} #{@first_name} #{@patronymic}, Дата рождения: #{birthdate}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, GitHub: #{@git}"
	end

end