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

puts "Введите число:"
number = gets.to_i 
puts "Максимальный простой делитель числа #{number}: #{max_prime_divisor(number)}"