# insert into availability (space_id, start_date, end_date)
# values( 1, '2019-01-01', '2019-02-28'),
#      ( 1, '2019-03-14', '2019-03-24'),
#      ( 2, '2019-01-02', '2019-12-01');



describe Availability do
  # context "creating a new space and adding availability to it" do
  #   it ".update should add all days to the database within the given range" do
  #     subject.update(1, '12/12/2018', '01/02/2019')
  #   end
  # end
  let(:availability) { Availability.retrieve(1) }
  it "Self.retrieve should return an availability instance where the given space id is free" do
    expect(availability.space_id).to eq(1)
  end
  it ".max_date should return the maximum date where the given space id is free" do
    expect(availability.max_date.to_s).to eq('2019-03-24')
  end
  it ".min_date should return the minimum date where the given space id is free" do
    expect(availability.min_date.to_s).to eq('2019-01-01')
  end
  it ".dates should return the dates where the availability object is available in chronological order" do
    date1 = Date.new(2019,1,2)
    date2 = Date.new(2019,1,3)
    date3 = Date.new(2019,1,4)
    expect(Availability.retrieve(2).dates).to eq([date1,date2,date3])
  end

end
