class Space
	attr_reader :id, :user_id, :property_name, :price_in_pence, :property_description

	def initialize(id, user_id, property_name, price_in_pence, property_description)
		@id = id
		@user_id = user_id
		@property_name = property_name
		@price_in_pence = price_in_pence
		@property_description = property_description
	end

	def self.create(user_id, property_name, price_in_pence, property_description)
			query_result = Database_connection.sql("INSERT INTO spaces(user_id, property_name,
			price_in_pence, property_description)
			VALUES( #{user_id}, '#{property_name}', #{price_in_pence}, '#{property_description}')
			RETURNING (id, user_id, property_name,
			price_in_pence, property_description);  ")

			Space.new(query_result[0]['id'], query_result[0]['user_id'], query_result[0]['property_name'],
			query_result[0]['price_in_pence'], query_result[0]['property_description'])
	end

end
