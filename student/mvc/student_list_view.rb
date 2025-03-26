include Fox
require_relative '../DB/students_list_DB'
require_relative '../lib/data_list_student_short'
require_relative 'student_list_controller'

class StudentListView < FXMainWindow
  attr_accessor :current_page, :items_per_page, :controller

  def initialize(app, db_config)
    super(app, "Список студентов", width: 1200, height: 750)
    @current_page = 1
    @items_per_page = 20
    @controller = StudentListController.new(self, db_config)

    create_main_layout
    create_filter_section
    create_table_section
    create_pagination_controls
    create_control_buttons

    show(PLACEMENT_SCREEN)

    @controller.refresh_data
  end

  def set_table_params(column_names, whole_entities_count)
    @table.setTableSize(0, column_names.size)
    column_names.each_with_index { |name, index| @table.setColumnText(index, name) }

    @total_pages = (whole_entities_count.to_f / @items_per_page).ceil
    @page_label.text = "Страница #{@current_page} из #{@total_pages}"
  end

  def set_table_data(data_table)
    puts "📌 View перед установкой данных: #{data_table.rows_count} студентов"

    @table.setTableSize(data_table.rows_count, data_table.columns_count)
    (0...data_table.rows_count).each do |row_index|
      (0...data_table.columns_count).each do |col_index|
        @table.setItemText(row_index, col_index, data_table.get_element(row_index, col_index).to_s)
      end
    end

    adjust_column_widths
  end

  def refresh_view
    @controller.refresh_data if @controller
  end

  def create_main_layout
    @sections = FXTabBook.new(self, opts: LAYOUT_FILL)
    FXTabItem.new(@sections, "Список студентов")
    @student_list_view = FXVerticalFrame.new(@sections, opts: LAYOUT_FILL)
  end

  def create_filter_section
    filter_frame = FXVerticalFrame.new(@student_list_view, LAYOUT_FILL_X | PACK_UNIFORM_WIDTH)

    # Поле для ФИО
    FXLabel.new(filter_frame, "ФИО")
    @fio_input = FXTextField.new(filter_frame, 25, opts: FRAME_SUNKEN | LAYOUT_FILL_X)

    # Git
    git_frame = FXHorizontalFrame.new(filter_frame, LAYOUT_FILL_X)
    FXLabel.new(git_frame, "Гит")
    @git_choice = FXComboBox.new(git_frame, 3, nil, 0, COMBOBOX_STATIC | COMBOBOX_NO_REPLACE | LAYOUT_FILL_X)
    @git_choice.appendItem("Да")
    @git_choice.appendItem("Нет")
    @git_choice.appendItem("Неважно")
    @git_choice.numVisible = 3
    @git_choice.setCurrentItem(2) # Устанавливаем "Неважно" по умолчанию
    @git_input = FXTextField.new(git_frame, 25, opts: FRAME_SUNKEN | LAYOUT_FILL_X)
    @git_input.disable

    @git_choice.connect(SEL_COMMAND) do
      if @git_choice.currentItem == 0
        @git_input.enable
      else
        @git_input.disable
        @git_input.text = ""
      end
    end

    # Контакт
    contact_frame = FXHorizontalFrame.new(filter_frame, LAYOUT_FILL_X)
    FXLabel.new(contact_frame, "Контакт")
    @contact_choice = FXComboBox.new(contact_frame, 3, nil, 0, COMBOBOX_STATIC | COMBOBOX_NO_REPLACE | LAYOUT_FILL_X)
    @contact_choice.appendItem("Да")
    @contact_choice.appendItem("Нет")
    @contact_choice.appendItem("Неважно")
    @contact_choice.numVisible = 3
    @contact_choice.setCurrentItem(2) # Устанавливаем "Неважно" по умолчанию
    @contact_input = FXTextField.new(contact_frame, 25, opts: FRAME_SUNKEN | LAYOUT_FILL_X)
    @contact_input.disable

    @contact_choice.connect(SEL_COMMAND) do
      if @contact_choice.currentItem == 0
        @contact_input.enable
      else
        @contact_input.disable
        @contact_input.text = ""
      end
    end
  end

  def create_table_section
    table_frame = FXGroupBox.new(@student_list_view, "Список студентов", opts: GROUPBOX_NORMAL | LAYOUT_FILL)
    @table = FXTable.new(table_frame, opts: LAYOUT_FILL | TABLE_COL_SIZABLE | TABLE_READONLY | TABLE_NO_COLSELECT)
    @table.setTableSize(0, 4)

    @table.connect(SEL_COMMAND) { adjust_column_widths }
  end

  def create_pagination_controls
    pagination_frame = FXHorizontalFrame.new(@student_list_view, opts: LAYOUT_FILL_X)
    @prev_button = FXButton.new(pagination_frame, "Назад", nil, nil, 0, opts: BUTTON_NORMAL)
    @page_label = FXLabel.new(pagination_frame, "Страница #{@current_page} из 1", opts: LAYOUT_CENTER_X)
    @next_button = FXButton.new(pagination_frame, "Вперед", nil, nil, 0, opts: BUTTON_NORMAL)

    @prev_button.connect(SEL_COMMAND) { change_page(-1) }
    @next_button.connect(SEL_COMMAND) { change_page(1) }
  end

  def create_control_buttons
    control_frame = FXHorizontalFrame.new(@student_list_view, opts: LAYOUT_FILL_X)

    @add_button = FXButton.new(control_frame, "Добавить", opts: BUTTON_NORMAL)
    @edit_button = FXButton.new(control_frame, "Изменить", opts: BUTTON_NORMAL)
    @delete_button = FXButton.new(control_frame, "Удалить", opts: BUTTON_NORMAL)
    @update_button = FXButton.new(control_frame, "Обновить", opts: BUTTON_NORMAL)
    
    @update_button.connect(SEL_COMMAND) { refresh_view }

    @table.connect(SEL_SELECTED) do
      selected_rows = (@table.selStartRow..@table.selEndRow).to_a
      selected_count = selected_rows.count { |row| @table.rowSelected?(row) }
      @edit_button.enabled = selected_count == 1
      @delete_button.enabled = selected_count >= 1
    end

    @table.connect(SEL_DESELECTED) do
      @edit_button.enabled = false
      @delete_button.enabled = false
    end
  end

  def change_page(page)
    @controller.change_page(page)
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
end
