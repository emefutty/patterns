require_relative 'data_list'
require_relative 'data_table'

class DataListStudentShort < DataList

  private

  def column_names
    ["№", "Фамилия И.О.", "git", "Контакт"]
  end

  def build_row(student_short)
    [index + @offset, student_short.initials, student_short.git, student_short.contact]
  end
end
  