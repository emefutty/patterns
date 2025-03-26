require_relative '../lib/data_list_student_short'
require_relative '../DB/students_list_DB'

class StudentListController
  def initialize(view, db_config)
    @view = view
    @student_list = StudentsListDB.new(db_config)
    @data_list_student_short = DataListStudentShort.new([])
    @data_list_student_short.add_observer(@view)
  end

 def refresh_data
    data_list = @student_list.get_k_n_student_short_list(@view.current_page, @view.items_per_page)

    puts "📌 Контроллер передаёт в View: #{data_list.get_student_short_count} студентов" # Отладка

    @data_list_student_short.data = data_list.data
    @data_list_student_short.selected = data_list.selected
    @data_list_student_short.count = @student_list.get_students_count 
    
    @data_list_student_short.notify
  end
  
  def update_pagination(current_page, total_pages)
    @view.page_label.text = "Страница: #{current_page}/#{total_pages}"
  end

  def change_page(page)
    total_items = @student_list.get_students_count
    total_pages = (total_items.to_f / @view.items_per_page).ceil

    new_page = @view.current_page + page
    return if new_page < 1 || new_page > total_pages

    @view.current_page = new_page
    refresh_data
  end
end