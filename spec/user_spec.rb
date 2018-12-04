require 'user'

describe User do
  let(:database_connection_class) {double :database_connection, sql: [{"id" => "1", "email" => "test@test.com", "username" => "test"}]}
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
    user = User.create("test@test.com", "test", "password", database_connection_class)
    expect(user.id).to eq "1"
  end

  it "creates a user with email 'test@test.com'" do
    user = User.create("test@test.com", "test", "password", database_connection_class)
    expect(user.email).to eq "test@test.com"
  end

  it "creates a user with username test" do
    user = User.create("test@test.com", "test", "password", database_connection_class)
    expect(user.username).to eq "test"
  end
end
