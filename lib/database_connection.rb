require 'pg'

#wrapper for the method PG.connect by using class method set up on object DatabaseConnection

class DatabaseConnection

  def self.setup(dbname) 
    @connection = PG.connect(dbname: dbname)
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end

end