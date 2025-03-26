class DataList  
  attr_reader :data
  attr_accessor :selected

  def initialize(elements)
    @column_names = column_names
    @data = elements
    @selected=[]
  end

  def select(number)
    element = @data[number]
    if element && !@selected.include?(element.id)
      @selected << number
    end
  end

  def get_selected
    @selected.dup
  end

  def get_names
    @column_names
  end

  def get_data
    result = [self.get_names]
    
    self.data.each do |obj| # ✅ Вместо `selected` проходим по всем студентам
      row = build_row(obj)
      result << row
    end

    puts "📌 Итоговое количество студентов в DataTable: #{result.size - 1}" # Отладка
    DataTable.new(result)
  end


  def data=(data)
    @data = data
    @selected = []
  end

  private

  def column_names
    raise NotImplementedError, 'Метод реализован в наследнике.'
  end

  def build_row(student_short)
    raise NotImplementedError, 'Метод реализован в наследнике.'
  end

end