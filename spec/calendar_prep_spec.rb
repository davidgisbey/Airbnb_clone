require "calendar_prep"
describe Calendar_prep do
  adate1 = Date.parse('02-01-2018')
  adate2 = Date.parse('03-01-2018')
  adate3 = Date.parse('04-01-2018')
  adate4 = Date.parse('06-01-2018')
  adate5 = Date.parse('07-01-2018')
  adate6 = Date.parse('08-01-2018')
  udate7 = Date.parse('05-01-2018')
  string = '2018-01-02, 2018-01-03, 2018-01-05'
  let(:availability) { double :availability, space_id: 1, dates: [adate1, adate2, adate3, adate4, adate5, adate6] }
  let(:booking) { double :booking, id: 1, space_id: 1, user_id: 1, dates: [adate1, adate2] }

  it "returns a string separated by commas of unavailable dates" do
    allow(availability).to receive(:unavailable_days) { [udate7]}
    array_of_bookings = [booking]
    expect(Calendar_prep.unavailable_dates(array_of_bookings, availability)).to eq string
  end

end
