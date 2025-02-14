require 'fox16'
include Fox

require_relative 'student_list_view'
require_relative 'student_list_controller'
require_relative '../lib/data_list_student_short'
require_relative '../DB/students_list_DB'

begin
  db_config = {
    dbname: 'studentsDB',
    user: 'postgres',
    password: '123', 
    host: 'localhost',
    port: 5432
  }
  app = FXApp.new
  view = StudentListView.new(app, db_config)
  app.create
  app.run
rescue ArgumentError => e
  puts e.message
end