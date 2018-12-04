require 'space'

describe(Space) do

	let(:space) { Space.new(2, 'Buckingham Palace', 245, 'Nice and comfy') }

	describe('properties tests') do
		it('should store space id') do
			expect(space.id).to equal(2)
		end

		it('should store space property_name') do
			expect(space.property_name).to eql('Buckingham Palace')
		end

		it('should store space price_in_pence') do
			expect(space.price_in_pence).to equal(245)
		end

		it('should store space property_description') do
			expect(space.property_description).to eql('Nice and comfy')
		end
	end

	  it('.list method returns all space objects') do
			
	  end

end
