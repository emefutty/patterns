name = ARGV[0] # Принимаю имя пользователя как аргумент программы 

puts "Привет, #{name}!" 

puts "Какой ваш любимый язык программирования?"
language = STDIN.gets.chomp 

case language
when "ruby"
 puts "Подлиза!"
when "python"
 puts "Я тоже люблю этот язык, но Ruby лучше!"
when "javascript"
 puts "Интересный выбор, но Ruby лучше!"
else
 puts "Скоро будет Ruby!"
end

puts "Введите команду Ruby:"
eval(STDIN.gets.chomp)

puts "Введите команду ОС:"
system(STDIN.gets.chomp)