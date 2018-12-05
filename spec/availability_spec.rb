describe Availability do
  context "creating a new space and adding availability to it" do
    it ".update should add all days to the database within the given range" do
      subject.update(1, '12/12/2018', '01/02/2019')
    end
  end
end
