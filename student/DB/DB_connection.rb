require 'pg'

class StudentsDBConection

  @instance = nil
  private_class_method :new
  private attr_reader :connection

  def self.instance(db_config)
    @instance ||= new(db_config)
  end

  def initialize(db_config)
    @connection = PG.connect(db_config)
  end

  def execute_query(query, params = [])
    connection.exec_params(query, params)
  end
  
  def close
    connection.close
  end
end