require 'user'

describe User do
  let(:databaseClassforCreate) {double :databaseClassforCreate, sql: [{"id" => "1", "email" => "test@test.com", "username" => "test"}]}
  let(:databaseClassforEmailEmpty) {double :databaseClassforEmailEmpty, sql: []}
  it("sets id to 1 as passed by user") do
    user = User.new(1, "test@test.com", "test", "Abdi")
    expect(user.id).to eq 1
  end

  it("sets email to nil upon initialization") do
    user = User.new(1, "test@test.com", "test", "Abdi")
    expect(user.email).to eq "test@test.com"
  end

  it("sets username to nil upon initialization") do
    user = User.new(1, "test@test.com", "test", "Abdi")
    expect(user.username).to eq "test"
  end

  it "creates a user with id 1" do
    user = User.create("test@test.com", "test", "Abdi", "password", databaseClassforCreate)
    expect(user.id).to eq "1"
  end

  it "creates a user with email 'test@test.com'" do
    user = User.create("test@test.com", "test", "Slev", "password", databaseClassforCreate)
    expect(user.email).to eq "test@test.com"
  end

  it "creates a user with username test" do
    user = User.create("test@test.com", "test", "Nim", "password", databaseClassforCreate)
    expect(user.username).to eq "test"
  end

  it("returns true when user attempts to register an email that already exists") do
    user = User.create("test@test.com", "test", "David", "password", databaseClassforCreate)
    expect(User.email_already_exists?("test@test.com", databaseClassforCreate)).to eq true
  end

  it("returns false when user email already exists") do
    expect(User.email_already_exists?("test@test.com", databaseClassforEmailEmpty)).to eq false
  end

  it "user.find method that finds a user by id" do
    expect(User.find(1).name).to eq ("David G")
  end

end
