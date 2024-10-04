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

