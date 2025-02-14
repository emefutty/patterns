require_relative '../DB/students_list_DB'
require_relative '../lib/data_list_student_short'

class StudentListController
  attr_reader :data_list, :students_list
  attr_accessor :view

  def initialize(view, db_config)
    @view = view
    begin
      @students_list = StudentsListDB.new(db_config)
    rescue => e
      raise "Ошибка при подключении к базе данных: #{e.message}"
    end

    @data_list = DataListStudentShort.new([])
    @data_list.add_observer(@view)
  end

  def refresh_data
    students = @students_list.get_k_n_student_short_list(@view.current_page, @view.items_per_page)
    @data_list.data = students.data
    @data_list.count = @students_list.get_students_count
    @data_list.notify
  end

  def change_page(page)
    begin
      total_items = @students_list.get_students_count
      total_pages = (total_items.to_f / @view.items_per_page).ceil

      new_page = @view.current_page + page
      return if new_page < 1 || new_page > total_pages

      @view.current_page = new_page
      refresh_data
    rescue => e
      raise "Ошибка при изменении страницы: #{e.message}"
    end
  end
end
