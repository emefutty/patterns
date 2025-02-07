require_relative '../DB_connection' 

def fetch_students
  connection = StudentsDBConection.connection 
  result = connection.exec("SELECT * FROM studentsDB;") 
 
  result.each do |row|
    puts "ID: #{row['id']}, ФИО: #{row['surname']} #{row['first_name']} #{row['patronymic']}, Дата рождения: #{row['birthdate']}, Телефон: #{row['phone']}, Telegram: #{row['telegram']}, Email: #{row['email']}, Git: #{row['git']}"
  end
end

fetch_students