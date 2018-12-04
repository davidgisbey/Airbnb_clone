require_relative "./database_connection.rb"
require 'bcrypt'

class User

  attr_reader :id ,:username , :email

  def initialize(id, email, username)
    @id = id
    @email = email
    @username = username
  end

  def self.create(email, username, password)
    enc_password = BCrypt::Password.create(password)
    result = database_connection.query(("INSERT INTO users (email, username, password) VALUES('#{email}', '#{username}', '#{enc_password}')) RETURNING id, email, username;"))
    User.new(result[0]['id'], result[0]['email'], result[0]['username'])
  end



end
