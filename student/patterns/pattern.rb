class CoffeePreparation
  def prepare_coffee
    boil_water
    brew_coffee_grounds
    pour_in_cup
    add_condiments
  end

  def boil_water
    puts "Кипятим воду"
  end

  def brew_coffee_grounds
    raise NotImplementedError, "Этот метод должен быть переопределен в подклассе"
  end

  def pour_in_cup
    puts "Разливаем кофе по чашкам"
  end

  def add_condiments
    raise NotImplementedError, "Этот метод должен быть переопределен в подклассе"
  end
end

class CoffeeWithHook < CoffeePreparation
  def brew_coffee_grounds
    puts "Завариваем кофе"
  end

  def add_condiments
    puts "Не добавляем приправы"
  end
end

class CoffeeWithMilk < CoffeePreparation
  def brew_coffee_grounds
    puts "Завариваем кофе"
  end

  def add_condiments
    puts "Добавляем молоко в кофе"
  end
end


  puts "Приготовление обычного кофе:"
  coffee = CoffeeWithHook.new
  coffee.prepare_coffee

  puts "\nПриготовление кофе с молоком:"
  coffee_with_milk = CoffeeWithMilk.new
  coffee_with_milk.prepare_coffee


