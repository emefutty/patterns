require_relative 'person'

class StudentShort < Person
  attr_reader :surname_initials, :contact
  
  def initialize(surname_initials, id:nil, git:nil, contact:nil)
    @surname_initials = surname_initials
    @contact = contact
    super(id: id, git: git)
  end

  def self.from_student(student)
    new(student.surname_initials, id: student.id, git: student.git, contact: student.contact)
  end
  
  def self.from_string(id, input)
    info = input.split(", ")
    surname_initials = info[0]
    git = info[1] 
    contact = info[2]
    new(surname_initials, id: id, git: git, contact: contact)
  end


  # Метод to_s для строкового представления объекта
  def to_s
    "ID: #{@id}, Фамилия И.О.: #{@surname_initials}, Git: #{@git}, Контакт: #{@contact}"
  end

  private_class_method :new
  private :id=, :git=

end