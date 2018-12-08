require "calendar_prep"
describe Calendar_prep do
  adate1 = Date.parse('02-01-2018')
  adate2 = Date.parse('03-01-2018')
  adate3 = Date.parse('04-01-2018')
  adate4 = Date.parse('06-01-2018')
  adate5 = Date.parse('07-01-2018')
  adate6 = Date.parse('08-01-2018')
  udate7 = Date.parse('05-01-2018')
  unavailable_string_1 = '2018-01-02.2018-01-03.2018-01-05'
  unavailable_string_2 = '2018-01-02.2018-01-03.2018-01-04'
  let(:availability_1) { double :availability_1, space_id: 1, dates: [adate1, adate2, adate3, adate4, adate5, adate6] }
  let(:availability_2) { double :availability_2, space_id: 1, dates: [adate1, adate2, adate3] }
  let(:booking_1) { double :booking, id: 1, space_id: 1, user_id: 1, dates: [adate1, adate2] }
  let(:booking_2) { double :booking, id: 0, space_id: 0, user_id: 0, dates: [] }

  it "returns a string separated by full-stops of unavailable dates" do
    allow(availability_1).to receive(:unavailable_days) { [udate7]}
    array_of_bookings = [booking_1]
    expect(Calendar_prep.unavailable_dates(array_of_bookings, availability_1)).to eq unavailable_string_1
  end
  it "returns a string separated by full-stops of available dates to be disabled" do
    expect(Calendar_prep.available_dates_disabled(availability_2)).to eq unavailable_string_2
  end
  it "returns a string separated by full stops of available dates to be disabled when no bookings found" do
    allow(availability_2).to receive(:unavailable_days) { []}
    array_of_bookings = [booking_2]
    expect(Calendar_prep.unavailable_dates(array_of_bookings, availability_2)).to eq ""
  end

end
