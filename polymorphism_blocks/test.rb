require 'minitest/autorun'
require './array_processor.rb'

class TestArrayProcessor < Minitest::Test
  
  def test_filter
    array = ArrayProcessor.new([1, 2, 3, 4, 5])
    assert_equal([2, 4], array.filter { |num| num.even? })

    array = ArrayProcessor.new(%w[apple banana apricot])
    assert_equal(['apple', 'apricot'], array.filter { |str| str.start_with?('a') })

    array = ArrayProcessor.new([])
    assert_equal([], array.filter { |num| num > 0 })
  end

  def test_member
    array = ArrayProcessor.new([1, 2, 3, 4, 5])
    assert(array.member?(3))
    refute(array.member?(6))

    array = ArrayProcessor.new(%w[red blue green])
    assert(array.member?('blue'))
    refute(array.member?('yellow'))
  end

  def test_sum
    array = ArrayProcessor.new([1, 2, 3, 4, 5])
    assert_equal(15, array.sum)

    array = ArrayProcessor.new([10, -10, 20, -20])
    assert_equal(0, array.sum)

    array = ArrayProcessor.new([])
    assert_equal(0, array.sum)
  end

  def test_reduce
    array = ArrayProcessor.new([1, 2, 3, 4, 5])
    assert_equal(15, array.reduce(0) { |sum, num| sum + num })
    assert_equal(120, array.reduce(1) { |product, num| product * num })

    array = ArrayProcessor.new(%w[ruby python java])
    assert_equal('rubypythonjava', array.reduce('') { |acc, str| acc + str })
  end

  def test_include
  array = ArrayProcessor.new([1, 2, 3, 4, 5])

  assert(array.include?(3))  
  refute(array.include?(6))  

  array = ArrayProcessor.new(%w[apple banana cherry])
  assert(array.include?('banana')) 
  refute(array.include?('grape'))  
end


  def test_chunk
    array = ArrayProcessor.new([1, 2, 2, 3, 3, 3, 4, 4, 5])
    expected = [[false, [1]], [true, [2, 2]], [false, [3, 3, 3]], [true, [4, 4]], [false, [5]]]
    assert_equal(expected, array.chunk { |num| num.even? })

    array = ArrayProcessor.new(["red", "blue", "blue", "red", "green"])
    expected = [["r", ["red"]], ["b", ["blue", "blue"]], ["r", ["red"]], ["g", ["green"]]]
    assert_equal(expected, array.chunk { |word| word[0] })

    array = ArrayProcessor.new([])
    assert_equal([], array.chunk { |num| num > 0 })
  end
end
