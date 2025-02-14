require 'fox16'
include Fox

require_relative 'student_list_view'
require_relative 'student_list_controller'

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