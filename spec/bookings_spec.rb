require 'bookings'

describe Bookings do

  it "self.create makes a booking between two dates" do
    booking = Bookings.create(1, 2, "2018-07-07", "2018-08-08")
    expect(booking[0]["space_id"].to_i).to eq(1)
  end

  it "self.retrieve returns a booking object" do
    date1 = Date.parse('2019-01-10')
    date2 = Date.parse('2019-01-11')
    date3 = Date.parse('2019-01-12')
    date4 = Date.parse('2019-01-13')
    booking = Bookings.retrieve(1)
    expect(booking.space_id).to eq(1)
    expect(booking.user_id).to eq(3)
    expect(booking.dates).to eq [date1, date2, date3, date4]
  end
  it "self.bookings_for_space_id returns all bookings for a space id" do
    bookings = Bookings.bookings_for_space_id(2)
    date1 = Date.parse('2019-11-18')
    date2 = Date.parse('2019-11-19')
    date3 = Date.parse('2019-11-20')
    date4 = Date.parse('2019-05-08')
    date5 = Date.parse('2019-05-09')
    date6 = Date.parse('2019-05-10')
    date7 = Date.parse('2019-01-03')
    date8 = Date.parse('2019-01-04')
    expect(bookings.length).to eq 3
    expect(bookings[0].id).to eq(2)
    expect(bookings[0].space_id).to eq(2)
    expect(bookings[0].user_id).to eq(5)
    expect(bookings[0].dates).to eq [date1, date2, date3]
    expect(bookings[1].id).to eq(3)
    expect(bookings[1].space_id).to eq(2)
    expect(bookings[1].user_id).to eq(5)
    expect(bookings[1].dates).to eq [date4, date5, date6]
    expect(bookings[2].id).to eq(4)
    expect(bookings[2].space_id).to eq(2)
    expect(bookings[2].user_id).to eq(5)
    expect(bookings[2].dates).to eq [date7, date8]
  end
  it "displays the range of days between start/end date" do
    dates = Bookings.list_days_in_booking('2019-01-01', '2019-01-03')
    date1 = Date.parse('2019-01-01')
    date2 = Date.parse('2019-01-02')
    date3 = Date.parse('2019-01-03')
    expect(dates).to eq [date1, date2, date3]
  end
end
