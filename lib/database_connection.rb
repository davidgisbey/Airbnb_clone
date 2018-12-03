require 'pg'

class Database_connection

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      @@connection = PG.connect(dbname: 'airbnb_test')
    else
      @@connection = PG.connect(dbname: 'airbnb')
    end
  end

 def self.sql(query)
   return @@connection.exec(query)
 end


end
