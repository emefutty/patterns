require 'pg'
require_relative './DB_connection'
require_relative '../model/student'
require_relative '../model/student_short'
require_relative '../lib/data_list'
require_relative '../lib/data_list_student_short'

class StudentsListDB
  def initialize(db_config)
    @db = StudentsDBConection.instance(db_config)
  end

  def get_student_by_id(id)
    query = 'SELECT * FROM studentsdb WHERE id = $1'
    result = @db.execute_query(query, [id])
    raise "Студент с таким ID не найден" if result.ntuples.zero?

    row = result.first.transform_keys(&:to_sym)
    row[:id] = row[:id].to_i if row[:id]
    Student.new(**row)
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    start = (k - 1) * n
    query = 'SELECT * FROM studentsdb ORDER BY id LIMIT $1 OFFSET $2'
    result = @db.execute_query(query, [n, start])
    
    students_short = result.map do |row|
      row.transform_keys!(&:to_sym)
      row[:id] = row[:id].to_i  # Приведение id к Integer
      begin
        StudentShort.from_student(Student.new(**row))
      rescue => e
        puts "❌ Ошибка при создании StudentShort: #{e.message}"
        nil
      end
    end

    data_list ||= DataListStudentShort.new(students_short)
    students_short.each_with_index { |_, index| data_list.select(index) }
    data_list
  end

  def add_student(student)
    query = 'INSERT INTO studentsdb (surname, first_name, patronymic, birthdate, phone, telegram, email, git)
             VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id'
    params = [student.surname, student.first_name, student.patronymic, student.birthdate, student.phone, student.telegram, student.email, student.git]
    result = @db.execute_query(query, params)

    student.id = result[0]['id'].to_i
    student
  end

  def replace_student_by_id(id, student)
    query = 'UPDATE studentsdb SET surname = $1, first_name = $2, patronymic = $3, birthdate = $4, phone = $5, telegram = $6, email = $7, git = $8 WHERE id = $9'
    params = [student.surname, student.first_name, student.patronymic, student.birthdate, student.phone, student.telegram, student.email, student.git, id]
    result = @db.execute_query(query, params)

    raise "Студент с ID #{id} не найден для обновления" if result.cmd_tuples.zero?
    true
  end

  def delete_student_by_id(id)
    query = 'DELETE FROM studentsdb WHERE id = $1'
    result = @db.execute_query(query, [id])
    raise "Студент с ID #{id} не найден" if result.cmd_tuples.zero?
  end

  def get_students_count
    query = 'SELECT COUNT(*) AS count FROM studentsdb'
    result = @db.execute_query(query)
    result[0]['count'].to_i
  end

end

