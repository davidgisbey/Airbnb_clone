require "calendar_prep"
describe Calendar_prep do
  let(:availability) { Availability.retrieve(2) }
  let(:bookings) { Bookings.bookings_for_space_id(2) }

  it "returns a string separated by commas of unavailable dates" do
    expect(Calendar_prep.unavailable_dates(bookings, availability)).to eq('2019-01-03')
  end

end
