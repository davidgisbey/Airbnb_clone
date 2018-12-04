require_relative "./database_connection.rb"
require 'bcrypt'

class User

  attr_reader :id ,:username , :email, :name

  def initialize(id, email, username, name)
    @id = id
    @email = email
    @username = username
    @name = name
  end

  def self.create(email, username, name, password, database_connection_class = Database_connection)
    enc_password = BCrypt::Password.create(password)
    result = database_connection_class.sql(("INSERT INTO users (email, username, name, password)
      VALUES('#{email}', '#{username}', '#{name}', '#{enc_password}') RETURNING id, email, username, name;"))
    User.new(result[0]['id'], result[0]['email'], result[0]['username'], result[0]['name'])
  end

  def self.email_already_exists?(email_address, database_connection_class = Database_connection)
    result = database_connection_class.sql("SELECT * FROM users WHERE email = '#{email_address}';")
    result.any?
  end

  def self.find(id)
    result = Database_connection.sql("SELECT id, email, username, name FROM users WHERE id = #{id}")
    user = User.new(result[0]['id'], result[0]['email'], result[0]['username'], result[0]['name'])
    user
  end

end
