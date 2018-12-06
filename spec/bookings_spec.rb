require 'bookings'

describe Bookings do

  it "self.create makes a booking between two dates" do
    booking = Bookings.create(1, 2, "2018-07-07", "2018-08-08")
    expect(booking[0]["space_id"].to_i).to eq(1)
  end

  it "self.retrieve returns a booking object" do
    expect(Bookings.retrieve(1).user_id).to eq(3)
  end
  it "self.bookings_for_space_id returns all bookings for a space id" do
    bookings = Bookings.bookings_for_space_id(2)
    expect(bookings.length).to eq 3
    expect(bookings[0].id).to eq(2)
    expect(bookings[1].id).to eq(3)
  end
end
