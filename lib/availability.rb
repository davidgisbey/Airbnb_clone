require_relative "database_connection"


class Availability

  def self.update(user_id, start_date, end_date)
    Database_connection.sql("INSERT INTO availability (space_id, start_date, end_date)
      VALUES (#{user_id.to_i}, '#{start_date}', '#{end_date}');")
  end

end
