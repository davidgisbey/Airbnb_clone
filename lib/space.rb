class Space
	attr_accessor :id, :property_name, :price_in_pence, :property_description

	def initialize(id, property_name, price_in_pence, property_description)
		@id = id
		@property_name = property_name
		@price_in_pence = price_in_pence
		@property_description = property_description
	end

end
