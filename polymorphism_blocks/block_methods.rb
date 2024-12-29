def elements_before_last_min(arr)
  min_index = arr.rindex(arr.min)
  arr[0...min_index]
end

def elements_after_first_max(arr)
  max_index = arr.index(arr.max)
  arr[(max_index + 1)..-1]
end

def alternating_signs?(arr)
  arr[1..-1].zip(arr[0..-2]).all? { |a, b| a * b < 0 }
end

def sum_in_interval(arr, a, b)
  arr.select { |num| num.between?(a, b) }.sum
end

def count_greater_than_sum_previous(arr)
  arr[1..-1].map.with_index { |num, i| num > arr[0..i].sum }.count(true)
end

def input_array
  puts "Введите массив целых чисел (через пробел):"
  gets.chomp.split.map(&:to_i)
end

def input_interval
  puts "Введите границы интервала a и b (через пробел):"
  gets.chomp.split.map(&:to_i)
end

puts "Выберите задачу (1-5):"
puts "1. Найти элементы перед последним минимальным"
puts "2. Найти элементы после первого максимального"
puts "3. Проверить, чередуются ли положительные и отрицательные числа"
puts "4. Найти сумму элементов в интервале a..b"
puts "5. Найти количество элементов, которые больше суммы всех предыдущих"

choice = gets.to_i

case choice
when 1
  arr = input_array
  puts "Элементы перед последним минимальным: #{elements_before_last_min(arr)}"
when 2
  arr = input_array
  puts "Элементы после первого максимального: #{elements_after_first_max(arr)}"
when 3
  arr = input_array
  puts "Чередуются ли положительные и отрицательные числа: #{alternating_signs?(arr)}"
when 4
  arr = input_array
  a, b = input_interval
  puts "Сумма элементов в интервале #{a}..#{b}: #{sum_in_interval(arr, a, b)}"
when 5
  arr = input_array
  puts "Количество элементов, которые больше суммы всех предыдущих: #{count_greater_than_sum_previous(arr)}"
else
  puts "Неверный выбор"
end
