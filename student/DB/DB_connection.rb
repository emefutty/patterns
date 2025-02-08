require 'pg'

class StudentsDBConection

  DEFAULT = {
    dbname: 'studentsDB',
    user: 'postgres',
    password: '123', 
    host: 'localhost',
    port: 5432
  }.freeze

  @instance = nil
  private_class_method :new
  private attr_reader :connection

  def self.instance
    @instance ||= new
  end

  def initialize
    @connection = PG.connect(DEFAULT)
  end

  def execute_query(query, params = [])
    connection.exec_params(query, params)
  end
  
  def close
    connection.close
  end
end