require_relative 'user.rb'

class Space
	attr_reader :id, :user_id, :property_name, :price_in_pence, :property_description, :property_owner

	def initialize(id, user_id, property_name, price_in_pence, property_description, property_owner)
		@id = id
		@user_id = user_id
		@property_name = property_name
		@price_in_pence = price_in_pence
		@property_description = property_description
		@property_owner = property_owner
	end

	def self.create(user_id, property_name, price_in_pence, property_description)
			query_result = Database_connection.sql("INSERT INTO spaces(user_id, property_name,
			price_in_pence, property_description)
			VALUES( #{user_id}, '#{property_name}', #{price_in_pence}, '#{property_description}')
			RETURNING id, user_id, property_name,
			price_in_pence, property_description  ")

			Space.new(query_result[0]['id'].to_i, query_result[0]['user_id'].to_i, query_result[0]['property_name'],
			query_result[0]['price_in_pence'].to_i, query_result[0]['property_description'], User.find(query_result[0]['user_id'].to_i ))
	end

	def self.list
		query_result = Database_connection.sql("SELECT * FROM spaces")
		spaces = query_result.map do |space| Space.new(
			space['id'].to_i ,
			space['user_id'].to_i ,
			space['property_name'],
			space['price_in_pence'].to_i ,
			space['property_description'],
			User.find(space['user_id'].to_i)
			)
		end
	end


	def get_formatted_price
  	  "£#{'%.2f' % (@price_in_pence / 100.0)}"
 	end

end
