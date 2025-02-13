require_relative './DB_connection'

puts "Тест работы паттерна Одиночка"

begin
  # Получаем два экземпляра класса DBConnection
  db1 = StudentsDBConection.instance
  db2 = StudentsDBConection.instance

  # Проверяем, что оба объекта одинаковы
  if db1.equal?(db2)
    puts "Паттерн Одиночка работает: оба объекта одинаковы"
  else
    puts "Ошибка: объекты разные"
  end

rescue => e
  puts "Ошибка: #{e.message}"
end