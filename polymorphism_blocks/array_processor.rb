class ArrayProcessor
  attr_reader :arr

  def initialize(arr)
    @arr = arr.freeze
  end

  def filter
    result = []
    @arr.each { |element| result << element if yield(element) }
    result
  end

  def member?(value)
    @arr.each { |element| return true if element == value }
    false
  end

  def sum
    total = 0
    @arr.each { |element| total += element }
    total
  end

  def reduce(initial = nil)
    result = initial.nil? ? @arr.first : initial
    start_index = initial.nil? ? 1 : 0
    @arr[start_index..-1].each { |element| result = yield(result, element) }
    result
  end

  def include?(value)
    @arr.each { |element| return true if element == value }
    false
  end

  def chunk
    result = []
    current_chunk = []
    current_key = nil

    @arr.each do |element|
      key = yield(element)

      if current_chunk.empty? || key == current_key
        current_chunk << element
      else
        result << [current_key, current_chunk]
        current_chunk = [element]
      end

      current_key = key
    end
    result << [current_key, current_chunk] unless current_chunk.empty?
    result
    end


end
