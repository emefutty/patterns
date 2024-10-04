# Метод для поиска минимального элемента массива
def find_min(array)
  min = array[0]
  for i in 1...array.length
    if array[i] < min
      min = array[i]
    end
  end
  return min
end

# Метод для поиска максимального элемента массива
def find_max(array)
  max = array[0]
  for i in 1...array.length
    if array[i] > max
      max = array[i]
    end
  end
  return max
end

# Метод для поиска номера первого положительного элемента
def find_first_positive(array)
  for i in 0...array.length
    if array[i] > 0
      return i
    end
  end
  nil # Если положительных элементов нет
end

# Получаем аргументы программы
method = ARGV[0]
filename = ARGV[1]

if File.exist?(filename)
  # Читаем массив из файла
  file_content = File.read(filename)
  array = file_content.split.map(&:to_i)
else
  puts "Файл не найден: #{filename}" 
  exit                             
end  

  # Выполняем выбранную операцию
  case method
  when "min"
    puts "Минимальный элемент: #{find_min(array)}"
  when "max"
    puts "Максимальный элемент: #{find_max(array)}"
  when "first_positive"
    puts "Номер первого положительного элемента: #{find_first_positive(array)}"
  else
    puts "Неверная операция!"
  end