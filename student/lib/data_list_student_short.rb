require_relative 'data_list'
require_relative 'data_table'

class DataListStudentShort < DataList

  def get_names
    ["№", "Фамилия И.О.", "git", "Контакт"]
  end

  def get_objects_array(index, student_short)
    [index, student_short.initials, student_short.git, student_short.contact]
  end
end
