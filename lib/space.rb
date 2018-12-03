class Space
	attr_reader :id, :user_id, :property_name, :price_in_pence, :property_description

	def initialize(id, user_id property_name, price_in_pence, property_description)
		@id = id
		@user_id = user_id
		@property_name = property_name
		@price_in_pence = price_in_pence
		@property_description = property_description
	end

end
