require_relative "database_connection"
require "date"


class Availability

  attr_reader :space_id, :dates

  def initialize(space_id, dates)
    @space_id = space_id
    @dates = dates
  end

  def self.update(space_id, start_date, end_date)
    Database_connection.sql("INSERT INTO availability (space_id, start_date, end_date)
      VALUES (#{space_id.to_i}, '#{start_date}', '#{end_date}');")
  end

  def self.retrieve(space_id)
    query_result = Database_connection.sql("SELECT *
      FROM availability
      WHERE space_id = #{space_id};")

    available_periods = query_result.map do |a|
      [Date.parse(a['start_date']), Date.parse(a['end_date'])]
    end

    dates = []
    available_periods.each do |period|
      period[0].upto(period[1]) do |date|
        dates.push(date)
      end
    end
    new_availability = Availability.new(space_id, dates.sort)
  end

  def max_date
    @dates.last
  end

  def min_date
    @dates.first
  end

  def unavailable_days
    days = []
    min_date.upto(max_date) do |date|
      days.push(date) unless @dates.include?(date)
    end
    days
  end

end
