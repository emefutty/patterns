#1.Найти максимальный простой делитель числа.
#Проверяем, является ли заданное число простым
def is_prime?(number)
  return false if number <= 1
  (2..Math.sqrt(number)).each do |i|
    return false if number % i == 0
  end
  true
end

#Находим максимальный простой делитель заданного числа
def max_prime_divisor(number)
  max_prime = 1
  (2..number).each do |i|
    if number % i == 0 && is_prime?(i)
      max_prime = i
    end
  end
  max_prime
end

#2.Найти произведение цифр числа, не делящихся на 5.

def product_of_digits_not_divisible_by_five(number)
  product = 1
  #Пока число существует выполняем алгоритм подсчета
  while(number != 0) do
    last_digit = number % 10 #Выбираем последнюю цифру
    if(last_digit % 5 != 0) #Проверяем делится лм число на 5
      product *= last_digit #Если нет, умножаем на произведение
    end
    number /= 10 #Избавляемся от последней цифры числа
  end
  return product
end


#3.Найти НОД максимального нечетного непростого делителя числа и прозведения цифр данного числа.

# Функция для вычисления НОД
def gcd(number1, number2)
  while number2 != 0
    number1, number2 = number2, number1 % number2
  end
  number1
end

# Функция для нахождения максимального нечетного непростого делителя
def max_odd_nonprime_divisor(number)
  max_divisor = 1
  (2..number).each do |i|
    # Проверяем, является ли i делителем и нечетным непростым
    if number % i == 0 && i % 2 != 0 && !is_prime?(i)
      if i > max_divisor
        max_divisor = i 
      end
    end
  end
  max_divisor
end

# Функция для вычисления произведения цифр числа
def product_of_digits(number)
  product = 1
  #Пока число существует выполняем алгоритм подсчета
  while(number != 0) do
    last_digit = number % 10 #Выбираем последнюю цифру
    product *= last_digit #умножаем на произведение
    number /= 10 #Избавляемся от последней цифры числа
  end
  return product
end

# Основная функция, которая находит НОД
def gcd_of_max_odd_nonprime_and_product(number)
  max_divisor = max_odd_nonprime_divisor(number)
  product = product_of_digits(number)
  
  # Вычисляем НОД максимального нечетного непростого делителя и произведения цифр
  gcd_value = gcd(max_divisor, product)
  
  return gcd_value
end


puts "Введите число:"
number = gets.to_i 
puts "НОД максимального нечетного непростого делителя числа #{number} и произведения цифр данного числа: #{gcd_of_max_odd_nonprime_and_product(number)}"
puts "Произведение цифр числа #{number}, не делящихся на 5: #{product_of_digits_not_divisible_by_five(number)}"
puts "Максимальный простой делитель числа #{number}: #{max_prime_divisor(number)}"