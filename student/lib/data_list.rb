class DataList  
  attr_reader :data, :column_names, :selected

  def initialize(data)
    self.data = data
    @selected = []
  end

  def select(number)
    raise ArgumentError, "Элемент по указанному номеру не существует" if @data[number].nil?
    selected << number unless @selected.include?(number)
    @data[number]
  end

  def get_selected
    @selected
  end

  def get_names
    @column_names
  end

  def get_data
    data = []
    self.selected.each do |index|
      obj = @data[index]
      row = build_row(obj)
      data.append(row)
    end
    DataTable.new(data)
  end

  def data=(data)
    raise ArgumentError, "Объект должен являться массивом" unless data.is_a?(Array)
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