require_relative 'data_list'
require_relative 'data_table'

class DataListStudentShort < DataList
  attr_accessor :count
    
  def initialize(elements)
      super(elements)
      @observers = []
  end

  def add_observer(observer)
      @observers << observer
  end

  def remove_observer(observer)
      @observers.delete(observer)
  end
  
  def notify
      @observers.each do |observer|
        observer.set_table_params(column_names, @count)
        observer.set_table_data(get_data)
      end
  end

   def get_student_short_count
      puts "📌 Вызван get_student_short_count, возвращаем: #{@data.size}"
      @data.size
    end

  private

  def column_names
    ["№", "Фамилия И.О.", "git", "Контакт"]
  end

  def build_row(student_short)
    [student_short.id, student_short.surname_initials, student_short.git, student_short.contact]
  end
end
  