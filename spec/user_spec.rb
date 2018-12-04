require 'user'

describe User do

  it("sets id to 1 as passed by user") do
    user = User.new(1, "test@test.com", "test")
    expect(user.id).to eq 1
  end

  it("sets email to nil upon initialization") do
    user = User.new(1, "test@test.com", "test")
    expect(user.email).to eq "test@test.com"
  end


  it("sets username to nil upon initialization") do
    user = User.new(1, "test@test.com", "test")
    expect(user.username).to eq "test"
  end

  it "creates a user with id 1" do
    user = User.create("test@test.com", "test", "password")
    expect(user.id).to eq 1
  end

  it "creates a user with email 'test@test.com'" do
    user = User.create("test@test.com", "test", "password")
    expect(user.email).to eq "test@test.com"
  end

  it "creates a user with username test" do
    user = User.create("test@test.com", "test", "password")
    expect(user.username).to eq "test"
  end

  it "checks if DatabaseConnection receives a method" do
    expect(database_connection).to receive(:query).with ()
    expect(user.username).to eq "test"
  end


end
