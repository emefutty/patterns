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
     accumulator = initial
    if accumulator.nil?
        accumulator = 0
    end
    @arr.each do |element|
        accumulator = yield accumulator, element
    end
    return accumulator
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

      if key != current_key
        result << [current_key, current_chunk] unless current_chunk.empty?
        current_key = key
        current_chunk = []
      end

      current_chunk << element
    end
    result << [current_key, current_chunk] unless current_chunk.empty?
    result
    end
    
end
