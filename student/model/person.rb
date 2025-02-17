class Person
	attr_reader :id, :git

	# Конструктор для базового класса
	def initialize(id: nil, git: nil)
		self.id = id
		self.git = git
	end

	# Валидация методов
	def self.valid_git?(git)
		!!(git =~ /\Ahttps?:\/\/github\.com\/[a-zA-Z0-9_-]+\z/)
	end
	
	def self.valid_id?(id)
    	id.nil? || (id.is_a?(Integer) && id > 0)
  	end

	def git=(git)
		raise ArgumentError, "Неверный формат гита" unless Person.valid_git?(git)
		@git = git
	end
	  
	def id=(id)
		raise ArgumentError, "Неверный формат ID" unless Person.valid_id?(id)
		@id = id
	end

	def has_git?
		!@git.nil?
	end
	  
	def validate?
		has_contact? && has_git?   
	end

	def has_contact?
    	raise NotImplementedError, "Метод должен быть реализован в дочернем классе"
 	end

 	def contact    
    	raise NotImplementedError, "Метод должен быть реализован в дочернем классе"
  	end

	def surname_initials
		raise NotImplementedError, "Метод должен быть реализован в дочернем классе"
	end

end