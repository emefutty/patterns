require_relative 'strategy'

class YAMLStrategy < Strategy
	def read(filepath)
	    return [] unless File.exist?(filepath)

	    file = File.read(filepath)
	    data = YAML.safe_load(file, symbolize_names: true, permitted_classes: [Symbol, Date])

	    data.map { |student_data| Student.new(**student_data) }
	end

	def write(filepath, data)
		serialized_data = data.map do |student|
            {
                id: student.id,
                surname: student.surname,
                first_name: student.first_name,
                patronymic: student.patronymic,
                git: student.git,
                birthdate: student.birthdate,
                phone: student.phone,
                email: student.email,
                telegram: student.telegram
            }
        end

    	File.open(filepath, 'w') do |file|
            file.write(YAML.dump(serialized_data))
        end
	end
end