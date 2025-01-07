class CoffeePreparation
  # Метод, который представляет структуру алгоритма
  def prepare_coffee
    boil_water
    brew_coffee_grounds
    pour_in_cup
    add_condiments
  end

  # Шаг 1: Довести воду до кипения
  def boil_water
    puts "Кипятим воду"
  end

  # Шаг 2: Заварить кофе
  def brew_coffee_grounds
    raise NotImplementedError, "Этот метод должен быть переопределен в подклассе"
  end

  # Шаг 3: Разлить кофе по чашкам
  def pour_in_cup
    puts "Разливаем кофе по чашкам"
  end

  # Шаг 4: Добавить приправы (опционально)
  def add_condiments
    raise NotImplementedError, "Этот метод должен быть переопределен в подклассе"
  end
end

# Конкретный класс для приготовления кофе без добавок
class CoffeeWithHook < CoffeePreparation
  def brew_coffee_grounds
    puts "Завариваем кофе"
  end

  def add_condiments
    puts "Не добавляем приправы"
  end
end

# Конкретный класс для приготовления кофе с добавками
class CoffeeWithMilk < CoffeePreparation
  def brew_coffee_grounds
    puts "Завариваем кофе"
  end

  def add_condiments
    puts "Добавляем молоко в кофе"
  end
end

# Использование шаблонного метода
def client_code
  puts "Приготовление обычного кофе:"
  coffee = CoffeeWithHook.new
  coffee.prepare_coffee

  puts "\nПриготовление кофе с молоком:"
  coffee_with_milk = CoffeeWithMilk.new
  coffee_with_milk.prepare_coffee
end

client_code
