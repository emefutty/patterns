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

