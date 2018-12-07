describe Availability do
  it "Self.retrieve should return an availability instance where the given space id is free" do
    availability = Availability.retrieve(1)
    expect(availability.space_id).to eq(1)
  end
  it ".max_date should return the maximum date where the given space id is free" do
    availability = Availability.retrieve(1)
    expect(availability.max_date.to_s).to eq('2019-01-09')
  end
  it ".min_date should return the minimum date where the given space id is free" do
    availability = Availability.retrieve(1)
    expect(availability.min_date.to_s).to eq('2019-01-01')
  end
  it "updates availability for a new space" do
    availability = Availability.update('2', '2019-01-02', '2019-01-04')
    available_dates = Availability.retrieve(2)
    date1 = Date.parse('2019-01-02')
    date2 = Date.parse('2019-01-03')
    date3 = Date.parse('2019-01-04')
    expect(available_dates.dates).to eq([date1, date2, date3])
  end
  it "dates should return the dates where the availability object is available in chronological order" do
    available_dates = Availability.retrieve(1)
    date1 = Date.parse('2019-01-01')
    date2 = Date.parse('2019-01-02')
    date3 = Date.parse('2019-01-03')
    date4 = Date.parse('2019-01-04')
    date5 = Date.parse('2019-01-05')
    date6 = Date.parse('2019-01-07')
    date7 = Date.parse('2019-01-08')
    date8 = Date.parse('2019-01-09')
    expect(available_dates.dates).to eq([date1, date2, date3, date4, date5, date6, date7, date8])
  end
  it "returns the days inbetween conscecutive start/end dates" do
    available_dates = Availability.retrieve(1)
    day = Date.parse('2019-01-06')
    expect(available_dates.unavailable_days).to eq [day]
  end

end
