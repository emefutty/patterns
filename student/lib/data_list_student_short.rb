require_relative 'data_list'
require_relative 'data_table'

class DataListStudentShort < DataList

  private

  def column_names
    ["№", "Фамилия И.О.", "git", "Контакт"]
  end

  def get_objects_array
    raise ArgumentError, "Данные отсутствуют" if data.empty?
    data.map.with_index(1) do |object, index|
      [index, object.surname_initials, object.git, object.contact]
    end
  end
end
