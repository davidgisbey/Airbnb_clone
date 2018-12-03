require 'space'

describe(Space) do

	let(:space) { Space.new(1) }
	
	it('should store space id') do
		space.id = 2
		expect(space.id).to equal(2)
	end

end
