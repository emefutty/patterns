require 'fox16'
require_relative '../DB/students_list_DB'
require_relative '../lib/data_list_student_short'
require_relative '../controllers/student_list_controller'
require_relative '../controllers/student_list_controller'

include Fox

class StudentListView < FXMainWindow
  attr_reader :items_per_page, :page_label, :table
  attr_accessor :current_page

  def initialize(app, db_config)
    super(app, "Список студентов", width: 1200, height: 750)
    @controller = StudentListController.new(self, db_config)

    @current_page = 1
    @items_per_page = 20

    tab_book = FXTabBook.new(self, nil, 0, LAYOUT_FILL)
    tab1 = FXTabItem.new(tab_book, "Список студентов")
    tab1_frame = FXVerticalFrame.new(tab_book, LAYOUT_FILL)

    # Фильтры
    filter_frame = FXVerticalFrame.new(tab1_frame, LAYOUT_FILL_X | PACK_UNIFORM_WIDTH)
    FXLabel.new(filter_frame, "ФИО")
    @fio_input = FXTextField.new(filter_frame, 25, opts: FRAME_SUNKEN | LAYOUT_FILL_X)

    FXLabel.new(filter_frame, "Гит")
    git_frame = FXHorizontalFrame.new(filter_frame, LAYOUT_FILL_X)
    @git_choice = FXComboBox.new(git_frame, 3, nil, 0, COMBOBOX_STATIC | COMBOBOX_NO_REPLACE | LAYOUT_FILL_X)
    @git_choice.appendItem("Да")
    @git_choice.appendItem("Нет")
    @git_choice.appendItem("Не важно")
    @git_choice.numVisible = 3
    @git_search_input = FXTextField.new(git_frame, 25, opts: FRAME_SUNKEN | LAYOUT_FILL_X)
    @git_search_input.disable

    @git_choice.connect(SEL_COMMAND) do
      if @git_choice.currentItem == 0
        @git_search_input.enable
      else
        @git_search_input.disable
        @git_search_input.text = ""
      end
    end

    FXLabel.new(filter_frame, "Контакт")
    contact_frame = FXHorizontalFrame.new(filter_frame, LAYOUT_FILL_X)
    @contact_choice = FXComboBox.new(contact_frame, 3, nil, 0, COMBOBOX_STATIC | COMBOBOX_NO_REPLACE | LAYOUT_FILL_X)
    @contact_choice.appendItem("Да")
    @contact_choice.appendItem("Нет")
    @contact_choice.appendItem("Не важно")
    @contact_choice.numVisible = 3
    @contact_search_input = FXTextField.new(contact_frame, 25, opts: FRAME_SUNKEN | LAYOUT_FILL_X)
    @contact_search_input.disable

    @contact_choice.connect(SEL_COMMAND) do
      if @contact_choice.currentItem == 0
        @contact_search_input.enable
      else
        @contact_search_input.disable
        @contact_search_input.text = ""
      end
    end

    # Таблица
    table_frame = FXHorizontalFrame.new(tab1_frame, LAYOUT_FILL)
    @table = FXTable.new(table_frame, nil, 0, TABLE_COL_SIZABLE | LAYOUT_FILL | TABLE_READONLY | TABLE_NO_COLSELECT)

    # Автоматическая подстройка ширины колонок
    @table.connect(SEL_COMMAND) do
      adjust_column_widths
    end

    # Панель страниц
    pagination_frame = FXHorizontalFrame.new(tab1_frame, LAYOUT_FILL_X | PACK_UNIFORM_WIDTH)
    prev_button = FXButton.new(pagination_frame, "Предыдущая")
    @page_label = FXLabel.new(pagination_frame, "Страница: 1/1", nil, JUSTIFY_CENTER_X)
    next_button = FXButton.new(pagination_frame, "Следующая")
    prev_button.connect(SEL_COMMAND) { change_page(-1) }
    next_button.connect(SEL_COMMAND) { change_page(1) }

    # Кнопки управления
    control_frame = FXHorizontalFrame.new(tab1_frame, LAYOUT_FILL_X | PACK_UNIFORM_WIDTH)
    add_button = FXButton.new(control_frame, "Добавить")
    edit_button = FXButton.new(control_frame, "Изменить")
    delete_button = FXButton.new(control_frame, "Удалить")
    update_button = FXButton.new(control_frame, "Обновить")
    edit_button.enabled = false
    delete_button.enabled = false
    update_button.connect(SEL_COMMAND) do
      @controller.refresh_data
    end

    @table.connect(SEL_SELECTED) do
      selected_rows = (@table.selStartRow..@table.selEndRow).to_a
      selected_count = selected_rows.count { |row| @table.rowSelected?(row) }
      edit_button.enabled = selected_count == 1
      delete_button.enabled = selected_count >= 1
    end

    @table.connect(SEL_DESELECTED) do
      edit_button.enabled = false
      delete_button.enabled = false
    end

    # Закрытие приложения
    quit_button = FXButton.new(self, "Закрыть окно", nil, nil, 0, FRAME_RAISED | LAYOUT_FILL_X)
    quit_button.connect(SEL_COMMAND) { getApp().exit }

    @controller.refresh_data
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end

  def adjust_column_widths
    (0...@table.numColumns).each do |col|
      max_width = 50
      (0...@table.numRows).each do |row|
        cell_text = @table.getItemText(row, col)
        text_width = cell_text.length * 7
        max_width = [max_width, text_width].max
      end
      @table.setColumnWidth(col, max_width)
    end
  end

  def set_table_params(column_names, whole_entities_count)
    @table.setTableSize(0, column_names.size)
    column_names.each_with_index { |name, index| @table.setColumnText(index, name) }
    total_pages = (whole_entities_count.to_f / @items_per_page).ceil
    update_pagination(@current_page, total_pages)
  end

  def set_table_data(data_table)
    @table.setTableSize(data_table.rows_count, data_table.columns_count)
    (0...data_table.rows_count).each do |row_index|
      (0...data_table.columns_count).each do |col_index|
        @table.setItemText(row_index, col_index, data_table.get_element(row_index, col_index).to_s)
      end
    end
    adjust_column_widths
  end

  private

  def update_pagination(current_page, total_pages)
    @controller.update_pagination(current_page, total_pages)
  end

  def change_page(page)
    @controller.change_page(page)
  end
end
