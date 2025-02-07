require 'pg'

class StudentsDBConection

  def self.connection
    @connection ||= PG.connect(
      dbname: 'studentsDB',
      user: 'postgres',
      password: '123', 
      host: 'localhost',
      port: 5432
    )
  end
end