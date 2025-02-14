class DataList  
  attr_reader :data, :column_names
  attr_accessor :selected

  def initialize(elements)
    @data = elements
    @selected = []
  end

  def select(number)
    element = @data[number]
    if element && !@selected.include?(element.id)
      @selected << number
    end
  end

  def get_selected
    @selected
  end

  def get_names
    @column_names
  end

  def get_data
    data = []
    selected.each do |index|
      obj = @data[index]
      row = build_row(obj)
      data << row
    end
    DataTable.new(data)
  end

  def data=(data)
    @data = data
  end

  private

  def column_names
    raise NotImplementedError, 'Метод реализован в наследнике.'
  end

  def build_row(student_short)
    raise NotImplementedError, 'Метод реализован в наследнике.'
  end

end