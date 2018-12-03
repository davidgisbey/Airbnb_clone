require 'pg'

class Database_connection

 def self.sql(query)
   if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'airbnb_test')
   else
     connection = PG.connect(dbname: 'airbnb')
   end
   return connection.exec(query)
 end
 

end
