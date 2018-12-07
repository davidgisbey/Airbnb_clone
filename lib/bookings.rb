require "date"
require_relative "./database_connection.rb"

class Bookings

  attr_reader :space_id, :user_id, :id, :dates

  def initialize(id, space_id, user_id, array_of_dates)
    @id = id.to_i
    @space_id = space_id.to_i
    @user_id = user_id.to_i
    @dates = array_of_dates
  end

  def self.create(space_id, user_id, start_date, end_date)
    Database_connection.sql("INSERT INTO bookings (space_id, user_id, start_date, end_date)
      VALUES (#{space_id.to_i}, #{user_id.to_i}, '#{start_date}', '#{end_date}')
      RETURNING id, space_id, user_id start_date, end_date;")
  end

  def  self.retrieve(id)
    query_result = Database_connection.sql("SELECT *
      FROM bookings
      WHERE id = #{id};")
      if query_result.any? == false
        return Bookings.new(0, 0, 0, [])
      end
    booked_dates_array = Bookings.list_days_in_booking(query_result[0]["start_date"], query_result[0]["end_date"])
    booking = Bookings.new(query_result[0]['id'], query_result[0]['space_id'], query_result[0]['user_id'], booked_dates_array)
  end

  def  self.bookings_for_space_id(space_id)
    query_result = Database_connection.sql("SELECT id
      FROM bookings
      WHERE space_id = #{space_id};")
      array_of_bookings = []
      query_result.map do |booking|
        array_of_bookings.push(Bookings.retrieve(booking['id']))
      end
      array_of_bookings
  end

  def self.list_days_in_booking(start_date, end_date)
    array_of_dates = []
    first_date = Date.parse(start_date)
    last_date = Date.parse(end_date)
    first_date.upto(last_date) do |day|
      array_of_dates.push(day)
    end
    array_of_dates
  end
end
