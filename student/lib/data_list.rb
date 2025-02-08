class DataList
  
  private attr_reader :data, :column_names
  private attr_accessor :selected

  def initialize(data, column_names = [])
    self.data = data
    @column_names = column_names
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

  def get_objects  
    @data
  end

   def get_data
      index = 0
      data = []
      selected = self.get_selected
      selected.each do |index|
        obj = @data[index]
        row = get_objects_array(index, obj)
        data.append(row)
      end
      DataTable.new(data)
    end

    def data=(data)
      raise ArgumentError, "Объект должен являться массивом" unless data.is_a?(Array)
      @data = data
    end

    private

    def get_names
      raise NotImplementedError, 'Метод реализован в наследнике.'
    end

    def get_objects_array(index, element)
      raise NotImplementedError, 'Метод реализован в наследнике.'
    end

end