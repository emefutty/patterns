require './data_list.rb'
require './data_table.rb'
class DataListStudentShort < DataList
  def get_names
    ["№", "Фамилия И.О.", "git", "Контакт"]
  end
  def get_data
    raise ArgumentError, "Данные отсутствуют" unless data.empty?
    data.map.with_index(1) do |object, index|
      [index, object.surname_initials, object.git, object.contact]
    end
  end
end
