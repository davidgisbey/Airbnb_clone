require 'user'

describe User do
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

  it "creates a user with id 6" do
    user = User.create("test@test.com", "test", "Abdi", "password")
    expect(user.id).to eq "6"
  end

  it "creates a user with email 'test@test.com'" do
    user = User.create("test@test.com", "test", "Slev", "password")
    expect(user.email).to eq "test@test.com"
  end

  it "creates a user with username test" do
    user = User.create("test@test.com", "test", "Nim", "password")
    expect(user.username).to eq "test"
  end

  it("returns true when user attempts to register an email that already exists") do
    user = User.create("test@test.com", "test", "David", "password")
    expect(User.email_already_exists?("test@test.com")).to eq true
  end

  it("returns false when user email already exists") do
    expect(User.email_already_exists?("test@test.com")).to eq false
  end

  it("returns false when email address entered incorrectly") do
    User.create("test@test.com", "test", "test", "password")
    expect(User.authenticate("test@incorrect.com", "password")).to eq false
  end

  it("returns false when password entered incorrectly") do
    User.create("test@test.com", "test", "test", "password")
    expect(User.authenticate("test@test.com", "incorrect")).to eq false
  end

  it("returns user object when email and password entered correctly") do
    User.create("test@test.com", "test", "test", "password")
    user = User.authenticate("test@test.com", "password")
    expect(user.username).to eq "test"
    expect(user.email).to eq "test@test.com"
  end
  it "user.find method that finds a user by id" do
    expect(User.find(1).name).to eq ("David G")
  end
end
