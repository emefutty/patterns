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

puts "Введите число:"
number = gets.to_i 
puts "Произведение цифр числа #{number}, не делящихся на 5: #{product_of_digits_not_divisible_by_five(number)}"
puts "Максимальный простой делитель числа #{number}: #{max_prime_divisor(number)}"